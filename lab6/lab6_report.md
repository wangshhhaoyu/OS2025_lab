# Lab6 实验报告：调度算法

---

## 练习1：理解调度器框架的实现（不需要编码）

### 1.1 调度类结构体 sched_class 的分析

`sched_class` 结构体定义在 `kern/schedule/sched.h` 中，是调度器框架的核心抽象：

```c
struct sched_class {
    const char *name;                                           // 调度器名称
    void (*init)(struct run_queue *rq);                         // 初始化运行队列
    void (*enqueue)(struct run_queue *rq, struct proc_struct *proc);  // 入队
    void (*dequeue)(struct run_queue *rq, struct proc_struct *proc);  // 出队
    struct proc_struct *(*pick_next)(struct run_queue *rq);     // 选择下一个进程
    void (*proc_tick)(struct run_queue *rq, struct proc_struct *proc); // 时钟处理
};
```

**各函数指针的作用和调用时机：**

| 函数指针 | 作用 | 调用时机 |
|---------|------|---------|
| `init` | 初始化运行队列的数据结构 | 系统启动时 `sched_init()` 调用 |
| `enqueue` | 将进程加入就绪队列 | 进程变为就绪态时（`wakeup_proc`、`schedule`） |
| `dequeue` | 将进程从就绪队列移除 | 进程被选中运行时（`schedule`） |
| `pick_next` | 选择下一个要运行的进程 | 调度时（`schedule`） |
| `proc_tick` | 处理时钟中断对进程的影响 | 每次时钟中断（`trap.c`） |

**为什么使用函数指针而不是直接实现函数？**

1. **策略与机制分离**：调度框架（机制）和具体调度算法（策略）解耦
2. **易于扩展**：添加新调度算法只需实现这5个函数，无需修改框架代码
3. **运行时切换**：理论上可以在运行时动态切换调度算法
4. **代码复用**：通用的调度逻辑（如 `schedule()`）可被所有调度算法复用

### 1.2 运行队列结构体 run_queue 的分析

```c
struct run_queue {
    list_entry_t run_list;           // 就绪进程链表头
    unsigned int proc_num;           // 就绪进程数量
    int max_time_slice;              // 最大时间片
    skew_heap_entry_t *lab6_run_pool; // LAB6: 斜堆（用于 Stride 调度）
};
```

**Lab5 与 Lab6 的 run_queue 差异：**

Lab6 新增了 `lab6_run_pool` 字段，支持斜堆数据结构。

**为什么需要支持两种数据结构（链表和斜堆）？**

| 数据结构 | 适用调度算法 | 时间复杂度 | 特点 |
|---------|-------------|-----------|------|
| 链表 | RR（轮转） | O(1) 入队/出队 | 简单，适合 FIFO 顺序 |
| 斜堆 | Stride | O(log n) 操作 | 支持按优先级（stride值）排序 |

### 1.3 调度器框架函数分析

#### sched_init() 函数
```c
void sched_init(void) {
    list_init(&timer_list);
    sched_class = &default_sched_class;  // 选择调度器
    rq = &__rq;
    rq->max_time_slice = MAX_TIME_SLICE;
    sched_class->init(rq);               // 调用具体调度器的初始化
    cprintf("sched class: %s\n", sched_class->name);
}
```

**作用**：初始化调度器框架，设置默认调度算法，初始化运行队列。

#### wakeup_proc() 函数
```c
void wakeup_proc(struct proc_struct *proc) {
    if (proc->state != PROC_RUNNABLE) {
        proc->state = PROC_RUNNABLE;
        proc->wait_state = 0;
        if (proc != current) {
            sched_class_enqueue(proc);   // 加入就绪队列
        }
    }
}
```

**作用**：唤醒进程，将其状态改为 RUNNABLE 并加入就绪队列。

#### schedule() 函数
```c
void schedule(void) {
    current->need_resched = 0;
    if (current->state == PROC_RUNNABLE) {
        sched_class_enqueue(current);    // 当前进程重新入队
    }
    next = sched_class_pick_next();      // 选择下一个进程
    if (next != NULL) {
        sched_class_dequeue(next);       // 从队列移除
    }
    if (next != current) {
        proc_run(next);                  // 上下文切换
    }
}
```

**作用**：执行调度，选择下一个运行的进程并进行上下文切换。

### 1.4 调度类的初始化流程

```
kern_init()
    └── sched_init()
            ├── 初始化 timer_list
            ├── 设置 sched_class = &default_sched_class
            ├── 设置 rq->max_time_slice = MAX_TIME_SLICE (5)
            └── 调用 sched_class->init(rq)
                    └── RR_init() 或 stride_init()
                            ├── list_init(&rq->run_list)
                            └── rq->proc_num = 0
```

### 1.5 进程调度流程

```
                    ┌─────────────────────────────────────┐
                    │         时钟中断发生                  │
                    └─────────────────────────────────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────────────┐
                    │    trap_dispatch() 处理中断          │
                    │    调用 sched_class_proc_tick()     │
                    └─────────────────────────────────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────────────┐
                    │    RR_proc_tick()                   │
                    │    proc->time_slice--               │
                    │    if (time_slice == 0)             │
                    │        proc->need_resched = 1       │
                    └─────────────────────────────────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────────────┐
                    │    中断返回后 cpu_idle() 检查        │
                    │    if (need_resched) schedule()     │
                    └─────────────────────────────────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────────────┐
                    │    schedule()                       │
                    │    1. 当前进程入队 (enqueue)         │
                    │    2. 选择下一进程 (pick_next)       │
                    │    3. 下一进程出队 (dequeue)         │
                    │    4. 上下文切换 (proc_run)          │
                    └─────────────────────────────────────┘
```

**need_resched 标志位的作用**：
- 标记当前进程是否需要被调度
- 由 `proc_tick` 在时间片耗尽时设置为1
- 由 `schedule()` 在调度开始时清零
- 避免在中断处理中直接调度，而是延迟到安全点

### 1.6 调度算法的切换机制

添加新调度算法只需：

1. **实现调度类**：在新文件中实现5个函数（init, enqueue, dequeue, pick_next, proc_tick）
2. **声明结构体**：
```c
struct sched_class my_sched_class = {
    .name = "my_scheduler",
    .init = my_init,
    .enqueue = my_enqueue,
    .dequeue = my_dequeue,
    .pick_next = my_pick_next,
    .proc_tick = my_proc_tick,
};
```
3. **切换调度器**：修改 `sched_init()` 中的一行代码：
```c
sched_class = &my_sched_class;  // 替换为新调度器
```

**设计优点**：通过函数指针实现多态，切换调度算法只需修改一行代码，体现了良好的模块化设计。

---

## 练习2：实现 Round Robin 调度算法（需要编码）

### 2.1 Lab5 与 Lab6 的函数差异

Lab6 相比 Lab5 在 `kern/schedule/sched.c` 中做了以下改动：

| 改动点 | Lab5 | Lab6 |
|-------|------|------|
| 时钟中断处理 | 直接设置 `need_resched=1` | 调用 `sched_class_proc_tick()` |
| 调度逻辑 | 可能硬编码 | 通过函数指针调用 |
| 进程结构体 | 无调度相关字段 | 新增 `run_link`, `time_slice`, `rq` 等 |

**为什么要做这个改动？**

Lab5 每次时钟中断都触发调度，没有时间片概念。Lab6 引入调度框架，由 `proc_tick` 函数管理时间片，只有时间片耗尽才触发调度，实现了真正的时间片轮转。

### 2.2 各函数实现思路

#### RR_init - 初始化运行队列
```c
static void RR_init(struct run_queue *rq) {
    list_init(&(rq->run_list));  // 初始化为空链表
    rq->proc_num = 0;            // 进程数为0
}
```
**思路**：初始化空的双向循环链表，进程计数清零。

#### RR_enqueue - 进程入队
```c
static void RR_enqueue(struct run_queue *rq, struct proc_struct *proc) {
    assert(list_empty(&(proc->run_link)));
    list_add_before(&(rq->run_list), &(proc->run_link));  // 加入队尾
    if (proc->time_slice == 0 || proc->time_slice > rq->max_time_slice) {
        proc->time_slice = rq->max_time_slice;  // 重置时间片
    }
    proc->rq = rq;
    rq->proc_num++;
}
```
**思路**：
- 使用 `list_add_before` 将进程加入链表头节点之前（即队尾），实现 FIFO
- 初始化或重置时间片
- 更新进程的队列指针和队列进程计数

**边界处理**：
- 断言确保进程不在其他队列中
- 时间片为0或超过最大值时重置

#### RR_dequeue - 进程出队
```c
static void RR_dequeue(struct run_queue *rq, struct proc_struct *proc) {
    assert(!list_empty(&(proc->run_link)) && proc->rq == rq);
    list_del_init(&(proc->run_link));  // 从链表删除并重初始化
    rq->proc_num--;
}
```
**思路**：
- 使用 `list_del_init` 删除节点并重新初始化（方便下次入队）
- 更新进程计数

#### RR_pick_next - 选择下一个进程
```c
static struct proc_struct *RR_pick_next(struct run_queue *rq) {
    list_entry_t *le = list_next(&(rq->run_list));
    if (le != &(rq->run_list)) {
        return le2proc(le, run_link);  // 转换为进程结构体
    }
    return NULL;  // 队列为空
}
```
**思路**：
- 取链表第一个元素（队首）
- 使用 `le2proc` 宏从链表节点获取进程结构体
- 空队列返回 NULL

#### RR_proc_tick - 时钟中断处理
```c
static void RR_proc_tick(struct run_queue *rq, struct proc_struct *proc) {
    if (proc->time_slice > 0) {
        proc->time_slice--;  // 时间片减一
    }
    if (proc->time_slice == 0) {
        proc->need_resched = 1;  // 触发调度
    }
}
```
**思路**：
- 每次时钟中断减少时间片
- 时间片耗尽时设置调度标志

### 2.3 make grade 输出结果

```
priority:                (2.4s)
  -check result:                             OK
  -check output:                             OK
Total Score: 50/50
```

### 2.4 QEMU 中观察到的调度现象

运行 `make qemu` 后观察到：
- 系统输出 `sched class: RR_scheduler` 表示使用 RR 调度
- 多个进程轮流执行，每个进程运行约 5 个时钟中断后切换
- `priority` 程序中 5 个子进程按创建顺序轮转执行

### 2.5 Round Robin 调度算法的优缺点

**优点：**
1. **简单公平**：每个进程获得相等的 CPU 时间
2. **响应性好**：所有就绪进程都能及时获得 CPU
3. **实现简单**：只需维护一个 FIFO 队列

**缺点：**
1. **不支持优先级**：无法区分重要程度不同的进程
2. **时间片选择困难**：
   - 太大：响应时间长，退化为 FCFS
   - 太小：上下文切换开销大
3. **I/O密集型进程吃亏**：I/O 进程主动放弃 CPU 后，时间片不保留

### 2.6 为什么在 RR_proc_tick 中设置 need_resched

1. **中断上下文安全**：不能在中断处理中直接调度，need_resched 延迟调度到安全点
2. **解耦时钟处理和调度**：proc_tick 只负责判断，schedule 负责执行
3. **支持抢占式调度**：标志位机制允许在中断返回时检查并调度

### 2.7 拓展思考

**如何实现优先级 RR 调度？**
- 维护多个队列，每个优先级一个
- `pick_next` 从高优先级队列开始查找
- 可选：高优先级进程获得更大时间片

**当前实现是否支持多核调度？**
- 不支持。当前只有一个全局 `rq` 和 `sched_class`
- 改进方案：每个 CPU 维护独立的运行队列，添加负载均衡机制

---

## 扩展练习 Challenge 1：实现 Stride Scheduling 调度算法

### 3.1 Stride 调度算法实现

#### BIG_STRIDE 常量
```c
#define BIG_STRIDE 0x7FFFFFFF
```
选择 32 位最大正整数，确保 stride 值不会溢出且能利用有符号整数比较。

#### stride_init
```c
static void stride_init(struct run_queue *rq) {
    list_init(&(rq->run_list));
    rq->lab6_run_pool = NULL;
    rq->proc_num = 0;
}
```

#### stride_enqueue
```c
static void stride_enqueue(struct run_queue *rq, struct proc_struct *proc) {
    rq->lab6_run_pool = skew_heap_insert(rq->lab6_run_pool, 
                                          &(proc->lab6_run_pool), 
                                          proc_stride_comp_f);
    if (proc->time_slice == 0 || proc->time_slice > rq->max_time_slice) {
        proc->time_slice = rq->max_time_slice;
    }
    proc->rq = rq;
    rq->proc_num++;
}
```

#### stride_pick_next
```c
static struct proc_struct *stride_pick_next(struct run_queue *rq) {
    if (rq->lab6_run_pool == NULL) return NULL;
    
    struct proc_struct *p = le2proc(rq->lab6_run_pool, lab6_run_pool);
    
    // 更新 stride 值
    if (p->lab6_priority == 0) {
        p->lab6_stride += BIG_STRIDE;
    } else {
        p->lab6_stride += BIG_STRIDE / p->lab6_priority;
    }
    return p;
}
```

### 3.2 多级反馈队列调度算法设计

**概要设计：**

```
优先级0（最高）: ──────────────────  时间片 = 1
优先级1:        ──────────────────  时间片 = 2  
优先级2:        ──────────────────  时间片 = 4
优先级3（最低）: ──────────────────  时间片 = 8
```

**数据结构：**
```c
#define MLFQ_LEVELS 4
struct run_queue {
    list_entry_t queues[MLFQ_LEVELS];  // 多个优先级队列
    int time_slices[MLFQ_LEVELS];      // 各级时间片
};
```

**核心逻辑：**
1. 新进程进入最高优先级队列
2. 时间片用完降级到下一队列
3. I/O 等待后提升优先级
4. 调度时从高优先级队列开始选择

### 3.3 Stride 算法时间片与优先级成正比的证明

**定义：**
- 进程 i 的优先级为 $P_i$
- 每次调度后 stride 增加 $\Delta_i = \frac{BIG\_STRIDE}{P_i}$
- 经过 N 次调度后，进程 i 被调度 $n_i$ 次

**证明：**

Stride 算法总是选择 stride 值最小的进程。长期来看，所有进程的 stride 趋于相等：

$$stride_i \approx stride_j \quad \forall i,j$$

对于进程 i：$stride_i = n_i \cdot \Delta_i = n_i \cdot \frac{BIG\_STRIDE}{P_i}$

由于 stride 值趋于相等：
$$n_i \cdot \frac{BIG\_STRIDE}{P_i} \approx n_j \cdot \frac{BIG\_STRIDE}{P_j}$$

化简得：
$$\frac{n_i}{n_j} \approx \frac{P_i}{P_j}$$

因此，各进程获得的时间片数目 $n_i$ 与其优先级 $P_i$ 成正比。

**直观理解**：优先级高的进程 stride 增长慢，更容易成为"最小 stride"被选中，因此获得更多 CPU 时间。

---

## 总结

本实验通过实现 Round Robin 和 Stride 两种调度算法，深入理解了：

1. **调度器框架设计**：通过函数指针实现策略与机制分离
2. **RR 调度**：简单公平的时间片轮转
3. **Stride 调度**：支持优先级的确定性调度
4. **数据结构选择**：链表适合 FIFO，斜堆适合优先级队列

调度器框架的设计体现了良好的软件工程思想，使得添加新调度算法变得简单而不影响现有代码。
