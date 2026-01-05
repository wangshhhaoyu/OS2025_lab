
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
    .globl kern_entry
kern_entry:
    # a0: hartid
    # a1: dtb physical address
    # save hartid and dtb address
    la t0, boot_hartid
ffffffffc0200000:	00007297          	auipc	t0,0x7
ffffffffc0200004:	00028293          	mv	t0,t0
    sd a0, 0(t0)
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0207000 <boot_hartid>
    la t0, boot_dtb
ffffffffc020000c:	00007297          	auipc	t0,0x7
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0207008 <boot_dtb>
    sd a1, 0(t0)
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)

    # t0 := 三级页表的虚拟地址
    lui     t0, %hi(boot_page_table_sv39)
ffffffffc0200018:	c02062b7          	lui	t0,0xc0206
    # t1 := 0xffffffff40000000 即虚实映射偏移量
    li      t1, 0xffffffffc0000000 - 0x80000000
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
    # t0 减去虚实映射偏移量 0xffffffff40000000，变为三级页表的物理地址
    sub     t0, t0, t1
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
    # t0 >>= 12，变为三级页表的物理页号
    srli    t0, t0, 12
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc

    # t1 := 8 << 60，设置 satp 的 MODE 字段为 Sv39
    li      t1, 8 << 60
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
    # 将刚才计算出的预设三级页表物理页号附加到 satp 中
    or      t0, t0, t1
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
    # 将算出的 t0(即新的MODE|页表基址物理页号) 覆盖到 satp 中
    csrw    satp, t0
ffffffffc0200034:	18029073          	csrw	satp,t0
    # 使用 sfence.vma 指令刷新 TLB
    sfence.vma
ffffffffc0200038:	12000073          	sfence.vma
    # 从此，我们给内核搭建出了一个完美的虚拟内存空间！
    #nop # 可能映射的位置有些bug。。插入一个nop
    
    # 我们在虚拟内存空间中：随意将 sp 设置为虚拟地址！
    lui sp, %hi(bootstacktop)
ffffffffc020003c:	c0206137          	lui	sp,0xc0206

    # 我们在虚拟内存空间中：随意跳转到虚拟地址！
    # 1. 使用临时寄存器 t1 计算栈顶的精确地址
    lui t1, %hi(bootstacktop)
ffffffffc0200040:	c0206337          	lui	t1,0xc0206
    addi t1, t1, %lo(bootstacktop)
ffffffffc0200044:	00030313          	mv	t1,t1
    # 2. 将精确地址一次性地、安全地传给 sp
    mv sp, t1
ffffffffc0200048:	811a                	mv	sp,t1
    # 现在栈指针已经完美设置，可以安全地调用任何C函数了
    # 然后跳转到 kern_init (不再返回)
    lui t0, %hi(kern_init)
ffffffffc020004a:	c02002b7          	lui	t0,0xc0200
    addi t0, t0, %lo(kern_init)
ffffffffc020004e:	05428293          	addi	t0,t0,84 # ffffffffc0200054 <kern_init>
    jr t0
ffffffffc0200052:	8282                	jr	t0

ffffffffc0200054 <kern_init>:
void grade_backtrace(void);

int kern_init(void) {
    extern char edata[], end[];
    // 先清零 BSS，再读取并保存 DTB 的内存信息，避免被清零覆盖（为了解释变化 正式上传时我觉得应该删去这句话）
    memset(edata, 0, end - edata);
ffffffffc0200054:	00007517          	auipc	a0,0x7
ffffffffc0200058:	fd450513          	addi	a0,a0,-44 # ffffffffc0207028 <free_area>
ffffffffc020005c:	00007617          	auipc	a2,0x7
ffffffffc0200060:	44c60613          	addi	a2,a2,1100 # ffffffffc02074a8 <end>
int kern_init(void) {
ffffffffc0200064:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
ffffffffc0200066:	8e09                	sub	a2,a2,a0
ffffffffc0200068:	4581                	li	a1,0
int kern_init(void) {
ffffffffc020006a:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
ffffffffc020006c:	77f010ef          	jal	ra,ffffffffc0201fea <memset>
    dtb_init();
ffffffffc0200070:	448000ef          	jal	ra,ffffffffc02004b8 <dtb_init>
    cons_init();  // init the console
ffffffffc0200074:	436000ef          	jal	ra,ffffffffc02004aa <cons_init>

    idt_init();  // init interrupt descriptor table
ffffffffc0200078:	7fc000ef          	jal	ra,ffffffffc0200874 <idt_init>

    // For Challenge 3 test
    cprintf("------------------------------------\n");
ffffffffc020007c:	00002517          	auipc	a0,0x2
ffffffffc0200080:	f8450513          	addi	a0,a0,-124 # ffffffffc0202000 <etext+0x4>
ffffffffc0200084:	08e000ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("Testing Challenge 3 exceptions...\n");
ffffffffc0200088:	00002517          	auipc	a0,0x2
ffffffffc020008c:	fa050513          	addi	a0,a0,-96 # ffffffffc0202028 <etext+0x2c>
ffffffffc0200090:	082000ef          	jal	ra,ffffffffc0200112 <cprintf>


    // Test 1: Breakpoint exception
    cprintf("Test 1: Triggering breakpoint exception (ebreak)...\n");
ffffffffc0200094:	00002517          	auipc	a0,0x2
ffffffffc0200098:	fbc50513          	addi	a0,a0,-68 # ffffffffc0202050 <etext+0x54>
ffffffffc020009c:	076000ef          	jal	ra,ffffffffc0200112 <cprintf>
    asm volatile ("ebreak");
ffffffffc02000a0:	9002                	ebreak

    // Test 2: Illegal instruction exception
    // cprintf("Test 2: Triggering illegal instruction exception...\n");
    // asm volatile (".word 0x00000000");

    cprintf("Exception test passed.\n");
ffffffffc02000a2:	00002517          	auipc	a0,0x2
ffffffffc02000a6:	fe650513          	addi	a0,a0,-26 # ffffffffc0202088 <etext+0x8c>
ffffffffc02000aa:	068000ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("------------------------------------\n\n");
ffffffffc02000ae:	00002517          	auipc	a0,0x2
ffffffffc02000b2:	ff250513          	addi	a0,a0,-14 # ffffffffc02020a0 <etext+0xa4>
ffffffffc02000b6:	05c000ef          	jal	ra,ffffffffc0200112 <cprintf>

    const char *message = "(THU.CST) os is loading ...\0";
    //cprintf("%s\n\n", message);
    cputs(message);
ffffffffc02000ba:	00002517          	auipc	a0,0x2
ffffffffc02000be:	00e50513          	addi	a0,a0,14 # ffffffffc02020c8 <etext+0xcc>
ffffffffc02000c2:	088000ef          	jal	ra,ffffffffc020014a <cputs>

    print_kerninfo();
ffffffffc02000c6:	0d4000ef          	jal	ra,ffffffffc020019a <print_kerninfo>

    // grade_backtrace();

    pmm_init();  // init physical memory management
ffffffffc02000ca:	7a4010ef          	jal	ra,ffffffffc020186e <pmm_init>

    clock_init();   // init clock interrupt
ffffffffc02000ce:	39a000ef          	jal	ra,ffffffffc0200468 <clock_init>
    intr_enable();  // enable irq interrupt
ffffffffc02000d2:	796000ef          	jal	ra,ffffffffc0200868 <intr_enable>

    /* do nothing */
    while (1)
ffffffffc02000d6:	a001                	j	ffffffffc02000d6 <kern_init+0x82>

ffffffffc02000d8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
ffffffffc02000d8:	1141                	addi	sp,sp,-16
ffffffffc02000da:	e022                	sd	s0,0(sp)
ffffffffc02000dc:	e406                	sd	ra,8(sp)
ffffffffc02000de:	842e                	mv	s0,a1
    cons_putc(c);
ffffffffc02000e0:	3cc000ef          	jal	ra,ffffffffc02004ac <cons_putc>
    (*cnt) ++;
ffffffffc02000e4:	401c                	lw	a5,0(s0)
}
ffffffffc02000e6:	60a2                	ld	ra,8(sp)
    (*cnt) ++;
ffffffffc02000e8:	2785                	addiw	a5,a5,1
ffffffffc02000ea:	c01c                	sw	a5,0(s0)
}
ffffffffc02000ec:	6402                	ld	s0,0(sp)
ffffffffc02000ee:	0141                	addi	sp,sp,16
ffffffffc02000f0:	8082                	ret

ffffffffc02000f2 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
ffffffffc02000f2:	1101                	addi	sp,sp,-32
ffffffffc02000f4:	862a                	mv	a2,a0
ffffffffc02000f6:	86ae                	mv	a3,a1
    int cnt = 0;
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc02000f8:	00000517          	auipc	a0,0x0
ffffffffc02000fc:	fe050513          	addi	a0,a0,-32 # ffffffffc02000d8 <cputch>
ffffffffc0200100:	006c                	addi	a1,sp,12
vcprintf(const char *fmt, va_list ap) {
ffffffffc0200102:	ec06                	sd	ra,24(sp)
    int cnt = 0;
ffffffffc0200104:	c602                	sw	zero,12(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc0200106:	1b5010ef          	jal	ra,ffffffffc0201aba <vprintfmt>
    return cnt;
}
ffffffffc020010a:	60e2                	ld	ra,24(sp)
ffffffffc020010c:	4532                	lw	a0,12(sp)
ffffffffc020010e:	6105                	addi	sp,sp,32
ffffffffc0200110:	8082                	ret

ffffffffc0200112 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
ffffffffc0200112:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
ffffffffc0200114:	02810313          	addi	t1,sp,40 # ffffffffc0206028 <boot_page_table_sv39+0x28>
cprintf(const char *fmt, ...) {
ffffffffc0200118:	8e2a                	mv	t3,a0
ffffffffc020011a:	f42e                	sd	a1,40(sp)
ffffffffc020011c:	f832                	sd	a2,48(sp)
ffffffffc020011e:	fc36                	sd	a3,56(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc0200120:	00000517          	auipc	a0,0x0
ffffffffc0200124:	fb850513          	addi	a0,a0,-72 # ffffffffc02000d8 <cputch>
ffffffffc0200128:	004c                	addi	a1,sp,4
ffffffffc020012a:	869a                	mv	a3,t1
ffffffffc020012c:	8672                	mv	a2,t3
cprintf(const char *fmt, ...) {
ffffffffc020012e:	ec06                	sd	ra,24(sp)
ffffffffc0200130:	e0ba                	sd	a4,64(sp)
ffffffffc0200132:	e4be                	sd	a5,72(sp)
ffffffffc0200134:	e8c2                	sd	a6,80(sp)
ffffffffc0200136:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
ffffffffc0200138:	e41a                	sd	t1,8(sp)
    int cnt = 0;
ffffffffc020013a:	c202                	sw	zero,4(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc020013c:	17f010ef          	jal	ra,ffffffffc0201aba <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
ffffffffc0200140:	60e2                	ld	ra,24(sp)
ffffffffc0200142:	4512                	lw	a0,4(sp)
ffffffffc0200144:	6125                	addi	sp,sp,96
ffffffffc0200146:	8082                	ret

ffffffffc0200148 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
    cons_putc(c);
ffffffffc0200148:	a695                	j	ffffffffc02004ac <cons_putc>

ffffffffc020014a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
ffffffffc020014a:	1101                	addi	sp,sp,-32
ffffffffc020014c:	e822                	sd	s0,16(sp)
ffffffffc020014e:	ec06                	sd	ra,24(sp)
ffffffffc0200150:	e426                	sd	s1,8(sp)
ffffffffc0200152:	842a                	mv	s0,a0
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
ffffffffc0200154:	00054503          	lbu	a0,0(a0)
ffffffffc0200158:	c51d                	beqz	a0,ffffffffc0200186 <cputs+0x3c>
ffffffffc020015a:	0405                	addi	s0,s0,1
ffffffffc020015c:	4485                	li	s1,1
ffffffffc020015e:	9c81                	subw	s1,s1,s0
    cons_putc(c);
ffffffffc0200160:	34c000ef          	jal	ra,ffffffffc02004ac <cons_putc>
    while ((c = *str ++) != '\0') {
ffffffffc0200164:	00044503          	lbu	a0,0(s0)
ffffffffc0200168:	008487bb          	addw	a5,s1,s0
ffffffffc020016c:	0405                	addi	s0,s0,1
ffffffffc020016e:	f96d                	bnez	a0,ffffffffc0200160 <cputs+0x16>
    (*cnt) ++;
ffffffffc0200170:	0017841b          	addiw	s0,a5,1
    cons_putc(c);
ffffffffc0200174:	4529                	li	a0,10
ffffffffc0200176:	336000ef          	jal	ra,ffffffffc02004ac <cons_putc>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
    return cnt;
}
ffffffffc020017a:	60e2                	ld	ra,24(sp)
ffffffffc020017c:	8522                	mv	a0,s0
ffffffffc020017e:	6442                	ld	s0,16(sp)
ffffffffc0200180:	64a2                	ld	s1,8(sp)
ffffffffc0200182:	6105                	addi	sp,sp,32
ffffffffc0200184:	8082                	ret
    while ((c = *str ++) != '\0') {
ffffffffc0200186:	4405                	li	s0,1
ffffffffc0200188:	b7f5                	j	ffffffffc0200174 <cputs+0x2a>

ffffffffc020018a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
ffffffffc020018a:	1141                	addi	sp,sp,-16
ffffffffc020018c:	e406                	sd	ra,8(sp)
    int c;
    while ((c = cons_getc()) == 0)
ffffffffc020018e:	326000ef          	jal	ra,ffffffffc02004b4 <cons_getc>
ffffffffc0200192:	dd75                	beqz	a0,ffffffffc020018e <getchar+0x4>
        /* do nothing */;
    return c;
}
ffffffffc0200194:	60a2                	ld	ra,8(sp)
ffffffffc0200196:	0141                	addi	sp,sp,16
ffffffffc0200198:	8082                	ret

ffffffffc020019a <print_kerninfo>:
/* *
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void print_kerninfo(void) {
ffffffffc020019a:	1141                	addi	sp,sp,-16
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
ffffffffc020019c:	00002517          	auipc	a0,0x2
ffffffffc02001a0:	f4c50513          	addi	a0,a0,-180 # ffffffffc02020e8 <etext+0xec>
void print_kerninfo(void) {
ffffffffc02001a4:	e406                	sd	ra,8(sp)
    cprintf("Special kernel symbols:\n");
ffffffffc02001a6:	f6dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  entry  0x%016lx (virtual)\n", kern_init);
ffffffffc02001aa:	00000597          	auipc	a1,0x0
ffffffffc02001ae:	eaa58593          	addi	a1,a1,-342 # ffffffffc0200054 <kern_init>
ffffffffc02001b2:	00002517          	auipc	a0,0x2
ffffffffc02001b6:	f5650513          	addi	a0,a0,-170 # ffffffffc0202108 <etext+0x10c>
ffffffffc02001ba:	f59ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  etext  0x%016lx (virtual)\n", etext);
ffffffffc02001be:	00002597          	auipc	a1,0x2
ffffffffc02001c2:	e3e58593          	addi	a1,a1,-450 # ffffffffc0201ffc <etext>
ffffffffc02001c6:	00002517          	auipc	a0,0x2
ffffffffc02001ca:	f6250513          	addi	a0,a0,-158 # ffffffffc0202128 <etext+0x12c>
ffffffffc02001ce:	f45ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  edata  0x%016lx (virtual)\n", edata);
ffffffffc02001d2:	00007597          	auipc	a1,0x7
ffffffffc02001d6:	e5658593          	addi	a1,a1,-426 # ffffffffc0207028 <free_area>
ffffffffc02001da:	00002517          	auipc	a0,0x2
ffffffffc02001de:	f6e50513          	addi	a0,a0,-146 # ffffffffc0202148 <etext+0x14c>
ffffffffc02001e2:	f31ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  end    0x%016lx (virtual)\n", end);
ffffffffc02001e6:	00007597          	auipc	a1,0x7
ffffffffc02001ea:	2c258593          	addi	a1,a1,706 # ffffffffc02074a8 <end>
ffffffffc02001ee:	00002517          	auipc	a0,0x2
ffffffffc02001f2:	f7a50513          	addi	a0,a0,-134 # ffffffffc0202168 <etext+0x16c>
ffffffffc02001f6:	f1dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n",
            (end - kern_init + 1023) / 1024);
ffffffffc02001fa:	00007597          	auipc	a1,0x7
ffffffffc02001fe:	6ad58593          	addi	a1,a1,1709 # ffffffffc02078a7 <end+0x3ff>
ffffffffc0200202:	00000797          	auipc	a5,0x0
ffffffffc0200206:	e5278793          	addi	a5,a5,-430 # ffffffffc0200054 <kern_init>
ffffffffc020020a:	40f587b3          	sub	a5,a1,a5
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc020020e:	43f7d593          	srai	a1,a5,0x3f
}
ffffffffc0200212:	60a2                	ld	ra,8(sp)
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc0200214:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200218:	95be                	add	a1,a1,a5
ffffffffc020021a:	85a9                	srai	a1,a1,0xa
ffffffffc020021c:	00002517          	auipc	a0,0x2
ffffffffc0200220:	f6c50513          	addi	a0,a0,-148 # ffffffffc0202188 <etext+0x18c>
}
ffffffffc0200224:	0141                	addi	sp,sp,16
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc0200226:	b5f5                	j	ffffffffc0200112 <cprintf>

ffffffffc0200228 <print_stackframe>:
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before
 * jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the
 * boundary.
 * */
void print_stackframe(void) {
ffffffffc0200228:	1141                	addi	sp,sp,-16
    panic("Not Implemented!");
ffffffffc020022a:	00002617          	auipc	a2,0x2
ffffffffc020022e:	f8e60613          	addi	a2,a2,-114 # ffffffffc02021b8 <etext+0x1bc>
ffffffffc0200232:	04d00593          	li	a1,77
ffffffffc0200236:	00002517          	auipc	a0,0x2
ffffffffc020023a:	f9a50513          	addi	a0,a0,-102 # ffffffffc02021d0 <etext+0x1d4>
void print_stackframe(void) {
ffffffffc020023e:	e406                	sd	ra,8(sp)
    panic("Not Implemented!");
ffffffffc0200240:	1cc000ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc0200244 <mon_help>:
    }
}

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
ffffffffc0200244:	1141                	addi	sp,sp,-16
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc0200246:	00002617          	auipc	a2,0x2
ffffffffc020024a:	fa260613          	addi	a2,a2,-94 # ffffffffc02021e8 <etext+0x1ec>
ffffffffc020024e:	00002597          	auipc	a1,0x2
ffffffffc0200252:	fba58593          	addi	a1,a1,-70 # ffffffffc0202208 <etext+0x20c>
ffffffffc0200256:	00002517          	auipc	a0,0x2
ffffffffc020025a:	fba50513          	addi	a0,a0,-70 # ffffffffc0202210 <etext+0x214>
mon_help(int argc, char **argv, struct trapframe *tf) {
ffffffffc020025e:	e406                	sd	ra,8(sp)
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffffffffc0200260:	eb3ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
ffffffffc0200264:	00002617          	auipc	a2,0x2
ffffffffc0200268:	fbc60613          	addi	a2,a2,-68 # ffffffffc0202220 <etext+0x224>
ffffffffc020026c:	00002597          	auipc	a1,0x2
ffffffffc0200270:	fdc58593          	addi	a1,a1,-36 # ffffffffc0202248 <etext+0x24c>
ffffffffc0200274:	00002517          	auipc	a0,0x2
ffffffffc0200278:	f9c50513          	addi	a0,a0,-100 # ffffffffc0202210 <etext+0x214>
ffffffffc020027c:	e97ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
ffffffffc0200280:	00002617          	auipc	a2,0x2
ffffffffc0200284:	fd860613          	addi	a2,a2,-40 # ffffffffc0202258 <etext+0x25c>
ffffffffc0200288:	00002597          	auipc	a1,0x2
ffffffffc020028c:	ff058593          	addi	a1,a1,-16 # ffffffffc0202278 <etext+0x27c>
ffffffffc0200290:	00002517          	auipc	a0,0x2
ffffffffc0200294:	f8050513          	addi	a0,a0,-128 # ffffffffc0202210 <etext+0x214>
ffffffffc0200298:	e7bff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    }
    return 0;
}
ffffffffc020029c:	60a2                	ld	ra,8(sp)
ffffffffc020029e:	4501                	li	a0,0
ffffffffc02002a0:	0141                	addi	sp,sp,16
ffffffffc02002a2:	8082                	ret

ffffffffc02002a4 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
ffffffffc02002a4:	1141                	addi	sp,sp,-16
ffffffffc02002a6:	e406                	sd	ra,8(sp)
    print_kerninfo();
ffffffffc02002a8:	ef3ff0ef          	jal	ra,ffffffffc020019a <print_kerninfo>
    return 0;
}
ffffffffc02002ac:	60a2                	ld	ra,8(sp)
ffffffffc02002ae:	4501                	li	a0,0
ffffffffc02002b0:	0141                	addi	sp,sp,16
ffffffffc02002b2:	8082                	ret

ffffffffc02002b4 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
ffffffffc02002b4:	1141                	addi	sp,sp,-16
ffffffffc02002b6:	e406                	sd	ra,8(sp)
    print_stackframe();
ffffffffc02002b8:	f71ff0ef          	jal	ra,ffffffffc0200228 <print_stackframe>
    return 0;
}
ffffffffc02002bc:	60a2                	ld	ra,8(sp)
ffffffffc02002be:	4501                	li	a0,0
ffffffffc02002c0:	0141                	addi	sp,sp,16
ffffffffc02002c2:	8082                	ret

ffffffffc02002c4 <kmonitor>:
kmonitor(struct trapframe *tf) {
ffffffffc02002c4:	7115                	addi	sp,sp,-224
ffffffffc02002c6:	ed5e                	sd	s7,152(sp)
ffffffffc02002c8:	8baa                	mv	s7,a0
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc02002ca:	00002517          	auipc	a0,0x2
ffffffffc02002ce:	fbe50513          	addi	a0,a0,-66 # ffffffffc0202288 <etext+0x28c>
kmonitor(struct trapframe *tf) {
ffffffffc02002d2:	ed86                	sd	ra,216(sp)
ffffffffc02002d4:	e9a2                	sd	s0,208(sp)
ffffffffc02002d6:	e5a6                	sd	s1,200(sp)
ffffffffc02002d8:	e1ca                	sd	s2,192(sp)
ffffffffc02002da:	fd4e                	sd	s3,184(sp)
ffffffffc02002dc:	f952                	sd	s4,176(sp)
ffffffffc02002de:	f556                	sd	s5,168(sp)
ffffffffc02002e0:	f15a                	sd	s6,160(sp)
ffffffffc02002e2:	e962                	sd	s8,144(sp)
ffffffffc02002e4:	e566                	sd	s9,136(sp)
ffffffffc02002e6:	e16a                	sd	s10,128(sp)
    cprintf("Welcome to the kernel debug monitor!!\n");
ffffffffc02002e8:	e2bff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
ffffffffc02002ec:	00002517          	auipc	a0,0x2
ffffffffc02002f0:	fc450513          	addi	a0,a0,-60 # ffffffffc02022b0 <etext+0x2b4>
ffffffffc02002f4:	e1fff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    if (tf != NULL) {
ffffffffc02002f8:	000b8563          	beqz	s7,ffffffffc0200302 <kmonitor+0x3e>
        print_trapframe(tf);
ffffffffc02002fc:	855e                	mv	a0,s7
ffffffffc02002fe:	756000ef          	jal	ra,ffffffffc0200a54 <print_trapframe>
ffffffffc0200302:	00002c17          	auipc	s8,0x2
ffffffffc0200306:	01ec0c13          	addi	s8,s8,30 # ffffffffc0202320 <commands>
        if ((buf = readline("K> ")) != NULL) {
ffffffffc020030a:	00002917          	auipc	s2,0x2
ffffffffc020030e:	fce90913          	addi	s2,s2,-50 # ffffffffc02022d8 <etext+0x2dc>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc0200312:	00002497          	auipc	s1,0x2
ffffffffc0200316:	fce48493          	addi	s1,s1,-50 # ffffffffc02022e0 <etext+0x2e4>
        if (argc == MAXARGS - 1) {
ffffffffc020031a:	49bd                	li	s3,15
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc020031c:	00002b17          	auipc	s6,0x2
ffffffffc0200320:	fccb0b13          	addi	s6,s6,-52 # ffffffffc02022e8 <etext+0x2ec>
        argv[argc ++] = buf;
ffffffffc0200324:	00002a17          	auipc	s4,0x2
ffffffffc0200328:	ee4a0a13          	addi	s4,s4,-284 # ffffffffc0202208 <etext+0x20c>
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc020032c:	4a8d                	li	s5,3
        if ((buf = readline("K> ")) != NULL) {
ffffffffc020032e:	854a                	mv	a0,s2
ffffffffc0200330:	30d010ef          	jal	ra,ffffffffc0201e3c <readline>
ffffffffc0200334:	842a                	mv	s0,a0
ffffffffc0200336:	dd65                	beqz	a0,ffffffffc020032e <kmonitor+0x6a>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc0200338:	00054583          	lbu	a1,0(a0)
    int argc = 0;
ffffffffc020033c:	4c81                	li	s9,0
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc020033e:	e1bd                	bnez	a1,ffffffffc02003a4 <kmonitor+0xe0>
    if (argc == 0) {
ffffffffc0200340:	fe0c87e3          	beqz	s9,ffffffffc020032e <kmonitor+0x6a>
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc0200344:	6582                	ld	a1,0(sp)
ffffffffc0200346:	00002d17          	auipc	s10,0x2
ffffffffc020034a:	fdad0d13          	addi	s10,s10,-38 # ffffffffc0202320 <commands>
        argv[argc ++] = buf;
ffffffffc020034e:	8552                	mv	a0,s4
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc0200350:	4401                	li	s0,0
ffffffffc0200352:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc0200354:	43d010ef          	jal	ra,ffffffffc0201f90 <strcmp>
ffffffffc0200358:	c919                	beqz	a0,ffffffffc020036e <kmonitor+0xaa>
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc020035a:	2405                	addiw	s0,s0,1
ffffffffc020035c:	0b540063          	beq	s0,s5,ffffffffc02003fc <kmonitor+0x138>
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc0200360:	000d3503          	ld	a0,0(s10)
ffffffffc0200364:	6582                	ld	a1,0(sp)
    for (i = 0; i < NCOMMANDS; i ++) {
ffffffffc0200366:	0d61                	addi	s10,s10,24
        if (strcmp(commands[i].name, argv[0]) == 0) {
ffffffffc0200368:	429010ef          	jal	ra,ffffffffc0201f90 <strcmp>
ffffffffc020036c:	f57d                	bnez	a0,ffffffffc020035a <kmonitor+0x96>
            return commands[i].func(argc - 1, argv + 1, tf);
ffffffffc020036e:	00141793          	slli	a5,s0,0x1
ffffffffc0200372:	97a2                	add	a5,a5,s0
ffffffffc0200374:	078e                	slli	a5,a5,0x3
ffffffffc0200376:	97e2                	add	a5,a5,s8
ffffffffc0200378:	6b9c                	ld	a5,16(a5)
ffffffffc020037a:	865e                	mv	a2,s7
ffffffffc020037c:	002c                	addi	a1,sp,8
ffffffffc020037e:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200382:	9782                	jalr	a5
            if (runcmd(buf, tf) < 0) {
ffffffffc0200384:	fa0555e3          	bgez	a0,ffffffffc020032e <kmonitor+0x6a>
}
ffffffffc0200388:	60ee                	ld	ra,216(sp)
ffffffffc020038a:	644e                	ld	s0,208(sp)
ffffffffc020038c:	64ae                	ld	s1,200(sp)
ffffffffc020038e:	690e                	ld	s2,192(sp)
ffffffffc0200390:	79ea                	ld	s3,184(sp)
ffffffffc0200392:	7a4a                	ld	s4,176(sp)
ffffffffc0200394:	7aaa                	ld	s5,168(sp)
ffffffffc0200396:	7b0a                	ld	s6,160(sp)
ffffffffc0200398:	6bea                	ld	s7,152(sp)
ffffffffc020039a:	6c4a                	ld	s8,144(sp)
ffffffffc020039c:	6caa                	ld	s9,136(sp)
ffffffffc020039e:	6d0a                	ld	s10,128(sp)
ffffffffc02003a0:	612d                	addi	sp,sp,224
ffffffffc02003a2:	8082                	ret
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc02003a4:	8526                	mv	a0,s1
ffffffffc02003a6:	42f010ef          	jal	ra,ffffffffc0201fd4 <strchr>
ffffffffc02003aa:	c901                	beqz	a0,ffffffffc02003ba <kmonitor+0xf6>
ffffffffc02003ac:	00144583          	lbu	a1,1(s0)
            *buf ++ = '\0';
ffffffffc02003b0:	00040023          	sb	zero,0(s0)
ffffffffc02003b4:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc02003b6:	d5c9                	beqz	a1,ffffffffc0200340 <kmonitor+0x7c>
ffffffffc02003b8:	b7f5                	j	ffffffffc02003a4 <kmonitor+0xe0>
        if (*buf == '\0') {
ffffffffc02003ba:	00044783          	lbu	a5,0(s0)
ffffffffc02003be:	d3c9                	beqz	a5,ffffffffc0200340 <kmonitor+0x7c>
        if (argc == MAXARGS - 1) {
ffffffffc02003c0:	033c8963          	beq	s9,s3,ffffffffc02003f2 <kmonitor+0x12e>
        argv[argc ++] = buf;
ffffffffc02003c4:	003c9793          	slli	a5,s9,0x3
ffffffffc02003c8:	0118                	addi	a4,sp,128
ffffffffc02003ca:	97ba                	add	a5,a5,a4
ffffffffc02003cc:	f887b023          	sd	s0,-128(a5)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc02003d0:	00044583          	lbu	a1,0(s0)
        argv[argc ++] = buf;
ffffffffc02003d4:	2c85                	addiw	s9,s9,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc02003d6:	e591                	bnez	a1,ffffffffc02003e2 <kmonitor+0x11e>
ffffffffc02003d8:	b7b5                	j	ffffffffc0200344 <kmonitor+0x80>
ffffffffc02003da:	00144583          	lbu	a1,1(s0)
            buf ++;
ffffffffc02003de:	0405                	addi	s0,s0,1
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
ffffffffc02003e0:	d1a5                	beqz	a1,ffffffffc0200340 <kmonitor+0x7c>
ffffffffc02003e2:	8526                	mv	a0,s1
ffffffffc02003e4:	3f1010ef          	jal	ra,ffffffffc0201fd4 <strchr>
ffffffffc02003e8:	d96d                	beqz	a0,ffffffffc02003da <kmonitor+0x116>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
ffffffffc02003ea:	00044583          	lbu	a1,0(s0)
ffffffffc02003ee:	d9a9                	beqz	a1,ffffffffc0200340 <kmonitor+0x7c>
ffffffffc02003f0:	bf55                	j	ffffffffc02003a4 <kmonitor+0xe0>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
ffffffffc02003f2:	45c1                	li	a1,16
ffffffffc02003f4:	855a                	mv	a0,s6
ffffffffc02003f6:	d1dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
ffffffffc02003fa:	b7e9                	j	ffffffffc02003c4 <kmonitor+0x100>
    cprintf("Unknown command '%s'\n", argv[0]);
ffffffffc02003fc:	6582                	ld	a1,0(sp)
ffffffffc02003fe:	00002517          	auipc	a0,0x2
ffffffffc0200402:	f0a50513          	addi	a0,a0,-246 # ffffffffc0202308 <etext+0x30c>
ffffffffc0200406:	d0dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    return 0;
ffffffffc020040a:	b715                	j	ffffffffc020032e <kmonitor+0x6a>

ffffffffc020040c <__panic>:
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
ffffffffc020040c:	00007317          	auipc	t1,0x7
ffffffffc0200410:	03430313          	addi	t1,t1,52 # ffffffffc0207440 <is_panic>
ffffffffc0200414:	00032e03          	lw	t3,0(t1)
__panic(const char *file, int line, const char *fmt, ...) {
ffffffffc0200418:	715d                	addi	sp,sp,-80
ffffffffc020041a:	ec06                	sd	ra,24(sp)
ffffffffc020041c:	e822                	sd	s0,16(sp)
ffffffffc020041e:	f436                	sd	a3,40(sp)
ffffffffc0200420:	f83a                	sd	a4,48(sp)
ffffffffc0200422:	fc3e                	sd	a5,56(sp)
ffffffffc0200424:	e0c2                	sd	a6,64(sp)
ffffffffc0200426:	e4c6                	sd	a7,72(sp)
    if (is_panic) {
ffffffffc0200428:	020e1a63          	bnez	t3,ffffffffc020045c <__panic+0x50>
        goto panic_dead;
    }
    is_panic = 1;
ffffffffc020042c:	4785                	li	a5,1
ffffffffc020042e:	00f32023          	sw	a5,0(t1)

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
ffffffffc0200432:	8432                	mv	s0,a2
ffffffffc0200434:	103c                	addi	a5,sp,40
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc0200436:	862e                	mv	a2,a1
ffffffffc0200438:	85aa                	mv	a1,a0
ffffffffc020043a:	00002517          	auipc	a0,0x2
ffffffffc020043e:	f2e50513          	addi	a0,a0,-210 # ffffffffc0202368 <commands+0x48>
    va_start(ap, fmt);
ffffffffc0200442:	e43e                	sd	a5,8(sp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc0200444:	ccfff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    vcprintf(fmt, ap);
ffffffffc0200448:	65a2                	ld	a1,8(sp)
ffffffffc020044a:	8522                	mv	a0,s0
ffffffffc020044c:	ca7ff0ef          	jal	ra,ffffffffc02000f2 <vcprintf>
    cprintf("\n");
ffffffffc0200450:	00002517          	auipc	a0,0x2
ffffffffc0200454:	d6050513          	addi	a0,a0,-672 # ffffffffc02021b0 <etext+0x1b4>
ffffffffc0200458:	cbbff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
ffffffffc020045c:	412000ef          	jal	ra,ffffffffc020086e <intr_disable>
    while (1) {
        kmonitor(NULL);
ffffffffc0200460:	4501                	li	a0,0
ffffffffc0200462:	e63ff0ef          	jal	ra,ffffffffc02002c4 <kmonitor>
    while (1) {
ffffffffc0200466:	bfed                	j	ffffffffc0200460 <__panic+0x54>

ffffffffc0200468 <clock_init>:

/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void clock_init(void) {
ffffffffc0200468:	1141                	addi	sp,sp,-16
ffffffffc020046a:	e406                	sd	ra,8(sp)
    // enable timer interrupt in sie
    set_csr(sie, MIP_STIP);
ffffffffc020046c:	02000793          	li	a5,32
ffffffffc0200470:	1047a7f3          	csrrs	a5,sie,a5
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc0200474:	c0102573          	rdtime	a0
    ticks = 0;

    cprintf("++ setup timer interrupts\n");
}

void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc0200478:	67e1                	lui	a5,0x18
ffffffffc020047a:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc020047e:	953e                	add	a0,a0,a5
ffffffffc0200480:	28b010ef          	jal	ra,ffffffffc0201f0a <sbi_set_timer>
}
ffffffffc0200484:	60a2                	ld	ra,8(sp)
    ticks = 0;
ffffffffc0200486:	00007797          	auipc	a5,0x7
ffffffffc020048a:	fc07b123          	sd	zero,-62(a5) # ffffffffc0207448 <ticks>
    cprintf("++ setup timer interrupts\n");
ffffffffc020048e:	00002517          	auipc	a0,0x2
ffffffffc0200492:	efa50513          	addi	a0,a0,-262 # ffffffffc0202388 <commands+0x68>
}
ffffffffc0200496:	0141                	addi	sp,sp,16
    cprintf("++ setup timer interrupts\n");
ffffffffc0200498:	b9ad                	j	ffffffffc0200112 <cprintf>

ffffffffc020049a <clock_set_next_event>:
    __asm__ __volatile__("rdtime %0" : "=r"(n));
ffffffffc020049a:	c0102573          	rdtime	a0
void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
ffffffffc020049e:	67e1                	lui	a5,0x18
ffffffffc02004a0:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc02004a4:	953e                	add	a0,a0,a5
ffffffffc02004a6:	2650106f          	j	ffffffffc0201f0a <sbi_set_timer>

ffffffffc02004aa <cons_init>:

/* serial_intr - try to feed input characters from serial port */
void serial_intr(void) {}

/* cons_init - initializes the console devices */
void cons_init(void) {}
ffffffffc02004aa:	8082                	ret

ffffffffc02004ac <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) { sbi_console_putchar((unsigned char)c); }
ffffffffc02004ac:	0ff57513          	zext.b	a0,a0
ffffffffc02004b0:	2410106f          	j	ffffffffc0201ef0 <sbi_console_putchar>

ffffffffc02004b4 <cons_getc>:
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int cons_getc(void) {
    int c = 0;
    c = sbi_console_getchar();
ffffffffc02004b4:	2710106f          	j	ffffffffc0201f24 <sbi_console_getchar>

ffffffffc02004b8 <dtb_init>:

// 保存解析出的系统物理内存信息
static uint64_t memory_base = 0;
static uint64_t memory_size = 0;

void dtb_init(void) {
ffffffffc02004b8:	7119                	addi	sp,sp,-128
    cprintf("DTB Init\n");
ffffffffc02004ba:	00002517          	auipc	a0,0x2
ffffffffc02004be:	eee50513          	addi	a0,a0,-274 # ffffffffc02023a8 <commands+0x88>
void dtb_init(void) {
ffffffffc02004c2:	fc86                	sd	ra,120(sp)
ffffffffc02004c4:	f8a2                	sd	s0,112(sp)
ffffffffc02004c6:	e8d2                	sd	s4,80(sp)
ffffffffc02004c8:	f4a6                	sd	s1,104(sp)
ffffffffc02004ca:	f0ca                	sd	s2,96(sp)
ffffffffc02004cc:	ecce                	sd	s3,88(sp)
ffffffffc02004ce:	e4d6                	sd	s5,72(sp)
ffffffffc02004d0:	e0da                	sd	s6,64(sp)
ffffffffc02004d2:	fc5e                	sd	s7,56(sp)
ffffffffc02004d4:	f862                	sd	s8,48(sp)
ffffffffc02004d6:	f466                	sd	s9,40(sp)
ffffffffc02004d8:	f06a                	sd	s10,32(sp)
ffffffffc02004da:	ec6e                	sd	s11,24(sp)
    cprintf("DTB Init\n");
ffffffffc02004dc:	c37ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("HartID: %ld\n", boot_hartid);
ffffffffc02004e0:	00007597          	auipc	a1,0x7
ffffffffc02004e4:	b205b583          	ld	a1,-1248(a1) # ffffffffc0207000 <boot_hartid>
ffffffffc02004e8:	00002517          	auipc	a0,0x2
ffffffffc02004ec:	ed050513          	addi	a0,a0,-304 # ffffffffc02023b8 <commands+0x98>
ffffffffc02004f0:	c23ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("DTB Address: 0x%lx\n", boot_dtb);
ffffffffc02004f4:	00007417          	auipc	s0,0x7
ffffffffc02004f8:	b1440413          	addi	s0,s0,-1260 # ffffffffc0207008 <boot_dtb>
ffffffffc02004fc:	600c                	ld	a1,0(s0)
ffffffffc02004fe:	00002517          	auipc	a0,0x2
ffffffffc0200502:	eca50513          	addi	a0,a0,-310 # ffffffffc02023c8 <commands+0xa8>
ffffffffc0200506:	c0dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    
    if (boot_dtb == 0) {
ffffffffc020050a:	00043a03          	ld	s4,0(s0)
        cprintf("Error: DTB address is null\n");
ffffffffc020050e:	00002517          	auipc	a0,0x2
ffffffffc0200512:	ed250513          	addi	a0,a0,-302 # ffffffffc02023e0 <commands+0xc0>
    if (boot_dtb == 0) {
ffffffffc0200516:	120a0463          	beqz	s4,ffffffffc020063e <dtb_init+0x186>
        return;
    }
    
    // 转换为虚拟地址
    uintptr_t dtb_vaddr = boot_dtb + PHYSICAL_MEMORY_OFFSET;
ffffffffc020051a:	57f5                	li	a5,-3
ffffffffc020051c:	07fa                	slli	a5,a5,0x1e
ffffffffc020051e:	00fa0733          	add	a4,s4,a5
    const struct fdt_header *header = (const struct fdt_header *)dtb_vaddr;
    
    // 验证DTB
    uint32_t magic = fdt32_to_cpu(header->magic);
ffffffffc0200522:	431c                	lw	a5,0(a4)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200524:	00ff0637          	lui	a2,0xff0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200528:	6b41                	lui	s6,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020052a:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020052e:	0187969b          	slliw	a3,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200532:	0187d51b          	srliw	a0,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200536:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020053a:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020053e:	8df1                	and	a1,a1,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200540:	8ec9                	or	a3,a3,a0
ffffffffc0200542:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200546:	1b7d                	addi	s6,s6,-1
ffffffffc0200548:	0167f7b3          	and	a5,a5,s6
ffffffffc020054c:	8dd5                	or	a1,a1,a3
ffffffffc020054e:	8ddd                	or	a1,a1,a5
    if (magic != 0xd00dfeed) {
ffffffffc0200550:	d00e07b7          	lui	a5,0xd00e0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200554:	2581                	sext.w	a1,a1
    if (magic != 0xd00dfeed) {
ffffffffc0200556:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfed8a45>
ffffffffc020055a:	10f59163          	bne	a1,a5,ffffffffc020065c <dtb_init+0x1a4>
        return;
    }
    
    // 提取内存信息
    uint64_t mem_base, mem_size;
    if (extract_memory_info(dtb_vaddr, header, &mem_base, &mem_size) == 0) {
ffffffffc020055e:	471c                	lw	a5,8(a4)
ffffffffc0200560:	4754                	lw	a3,12(a4)
    int in_memory_node = 0;
ffffffffc0200562:	4c81                	li	s9,0
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200564:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200568:	0086d51b          	srliw	a0,a3,0x8
ffffffffc020056c:	0186941b          	slliw	s0,a3,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200570:	0186d89b          	srliw	a7,a3,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200574:	01879a1b          	slliw	s4,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200578:	0187d81b          	srliw	a6,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020057c:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200580:	0106d69b          	srliw	a3,a3,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200584:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200588:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020058c:	8d71                	and	a0,a0,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020058e:	01146433          	or	s0,s0,a7
ffffffffc0200592:	0086969b          	slliw	a3,a3,0x8
ffffffffc0200596:	010a6a33          	or	s4,s4,a6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020059a:	8e6d                	and	a2,a2,a1
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020059c:	0087979b          	slliw	a5,a5,0x8
ffffffffc02005a0:	8c49                	or	s0,s0,a0
ffffffffc02005a2:	0166f6b3          	and	a3,a3,s6
ffffffffc02005a6:	00ca6a33          	or	s4,s4,a2
ffffffffc02005aa:	0167f7b3          	and	a5,a5,s6
ffffffffc02005ae:	8c55                	or	s0,s0,a3
ffffffffc02005b0:	00fa6a33          	or	s4,s4,a5
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02005b4:	1402                	slli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02005b6:	1a02                	slli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02005b8:	9001                	srli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02005ba:	020a5a13          	srli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc02005be:	943a                	add	s0,s0,a4
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc02005c0:	9a3a                	add	s4,s4,a4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02005c2:	00ff0c37          	lui	s8,0xff0
        switch (token) {
ffffffffc02005c6:	4b8d                	li	s7,3
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc02005c8:	00002917          	auipc	s2,0x2
ffffffffc02005cc:	e6890913          	addi	s2,s2,-408 # ffffffffc0202430 <commands+0x110>
ffffffffc02005d0:	49bd                	li	s3,15
        switch (token) {
ffffffffc02005d2:	4d91                	li	s11,4
ffffffffc02005d4:	4d05                	li	s10,1
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02005d6:	00002497          	auipc	s1,0x2
ffffffffc02005da:	e5248493          	addi	s1,s1,-430 # ffffffffc0202428 <commands+0x108>
        uint32_t token = fdt32_to_cpu(*struct_ptr++);
ffffffffc02005de:	000a2703          	lw	a4,0(s4)
ffffffffc02005e2:	004a0a93          	addi	s5,s4,4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02005e6:	0087569b          	srliw	a3,a4,0x8
ffffffffc02005ea:	0187179b          	slliw	a5,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02005ee:	0187561b          	srliw	a2,a4,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02005f2:	0106969b          	slliw	a3,a3,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02005f6:	0107571b          	srliw	a4,a4,0x10
ffffffffc02005fa:	8fd1                	or	a5,a5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02005fc:	0186f6b3          	and	a3,a3,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200600:	0087171b          	slliw	a4,a4,0x8
ffffffffc0200604:	8fd5                	or	a5,a5,a3
ffffffffc0200606:	00eb7733          	and	a4,s6,a4
ffffffffc020060a:	8fd9                	or	a5,a5,a4
ffffffffc020060c:	2781                	sext.w	a5,a5
        switch (token) {
ffffffffc020060e:	09778c63          	beq	a5,s7,ffffffffc02006a6 <dtb_init+0x1ee>
ffffffffc0200612:	00fbea63          	bltu	s7,a5,ffffffffc0200626 <dtb_init+0x16e>
ffffffffc0200616:	07a78663          	beq	a5,s10,ffffffffc0200682 <dtb_init+0x1ca>
ffffffffc020061a:	4709                	li	a4,2
ffffffffc020061c:	00e79763          	bne	a5,a4,ffffffffc020062a <dtb_init+0x172>
ffffffffc0200620:	4c81                	li	s9,0
ffffffffc0200622:	8a56                	mv	s4,s5
ffffffffc0200624:	bf6d                	j	ffffffffc02005de <dtb_init+0x126>
ffffffffc0200626:	ffb78ee3          	beq	a5,s11,ffffffffc0200622 <dtb_init+0x16a>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
        // 保存到全局变量，供 PMM 查询
        memory_base = mem_base;
        memory_size = mem_size;
    } else {
        cprintf("Warning: Could not extract memory info from DTB\n");
ffffffffc020062a:	00002517          	auipc	a0,0x2
ffffffffc020062e:	e7e50513          	addi	a0,a0,-386 # ffffffffc02024a8 <commands+0x188>
ffffffffc0200632:	ae1ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    }
    cprintf("DTB init completed\n");
ffffffffc0200636:	00002517          	auipc	a0,0x2
ffffffffc020063a:	eaa50513          	addi	a0,a0,-342 # ffffffffc02024e0 <commands+0x1c0>
}
ffffffffc020063e:	7446                	ld	s0,112(sp)
ffffffffc0200640:	70e6                	ld	ra,120(sp)
ffffffffc0200642:	74a6                	ld	s1,104(sp)
ffffffffc0200644:	7906                	ld	s2,96(sp)
ffffffffc0200646:	69e6                	ld	s3,88(sp)
ffffffffc0200648:	6a46                	ld	s4,80(sp)
ffffffffc020064a:	6aa6                	ld	s5,72(sp)
ffffffffc020064c:	6b06                	ld	s6,64(sp)
ffffffffc020064e:	7be2                	ld	s7,56(sp)
ffffffffc0200650:	7c42                	ld	s8,48(sp)
ffffffffc0200652:	7ca2                	ld	s9,40(sp)
ffffffffc0200654:	7d02                	ld	s10,32(sp)
ffffffffc0200656:	6de2                	ld	s11,24(sp)
ffffffffc0200658:	6109                	addi	sp,sp,128
    cprintf("DTB init completed\n");
ffffffffc020065a:	bc65                	j	ffffffffc0200112 <cprintf>
}
ffffffffc020065c:	7446                	ld	s0,112(sp)
ffffffffc020065e:	70e6                	ld	ra,120(sp)
ffffffffc0200660:	74a6                	ld	s1,104(sp)
ffffffffc0200662:	7906                	ld	s2,96(sp)
ffffffffc0200664:	69e6                	ld	s3,88(sp)
ffffffffc0200666:	6a46                	ld	s4,80(sp)
ffffffffc0200668:	6aa6                	ld	s5,72(sp)
ffffffffc020066a:	6b06                	ld	s6,64(sp)
ffffffffc020066c:	7be2                	ld	s7,56(sp)
ffffffffc020066e:	7c42                	ld	s8,48(sp)
ffffffffc0200670:	7ca2                	ld	s9,40(sp)
ffffffffc0200672:	7d02                	ld	s10,32(sp)
ffffffffc0200674:	6de2                	ld	s11,24(sp)
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc0200676:	00002517          	auipc	a0,0x2
ffffffffc020067a:	d8a50513          	addi	a0,a0,-630 # ffffffffc0202400 <commands+0xe0>
}
ffffffffc020067e:	6109                	addi	sp,sp,128
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc0200680:	bc49                	j	ffffffffc0200112 <cprintf>
                int name_len = strlen(name);
ffffffffc0200682:	8556                	mv	a0,s5
ffffffffc0200684:	0d7010ef          	jal	ra,ffffffffc0201f5a <strlen>
ffffffffc0200688:	8a2a                	mv	s4,a0
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc020068a:	4619                	li	a2,6
ffffffffc020068c:	85a6                	mv	a1,s1
ffffffffc020068e:	8556                	mv	a0,s5
                int name_len = strlen(name);
ffffffffc0200690:	2a01                	sext.w	s4,s4
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc0200692:	11d010ef          	jal	ra,ffffffffc0201fae <strncmp>
ffffffffc0200696:	e111                	bnez	a0,ffffffffc020069a <dtb_init+0x1e2>
                    in_memory_node = 1;
ffffffffc0200698:	4c85                	li	s9,1
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + name_len + 4) & ~3);
ffffffffc020069a:	0a91                	addi	s5,s5,4
ffffffffc020069c:	9ad2                	add	s5,s5,s4
ffffffffc020069e:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc02006a2:	8a56                	mv	s4,s5
ffffffffc02006a4:	bf2d                	j	ffffffffc02005de <dtb_init+0x126>
                uint32_t prop_len = fdt32_to_cpu(*struct_ptr++);
ffffffffc02006a6:	004a2783          	lw	a5,4(s4)
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc02006aa:	00ca0693          	addi	a3,s4,12
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006ae:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02006b2:	01879a9b          	slliw	s5,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006b6:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006ba:	0107171b          	slliw	a4,a4,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006be:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02006c2:	00caeab3          	or	s5,s5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006c6:	01877733          	and	a4,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02006ca:	0087979b          	slliw	a5,a5,0x8
ffffffffc02006ce:	00eaeab3          	or	s5,s5,a4
ffffffffc02006d2:	00fb77b3          	and	a5,s6,a5
ffffffffc02006d6:	00faeab3          	or	s5,s5,a5
ffffffffc02006da:	2a81                	sext.w	s5,s5
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc02006dc:	000c9c63          	bnez	s9,ffffffffc02006f4 <dtb_init+0x23c>
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + prop_len + 3) & ~3);
ffffffffc02006e0:	1a82                	slli	s5,s5,0x20
ffffffffc02006e2:	00368793          	addi	a5,a3,3
ffffffffc02006e6:	020ada93          	srli	s5,s5,0x20
ffffffffc02006ea:	9abe                	add	s5,s5,a5
ffffffffc02006ec:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc02006f0:	8a56                	mv	s4,s5
ffffffffc02006f2:	b5f5                	j	ffffffffc02005de <dtb_init+0x126>
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc02006f4:	008a2783          	lw	a5,8(s4)
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc02006f8:	85ca                	mv	a1,s2
ffffffffc02006fa:	e436                	sd	a3,8(sp)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02006fc:	0087d51b          	srliw	a0,a5,0x8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200700:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200704:	0187971b          	slliw	a4,a5,0x18
ffffffffc0200708:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020070c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200710:	8f51                	or	a4,a4,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200712:	01857533          	and	a0,a0,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200716:	0087979b          	slliw	a5,a5,0x8
ffffffffc020071a:	8d59                	or	a0,a0,a4
ffffffffc020071c:	00fb77b3          	and	a5,s6,a5
ffffffffc0200720:	8d5d                	or	a0,a0,a5
                const char *prop_name = strings_base + prop_nameoff;
ffffffffc0200722:	1502                	slli	a0,a0,0x20
ffffffffc0200724:	9101                	srli	a0,a0,0x20
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200726:	9522                	add	a0,a0,s0
ffffffffc0200728:	069010ef          	jal	ra,ffffffffc0201f90 <strcmp>
ffffffffc020072c:	66a2                	ld	a3,8(sp)
ffffffffc020072e:	f94d                	bnez	a0,ffffffffc02006e0 <dtb_init+0x228>
ffffffffc0200730:	fb59f8e3          	bgeu	s3,s5,ffffffffc02006e0 <dtb_init+0x228>
                    *mem_base = fdt64_to_cpu(reg_data[0]);
ffffffffc0200734:	00ca3783          	ld	a5,12(s4)
                    *mem_size = fdt64_to_cpu(reg_data[1]);
ffffffffc0200738:	014a3703          	ld	a4,20(s4)
        cprintf("Physical Memory from DTB:\n");
ffffffffc020073c:	00002517          	auipc	a0,0x2
ffffffffc0200740:	cfc50513          	addi	a0,a0,-772 # ffffffffc0202438 <commands+0x118>
           fdt32_to_cpu(x >> 32);
ffffffffc0200744:	4207d613          	srai	a2,a5,0x20
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200748:	0087d31b          	srliw	t1,a5,0x8
           fdt32_to_cpu(x >> 32);
ffffffffc020074c:	42075593          	srai	a1,a4,0x20
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200750:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200754:	0186581b          	srliw	a6,a2,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200758:	0187941b          	slliw	s0,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020075c:	0107d89b          	srliw	a7,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200760:	0187d693          	srli	a3,a5,0x18
ffffffffc0200764:	01861f1b          	slliw	t5,a2,0x18
ffffffffc0200768:	0087579b          	srliw	a5,a4,0x8
ffffffffc020076c:	0103131b          	slliw	t1,t1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200770:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200774:	010f6f33          	or	t5,t5,a6
ffffffffc0200778:	0187529b          	srliw	t0,a4,0x18
ffffffffc020077c:	0185df9b          	srliw	t6,a1,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200780:	01837333          	and	t1,t1,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200784:	01c46433          	or	s0,s0,t3
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200788:	0186f6b3          	and	a3,a3,s8
ffffffffc020078c:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200790:	01871e9b          	slliw	t4,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200794:	0107581b          	srliw	a6,a4,0x10
ffffffffc0200798:	0086161b          	slliw	a2,a2,0x8
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020079c:	8361                	srli	a4,a4,0x18
ffffffffc020079e:	0107979b          	slliw	a5,a5,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007a2:	0105d59b          	srliw	a1,a1,0x10
ffffffffc02007a6:	01e6e6b3          	or	a3,a3,t5
ffffffffc02007aa:	00cb7633          	and	a2,s6,a2
ffffffffc02007ae:	0088181b          	slliw	a6,a6,0x8
ffffffffc02007b2:	0085959b          	slliw	a1,a1,0x8
ffffffffc02007b6:	00646433          	or	s0,s0,t1
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02007ba:	0187f7b3          	and	a5,a5,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007be:	01fe6333          	or	t1,t3,t6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02007c2:	01877c33          	and	s8,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02007c6:	0088989b          	slliw	a7,a7,0x8
ffffffffc02007ca:	011b78b3          	and	a7,s6,a7
ffffffffc02007ce:	005eeeb3          	or	t4,t4,t0
ffffffffc02007d2:	00c6e733          	or	a4,a3,a2
ffffffffc02007d6:	006c6c33          	or	s8,s8,t1
ffffffffc02007da:	010b76b3          	and	a3,s6,a6
ffffffffc02007de:	00bb7b33          	and	s6,s6,a1
ffffffffc02007e2:	01d7e7b3          	or	a5,a5,t4
ffffffffc02007e6:	016c6b33          	or	s6,s8,s6
ffffffffc02007ea:	01146433          	or	s0,s0,a7
ffffffffc02007ee:	8fd5                	or	a5,a5,a3
           fdt32_to_cpu(x >> 32);
ffffffffc02007f0:	1702                	slli	a4,a4,0x20
ffffffffc02007f2:	1b02                	slli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc02007f4:	1782                	slli	a5,a5,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc02007f6:	9301                	srli	a4,a4,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc02007f8:	1402                	slli	s0,s0,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc02007fa:	020b5b13          	srli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc02007fe:	0167eb33          	or	s6,a5,s6
ffffffffc0200802:	8c59                	or	s0,s0,a4
        cprintf("Physical Memory from DTB:\n");
ffffffffc0200804:	90fff0ef          	jal	ra,ffffffffc0200112 <cprintf>
        cprintf("  Base: 0x%016lx\n", mem_base);
ffffffffc0200808:	85a2                	mv	a1,s0
ffffffffc020080a:	00002517          	auipc	a0,0x2
ffffffffc020080e:	c4e50513          	addi	a0,a0,-946 # ffffffffc0202458 <commands+0x138>
ffffffffc0200812:	901ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
        cprintf("  Size: 0x%016lx (%ld MB)\n", mem_size, mem_size / (1024 * 1024));
ffffffffc0200816:	014b5613          	srli	a2,s6,0x14
ffffffffc020081a:	85da                	mv	a1,s6
ffffffffc020081c:	00002517          	auipc	a0,0x2
ffffffffc0200820:	c5450513          	addi	a0,a0,-940 # ffffffffc0202470 <commands+0x150>
ffffffffc0200824:	8efff0ef          	jal	ra,ffffffffc0200112 <cprintf>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
ffffffffc0200828:	008b05b3          	add	a1,s6,s0
ffffffffc020082c:	15fd                	addi	a1,a1,-1
ffffffffc020082e:	00002517          	auipc	a0,0x2
ffffffffc0200832:	c6250513          	addi	a0,a0,-926 # ffffffffc0202490 <commands+0x170>
ffffffffc0200836:	8ddff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("DTB init completed\n");
ffffffffc020083a:	00002517          	auipc	a0,0x2
ffffffffc020083e:	ca650513          	addi	a0,a0,-858 # ffffffffc02024e0 <commands+0x1c0>
        memory_base = mem_base;
ffffffffc0200842:	00007797          	auipc	a5,0x7
ffffffffc0200846:	c087b723          	sd	s0,-1010(a5) # ffffffffc0207450 <memory_base>
        memory_size = mem_size;
ffffffffc020084a:	00007797          	auipc	a5,0x7
ffffffffc020084e:	c167b723          	sd	s6,-1010(a5) # ffffffffc0207458 <memory_size>
    cprintf("DTB init completed\n");
ffffffffc0200852:	b3f5                	j	ffffffffc020063e <dtb_init+0x186>

ffffffffc0200854 <get_memory_base>:

uint64_t get_memory_base(void) {
    return memory_base;
}
ffffffffc0200854:	00007517          	auipc	a0,0x7
ffffffffc0200858:	bfc53503          	ld	a0,-1028(a0) # ffffffffc0207450 <memory_base>
ffffffffc020085c:	8082                	ret

ffffffffc020085e <get_memory_size>:

uint64_t get_memory_size(void) {
    return memory_size;
}
ffffffffc020085e:	00007517          	auipc	a0,0x7
ffffffffc0200862:	bfa53503          	ld	a0,-1030(a0) # ffffffffc0207458 <memory_size>
ffffffffc0200866:	8082                	ret

ffffffffc0200868 <intr_enable>:
#include <intr.h>
#include <riscv.h>

/* intr_enable - enable irq interrupt */
void intr_enable(void) { set_csr(sstatus, SSTATUS_SIE); }
ffffffffc0200868:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020086c:	8082                	ret

ffffffffc020086e <intr_disable>:

/* intr_disable - disable irq interrupt */
void intr_disable(void) { clear_csr(sstatus, SSTATUS_SIE); }
ffffffffc020086e:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200872:	8082                	ret

ffffffffc0200874 <idt_init>:
     */

    extern void __alltraps(void);
    /* Set sup0 scratch register to 0, indicating to exception vector
       that we are presently executing in the kernel */
    write_csr(sscratch, 0);
ffffffffc0200874:	14005073          	csrwi	sscratch,0
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
ffffffffc0200878:	00000797          	auipc	a5,0x0
ffffffffc020087c:	3b078793          	addi	a5,a5,944 # ffffffffc0200c28 <__alltraps>
ffffffffc0200880:	10579073          	csrw	stvec,a5
}
ffffffffc0200884:	8082                	ret

ffffffffc0200886 <print_regs>:
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr) {
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc0200886:	610c                	ld	a1,0(a0)
void print_regs(struct pushregs *gpr) {
ffffffffc0200888:	1141                	addi	sp,sp,-16
ffffffffc020088a:	e022                	sd	s0,0(sp)
ffffffffc020088c:	842a                	mv	s0,a0
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc020088e:	00002517          	auipc	a0,0x2
ffffffffc0200892:	c6a50513          	addi	a0,a0,-918 # ffffffffc02024f8 <commands+0x1d8>
void print_regs(struct pushregs *gpr) {
ffffffffc0200896:	e406                	sd	ra,8(sp)
    cprintf("  zero     0x%08x\n", gpr->zero);
ffffffffc0200898:	87bff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  ra       0x%08x\n", gpr->ra);
ffffffffc020089c:	640c                	ld	a1,8(s0)
ffffffffc020089e:	00002517          	auipc	a0,0x2
ffffffffc02008a2:	c7250513          	addi	a0,a0,-910 # ffffffffc0202510 <commands+0x1f0>
ffffffffc02008a6:	86dff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  sp       0x%08x\n", gpr->sp);
ffffffffc02008aa:	680c                	ld	a1,16(s0)
ffffffffc02008ac:	00002517          	auipc	a0,0x2
ffffffffc02008b0:	c7c50513          	addi	a0,a0,-900 # ffffffffc0202528 <commands+0x208>
ffffffffc02008b4:	85fff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  gp       0x%08x\n", gpr->gp);
ffffffffc02008b8:	6c0c                	ld	a1,24(s0)
ffffffffc02008ba:	00002517          	auipc	a0,0x2
ffffffffc02008be:	c8650513          	addi	a0,a0,-890 # ffffffffc0202540 <commands+0x220>
ffffffffc02008c2:	851ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  tp       0x%08x\n", gpr->tp);
ffffffffc02008c6:	700c                	ld	a1,32(s0)
ffffffffc02008c8:	00002517          	auipc	a0,0x2
ffffffffc02008cc:	c9050513          	addi	a0,a0,-880 # ffffffffc0202558 <commands+0x238>
ffffffffc02008d0:	843ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t0       0x%08x\n", gpr->t0);
ffffffffc02008d4:	740c                	ld	a1,40(s0)
ffffffffc02008d6:	00002517          	auipc	a0,0x2
ffffffffc02008da:	c9a50513          	addi	a0,a0,-870 # ffffffffc0202570 <commands+0x250>
ffffffffc02008de:	835ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t1       0x%08x\n", gpr->t1);
ffffffffc02008e2:	780c                	ld	a1,48(s0)
ffffffffc02008e4:	00002517          	auipc	a0,0x2
ffffffffc02008e8:	ca450513          	addi	a0,a0,-860 # ffffffffc0202588 <commands+0x268>
ffffffffc02008ec:	827ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t2       0x%08x\n", gpr->t2);
ffffffffc02008f0:	7c0c                	ld	a1,56(s0)
ffffffffc02008f2:	00002517          	auipc	a0,0x2
ffffffffc02008f6:	cae50513          	addi	a0,a0,-850 # ffffffffc02025a0 <commands+0x280>
ffffffffc02008fa:	819ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s0       0x%08x\n", gpr->s0);
ffffffffc02008fe:	602c                	ld	a1,64(s0)
ffffffffc0200900:	00002517          	auipc	a0,0x2
ffffffffc0200904:	cb850513          	addi	a0,a0,-840 # ffffffffc02025b8 <commands+0x298>
ffffffffc0200908:	80bff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s1       0x%08x\n", gpr->s1);
ffffffffc020090c:	642c                	ld	a1,72(s0)
ffffffffc020090e:	00002517          	auipc	a0,0x2
ffffffffc0200912:	cc250513          	addi	a0,a0,-830 # ffffffffc02025d0 <commands+0x2b0>
ffffffffc0200916:	ffcff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a0       0x%08x\n", gpr->a0);
ffffffffc020091a:	682c                	ld	a1,80(s0)
ffffffffc020091c:	00002517          	auipc	a0,0x2
ffffffffc0200920:	ccc50513          	addi	a0,a0,-820 # ffffffffc02025e8 <commands+0x2c8>
ffffffffc0200924:	feeff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a1       0x%08x\n", gpr->a1);
ffffffffc0200928:	6c2c                	ld	a1,88(s0)
ffffffffc020092a:	00002517          	auipc	a0,0x2
ffffffffc020092e:	cd650513          	addi	a0,a0,-810 # ffffffffc0202600 <commands+0x2e0>
ffffffffc0200932:	fe0ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a2       0x%08x\n", gpr->a2);
ffffffffc0200936:	702c                	ld	a1,96(s0)
ffffffffc0200938:	00002517          	auipc	a0,0x2
ffffffffc020093c:	ce050513          	addi	a0,a0,-800 # ffffffffc0202618 <commands+0x2f8>
ffffffffc0200940:	fd2ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a3       0x%08x\n", gpr->a3);
ffffffffc0200944:	742c                	ld	a1,104(s0)
ffffffffc0200946:	00002517          	auipc	a0,0x2
ffffffffc020094a:	cea50513          	addi	a0,a0,-790 # ffffffffc0202630 <commands+0x310>
ffffffffc020094e:	fc4ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a4       0x%08x\n", gpr->a4);
ffffffffc0200952:	782c                	ld	a1,112(s0)
ffffffffc0200954:	00002517          	auipc	a0,0x2
ffffffffc0200958:	cf450513          	addi	a0,a0,-780 # ffffffffc0202648 <commands+0x328>
ffffffffc020095c:	fb6ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a5       0x%08x\n", gpr->a5);
ffffffffc0200960:	7c2c                	ld	a1,120(s0)
ffffffffc0200962:	00002517          	auipc	a0,0x2
ffffffffc0200966:	cfe50513          	addi	a0,a0,-770 # ffffffffc0202660 <commands+0x340>
ffffffffc020096a:	fa8ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a6       0x%08x\n", gpr->a6);
ffffffffc020096e:	604c                	ld	a1,128(s0)
ffffffffc0200970:	00002517          	auipc	a0,0x2
ffffffffc0200974:	d0850513          	addi	a0,a0,-760 # ffffffffc0202678 <commands+0x358>
ffffffffc0200978:	f9aff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  a7       0x%08x\n", gpr->a7);
ffffffffc020097c:	644c                	ld	a1,136(s0)
ffffffffc020097e:	00002517          	auipc	a0,0x2
ffffffffc0200982:	d1250513          	addi	a0,a0,-750 # ffffffffc0202690 <commands+0x370>
ffffffffc0200986:	f8cff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s2       0x%08x\n", gpr->s2);
ffffffffc020098a:	684c                	ld	a1,144(s0)
ffffffffc020098c:	00002517          	auipc	a0,0x2
ffffffffc0200990:	d1c50513          	addi	a0,a0,-740 # ffffffffc02026a8 <commands+0x388>
ffffffffc0200994:	f7eff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s3       0x%08x\n", gpr->s3);
ffffffffc0200998:	6c4c                	ld	a1,152(s0)
ffffffffc020099a:	00002517          	auipc	a0,0x2
ffffffffc020099e:	d2650513          	addi	a0,a0,-730 # ffffffffc02026c0 <commands+0x3a0>
ffffffffc02009a2:	f70ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s4       0x%08x\n", gpr->s4);
ffffffffc02009a6:	704c                	ld	a1,160(s0)
ffffffffc02009a8:	00002517          	auipc	a0,0x2
ffffffffc02009ac:	d3050513          	addi	a0,a0,-720 # ffffffffc02026d8 <commands+0x3b8>
ffffffffc02009b0:	f62ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s5       0x%08x\n", gpr->s5);
ffffffffc02009b4:	744c                	ld	a1,168(s0)
ffffffffc02009b6:	00002517          	auipc	a0,0x2
ffffffffc02009ba:	d3a50513          	addi	a0,a0,-710 # ffffffffc02026f0 <commands+0x3d0>
ffffffffc02009be:	f54ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s6       0x%08x\n", gpr->s6);
ffffffffc02009c2:	784c                	ld	a1,176(s0)
ffffffffc02009c4:	00002517          	auipc	a0,0x2
ffffffffc02009c8:	d4450513          	addi	a0,a0,-700 # ffffffffc0202708 <commands+0x3e8>
ffffffffc02009cc:	f46ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s7       0x%08x\n", gpr->s7);
ffffffffc02009d0:	7c4c                	ld	a1,184(s0)
ffffffffc02009d2:	00002517          	auipc	a0,0x2
ffffffffc02009d6:	d4e50513          	addi	a0,a0,-690 # ffffffffc0202720 <commands+0x400>
ffffffffc02009da:	f38ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s8       0x%08x\n", gpr->s8);
ffffffffc02009de:	606c                	ld	a1,192(s0)
ffffffffc02009e0:	00002517          	auipc	a0,0x2
ffffffffc02009e4:	d5850513          	addi	a0,a0,-680 # ffffffffc0202738 <commands+0x418>
ffffffffc02009e8:	f2aff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s9       0x%08x\n", gpr->s9);
ffffffffc02009ec:	646c                	ld	a1,200(s0)
ffffffffc02009ee:	00002517          	auipc	a0,0x2
ffffffffc02009f2:	d6250513          	addi	a0,a0,-670 # ffffffffc0202750 <commands+0x430>
ffffffffc02009f6:	f1cff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s10      0x%08x\n", gpr->s10);
ffffffffc02009fa:	686c                	ld	a1,208(s0)
ffffffffc02009fc:	00002517          	auipc	a0,0x2
ffffffffc0200a00:	d6c50513          	addi	a0,a0,-660 # ffffffffc0202768 <commands+0x448>
ffffffffc0200a04:	f0eff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  s11      0x%08x\n", gpr->s11);
ffffffffc0200a08:	6c6c                	ld	a1,216(s0)
ffffffffc0200a0a:	00002517          	auipc	a0,0x2
ffffffffc0200a0e:	d7650513          	addi	a0,a0,-650 # ffffffffc0202780 <commands+0x460>
ffffffffc0200a12:	f00ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t3       0x%08x\n", gpr->t3);
ffffffffc0200a16:	706c                	ld	a1,224(s0)
ffffffffc0200a18:	00002517          	auipc	a0,0x2
ffffffffc0200a1c:	d8050513          	addi	a0,a0,-640 # ffffffffc0202798 <commands+0x478>
ffffffffc0200a20:	ef2ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t4       0x%08x\n", gpr->t4);
ffffffffc0200a24:	746c                	ld	a1,232(s0)
ffffffffc0200a26:	00002517          	auipc	a0,0x2
ffffffffc0200a2a:	d8a50513          	addi	a0,a0,-630 # ffffffffc02027b0 <commands+0x490>
ffffffffc0200a2e:	ee4ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t5       0x%08x\n", gpr->t5);
ffffffffc0200a32:	786c                	ld	a1,240(s0)
ffffffffc0200a34:	00002517          	auipc	a0,0x2
ffffffffc0200a38:	d9450513          	addi	a0,a0,-620 # ffffffffc02027c8 <commands+0x4a8>
ffffffffc0200a3c:	ed6ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200a40:	7c6c                	ld	a1,248(s0)
}
ffffffffc0200a42:	6402                	ld	s0,0(sp)
ffffffffc0200a44:	60a2                	ld	ra,8(sp)
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200a46:	00002517          	auipc	a0,0x2
ffffffffc0200a4a:	d9a50513          	addi	a0,a0,-614 # ffffffffc02027e0 <commands+0x4c0>
}
ffffffffc0200a4e:	0141                	addi	sp,sp,16
    cprintf("  t6       0x%08x\n", gpr->t6);
ffffffffc0200a50:	ec2ff06f          	j	ffffffffc0200112 <cprintf>

ffffffffc0200a54 <print_trapframe>:
void print_trapframe(struct trapframe *tf) {
ffffffffc0200a54:	1141                	addi	sp,sp,-16
ffffffffc0200a56:	e022                	sd	s0,0(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200a58:	85aa                	mv	a1,a0
void print_trapframe(struct trapframe *tf) {
ffffffffc0200a5a:	842a                	mv	s0,a0
    cprintf("trapframe at %p\n", tf);
ffffffffc0200a5c:	00002517          	auipc	a0,0x2
ffffffffc0200a60:	d9c50513          	addi	a0,a0,-612 # ffffffffc02027f8 <commands+0x4d8>
void print_trapframe(struct trapframe *tf) {
ffffffffc0200a64:	e406                	sd	ra,8(sp)
    cprintf("trapframe at %p\n", tf);
ffffffffc0200a66:	eacff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    print_regs(&tf->gpr);
ffffffffc0200a6a:	8522                	mv	a0,s0
ffffffffc0200a6c:	e1bff0ef          	jal	ra,ffffffffc0200886 <print_regs>
    cprintf("  status   0x%08x\n", tf->status);
ffffffffc0200a70:	10043583          	ld	a1,256(s0)
ffffffffc0200a74:	00002517          	auipc	a0,0x2
ffffffffc0200a78:	d9c50513          	addi	a0,a0,-612 # ffffffffc0202810 <commands+0x4f0>
ffffffffc0200a7c:	e96ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  epc      0x%08x\n", tf->epc);
ffffffffc0200a80:	10843583          	ld	a1,264(s0)
ffffffffc0200a84:	00002517          	auipc	a0,0x2
ffffffffc0200a88:	da450513          	addi	a0,a0,-604 # ffffffffc0202828 <commands+0x508>
ffffffffc0200a8c:	e86ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
ffffffffc0200a90:	11043583          	ld	a1,272(s0)
ffffffffc0200a94:	00002517          	auipc	a0,0x2
ffffffffc0200a98:	dac50513          	addi	a0,a0,-596 # ffffffffc0202840 <commands+0x520>
ffffffffc0200a9c:	e76ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200aa0:	11843583          	ld	a1,280(s0)
}
ffffffffc0200aa4:	6402                	ld	s0,0(sp)
ffffffffc0200aa6:	60a2                	ld	ra,8(sp)
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200aa8:	00002517          	auipc	a0,0x2
ffffffffc0200aac:	db050513          	addi	a0,a0,-592 # ffffffffc0202858 <commands+0x538>
}
ffffffffc0200ab0:	0141                	addi	sp,sp,16
    cprintf("  cause    0x%08x\n", tf->cause);
ffffffffc0200ab2:	e60ff06f          	j	ffffffffc0200112 <cprintf>

ffffffffc0200ab6 <interrupt_handler>:

void interrupt_handler(struct trapframe *tf) {
    intptr_t cause = (tf->cause << 1) >> 1;
ffffffffc0200ab6:	11853783          	ld	a5,280(a0)
ffffffffc0200aba:	472d                	li	a4,11
ffffffffc0200abc:	0786                	slli	a5,a5,0x1
ffffffffc0200abe:	8385                	srli	a5,a5,0x1
ffffffffc0200ac0:	06f76c63          	bltu	a4,a5,ffffffffc0200b38 <interrupt_handler+0x82>
ffffffffc0200ac4:	00002717          	auipc	a4,0x2
ffffffffc0200ac8:	e7470713          	addi	a4,a4,-396 # ffffffffc0202938 <commands+0x618>
ffffffffc0200acc:	078a                	slli	a5,a5,0x2
ffffffffc0200ace:	97ba                	add	a5,a5,a4
ffffffffc0200ad0:	439c                	lw	a5,0(a5)
ffffffffc0200ad2:	97ba                	add	a5,a5,a4
ffffffffc0200ad4:	8782                	jr	a5
            break;
        case IRQ_H_SOFT:
            cprintf("Hypervisor software interrupt\n");
            break;
        case IRQ_M_SOFT:
            cprintf("Machine software interrupt\n");
ffffffffc0200ad6:	00002517          	auipc	a0,0x2
ffffffffc0200ada:	dfa50513          	addi	a0,a0,-518 # ffffffffc02028d0 <commands+0x5b0>
ffffffffc0200ade:	e34ff06f          	j	ffffffffc0200112 <cprintf>
            cprintf("Hypervisor software interrupt\n");
ffffffffc0200ae2:	00002517          	auipc	a0,0x2
ffffffffc0200ae6:	dce50513          	addi	a0,a0,-562 # ffffffffc02028b0 <commands+0x590>
ffffffffc0200aea:	e28ff06f          	j	ffffffffc0200112 <cprintf>
            cprintf("User software interrupt\n");
ffffffffc0200aee:	00002517          	auipc	a0,0x2
ffffffffc0200af2:	d8250513          	addi	a0,a0,-638 # ffffffffc0202870 <commands+0x550>
ffffffffc0200af6:	e1cff06f          	j	ffffffffc0200112 <cprintf>
            break;
        case IRQ_U_TIMER:
            cprintf("User Timer interrupt\n");
ffffffffc0200afa:	00002517          	auipc	a0,0x2
ffffffffc0200afe:	df650513          	addi	a0,a0,-522 # ffffffffc02028f0 <commands+0x5d0>
ffffffffc0200b02:	e10ff06f          	j	ffffffffc0200112 <cprintf>
            // 定义静态变量以在函数调用间保持状态
            static size_t ticks = 0;
            static int print_count = 0;

            // (2) 计数器（ticks）加一
            ticks++;
ffffffffc0200b06:	00007717          	auipc	a4,0x7
ffffffffc0200b0a:	96270713          	addi	a4,a4,-1694 # ffffffffc0207468 <ticks.1>
ffffffffc0200b0e:	631c                	ld	a5,0(a4)

            // (3) 当计数器加到100的时候
            if (ticks == TICK_NUM) {
ffffffffc0200b10:	06400693          	li	a3,100
            ticks++;
ffffffffc0200b14:	0785                	addi	a5,a5,1
            if (ticks == TICK_NUM) {
ffffffffc0200b16:	02d78263          	beq	a5,a3,ffffffffc0200b3a <interrupt_handler+0x84>
            ticks++;
ffffffffc0200b1a:	e31c                	sd	a5,0(a4)
                    sbi_shutdown();
                    break;
                }
            }
            // (1) 设置下次时钟中断
            clock_set_next_event();
ffffffffc0200b1c:	97fff06f          	j	ffffffffc020049a <clock_set_next_event>
            break;
        case IRQ_U_EXT:
            cprintf("User software interrupt\n");
            break;
        case IRQ_S_EXT:
            cprintf("Supervisor external interrupt\n");
ffffffffc0200b20:	00002517          	auipc	a0,0x2
ffffffffc0200b24:	df850513          	addi	a0,a0,-520 # ffffffffc0202918 <commands+0x5f8>
ffffffffc0200b28:	deaff06f          	j	ffffffffc0200112 <cprintf>
            cprintf("Supervisor software interrupt\n");
ffffffffc0200b2c:	00002517          	auipc	a0,0x2
ffffffffc0200b30:	d6450513          	addi	a0,a0,-668 # ffffffffc0202890 <commands+0x570>
ffffffffc0200b34:	ddeff06f          	j	ffffffffc0200112 <cprintf>
            break;
        case IRQ_M_EXT:
            cprintf("Machine software interrupt\n");
            break;
        default:
            print_trapframe(tf);
ffffffffc0200b38:	bf31                	j	ffffffffc0200a54 <print_trapframe>
void interrupt_handler(struct trapframe *tf) {
ffffffffc0200b3a:	1141                	addi	sp,sp,-16
    cprintf("%d ticks\n", TICK_NUM);
ffffffffc0200b3c:	06400593          	li	a1,100
ffffffffc0200b40:	00002517          	auipc	a0,0x2
ffffffffc0200b44:	dc850513          	addi	a0,a0,-568 # ffffffffc0202908 <commands+0x5e8>
                ticks = 0; // 重置计数器
ffffffffc0200b48:	00007797          	auipc	a5,0x7
ffffffffc0200b4c:	9207b023          	sd	zero,-1760(a5) # ffffffffc0207468 <ticks.1>
void interrupt_handler(struct trapframe *tf) {
ffffffffc0200b50:	e406                	sd	ra,8(sp)
    cprintf("%d ticks\n", TICK_NUM);
ffffffffc0200b52:	dc0ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
                print_count++;
ffffffffc0200b56:	00007717          	auipc	a4,0x7
ffffffffc0200b5a:	90a70713          	addi	a4,a4,-1782 # ffffffffc0207460 <print_count.0>
ffffffffc0200b5e:	431c                	lw	a5,0(a4)
                if (print_count == 10) {
ffffffffc0200b60:	46a9                	li	a3,10
                print_count++;
ffffffffc0200b62:	0017861b          	addiw	a2,a5,1
ffffffffc0200b66:	c310                	sw	a2,0(a4)
                if (print_count == 10) {
ffffffffc0200b68:	00d60663          	beq	a2,a3,ffffffffc0200b74 <interrupt_handler+0xbe>
            break;
    }
}
ffffffffc0200b6c:	60a2                	ld	ra,8(sp)
ffffffffc0200b6e:	0141                	addi	sp,sp,16
            clock_set_next_event();
ffffffffc0200b70:	92bff06f          	j	ffffffffc020049a <clock_set_next_event>
}
ffffffffc0200b74:	60a2                	ld	ra,8(sp)
ffffffffc0200b76:	0141                	addi	sp,sp,16
                    sbi_shutdown();
ffffffffc0200b78:	3c80106f          	j	ffffffffc0201f40 <sbi_shutdown>

ffffffffc0200b7c <exception_handler>:

void exception_handler(struct trapframe *tf) {
ffffffffc0200b7c:	1101                	addi	sp,sp,-32
ffffffffc0200b7e:	e822                	sd	s0,16(sp)
    switch (tf->cause) {
ffffffffc0200b80:	11853403          	ld	s0,280(a0)
void exception_handler(struct trapframe *tf) {
ffffffffc0200b84:	e426                	sd	s1,8(sp)
ffffffffc0200b86:	ec06                	sd	ra,24(sp)
    switch (tf->cause) {
ffffffffc0200b88:	478d                	li	a5,3
void exception_handler(struct trapframe *tf) {
ffffffffc0200b8a:	84aa                	mv	s1,a0
    switch (tf->cause) {
ffffffffc0200b8c:	04f40863          	beq	s0,a5,ffffffffc0200bdc <exception_handler+0x60>
ffffffffc0200b90:	0287ed63          	bltu	a5,s0,ffffffffc0200bca <exception_handler+0x4e>
ffffffffc0200b94:	4789                	li	a5,2
ffffffffc0200b96:	02f41563          	bne	s0,a5,ffffffffc0200bc0 <exception_handler+0x44>
        case CAUSE_FAULT_FETCH:
            break;
        case CAUSE_ILLEGAL_INSTRUCTION: {
             // 非法指令异常处理
             /* LAB3 CHALLENGE3   YOUR CODE :  */
            cprintf("Illegal instruction caught at 0x%08x\n", tf->epc);
ffffffffc0200b9a:	10853583          	ld	a1,264(a0)
ffffffffc0200b9e:	00002517          	auipc	a0,0x2
ffffffffc0200ba2:	dca50513          	addi	a0,a0,-566 # ffffffffc0202968 <commands+0x648>
ffffffffc0200ba6:	d6cff0ef          	jal	ra,ffffffffc0200112 <cprintf>
            cprintf("Exception type: Illegal instruction\n");
ffffffffc0200baa:	00002517          	auipc	a0,0x2
ffffffffc0200bae:	de650513          	addi	a0,a0,-538 # ffffffffc0202990 <commands+0x670>
ffffffffc0200bb2:	d60ff0ef          	jal	ra,ffffffffc0200112 <cprintf>
            // For illegal instructions, we always skip 4 bytes for safety
            // because the instruction encoding is invalid and unreliable
            tf->epc += 4;
ffffffffc0200bb6:	1084b783          	ld	a5,264(s1)
ffffffffc0200bba:	0791                	addi	a5,a5,4
ffffffffc0200bbc:	10f4b423          	sd	a5,264(s1)
            break;
        default:
            print_trapframe(tf);
            break;
    }
}
ffffffffc0200bc0:	60e2                	ld	ra,24(sp)
ffffffffc0200bc2:	6442                	ld	s0,16(sp)
ffffffffc0200bc4:	64a2                	ld	s1,8(sp)
ffffffffc0200bc6:	6105                	addi	sp,sp,32
ffffffffc0200bc8:	8082                	ret
    switch (tf->cause) {
ffffffffc0200bca:	1471                	addi	s0,s0,-4
ffffffffc0200bcc:	479d                	li	a5,7
ffffffffc0200bce:	fe87f9e3          	bgeu	a5,s0,ffffffffc0200bc0 <exception_handler+0x44>
}
ffffffffc0200bd2:	6442                	ld	s0,16(sp)
ffffffffc0200bd4:	60e2                	ld	ra,24(sp)
ffffffffc0200bd6:	64a2                	ld	s1,8(sp)
ffffffffc0200bd8:	6105                	addi	sp,sp,32
            print_trapframe(tf);
ffffffffc0200bda:	bdad                	j	ffffffffc0200a54 <print_trapframe>
            cprintf("ebreak caught at 0x%08x\n", tf->epc);
ffffffffc0200bdc:	10853583          	ld	a1,264(a0)
ffffffffc0200be0:	00002517          	auipc	a0,0x2
ffffffffc0200be4:	dd850513          	addi	a0,a0,-552 # ffffffffc02029b8 <commands+0x698>
ffffffffc0200be8:	d2aff0ef          	jal	ra,ffffffffc0200112 <cprintf>
            cprintf("Exception type: breakpoint\n");
ffffffffc0200bec:	00002517          	auipc	a0,0x2
ffffffffc0200bf0:	dec50513          	addi	a0,a0,-532 # ffffffffc02029d8 <commands+0x6b8>
ffffffffc0200bf4:	d1eff0ef          	jal	ra,ffffffffc0200112 <cprintf>
            uint16_t inst_bp = *(uint16_t *)(tf->epc);
ffffffffc0200bf8:	1084b783          	ld	a5,264(s1)
            tf->epc += (inst_bp & 0x3) == 0x3 ? 4 : 2;
ffffffffc0200bfc:	4691                	li	a3,4
ffffffffc0200bfe:	0007d703          	lhu	a4,0(a5)
ffffffffc0200c02:	8b0d                	andi	a4,a4,3
ffffffffc0200c04:	00870363          	beq	a4,s0,ffffffffc0200c0a <exception_handler+0x8e>
ffffffffc0200c08:	4689                	li	a3,2
}
ffffffffc0200c0a:	60e2                	ld	ra,24(sp)
ffffffffc0200c0c:	6442                	ld	s0,16(sp)
            tf->epc += (inst_bp & 0x3) == 0x3 ? 4 : 2;
ffffffffc0200c0e:	97b6                	add	a5,a5,a3
ffffffffc0200c10:	10f4b423          	sd	a5,264(s1)
}
ffffffffc0200c14:	64a2                	ld	s1,8(sp)
ffffffffc0200c16:	6105                	addi	sp,sp,32
ffffffffc0200c18:	8082                	ret

ffffffffc0200c1a <trap>:

static inline void trap_dispatch(struct trapframe *tf) {
    if ((intptr_t)tf->cause < 0) {
ffffffffc0200c1a:	11853783          	ld	a5,280(a0)
ffffffffc0200c1e:	0007c363          	bltz	a5,ffffffffc0200c24 <trap+0xa>
        // interrupts
        interrupt_handler(tf);
    } else {
        // exceptions
        exception_handler(tf);
ffffffffc0200c22:	bfa9                	j	ffffffffc0200b7c <exception_handler>
        interrupt_handler(tf);
ffffffffc0200c24:	bd49                	j	ffffffffc0200ab6 <interrupt_handler>
	...

ffffffffc0200c28 <__alltraps>:
    .endm

    .globl __alltraps
    .align(2)
__alltraps:
    SAVE_ALL
ffffffffc0200c28:	14011073          	csrw	sscratch,sp
ffffffffc0200c2c:	712d                	addi	sp,sp,-288
ffffffffc0200c2e:	e002                	sd	zero,0(sp)
ffffffffc0200c30:	e406                	sd	ra,8(sp)
ffffffffc0200c32:	ec0e                	sd	gp,24(sp)
ffffffffc0200c34:	f012                	sd	tp,32(sp)
ffffffffc0200c36:	f416                	sd	t0,40(sp)
ffffffffc0200c38:	f81a                	sd	t1,48(sp)
ffffffffc0200c3a:	fc1e                	sd	t2,56(sp)
ffffffffc0200c3c:	e0a2                	sd	s0,64(sp)
ffffffffc0200c3e:	e4a6                	sd	s1,72(sp)
ffffffffc0200c40:	e8aa                	sd	a0,80(sp)
ffffffffc0200c42:	ecae                	sd	a1,88(sp)
ffffffffc0200c44:	f0b2                	sd	a2,96(sp)
ffffffffc0200c46:	f4b6                	sd	a3,104(sp)
ffffffffc0200c48:	f8ba                	sd	a4,112(sp)
ffffffffc0200c4a:	fcbe                	sd	a5,120(sp)
ffffffffc0200c4c:	e142                	sd	a6,128(sp)
ffffffffc0200c4e:	e546                	sd	a7,136(sp)
ffffffffc0200c50:	e94a                	sd	s2,144(sp)
ffffffffc0200c52:	ed4e                	sd	s3,152(sp)
ffffffffc0200c54:	f152                	sd	s4,160(sp)
ffffffffc0200c56:	f556                	sd	s5,168(sp)
ffffffffc0200c58:	f95a                	sd	s6,176(sp)
ffffffffc0200c5a:	fd5e                	sd	s7,184(sp)
ffffffffc0200c5c:	e1e2                	sd	s8,192(sp)
ffffffffc0200c5e:	e5e6                	sd	s9,200(sp)
ffffffffc0200c60:	e9ea                	sd	s10,208(sp)
ffffffffc0200c62:	edee                	sd	s11,216(sp)
ffffffffc0200c64:	f1f2                	sd	t3,224(sp)
ffffffffc0200c66:	f5f6                	sd	t4,232(sp)
ffffffffc0200c68:	f9fa                	sd	t5,240(sp)
ffffffffc0200c6a:	fdfe                	sd	t6,248(sp)
ffffffffc0200c6c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200c70:	100024f3          	csrr	s1,sstatus
ffffffffc0200c74:	14102973          	csrr	s2,sepc
ffffffffc0200c78:	143029f3          	csrr	s3,stval
ffffffffc0200c7c:	14202a73          	csrr	s4,scause
ffffffffc0200c80:	e822                	sd	s0,16(sp)
ffffffffc0200c82:	e226                	sd	s1,256(sp)
ffffffffc0200c84:	e64a                	sd	s2,264(sp)
ffffffffc0200c86:	ea4e                	sd	s3,272(sp)
ffffffffc0200c88:	ee52                	sd	s4,280(sp)

    move  a0, sp
ffffffffc0200c8a:	850a                	mv	a0,sp
    jal trap
ffffffffc0200c8c:	f8fff0ef          	jal	ra,ffffffffc0200c1a <trap>

ffffffffc0200c90 <__trapret>:
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
ffffffffc0200c90:	6492                	ld	s1,256(sp)
ffffffffc0200c92:	6932                	ld	s2,264(sp)
ffffffffc0200c94:	10049073          	csrw	sstatus,s1
ffffffffc0200c98:	14191073          	csrw	sepc,s2
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	61e2                	ld	gp,24(sp)
ffffffffc0200ca0:	7202                	ld	tp,32(sp)
ffffffffc0200ca2:	72a2                	ld	t0,40(sp)
ffffffffc0200ca4:	7342                	ld	t1,48(sp)
ffffffffc0200ca6:	73e2                	ld	t2,56(sp)
ffffffffc0200ca8:	6406                	ld	s0,64(sp)
ffffffffc0200caa:	64a6                	ld	s1,72(sp)
ffffffffc0200cac:	6546                	ld	a0,80(sp)
ffffffffc0200cae:	65e6                	ld	a1,88(sp)
ffffffffc0200cb0:	7606                	ld	a2,96(sp)
ffffffffc0200cb2:	76a6                	ld	a3,104(sp)
ffffffffc0200cb4:	7746                	ld	a4,112(sp)
ffffffffc0200cb6:	77e6                	ld	a5,120(sp)
ffffffffc0200cb8:	680a                	ld	a6,128(sp)
ffffffffc0200cba:	68aa                	ld	a7,136(sp)
ffffffffc0200cbc:	694a                	ld	s2,144(sp)
ffffffffc0200cbe:	69ea                	ld	s3,152(sp)
ffffffffc0200cc0:	7a0a                	ld	s4,160(sp)
ffffffffc0200cc2:	7aaa                	ld	s5,168(sp)
ffffffffc0200cc4:	7b4a                	ld	s6,176(sp)
ffffffffc0200cc6:	7bea                	ld	s7,184(sp)
ffffffffc0200cc8:	6c0e                	ld	s8,192(sp)
ffffffffc0200cca:	6cae                	ld	s9,200(sp)
ffffffffc0200ccc:	6d4e                	ld	s10,208(sp)
ffffffffc0200cce:	6dee                	ld	s11,216(sp)
ffffffffc0200cd0:	7e0e                	ld	t3,224(sp)
ffffffffc0200cd2:	7eae                	ld	t4,232(sp)
ffffffffc0200cd4:	7f4e                	ld	t5,240(sp)
ffffffffc0200cd6:	7fee                	ld	t6,248(sp)
ffffffffc0200cd8:	6142                	ld	sp,16(sp)
    # return from supervisor call
    sret
ffffffffc0200cda:	10200073          	sret

ffffffffc0200cde <default_init>:
 * list_init - initialize a new entry
 * @elm:        new entry to be initialized
 * */
static inline void
list_init(list_entry_t *elm) {
    elm->prev = elm->next = elm;
ffffffffc0200cde:	00006797          	auipc	a5,0x6
ffffffffc0200ce2:	34a78793          	addi	a5,a5,842 # ffffffffc0207028 <free_area>
ffffffffc0200ce6:	e79c                	sd	a5,8(a5)
ffffffffc0200ce8:	e39c                	sd	a5,0(a5)
#define nr_free (free_area.nr_free)

static void
default_init(void) {
    list_init(&free_list);
    nr_free = 0;
ffffffffc0200cea:	0007a823          	sw	zero,16(a5)
}
ffffffffc0200cee:	8082                	ret

ffffffffc0200cf0 <default_nr_free_pages>:
}

static size_t
default_nr_free_pages(void) {
    return nr_free;
}
ffffffffc0200cf0:	00006517          	auipc	a0,0x6
ffffffffc0200cf4:	34856503          	lwu	a0,840(a0) # ffffffffc0207038 <free_area+0x10>
ffffffffc0200cf8:	8082                	ret

ffffffffc0200cfa <default_check>:
}

// LAB2: below code is used to check the first fit allocation algorithm (your EXERCISE 1) 
// NOTICE: You SHOULD NOT CHANGE basic_check, default_check functions!
static void
default_check(void) {
ffffffffc0200cfa:	715d                	addi	sp,sp,-80
ffffffffc0200cfc:	e0a2                	sd	s0,64(sp)
 * list_next - get the next entry
 * @listelm:    the list head
 **/
static inline list_entry_t *
list_next(list_entry_t *listelm) {
    return listelm->next;
ffffffffc0200cfe:	00006417          	auipc	s0,0x6
ffffffffc0200d02:	32a40413          	addi	s0,s0,810 # ffffffffc0207028 <free_area>
ffffffffc0200d06:	641c                	ld	a5,8(s0)
ffffffffc0200d08:	e486                	sd	ra,72(sp)
ffffffffc0200d0a:	fc26                	sd	s1,56(sp)
ffffffffc0200d0c:	f84a                	sd	s2,48(sp)
ffffffffc0200d0e:	f44e                	sd	s3,40(sp)
ffffffffc0200d10:	f052                	sd	s4,32(sp)
ffffffffc0200d12:	ec56                	sd	s5,24(sp)
ffffffffc0200d14:	e85a                	sd	s6,16(sp)
ffffffffc0200d16:	e45e                	sd	s7,8(sp)
ffffffffc0200d18:	e062                	sd	s8,0(sp)
    int count = 0, total = 0;
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list) {
ffffffffc0200d1a:	2c878763          	beq	a5,s0,ffffffffc0200fe8 <default_check+0x2ee>
    int count = 0, total = 0;
ffffffffc0200d1e:	4481                	li	s1,0
ffffffffc0200d20:	4901                	li	s2,0
 * test_bit - Determine whether a bit is set
 * @nr:     the bit to test
 * @addr:   the address to count from
 * */
static inline bool test_bit(int nr, volatile void *addr) {
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc0200d22:	ff07b703          	ld	a4,-16(a5)
        struct Page *p = le2page(le, page_link);
        assert(PageProperty(p));
ffffffffc0200d26:	8b09                	andi	a4,a4,2
ffffffffc0200d28:	2c070463          	beqz	a4,ffffffffc0200ff0 <default_check+0x2f6>
        count ++, total += p->property;
ffffffffc0200d2c:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200d30:	679c                	ld	a5,8(a5)
ffffffffc0200d32:	2905                	addiw	s2,s2,1
ffffffffc0200d34:	9cb9                	addw	s1,s1,a4
    while ((le = list_next(le)) != &free_list) {
ffffffffc0200d36:	fe8796e3          	bne	a5,s0,ffffffffc0200d22 <default_check+0x28>
    }
    assert(total == nr_free_pages());
ffffffffc0200d3a:	89a6                	mv	s3,s1
ffffffffc0200d3c:	2f9000ef          	jal	ra,ffffffffc0201834 <nr_free_pages>
ffffffffc0200d40:	71351863          	bne	a0,s3,ffffffffc0201450 <default_check+0x756>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0200d44:	4505                	li	a0,1
ffffffffc0200d46:	271000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200d4a:	8a2a                	mv	s4,a0
ffffffffc0200d4c:	44050263          	beqz	a0,ffffffffc0201190 <default_check+0x496>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0200d50:	4505                	li	a0,1
ffffffffc0200d52:	265000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200d56:	89aa                	mv	s3,a0
ffffffffc0200d58:	70050c63          	beqz	a0,ffffffffc0201470 <default_check+0x776>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0200d5c:	4505                	li	a0,1
ffffffffc0200d5e:	259000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200d62:	8aaa                	mv	s5,a0
ffffffffc0200d64:	4a050663          	beqz	a0,ffffffffc0201210 <default_check+0x516>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc0200d68:	2b3a0463          	beq	s4,s3,ffffffffc0201010 <default_check+0x316>
ffffffffc0200d6c:	2aaa0263          	beq	s4,a0,ffffffffc0201010 <default_check+0x316>
ffffffffc0200d70:	2aa98063          	beq	s3,a0,ffffffffc0201010 <default_check+0x316>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc0200d74:	000a2783          	lw	a5,0(s4)
ffffffffc0200d78:	2a079c63          	bnez	a5,ffffffffc0201030 <default_check+0x336>
ffffffffc0200d7c:	0009a783          	lw	a5,0(s3)
ffffffffc0200d80:	2a079863          	bnez	a5,ffffffffc0201030 <default_check+0x336>
ffffffffc0200d84:	411c                	lw	a5,0(a0)
ffffffffc0200d86:	2a079563          	bnez	a5,ffffffffc0201030 <default_check+0x336>
extern struct Page *pages;
extern size_t npage;
extern const size_t nbase;
extern uint64_t va_pa_offset;

static inline ppn_t page2ppn(struct Page *page) { return page - pages + nbase; }
ffffffffc0200d8a:	00006797          	auipc	a5,0x6
ffffffffc0200d8e:	6ee7b783          	ld	a5,1774(a5) # ffffffffc0207478 <pages>
ffffffffc0200d92:	40fa0733          	sub	a4,s4,a5
ffffffffc0200d96:	870d                	srai	a4,a4,0x3
ffffffffc0200d98:	00002597          	auipc	a1,0x2
ffffffffc0200d9c:	3e85b583          	ld	a1,1000(a1) # ffffffffc0203180 <error_string+0x38>
ffffffffc0200da0:	02b70733          	mul	a4,a4,a1
ffffffffc0200da4:	00002617          	auipc	a2,0x2
ffffffffc0200da8:	3e463603          	ld	a2,996(a2) # ffffffffc0203188 <nbase>
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc0200dac:	00006697          	auipc	a3,0x6
ffffffffc0200db0:	6c46b683          	ld	a3,1732(a3) # ffffffffc0207470 <npage>
ffffffffc0200db4:	06b2                	slli	a3,a3,0xc
ffffffffc0200db6:	9732                	add	a4,a4,a2

static inline uintptr_t page2pa(struct Page *page) {
    return page2ppn(page) << PGSHIFT;
ffffffffc0200db8:	0732                	slli	a4,a4,0xc
ffffffffc0200dba:	28d77b63          	bgeu	a4,a3,ffffffffc0201050 <default_check+0x356>
static inline ppn_t page2ppn(struct Page *page) { return page - pages + nbase; }
ffffffffc0200dbe:	40f98733          	sub	a4,s3,a5
ffffffffc0200dc2:	870d                	srai	a4,a4,0x3
ffffffffc0200dc4:	02b70733          	mul	a4,a4,a1
ffffffffc0200dc8:	9732                	add	a4,a4,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc0200dca:	0732                	slli	a4,a4,0xc
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0200dcc:	4cd77263          	bgeu	a4,a3,ffffffffc0201290 <default_check+0x596>
static inline ppn_t page2ppn(struct Page *page) { return page - pages + nbase; }
ffffffffc0200dd0:	40f507b3          	sub	a5,a0,a5
ffffffffc0200dd4:	878d                	srai	a5,a5,0x3
ffffffffc0200dd6:	02b787b3          	mul	a5,a5,a1
ffffffffc0200dda:	97b2                	add	a5,a5,a2
    return page2ppn(page) << PGSHIFT;
ffffffffc0200ddc:	07b2                	slli	a5,a5,0xc
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc0200dde:	30d7f963          	bgeu	a5,a3,ffffffffc02010f0 <default_check+0x3f6>
    assert(alloc_page() == NULL);
ffffffffc0200de2:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc0200de4:	00043c03          	ld	s8,0(s0)
ffffffffc0200de8:	00843b83          	ld	s7,8(s0)
    unsigned int nr_free_store = nr_free;
ffffffffc0200dec:	01042b03          	lw	s6,16(s0)
    elm->prev = elm->next = elm;
ffffffffc0200df0:	e400                	sd	s0,8(s0)
ffffffffc0200df2:	e000                	sd	s0,0(s0)
    nr_free = 0;
ffffffffc0200df4:	00006797          	auipc	a5,0x6
ffffffffc0200df8:	2407a223          	sw	zero,580(a5) # ffffffffc0207038 <free_area+0x10>
    assert(alloc_page() == NULL);
ffffffffc0200dfc:	1bb000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e00:	2c051863          	bnez	a0,ffffffffc02010d0 <default_check+0x3d6>
    free_page(p0);
ffffffffc0200e04:	4585                	li	a1,1
ffffffffc0200e06:	8552                	mv	a0,s4
ffffffffc0200e08:	1ed000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_page(p1);
ffffffffc0200e0c:	4585                	li	a1,1
ffffffffc0200e0e:	854e                	mv	a0,s3
ffffffffc0200e10:	1e5000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_page(p2);
ffffffffc0200e14:	4585                	li	a1,1
ffffffffc0200e16:	8556                	mv	a0,s5
ffffffffc0200e18:	1dd000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    assert(nr_free == 3);
ffffffffc0200e1c:	4818                	lw	a4,16(s0)
ffffffffc0200e1e:	478d                	li	a5,3
ffffffffc0200e20:	28f71863          	bne	a4,a5,ffffffffc02010b0 <default_check+0x3b6>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0200e24:	4505                	li	a0,1
ffffffffc0200e26:	191000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e2a:	89aa                	mv	s3,a0
ffffffffc0200e2c:	26050263          	beqz	a0,ffffffffc0201090 <default_check+0x396>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0200e30:	4505                	li	a0,1
ffffffffc0200e32:	185000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e36:	8aaa                	mv	s5,a0
ffffffffc0200e38:	3a050c63          	beqz	a0,ffffffffc02011f0 <default_check+0x4f6>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0200e3c:	4505                	li	a0,1
ffffffffc0200e3e:	179000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e42:	8a2a                	mv	s4,a0
ffffffffc0200e44:	38050663          	beqz	a0,ffffffffc02011d0 <default_check+0x4d6>
    assert(alloc_page() == NULL);
ffffffffc0200e48:	4505                	li	a0,1
ffffffffc0200e4a:	16d000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e4e:	36051163          	bnez	a0,ffffffffc02011b0 <default_check+0x4b6>
    free_page(p0);
ffffffffc0200e52:	4585                	li	a1,1
ffffffffc0200e54:	854e                	mv	a0,s3
ffffffffc0200e56:	19f000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    assert(!list_empty(&free_list));
ffffffffc0200e5a:	641c                	ld	a5,8(s0)
ffffffffc0200e5c:	20878a63          	beq	a5,s0,ffffffffc0201070 <default_check+0x376>
    assert((p = alloc_page()) == p0);
ffffffffc0200e60:	4505                	li	a0,1
ffffffffc0200e62:	155000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e66:	30a99563          	bne	s3,a0,ffffffffc0201170 <default_check+0x476>
    assert(alloc_page() == NULL);
ffffffffc0200e6a:	4505                	li	a0,1
ffffffffc0200e6c:	14b000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200e70:	2e051063          	bnez	a0,ffffffffc0201150 <default_check+0x456>
    assert(nr_free == 0);
ffffffffc0200e74:	481c                	lw	a5,16(s0)
ffffffffc0200e76:	2a079d63          	bnez	a5,ffffffffc0201130 <default_check+0x436>
    free_page(p);
ffffffffc0200e7a:	854e                	mv	a0,s3
ffffffffc0200e7c:	4585                	li	a1,1
    free_list = free_list_store;
ffffffffc0200e7e:	01843023          	sd	s8,0(s0)
ffffffffc0200e82:	01743423          	sd	s7,8(s0)
    nr_free = nr_free_store;
ffffffffc0200e86:	01642823          	sw	s6,16(s0)
    free_page(p);
ffffffffc0200e8a:	16b000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_page(p1);
ffffffffc0200e8e:	4585                	li	a1,1
ffffffffc0200e90:	8556                	mv	a0,s5
ffffffffc0200e92:	163000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_page(p2);
ffffffffc0200e96:	4585                	li	a1,1
ffffffffc0200e98:	8552                	mv	a0,s4
ffffffffc0200e9a:	15b000ef          	jal	ra,ffffffffc02017f4 <free_pages>

    basic_check();

    struct Page *p0 = alloc_pages(5), *p1, *p2;
ffffffffc0200e9e:	4515                	li	a0,5
ffffffffc0200ea0:	117000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200ea4:	89aa                	mv	s3,a0
    assert(p0 != NULL);
ffffffffc0200ea6:	26050563          	beqz	a0,ffffffffc0201110 <default_check+0x416>
ffffffffc0200eaa:	651c                	ld	a5,8(a0)
ffffffffc0200eac:	8385                	srli	a5,a5,0x1
    assert(!PageProperty(p0));
ffffffffc0200eae:	8b85                	andi	a5,a5,1
ffffffffc0200eb0:	54079063          	bnez	a5,ffffffffc02013f0 <default_check+0x6f6>

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));
    assert(alloc_page() == NULL);
ffffffffc0200eb4:	4505                	li	a0,1
    list_entry_t free_list_store = free_list;
ffffffffc0200eb6:	00043b03          	ld	s6,0(s0)
ffffffffc0200eba:	00843a83          	ld	s5,8(s0)
ffffffffc0200ebe:	e000                	sd	s0,0(s0)
ffffffffc0200ec0:	e400                	sd	s0,8(s0)
    assert(alloc_page() == NULL);
ffffffffc0200ec2:	0f5000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200ec6:	50051563          	bnez	a0,ffffffffc02013d0 <default_check+0x6d6>

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    free_pages(p0 + 2, 3);
ffffffffc0200eca:	05098a13          	addi	s4,s3,80
ffffffffc0200ece:	8552                	mv	a0,s4
ffffffffc0200ed0:	458d                	li	a1,3
    unsigned int nr_free_store = nr_free;
ffffffffc0200ed2:	01042b83          	lw	s7,16(s0)
    nr_free = 0;
ffffffffc0200ed6:	00006797          	auipc	a5,0x6
ffffffffc0200eda:	1607a123          	sw	zero,354(a5) # ffffffffc0207038 <free_area+0x10>
    free_pages(p0 + 2, 3);
ffffffffc0200ede:	117000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    assert(alloc_pages(4) == NULL);
ffffffffc0200ee2:	4511                	li	a0,4
ffffffffc0200ee4:	0d3000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200ee8:	4c051463          	bnez	a0,ffffffffc02013b0 <default_check+0x6b6>
ffffffffc0200eec:	0589b783          	ld	a5,88(s3)
ffffffffc0200ef0:	8385                	srli	a5,a5,0x1
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc0200ef2:	8b85                	andi	a5,a5,1
ffffffffc0200ef4:	48078e63          	beqz	a5,ffffffffc0201390 <default_check+0x696>
ffffffffc0200ef8:	0609a703          	lw	a4,96(s3)
ffffffffc0200efc:	478d                	li	a5,3
ffffffffc0200efe:	48f71963          	bne	a4,a5,ffffffffc0201390 <default_check+0x696>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc0200f02:	450d                	li	a0,3
ffffffffc0200f04:	0b3000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f08:	8c2a                	mv	s8,a0
ffffffffc0200f0a:	46050363          	beqz	a0,ffffffffc0201370 <default_check+0x676>
    assert(alloc_page() == NULL);
ffffffffc0200f0e:	4505                	li	a0,1
ffffffffc0200f10:	0a7000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f14:	42051e63          	bnez	a0,ffffffffc0201350 <default_check+0x656>
    assert(p0 + 2 == p1);
ffffffffc0200f18:	418a1c63          	bne	s4,s8,ffffffffc0201330 <default_check+0x636>

    p2 = p0 + 1;
    free_page(p0);
ffffffffc0200f1c:	4585                	li	a1,1
ffffffffc0200f1e:	854e                	mv	a0,s3
ffffffffc0200f20:	0d5000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_pages(p1, 3);
ffffffffc0200f24:	458d                	li	a1,3
ffffffffc0200f26:	8552                	mv	a0,s4
ffffffffc0200f28:	0cd000ef          	jal	ra,ffffffffc02017f4 <free_pages>
ffffffffc0200f2c:	0089b783          	ld	a5,8(s3)
    p2 = p0 + 1;
ffffffffc0200f30:	02898c13          	addi	s8,s3,40
ffffffffc0200f34:	8385                	srli	a5,a5,0x1
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc0200f36:	8b85                	andi	a5,a5,1
ffffffffc0200f38:	3c078c63          	beqz	a5,ffffffffc0201310 <default_check+0x616>
ffffffffc0200f3c:	0109a703          	lw	a4,16(s3)
ffffffffc0200f40:	4785                	li	a5,1
ffffffffc0200f42:	3cf71763          	bne	a4,a5,ffffffffc0201310 <default_check+0x616>
ffffffffc0200f46:	008a3783          	ld	a5,8(s4)
ffffffffc0200f4a:	8385                	srli	a5,a5,0x1
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc0200f4c:	8b85                	andi	a5,a5,1
ffffffffc0200f4e:	3a078163          	beqz	a5,ffffffffc02012f0 <default_check+0x5f6>
ffffffffc0200f52:	010a2703          	lw	a4,16(s4)
ffffffffc0200f56:	478d                	li	a5,3
ffffffffc0200f58:	38f71c63          	bne	a4,a5,ffffffffc02012f0 <default_check+0x5f6>

    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc0200f5c:	4505                	li	a0,1
ffffffffc0200f5e:	059000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f62:	36a99763          	bne	s3,a0,ffffffffc02012d0 <default_check+0x5d6>
    free_page(p0);
ffffffffc0200f66:	4585                	li	a1,1
ffffffffc0200f68:	08d000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc0200f6c:	4509                	li	a0,2
ffffffffc0200f6e:	049000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f72:	32aa1f63          	bne	s4,a0,ffffffffc02012b0 <default_check+0x5b6>

    free_pages(p0, 2);
ffffffffc0200f76:	4589                	li	a1,2
ffffffffc0200f78:	07d000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    free_page(p2);
ffffffffc0200f7c:	4585                	li	a1,1
ffffffffc0200f7e:	8562                	mv	a0,s8
ffffffffc0200f80:	075000ef          	jal	ra,ffffffffc02017f4 <free_pages>

    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc0200f84:	4515                	li	a0,5
ffffffffc0200f86:	031000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f8a:	89aa                	mv	s3,a0
ffffffffc0200f8c:	48050263          	beqz	a0,ffffffffc0201410 <default_check+0x716>
    assert(alloc_page() == NULL);
ffffffffc0200f90:	4505                	li	a0,1
ffffffffc0200f92:	025000ef          	jal	ra,ffffffffc02017b6 <alloc_pages>
ffffffffc0200f96:	2c051d63          	bnez	a0,ffffffffc0201270 <default_check+0x576>

    assert(nr_free == 0);
ffffffffc0200f9a:	481c                	lw	a5,16(s0)
ffffffffc0200f9c:	2a079a63          	bnez	a5,ffffffffc0201250 <default_check+0x556>
    nr_free = nr_free_store;

    free_list = free_list_store;
    free_pages(p0, 5);
ffffffffc0200fa0:	4595                	li	a1,5
ffffffffc0200fa2:	854e                	mv	a0,s3
    nr_free = nr_free_store;
ffffffffc0200fa4:	01742823          	sw	s7,16(s0)
    free_list = free_list_store;
ffffffffc0200fa8:	01643023          	sd	s6,0(s0)
ffffffffc0200fac:	01543423          	sd	s5,8(s0)
    free_pages(p0, 5);
ffffffffc0200fb0:	045000ef          	jal	ra,ffffffffc02017f4 <free_pages>
    return listelm->next;
ffffffffc0200fb4:	641c                	ld	a5,8(s0)

    le = &free_list;
    while ((le = list_next(le)) != &free_list) {
ffffffffc0200fb6:	00878963          	beq	a5,s0,ffffffffc0200fc8 <default_check+0x2ce>
        struct Page *p = le2page(le, page_link);
        count --, total -= p->property;
ffffffffc0200fba:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200fbe:	679c                	ld	a5,8(a5)
ffffffffc0200fc0:	397d                	addiw	s2,s2,-1
ffffffffc0200fc2:	9c99                	subw	s1,s1,a4
    while ((le = list_next(le)) != &free_list) {
ffffffffc0200fc4:	fe879be3          	bne	a5,s0,ffffffffc0200fba <default_check+0x2c0>
    }
    assert(count == 0);
ffffffffc0200fc8:	26091463          	bnez	s2,ffffffffc0201230 <default_check+0x536>
    assert(total == 0);
ffffffffc0200fcc:	46049263          	bnez	s1,ffffffffc0201430 <default_check+0x736>
}
ffffffffc0200fd0:	60a6                	ld	ra,72(sp)
ffffffffc0200fd2:	6406                	ld	s0,64(sp)
ffffffffc0200fd4:	74e2                	ld	s1,56(sp)
ffffffffc0200fd6:	7942                	ld	s2,48(sp)
ffffffffc0200fd8:	79a2                	ld	s3,40(sp)
ffffffffc0200fda:	7a02                	ld	s4,32(sp)
ffffffffc0200fdc:	6ae2                	ld	s5,24(sp)
ffffffffc0200fde:	6b42                	ld	s6,16(sp)
ffffffffc0200fe0:	6ba2                	ld	s7,8(sp)
ffffffffc0200fe2:	6c02                	ld	s8,0(sp)
ffffffffc0200fe4:	6161                	addi	sp,sp,80
ffffffffc0200fe6:	8082                	ret
    while ((le = list_next(le)) != &free_list) {
ffffffffc0200fe8:	4981                	li	s3,0
    int count = 0, total = 0;
ffffffffc0200fea:	4481                	li	s1,0
ffffffffc0200fec:	4901                	li	s2,0
ffffffffc0200fee:	b3b9                	j	ffffffffc0200d3c <default_check+0x42>
        assert(PageProperty(p));
ffffffffc0200ff0:	00002697          	auipc	a3,0x2
ffffffffc0200ff4:	a0868693          	addi	a3,a3,-1528 # ffffffffc02029f8 <commands+0x6d8>
ffffffffc0200ff8:	00002617          	auipc	a2,0x2
ffffffffc0200ffc:	a1060613          	addi	a2,a2,-1520 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201000:	0f000593          	li	a1,240
ffffffffc0201004:	00002517          	auipc	a0,0x2
ffffffffc0201008:	a1c50513          	addi	a0,a0,-1508 # ffffffffc0202a20 <commands+0x700>
ffffffffc020100c:	c00ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(p0 != p1 && p0 != p2 && p1 != p2);
ffffffffc0201010:	00002697          	auipc	a3,0x2
ffffffffc0201014:	aa868693          	addi	a3,a3,-1368 # ffffffffc0202ab8 <commands+0x798>
ffffffffc0201018:	00002617          	auipc	a2,0x2
ffffffffc020101c:	9f060613          	addi	a2,a2,-1552 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201020:	0bd00593          	li	a1,189
ffffffffc0201024:	00002517          	auipc	a0,0x2
ffffffffc0201028:	9fc50513          	addi	a0,a0,-1540 # ffffffffc0202a20 <commands+0x700>
ffffffffc020102c:	be0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);
ffffffffc0201030:	00002697          	auipc	a3,0x2
ffffffffc0201034:	ab068693          	addi	a3,a3,-1360 # ffffffffc0202ae0 <commands+0x7c0>
ffffffffc0201038:	00002617          	auipc	a2,0x2
ffffffffc020103c:	9d060613          	addi	a2,a2,-1584 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201040:	0be00593          	li	a1,190
ffffffffc0201044:	00002517          	auipc	a0,0x2
ffffffffc0201048:	9dc50513          	addi	a0,a0,-1572 # ffffffffc0202a20 <commands+0x700>
ffffffffc020104c:	bc0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(page2pa(p0) < npage * PGSIZE);
ffffffffc0201050:	00002697          	auipc	a3,0x2
ffffffffc0201054:	ad068693          	addi	a3,a3,-1328 # ffffffffc0202b20 <commands+0x800>
ffffffffc0201058:	00002617          	auipc	a2,0x2
ffffffffc020105c:	9b060613          	addi	a2,a2,-1616 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201060:	0c000593          	li	a1,192
ffffffffc0201064:	00002517          	auipc	a0,0x2
ffffffffc0201068:	9bc50513          	addi	a0,a0,-1604 # ffffffffc0202a20 <commands+0x700>
ffffffffc020106c:	ba0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(!list_empty(&free_list));
ffffffffc0201070:	00002697          	auipc	a3,0x2
ffffffffc0201074:	b3868693          	addi	a3,a3,-1224 # ffffffffc0202ba8 <commands+0x888>
ffffffffc0201078:	00002617          	auipc	a2,0x2
ffffffffc020107c:	99060613          	addi	a2,a2,-1648 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201080:	0d900593          	li	a1,217
ffffffffc0201084:	00002517          	auipc	a0,0x2
ffffffffc0201088:	99c50513          	addi	a0,a0,-1636 # ffffffffc0202a20 <commands+0x700>
ffffffffc020108c:	b80ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201090:	00002697          	auipc	a3,0x2
ffffffffc0201094:	9c868693          	addi	a3,a3,-1592 # ffffffffc0202a58 <commands+0x738>
ffffffffc0201098:	00002617          	auipc	a2,0x2
ffffffffc020109c:	97060613          	addi	a2,a2,-1680 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02010a0:	0d200593          	li	a1,210
ffffffffc02010a4:	00002517          	auipc	a0,0x2
ffffffffc02010a8:	97c50513          	addi	a0,a0,-1668 # ffffffffc0202a20 <commands+0x700>
ffffffffc02010ac:	b60ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(nr_free == 3);
ffffffffc02010b0:	00002697          	auipc	a3,0x2
ffffffffc02010b4:	ae868693          	addi	a3,a3,-1304 # ffffffffc0202b98 <commands+0x878>
ffffffffc02010b8:	00002617          	auipc	a2,0x2
ffffffffc02010bc:	95060613          	addi	a2,a2,-1712 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02010c0:	0d000593          	li	a1,208
ffffffffc02010c4:	00002517          	auipc	a0,0x2
ffffffffc02010c8:	95c50513          	addi	a0,a0,-1700 # ffffffffc0202a20 <commands+0x700>
ffffffffc02010cc:	b40ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc02010d0:	00002697          	auipc	a3,0x2
ffffffffc02010d4:	ab068693          	addi	a3,a3,-1360 # ffffffffc0202b80 <commands+0x860>
ffffffffc02010d8:	00002617          	auipc	a2,0x2
ffffffffc02010dc:	93060613          	addi	a2,a2,-1744 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02010e0:	0cb00593          	li	a1,203
ffffffffc02010e4:	00002517          	auipc	a0,0x2
ffffffffc02010e8:	93c50513          	addi	a0,a0,-1732 # ffffffffc0202a20 <commands+0x700>
ffffffffc02010ec:	b20ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(page2pa(p2) < npage * PGSIZE);
ffffffffc02010f0:	00002697          	auipc	a3,0x2
ffffffffc02010f4:	a7068693          	addi	a3,a3,-1424 # ffffffffc0202b60 <commands+0x840>
ffffffffc02010f8:	00002617          	auipc	a2,0x2
ffffffffc02010fc:	91060613          	addi	a2,a2,-1776 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201100:	0c200593          	li	a1,194
ffffffffc0201104:	00002517          	auipc	a0,0x2
ffffffffc0201108:	91c50513          	addi	a0,a0,-1764 # ffffffffc0202a20 <commands+0x700>
ffffffffc020110c:	b00ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(p0 != NULL);
ffffffffc0201110:	00002697          	auipc	a3,0x2
ffffffffc0201114:	ae068693          	addi	a3,a3,-1312 # ffffffffc0202bf0 <commands+0x8d0>
ffffffffc0201118:	00002617          	auipc	a2,0x2
ffffffffc020111c:	8f060613          	addi	a2,a2,-1808 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201120:	0f800593          	li	a1,248
ffffffffc0201124:	00002517          	auipc	a0,0x2
ffffffffc0201128:	8fc50513          	addi	a0,a0,-1796 # ffffffffc0202a20 <commands+0x700>
ffffffffc020112c:	ae0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(nr_free == 0);
ffffffffc0201130:	00002697          	auipc	a3,0x2
ffffffffc0201134:	ab068693          	addi	a3,a3,-1360 # ffffffffc0202be0 <commands+0x8c0>
ffffffffc0201138:	00002617          	auipc	a2,0x2
ffffffffc020113c:	8d060613          	addi	a2,a2,-1840 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201140:	0df00593          	li	a1,223
ffffffffc0201144:	00002517          	auipc	a0,0x2
ffffffffc0201148:	8dc50513          	addi	a0,a0,-1828 # ffffffffc0202a20 <commands+0x700>
ffffffffc020114c:	ac0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201150:	00002697          	auipc	a3,0x2
ffffffffc0201154:	a3068693          	addi	a3,a3,-1488 # ffffffffc0202b80 <commands+0x860>
ffffffffc0201158:	00002617          	auipc	a2,0x2
ffffffffc020115c:	8b060613          	addi	a2,a2,-1872 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201160:	0dd00593          	li	a1,221
ffffffffc0201164:	00002517          	auipc	a0,0x2
ffffffffc0201168:	8bc50513          	addi	a0,a0,-1860 # ffffffffc0202a20 <commands+0x700>
ffffffffc020116c:	aa0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p = alloc_page()) == p0);
ffffffffc0201170:	00002697          	auipc	a3,0x2
ffffffffc0201174:	a5068693          	addi	a3,a3,-1456 # ffffffffc0202bc0 <commands+0x8a0>
ffffffffc0201178:	00002617          	auipc	a2,0x2
ffffffffc020117c:	89060613          	addi	a2,a2,-1904 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201180:	0dc00593          	li	a1,220
ffffffffc0201184:	00002517          	auipc	a0,0x2
ffffffffc0201188:	89c50513          	addi	a0,a0,-1892 # ffffffffc0202a20 <commands+0x700>
ffffffffc020118c:	a80ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p0 = alloc_page()) != NULL);
ffffffffc0201190:	00002697          	auipc	a3,0x2
ffffffffc0201194:	8c868693          	addi	a3,a3,-1848 # ffffffffc0202a58 <commands+0x738>
ffffffffc0201198:	00002617          	auipc	a2,0x2
ffffffffc020119c:	87060613          	addi	a2,a2,-1936 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02011a0:	0b900593          	li	a1,185
ffffffffc02011a4:	00002517          	auipc	a0,0x2
ffffffffc02011a8:	87c50513          	addi	a0,a0,-1924 # ffffffffc0202a20 <commands+0x700>
ffffffffc02011ac:	a60ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc02011b0:	00002697          	auipc	a3,0x2
ffffffffc02011b4:	9d068693          	addi	a3,a3,-1584 # ffffffffc0202b80 <commands+0x860>
ffffffffc02011b8:	00002617          	auipc	a2,0x2
ffffffffc02011bc:	85060613          	addi	a2,a2,-1968 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02011c0:	0d600593          	li	a1,214
ffffffffc02011c4:	00002517          	auipc	a0,0x2
ffffffffc02011c8:	85c50513          	addi	a0,a0,-1956 # ffffffffc0202a20 <commands+0x700>
ffffffffc02011cc:	a40ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc02011d0:	00002697          	auipc	a3,0x2
ffffffffc02011d4:	8c868693          	addi	a3,a3,-1848 # ffffffffc0202a98 <commands+0x778>
ffffffffc02011d8:	00002617          	auipc	a2,0x2
ffffffffc02011dc:	83060613          	addi	a2,a2,-2000 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02011e0:	0d400593          	li	a1,212
ffffffffc02011e4:	00002517          	auipc	a0,0x2
ffffffffc02011e8:	83c50513          	addi	a0,a0,-1988 # ffffffffc0202a20 <commands+0x700>
ffffffffc02011ec:	a20ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc02011f0:	00002697          	auipc	a3,0x2
ffffffffc02011f4:	88868693          	addi	a3,a3,-1912 # ffffffffc0202a78 <commands+0x758>
ffffffffc02011f8:	00002617          	auipc	a2,0x2
ffffffffc02011fc:	81060613          	addi	a2,a2,-2032 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201200:	0d300593          	li	a1,211
ffffffffc0201204:	00002517          	auipc	a0,0x2
ffffffffc0201208:	81c50513          	addi	a0,a0,-2020 # ffffffffc0202a20 <commands+0x700>
ffffffffc020120c:	a00ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p2 = alloc_page()) != NULL);
ffffffffc0201210:	00002697          	auipc	a3,0x2
ffffffffc0201214:	88868693          	addi	a3,a3,-1912 # ffffffffc0202a98 <commands+0x778>
ffffffffc0201218:	00001617          	auipc	a2,0x1
ffffffffc020121c:	7f060613          	addi	a2,a2,2032 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201220:	0bb00593          	li	a1,187
ffffffffc0201224:	00001517          	auipc	a0,0x1
ffffffffc0201228:	7fc50513          	addi	a0,a0,2044 # ffffffffc0202a20 <commands+0x700>
ffffffffc020122c:	9e0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(count == 0);
ffffffffc0201230:	00002697          	auipc	a3,0x2
ffffffffc0201234:	b1068693          	addi	a3,a3,-1264 # ffffffffc0202d40 <commands+0xa20>
ffffffffc0201238:	00001617          	auipc	a2,0x1
ffffffffc020123c:	7d060613          	addi	a2,a2,2000 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201240:	12500593          	li	a1,293
ffffffffc0201244:	00001517          	auipc	a0,0x1
ffffffffc0201248:	7dc50513          	addi	a0,a0,2012 # ffffffffc0202a20 <commands+0x700>
ffffffffc020124c:	9c0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(nr_free == 0);
ffffffffc0201250:	00002697          	auipc	a3,0x2
ffffffffc0201254:	99068693          	addi	a3,a3,-1648 # ffffffffc0202be0 <commands+0x8c0>
ffffffffc0201258:	00001617          	auipc	a2,0x1
ffffffffc020125c:	7b060613          	addi	a2,a2,1968 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201260:	11a00593          	li	a1,282
ffffffffc0201264:	00001517          	auipc	a0,0x1
ffffffffc0201268:	7bc50513          	addi	a0,a0,1980 # ffffffffc0202a20 <commands+0x700>
ffffffffc020126c:	9a0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201270:	00002697          	auipc	a3,0x2
ffffffffc0201274:	91068693          	addi	a3,a3,-1776 # ffffffffc0202b80 <commands+0x860>
ffffffffc0201278:	00001617          	auipc	a2,0x1
ffffffffc020127c:	79060613          	addi	a2,a2,1936 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201280:	11800593          	li	a1,280
ffffffffc0201284:	00001517          	auipc	a0,0x1
ffffffffc0201288:	79c50513          	addi	a0,a0,1948 # ffffffffc0202a20 <commands+0x700>
ffffffffc020128c:	980ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(page2pa(p1) < npage * PGSIZE);
ffffffffc0201290:	00002697          	auipc	a3,0x2
ffffffffc0201294:	8b068693          	addi	a3,a3,-1872 # ffffffffc0202b40 <commands+0x820>
ffffffffc0201298:	00001617          	auipc	a2,0x1
ffffffffc020129c:	77060613          	addi	a2,a2,1904 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02012a0:	0c100593          	li	a1,193
ffffffffc02012a4:	00001517          	auipc	a0,0x1
ffffffffc02012a8:	77c50513          	addi	a0,a0,1916 # ffffffffc0202a20 <commands+0x700>
ffffffffc02012ac:	960ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p0 = alloc_pages(2)) == p2 + 1);
ffffffffc02012b0:	00002697          	auipc	a3,0x2
ffffffffc02012b4:	a5068693          	addi	a3,a3,-1456 # ffffffffc0202d00 <commands+0x9e0>
ffffffffc02012b8:	00001617          	auipc	a2,0x1
ffffffffc02012bc:	75060613          	addi	a2,a2,1872 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02012c0:	11200593          	li	a1,274
ffffffffc02012c4:	00001517          	auipc	a0,0x1
ffffffffc02012c8:	75c50513          	addi	a0,a0,1884 # ffffffffc0202a20 <commands+0x700>
ffffffffc02012cc:	940ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p0 = alloc_page()) == p2 - 1);
ffffffffc02012d0:	00002697          	auipc	a3,0x2
ffffffffc02012d4:	a1068693          	addi	a3,a3,-1520 # ffffffffc0202ce0 <commands+0x9c0>
ffffffffc02012d8:	00001617          	auipc	a2,0x1
ffffffffc02012dc:	73060613          	addi	a2,a2,1840 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02012e0:	11000593          	li	a1,272
ffffffffc02012e4:	00001517          	auipc	a0,0x1
ffffffffc02012e8:	73c50513          	addi	a0,a0,1852 # ffffffffc0202a20 <commands+0x700>
ffffffffc02012ec:	920ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(PageProperty(p1) && p1->property == 3);
ffffffffc02012f0:	00002697          	auipc	a3,0x2
ffffffffc02012f4:	9c868693          	addi	a3,a3,-1592 # ffffffffc0202cb8 <commands+0x998>
ffffffffc02012f8:	00001617          	auipc	a2,0x1
ffffffffc02012fc:	71060613          	addi	a2,a2,1808 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201300:	10e00593          	li	a1,270
ffffffffc0201304:	00001517          	auipc	a0,0x1
ffffffffc0201308:	71c50513          	addi	a0,a0,1820 # ffffffffc0202a20 <commands+0x700>
ffffffffc020130c:	900ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(PageProperty(p0) && p0->property == 1);
ffffffffc0201310:	00002697          	auipc	a3,0x2
ffffffffc0201314:	98068693          	addi	a3,a3,-1664 # ffffffffc0202c90 <commands+0x970>
ffffffffc0201318:	00001617          	auipc	a2,0x1
ffffffffc020131c:	6f060613          	addi	a2,a2,1776 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201320:	10d00593          	li	a1,269
ffffffffc0201324:	00001517          	auipc	a0,0x1
ffffffffc0201328:	6fc50513          	addi	a0,a0,1788 # ffffffffc0202a20 <commands+0x700>
ffffffffc020132c:	8e0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(p0 + 2 == p1);
ffffffffc0201330:	00002697          	auipc	a3,0x2
ffffffffc0201334:	95068693          	addi	a3,a3,-1712 # ffffffffc0202c80 <commands+0x960>
ffffffffc0201338:	00001617          	auipc	a2,0x1
ffffffffc020133c:	6d060613          	addi	a2,a2,1744 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201340:	10800593          	li	a1,264
ffffffffc0201344:	00001517          	auipc	a0,0x1
ffffffffc0201348:	6dc50513          	addi	a0,a0,1756 # ffffffffc0202a20 <commands+0x700>
ffffffffc020134c:	8c0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc0201350:	00002697          	auipc	a3,0x2
ffffffffc0201354:	83068693          	addi	a3,a3,-2000 # ffffffffc0202b80 <commands+0x860>
ffffffffc0201358:	00001617          	auipc	a2,0x1
ffffffffc020135c:	6b060613          	addi	a2,a2,1712 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201360:	10700593          	li	a1,263
ffffffffc0201364:	00001517          	auipc	a0,0x1
ffffffffc0201368:	6bc50513          	addi	a0,a0,1724 # ffffffffc0202a20 <commands+0x700>
ffffffffc020136c:	8a0ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p1 = alloc_pages(3)) != NULL);
ffffffffc0201370:	00002697          	auipc	a3,0x2
ffffffffc0201374:	8f068693          	addi	a3,a3,-1808 # ffffffffc0202c60 <commands+0x940>
ffffffffc0201378:	00001617          	auipc	a2,0x1
ffffffffc020137c:	69060613          	addi	a2,a2,1680 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201380:	10600593          	li	a1,262
ffffffffc0201384:	00001517          	auipc	a0,0x1
ffffffffc0201388:	69c50513          	addi	a0,a0,1692 # ffffffffc0202a20 <commands+0x700>
ffffffffc020138c:	880ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
ffffffffc0201390:	00002697          	auipc	a3,0x2
ffffffffc0201394:	8a068693          	addi	a3,a3,-1888 # ffffffffc0202c30 <commands+0x910>
ffffffffc0201398:	00001617          	auipc	a2,0x1
ffffffffc020139c:	67060613          	addi	a2,a2,1648 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02013a0:	10500593          	li	a1,261
ffffffffc02013a4:	00001517          	auipc	a0,0x1
ffffffffc02013a8:	67c50513          	addi	a0,a0,1660 # ffffffffc0202a20 <commands+0x700>
ffffffffc02013ac:	860ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_pages(4) == NULL);
ffffffffc02013b0:	00002697          	auipc	a3,0x2
ffffffffc02013b4:	86868693          	addi	a3,a3,-1944 # ffffffffc0202c18 <commands+0x8f8>
ffffffffc02013b8:	00001617          	auipc	a2,0x1
ffffffffc02013bc:	65060613          	addi	a2,a2,1616 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02013c0:	10400593          	li	a1,260
ffffffffc02013c4:	00001517          	auipc	a0,0x1
ffffffffc02013c8:	65c50513          	addi	a0,a0,1628 # ffffffffc0202a20 <commands+0x700>
ffffffffc02013cc:	840ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(alloc_page() == NULL);
ffffffffc02013d0:	00001697          	auipc	a3,0x1
ffffffffc02013d4:	7b068693          	addi	a3,a3,1968 # ffffffffc0202b80 <commands+0x860>
ffffffffc02013d8:	00001617          	auipc	a2,0x1
ffffffffc02013dc:	63060613          	addi	a2,a2,1584 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02013e0:	0fe00593          	li	a1,254
ffffffffc02013e4:	00001517          	auipc	a0,0x1
ffffffffc02013e8:	63c50513          	addi	a0,a0,1596 # ffffffffc0202a20 <commands+0x700>
ffffffffc02013ec:	820ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(!PageProperty(p0));
ffffffffc02013f0:	00002697          	auipc	a3,0x2
ffffffffc02013f4:	81068693          	addi	a3,a3,-2032 # ffffffffc0202c00 <commands+0x8e0>
ffffffffc02013f8:	00001617          	auipc	a2,0x1
ffffffffc02013fc:	61060613          	addi	a2,a2,1552 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201400:	0f900593          	li	a1,249
ffffffffc0201404:	00001517          	auipc	a0,0x1
ffffffffc0201408:	61c50513          	addi	a0,a0,1564 # ffffffffc0202a20 <commands+0x700>
ffffffffc020140c:	800ff0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p0 = alloc_pages(5)) != NULL);
ffffffffc0201410:	00002697          	auipc	a3,0x2
ffffffffc0201414:	91068693          	addi	a3,a3,-1776 # ffffffffc0202d20 <commands+0xa00>
ffffffffc0201418:	00001617          	auipc	a2,0x1
ffffffffc020141c:	5f060613          	addi	a2,a2,1520 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201420:	11700593          	li	a1,279
ffffffffc0201424:	00001517          	auipc	a0,0x1
ffffffffc0201428:	5fc50513          	addi	a0,a0,1532 # ffffffffc0202a20 <commands+0x700>
ffffffffc020142c:	fe1fe0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(total == 0);
ffffffffc0201430:	00002697          	auipc	a3,0x2
ffffffffc0201434:	92068693          	addi	a3,a3,-1760 # ffffffffc0202d50 <commands+0xa30>
ffffffffc0201438:	00001617          	auipc	a2,0x1
ffffffffc020143c:	5d060613          	addi	a2,a2,1488 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201440:	12600593          	li	a1,294
ffffffffc0201444:	00001517          	auipc	a0,0x1
ffffffffc0201448:	5dc50513          	addi	a0,a0,1500 # ffffffffc0202a20 <commands+0x700>
ffffffffc020144c:	fc1fe0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(total == nr_free_pages());
ffffffffc0201450:	00001697          	auipc	a3,0x1
ffffffffc0201454:	5e868693          	addi	a3,a3,1512 # ffffffffc0202a38 <commands+0x718>
ffffffffc0201458:	00001617          	auipc	a2,0x1
ffffffffc020145c:	5b060613          	addi	a2,a2,1456 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201460:	0f300593          	li	a1,243
ffffffffc0201464:	00001517          	auipc	a0,0x1
ffffffffc0201468:	5bc50513          	addi	a0,a0,1468 # ffffffffc0202a20 <commands+0x700>
ffffffffc020146c:	fa1fe0ef          	jal	ra,ffffffffc020040c <__panic>
    assert((p1 = alloc_page()) != NULL);
ffffffffc0201470:	00001697          	auipc	a3,0x1
ffffffffc0201474:	60868693          	addi	a3,a3,1544 # ffffffffc0202a78 <commands+0x758>
ffffffffc0201478:	00001617          	auipc	a2,0x1
ffffffffc020147c:	59060613          	addi	a2,a2,1424 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201480:	0ba00593          	li	a1,186
ffffffffc0201484:	00001517          	auipc	a0,0x1
ffffffffc0201488:	59c50513          	addi	a0,a0,1436 # ffffffffc0202a20 <commands+0x700>
ffffffffc020148c:	f81fe0ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc0201490 <default_free_pages>:
default_free_pages(struct Page *base, size_t n) {
ffffffffc0201490:	1141                	addi	sp,sp,-16
ffffffffc0201492:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0201494:	14058a63          	beqz	a1,ffffffffc02015e8 <default_free_pages+0x158>
    for (; p != base + n; p ++) {
ffffffffc0201498:	00259693          	slli	a3,a1,0x2
ffffffffc020149c:	96ae                	add	a3,a3,a1
ffffffffc020149e:	068e                	slli	a3,a3,0x3
ffffffffc02014a0:	96aa                	add	a3,a3,a0
ffffffffc02014a2:	87aa                	mv	a5,a0
ffffffffc02014a4:	02d50263          	beq	a0,a3,ffffffffc02014c8 <default_free_pages+0x38>
ffffffffc02014a8:	6798                	ld	a4,8(a5)
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc02014aa:	8b05                	andi	a4,a4,1
ffffffffc02014ac:	10071e63          	bnez	a4,ffffffffc02015c8 <default_free_pages+0x138>
ffffffffc02014b0:	6798                	ld	a4,8(a5)
ffffffffc02014b2:	8b09                	andi	a4,a4,2
ffffffffc02014b4:	10071a63          	bnez	a4,ffffffffc02015c8 <default_free_pages+0x138>
        p->flags = 0;
ffffffffc02014b8:	0007b423          	sd	zero,8(a5)



static inline int page_ref(struct Page *page) { return page->ref; }

static inline void set_page_ref(struct Page *page, int val) { page->ref = val; }
ffffffffc02014bc:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p ++) {
ffffffffc02014c0:	02878793          	addi	a5,a5,40
ffffffffc02014c4:	fed792e3          	bne	a5,a3,ffffffffc02014a8 <default_free_pages+0x18>
    base->property = n;
ffffffffc02014c8:	2581                	sext.w	a1,a1
ffffffffc02014ca:	c90c                	sw	a1,16(a0)
    SetPageProperty(base);
ffffffffc02014cc:	00850893          	addi	a7,a0,8
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc02014d0:	4789                	li	a5,2
ffffffffc02014d2:	40f8b02f          	amoor.d	zero,a5,(a7)
    nr_free += n;
ffffffffc02014d6:	00006697          	auipc	a3,0x6
ffffffffc02014da:	b5268693          	addi	a3,a3,-1198 # ffffffffc0207028 <free_area>
ffffffffc02014de:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc02014e0:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc02014e2:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc02014e6:	9db9                	addw	a1,a1,a4
ffffffffc02014e8:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list)) {
ffffffffc02014ea:	0ad78863          	beq	a5,a3,ffffffffc020159a <default_free_pages+0x10a>
            struct Page* page = le2page(le, page_link);
ffffffffc02014ee:	fe878713          	addi	a4,a5,-24
ffffffffc02014f2:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list)) {
ffffffffc02014f6:	4581                	li	a1,0
            if (base < page) {
ffffffffc02014f8:	00e56a63          	bltu	a0,a4,ffffffffc020150c <default_free_pages+0x7c>
    return listelm->next;
ffffffffc02014fc:	6798                	ld	a4,8(a5)
            } else if (list_next(le) == &free_list) {
ffffffffc02014fe:	06d70263          	beq	a4,a3,ffffffffc0201562 <default_free_pages+0xd2>
    for (; p != base + n; p ++) {
ffffffffc0201502:	87ba                	mv	a5,a4
            struct Page* page = le2page(le, page_link);
ffffffffc0201504:	fe878713          	addi	a4,a5,-24
            if (base < page) {
ffffffffc0201508:	fee57ae3          	bgeu	a0,a4,ffffffffc02014fc <default_free_pages+0x6c>
ffffffffc020150c:	c199                	beqz	a1,ffffffffc0201512 <default_free_pages+0x82>
ffffffffc020150e:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc0201512:	6398                	ld	a4,0(a5)
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_add(list_entry_t *elm, list_entry_t *prev, list_entry_t *next) {
    prev->next = next->prev = elm;
ffffffffc0201514:	e390                	sd	a2,0(a5)
ffffffffc0201516:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc0201518:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc020151a:	ed18                	sd	a4,24(a0)
    if (le != &free_list) {
ffffffffc020151c:	02d70063          	beq	a4,a3,ffffffffc020153c <default_free_pages+0xac>
        if (p + p->property == base) {
ffffffffc0201520:	ff872803          	lw	a6,-8(a4)
        p = le2page(le, page_link);
ffffffffc0201524:	fe870593          	addi	a1,a4,-24
        if (p + p->property == base) {
ffffffffc0201528:	02081613          	slli	a2,a6,0x20
ffffffffc020152c:	9201                	srli	a2,a2,0x20
ffffffffc020152e:	00261793          	slli	a5,a2,0x2
ffffffffc0201532:	97b2                	add	a5,a5,a2
ffffffffc0201534:	078e                	slli	a5,a5,0x3
ffffffffc0201536:	97ae                	add	a5,a5,a1
ffffffffc0201538:	02f50f63          	beq	a0,a5,ffffffffc0201576 <default_free_pages+0xe6>
    return listelm->next;
ffffffffc020153c:	7118                	ld	a4,32(a0)
    if (le != &free_list) {
ffffffffc020153e:	00d70f63          	beq	a4,a3,ffffffffc020155c <default_free_pages+0xcc>
        if (base + base->property == p) {
ffffffffc0201542:	490c                	lw	a1,16(a0)
        p = le2page(le, page_link);
ffffffffc0201544:	fe870693          	addi	a3,a4,-24
        if (base + base->property == p) {
ffffffffc0201548:	02059613          	slli	a2,a1,0x20
ffffffffc020154c:	9201                	srli	a2,a2,0x20
ffffffffc020154e:	00261793          	slli	a5,a2,0x2
ffffffffc0201552:	97b2                	add	a5,a5,a2
ffffffffc0201554:	078e                	slli	a5,a5,0x3
ffffffffc0201556:	97aa                	add	a5,a5,a0
ffffffffc0201558:	04f68863          	beq	a3,a5,ffffffffc02015a8 <default_free_pages+0x118>
}
ffffffffc020155c:	60a2                	ld	ra,8(sp)
ffffffffc020155e:	0141                	addi	sp,sp,16
ffffffffc0201560:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc0201562:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc0201564:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc0201566:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc0201568:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list) {
ffffffffc020156a:	02d70563          	beq	a4,a3,ffffffffc0201594 <default_free_pages+0x104>
    prev->next = next->prev = elm;
ffffffffc020156e:	8832                	mv	a6,a2
ffffffffc0201570:	4585                	li	a1,1
    for (; p != base + n; p ++) {
ffffffffc0201572:	87ba                	mv	a5,a4
ffffffffc0201574:	bf41                	j	ffffffffc0201504 <default_free_pages+0x74>
            p->property += base->property;
ffffffffc0201576:	491c                	lw	a5,16(a0)
ffffffffc0201578:	0107883b          	addw	a6,a5,a6
ffffffffc020157c:	ff072c23          	sw	a6,-8(a4)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201580:	57f5                	li	a5,-3
ffffffffc0201582:	60f8b02f          	amoand.d	zero,a5,(a7)
    __list_del(listelm->prev, listelm->next);
ffffffffc0201586:	6d10                	ld	a2,24(a0)
ffffffffc0201588:	711c                	ld	a5,32(a0)
            base = p;
ffffffffc020158a:	852e                	mv	a0,a1
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_del(list_entry_t *prev, list_entry_t *next) {
    prev->next = next;
ffffffffc020158c:	e61c                	sd	a5,8(a2)
    return listelm->next;
ffffffffc020158e:	6718                	ld	a4,8(a4)
    next->prev = prev;
ffffffffc0201590:	e390                	sd	a2,0(a5)
ffffffffc0201592:	b775                	j	ffffffffc020153e <default_free_pages+0xae>
ffffffffc0201594:	e290                	sd	a2,0(a3)
        while ((le = list_next(le)) != &free_list) {
ffffffffc0201596:	873e                	mv	a4,a5
ffffffffc0201598:	b761                	j	ffffffffc0201520 <default_free_pages+0x90>
}
ffffffffc020159a:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc020159c:	e390                	sd	a2,0(a5)
ffffffffc020159e:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc02015a0:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc02015a2:	ed1c                	sd	a5,24(a0)
ffffffffc02015a4:	0141                	addi	sp,sp,16
ffffffffc02015a6:	8082                	ret
            base->property += p->property;
ffffffffc02015a8:	ff872783          	lw	a5,-8(a4)
ffffffffc02015ac:	ff070693          	addi	a3,a4,-16
ffffffffc02015b0:	9dbd                	addw	a1,a1,a5
ffffffffc02015b2:	c90c                	sw	a1,16(a0)
ffffffffc02015b4:	57f5                	li	a5,-3
ffffffffc02015b6:	60f6b02f          	amoand.d	zero,a5,(a3)
    __list_del(listelm->prev, listelm->next);
ffffffffc02015ba:	6314                	ld	a3,0(a4)
ffffffffc02015bc:	671c                	ld	a5,8(a4)
}
ffffffffc02015be:	60a2                	ld	ra,8(sp)
    prev->next = next;
ffffffffc02015c0:	e69c                	sd	a5,8(a3)
    next->prev = prev;
ffffffffc02015c2:	e394                	sd	a3,0(a5)
ffffffffc02015c4:	0141                	addi	sp,sp,16
ffffffffc02015c6:	8082                	ret
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc02015c8:	00001697          	auipc	a3,0x1
ffffffffc02015cc:	7a068693          	addi	a3,a3,1952 # ffffffffc0202d68 <commands+0xa48>
ffffffffc02015d0:	00001617          	auipc	a2,0x1
ffffffffc02015d4:	43860613          	addi	a2,a2,1080 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02015d8:	08300593          	li	a1,131
ffffffffc02015dc:	00001517          	auipc	a0,0x1
ffffffffc02015e0:	44450513          	addi	a0,a0,1092 # ffffffffc0202a20 <commands+0x700>
ffffffffc02015e4:	e29fe0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(n > 0);
ffffffffc02015e8:	00001697          	auipc	a3,0x1
ffffffffc02015ec:	77868693          	addi	a3,a3,1912 # ffffffffc0202d60 <commands+0xa40>
ffffffffc02015f0:	00001617          	auipc	a2,0x1
ffffffffc02015f4:	41860613          	addi	a2,a2,1048 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02015f8:	08000593          	li	a1,128
ffffffffc02015fc:	00001517          	auipc	a0,0x1
ffffffffc0201600:	42450513          	addi	a0,a0,1060 # ffffffffc0202a20 <commands+0x700>
ffffffffc0201604:	e09fe0ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc0201608 <default_alloc_pages>:
    assert(n > 0);
ffffffffc0201608:	c959                	beqz	a0,ffffffffc020169e <default_alloc_pages+0x96>
    if (n > nr_free) {
ffffffffc020160a:	00006597          	auipc	a1,0x6
ffffffffc020160e:	a1e58593          	addi	a1,a1,-1506 # ffffffffc0207028 <free_area>
ffffffffc0201612:	0105a803          	lw	a6,16(a1)
ffffffffc0201616:	862a                	mv	a2,a0
ffffffffc0201618:	02081793          	slli	a5,a6,0x20
ffffffffc020161c:	9381                	srli	a5,a5,0x20
ffffffffc020161e:	00a7ee63          	bltu	a5,a0,ffffffffc020163a <default_alloc_pages+0x32>
    list_entry_t *le = &free_list;
ffffffffc0201622:	87ae                	mv	a5,a1
ffffffffc0201624:	a801                	j	ffffffffc0201634 <default_alloc_pages+0x2c>
        if (p->property >= n) {
ffffffffc0201626:	ff87a703          	lw	a4,-8(a5)
ffffffffc020162a:	02071693          	slli	a3,a4,0x20
ffffffffc020162e:	9281                	srli	a3,a3,0x20
ffffffffc0201630:	00c6f763          	bgeu	a3,a2,ffffffffc020163e <default_alloc_pages+0x36>
    return listelm->next;
ffffffffc0201634:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != &free_list) {
ffffffffc0201636:	feb798e3          	bne	a5,a1,ffffffffc0201626 <default_alloc_pages+0x1e>
        return NULL;
ffffffffc020163a:	4501                	li	a0,0
}
ffffffffc020163c:	8082                	ret
    return listelm->prev;
ffffffffc020163e:	0007b883          	ld	a7,0(a5)
    __list_del(listelm->prev, listelm->next);
ffffffffc0201642:	0087b303          	ld	t1,8(a5)
        struct Page *p = le2page(le, page_link);
ffffffffc0201646:	fe878513          	addi	a0,a5,-24
            p->property = page->property - n;
ffffffffc020164a:	00060e1b          	sext.w	t3,a2
    prev->next = next;
ffffffffc020164e:	0068b423          	sd	t1,8(a7)
    next->prev = prev;
ffffffffc0201652:	01133023          	sd	a7,0(t1)
        if (page->property > n) {
ffffffffc0201656:	02d67b63          	bgeu	a2,a3,ffffffffc020168c <default_alloc_pages+0x84>
            struct Page *p = page + n;
ffffffffc020165a:	00261693          	slli	a3,a2,0x2
ffffffffc020165e:	96b2                	add	a3,a3,a2
ffffffffc0201660:	068e                	slli	a3,a3,0x3
ffffffffc0201662:	96aa                	add	a3,a3,a0
            p->property = page->property - n;
ffffffffc0201664:	41c7073b          	subw	a4,a4,t3
ffffffffc0201668:	ca98                	sw	a4,16(a3)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc020166a:	00868613          	addi	a2,a3,8
ffffffffc020166e:	4709                	li	a4,2
ffffffffc0201670:	40e6302f          	amoor.d	zero,a4,(a2)
    __list_add(elm, listelm, listelm->next);
ffffffffc0201674:	0088b703          	ld	a4,8(a7)
            list_add(prev, &(p->page_link));
ffffffffc0201678:	01868613          	addi	a2,a3,24
        nr_free -= n;
ffffffffc020167c:	0105a803          	lw	a6,16(a1)
    prev->next = next->prev = elm;
ffffffffc0201680:	e310                	sd	a2,0(a4)
ffffffffc0201682:	00c8b423          	sd	a2,8(a7)
    elm->next = next;
ffffffffc0201686:	f298                	sd	a4,32(a3)
    elm->prev = prev;
ffffffffc0201688:	0116bc23          	sd	a7,24(a3)
ffffffffc020168c:	41c8083b          	subw	a6,a6,t3
ffffffffc0201690:	0105a823          	sw	a6,16(a1)
    __op_bit(and, __NOT, nr, ((volatile unsigned long *)addr));
ffffffffc0201694:	5775                	li	a4,-3
ffffffffc0201696:	17c1                	addi	a5,a5,-16
ffffffffc0201698:	60e7b02f          	amoand.d	zero,a4,(a5)
}
ffffffffc020169c:	8082                	ret
default_alloc_pages(size_t n) {
ffffffffc020169e:	1141                	addi	sp,sp,-16
    assert(n > 0);
ffffffffc02016a0:	00001697          	auipc	a3,0x1
ffffffffc02016a4:	6c068693          	addi	a3,a3,1728 # ffffffffc0202d60 <commands+0xa40>
ffffffffc02016a8:	00001617          	auipc	a2,0x1
ffffffffc02016ac:	36060613          	addi	a2,a2,864 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02016b0:	06200593          	li	a1,98
ffffffffc02016b4:	00001517          	auipc	a0,0x1
ffffffffc02016b8:	36c50513          	addi	a0,a0,876 # ffffffffc0202a20 <commands+0x700>
default_alloc_pages(size_t n) {
ffffffffc02016bc:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc02016be:	d4ffe0ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc02016c2 <default_init_memmap>:
default_init_memmap(struct Page *base, size_t n) {
ffffffffc02016c2:	1141                	addi	sp,sp,-16
ffffffffc02016c4:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc02016c6:	c9e1                	beqz	a1,ffffffffc0201796 <default_init_memmap+0xd4>
    for (; p != base + n; p ++) {
ffffffffc02016c8:	00259693          	slli	a3,a1,0x2
ffffffffc02016cc:	96ae                	add	a3,a3,a1
ffffffffc02016ce:	068e                	slli	a3,a3,0x3
ffffffffc02016d0:	96aa                	add	a3,a3,a0
ffffffffc02016d2:	87aa                	mv	a5,a0
ffffffffc02016d4:	00d50f63          	beq	a0,a3,ffffffffc02016f2 <default_init_memmap+0x30>
    return (((*(volatile unsigned long *)addr) >> nr) & 1);
ffffffffc02016d8:	6798                	ld	a4,8(a5)
        assert(PageReserved(p));
ffffffffc02016da:	8b05                	andi	a4,a4,1
ffffffffc02016dc:	cf49                	beqz	a4,ffffffffc0201776 <default_init_memmap+0xb4>
        p->flags = p->property = 0;
ffffffffc02016de:	0007a823          	sw	zero,16(a5)
ffffffffc02016e2:	0007b423          	sd	zero,8(a5)
ffffffffc02016e6:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; p ++) {
ffffffffc02016ea:	02878793          	addi	a5,a5,40
ffffffffc02016ee:	fed795e3          	bne	a5,a3,ffffffffc02016d8 <default_init_memmap+0x16>
    base->property = n;
ffffffffc02016f2:	2581                	sext.w	a1,a1
ffffffffc02016f4:	c90c                	sw	a1,16(a0)
    __op_bit(or, __NOP, nr, ((volatile unsigned long *)addr));
ffffffffc02016f6:	4789                	li	a5,2
ffffffffc02016f8:	00850713          	addi	a4,a0,8
ffffffffc02016fc:	40f7302f          	amoor.d	zero,a5,(a4)
    nr_free += n;
ffffffffc0201700:	00006697          	auipc	a3,0x6
ffffffffc0201704:	92868693          	addi	a3,a3,-1752 # ffffffffc0207028 <free_area>
ffffffffc0201708:	4a98                	lw	a4,16(a3)
    return list->next == list;
ffffffffc020170a:	669c                	ld	a5,8(a3)
        list_add(&free_list, &(base->page_link));
ffffffffc020170c:	01850613          	addi	a2,a0,24
    nr_free += n;
ffffffffc0201710:	9db9                	addw	a1,a1,a4
ffffffffc0201712:	ca8c                	sw	a1,16(a3)
    if (list_empty(&free_list)) {
ffffffffc0201714:	04d78a63          	beq	a5,a3,ffffffffc0201768 <default_init_memmap+0xa6>
            struct Page* page = le2page(le, page_link);
ffffffffc0201718:	fe878713          	addi	a4,a5,-24
ffffffffc020171c:	0006b803          	ld	a6,0(a3)
    if (list_empty(&free_list)) {
ffffffffc0201720:	4581                	li	a1,0
            if (base < page) {
ffffffffc0201722:	00e56a63          	bltu	a0,a4,ffffffffc0201736 <default_init_memmap+0x74>
    return listelm->next;
ffffffffc0201726:	6798                	ld	a4,8(a5)
            } else if (list_next(le) == &free_list) {
ffffffffc0201728:	02d70263          	beq	a4,a3,ffffffffc020174c <default_init_memmap+0x8a>
    for (; p != base + n; p ++) {
ffffffffc020172c:	87ba                	mv	a5,a4
            struct Page* page = le2page(le, page_link);
ffffffffc020172e:	fe878713          	addi	a4,a5,-24
            if (base < page) {
ffffffffc0201732:	fee57ae3          	bgeu	a0,a4,ffffffffc0201726 <default_init_memmap+0x64>
ffffffffc0201736:	c199                	beqz	a1,ffffffffc020173c <default_init_memmap+0x7a>
ffffffffc0201738:	0106b023          	sd	a6,0(a3)
    __list_add(elm, listelm->prev, listelm);
ffffffffc020173c:	6398                	ld	a4,0(a5)
}
ffffffffc020173e:	60a2                	ld	ra,8(sp)
    prev->next = next->prev = elm;
ffffffffc0201740:	e390                	sd	a2,0(a5)
ffffffffc0201742:	e710                	sd	a2,8(a4)
    elm->next = next;
ffffffffc0201744:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc0201746:	ed18                	sd	a4,24(a0)
ffffffffc0201748:	0141                	addi	sp,sp,16
ffffffffc020174a:	8082                	ret
    prev->next = next->prev = elm;
ffffffffc020174c:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc020174e:	f114                	sd	a3,32(a0)
    return listelm->next;
ffffffffc0201750:	6798                	ld	a4,8(a5)
    elm->prev = prev;
ffffffffc0201752:	ed1c                	sd	a5,24(a0)
        while ((le = list_next(le)) != &free_list) {
ffffffffc0201754:	00d70663          	beq	a4,a3,ffffffffc0201760 <default_init_memmap+0x9e>
    prev->next = next->prev = elm;
ffffffffc0201758:	8832                	mv	a6,a2
ffffffffc020175a:	4585                	li	a1,1
    for (; p != base + n; p ++) {
ffffffffc020175c:	87ba                	mv	a5,a4
ffffffffc020175e:	bfc1                	j	ffffffffc020172e <default_init_memmap+0x6c>
}
ffffffffc0201760:	60a2                	ld	ra,8(sp)
ffffffffc0201762:	e290                	sd	a2,0(a3)
ffffffffc0201764:	0141                	addi	sp,sp,16
ffffffffc0201766:	8082                	ret
ffffffffc0201768:	60a2                	ld	ra,8(sp)
ffffffffc020176a:	e390                	sd	a2,0(a5)
ffffffffc020176c:	e790                	sd	a2,8(a5)
    elm->next = next;
ffffffffc020176e:	f11c                	sd	a5,32(a0)
    elm->prev = prev;
ffffffffc0201770:	ed1c                	sd	a5,24(a0)
ffffffffc0201772:	0141                	addi	sp,sp,16
ffffffffc0201774:	8082                	ret
        assert(PageReserved(p));
ffffffffc0201776:	00001697          	auipc	a3,0x1
ffffffffc020177a:	61a68693          	addi	a3,a3,1562 # ffffffffc0202d90 <commands+0xa70>
ffffffffc020177e:	00001617          	auipc	a2,0x1
ffffffffc0201782:	28a60613          	addi	a2,a2,650 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc0201786:	04900593          	li	a1,73
ffffffffc020178a:	00001517          	auipc	a0,0x1
ffffffffc020178e:	29650513          	addi	a0,a0,662 # ffffffffc0202a20 <commands+0x700>
ffffffffc0201792:	c7bfe0ef          	jal	ra,ffffffffc020040c <__panic>
    assert(n > 0);
ffffffffc0201796:	00001697          	auipc	a3,0x1
ffffffffc020179a:	5ca68693          	addi	a3,a3,1482 # ffffffffc0202d60 <commands+0xa40>
ffffffffc020179e:	00001617          	auipc	a2,0x1
ffffffffc02017a2:	26a60613          	addi	a2,a2,618 # ffffffffc0202a08 <commands+0x6e8>
ffffffffc02017a6:	04600593          	li	a1,70
ffffffffc02017aa:	00001517          	auipc	a0,0x1
ffffffffc02017ae:	27650513          	addi	a0,a0,630 # ffffffffc0202a20 <commands+0x700>
ffffffffc02017b2:	c5bfe0ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc02017b6 <alloc_pages>:
#include <defs.h>
#include <intr.h>
#include <riscv.h>

static inline bool __intr_save(void) {
    if (read_csr(sstatus) & SSTATUS_SIE) {
ffffffffc02017b6:	100027f3          	csrr	a5,sstatus
ffffffffc02017ba:	8b89                	andi	a5,a5,2
ffffffffc02017bc:	e799                	bnez	a5,ffffffffc02017ca <alloc_pages+0x14>
struct Page *alloc_pages(size_t n) {
    struct Page *page = NULL;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        page = pmm_manager->alloc_pages(n);
ffffffffc02017be:	00006797          	auipc	a5,0x6
ffffffffc02017c2:	cc27b783          	ld	a5,-830(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc02017c6:	6f9c                	ld	a5,24(a5)
ffffffffc02017c8:	8782                	jr	a5
struct Page *alloc_pages(size_t n) {
ffffffffc02017ca:	1141                	addi	sp,sp,-16
ffffffffc02017cc:	e406                	sd	ra,8(sp)
ffffffffc02017ce:	e022                	sd	s0,0(sp)
ffffffffc02017d0:	842a                	mv	s0,a0
        intr_disable();
ffffffffc02017d2:	89cff0ef          	jal	ra,ffffffffc020086e <intr_disable>
        page = pmm_manager->alloc_pages(n);
ffffffffc02017d6:	00006797          	auipc	a5,0x6
ffffffffc02017da:	caa7b783          	ld	a5,-854(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc02017de:	6f9c                	ld	a5,24(a5)
ffffffffc02017e0:	8522                	mv	a0,s0
ffffffffc02017e2:	9782                	jalr	a5
ffffffffc02017e4:	842a                	mv	s0,a0
    return 0;
}

static inline void __intr_restore(bool flag) {
    if (flag) {
        intr_enable();
ffffffffc02017e6:	882ff0ef          	jal	ra,ffffffffc0200868 <intr_enable>
    }
    local_intr_restore(intr_flag);
    return page;
}
ffffffffc02017ea:	60a2                	ld	ra,8(sp)
ffffffffc02017ec:	8522                	mv	a0,s0
ffffffffc02017ee:	6402                	ld	s0,0(sp)
ffffffffc02017f0:	0141                	addi	sp,sp,16
ffffffffc02017f2:	8082                	ret

ffffffffc02017f4 <free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE) {
ffffffffc02017f4:	100027f3          	csrr	a5,sstatus
ffffffffc02017f8:	8b89                	andi	a5,a5,2
ffffffffc02017fa:	e799                	bnez	a5,ffffffffc0201808 <free_pages+0x14>
// free_pages - call pmm->free_pages to free a continuous n*PAGESIZE memory
void free_pages(struct Page *base, size_t n) {
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        pmm_manager->free_pages(base, n);
ffffffffc02017fc:	00006797          	auipc	a5,0x6
ffffffffc0201800:	c847b783          	ld	a5,-892(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc0201804:	739c                	ld	a5,32(a5)
ffffffffc0201806:	8782                	jr	a5
void free_pages(struct Page *base, size_t n) {
ffffffffc0201808:	1101                	addi	sp,sp,-32
ffffffffc020180a:	ec06                	sd	ra,24(sp)
ffffffffc020180c:	e822                	sd	s0,16(sp)
ffffffffc020180e:	e426                	sd	s1,8(sp)
ffffffffc0201810:	842a                	mv	s0,a0
ffffffffc0201812:	84ae                	mv	s1,a1
        intr_disable();
ffffffffc0201814:	85aff0ef          	jal	ra,ffffffffc020086e <intr_disable>
        pmm_manager->free_pages(base, n);
ffffffffc0201818:	00006797          	auipc	a5,0x6
ffffffffc020181c:	c687b783          	ld	a5,-920(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc0201820:	739c                	ld	a5,32(a5)
ffffffffc0201822:	85a6                	mv	a1,s1
ffffffffc0201824:	8522                	mv	a0,s0
ffffffffc0201826:	9782                	jalr	a5
    }
    local_intr_restore(intr_flag);
}
ffffffffc0201828:	6442                	ld	s0,16(sp)
ffffffffc020182a:	60e2                	ld	ra,24(sp)
ffffffffc020182c:	64a2                	ld	s1,8(sp)
ffffffffc020182e:	6105                	addi	sp,sp,32
        intr_enable();
ffffffffc0201830:	838ff06f          	j	ffffffffc0200868 <intr_enable>

ffffffffc0201834 <nr_free_pages>:
    if (read_csr(sstatus) & SSTATUS_SIE) {
ffffffffc0201834:	100027f3          	csrr	a5,sstatus
ffffffffc0201838:	8b89                	andi	a5,a5,2
ffffffffc020183a:	e799                	bnez	a5,ffffffffc0201848 <nr_free_pages+0x14>
size_t nr_free_pages(void) {
    size_t ret;
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        ret = pmm_manager->nr_free_pages();
ffffffffc020183c:	00006797          	auipc	a5,0x6
ffffffffc0201840:	c447b783          	ld	a5,-956(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc0201844:	779c                	ld	a5,40(a5)
ffffffffc0201846:	8782                	jr	a5
size_t nr_free_pages(void) {
ffffffffc0201848:	1141                	addi	sp,sp,-16
ffffffffc020184a:	e406                	sd	ra,8(sp)
ffffffffc020184c:	e022                	sd	s0,0(sp)
        intr_disable();
ffffffffc020184e:	820ff0ef          	jal	ra,ffffffffc020086e <intr_disable>
        ret = pmm_manager->nr_free_pages();
ffffffffc0201852:	00006797          	auipc	a5,0x6
ffffffffc0201856:	c2e7b783          	ld	a5,-978(a5) # ffffffffc0207480 <pmm_manager>
ffffffffc020185a:	779c                	ld	a5,40(a5)
ffffffffc020185c:	9782                	jalr	a5
ffffffffc020185e:	842a                	mv	s0,a0
        intr_enable();
ffffffffc0201860:	808ff0ef          	jal	ra,ffffffffc0200868 <intr_enable>
    }
    local_intr_restore(intr_flag);
    return ret;
}
ffffffffc0201864:	60a2                	ld	ra,8(sp)
ffffffffc0201866:	8522                	mv	a0,s0
ffffffffc0201868:	6402                	ld	s0,0(sp)
ffffffffc020186a:	0141                	addi	sp,sp,16
ffffffffc020186c:	8082                	ret

ffffffffc020186e <pmm_init>:
    pmm_manager = &default_pmm_manager;
ffffffffc020186e:	00001797          	auipc	a5,0x1
ffffffffc0201872:	54a78793          	addi	a5,a5,1354 # ffffffffc0202db8 <default_pmm_manager>
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0201876:	638c                	ld	a1,0(a5)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
    }
}

/* pmm_init - initialize the physical memory management */
void pmm_init(void) {
ffffffffc0201878:	7179                	addi	sp,sp,-48
ffffffffc020187a:	f022                	sd	s0,32(sp)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc020187c:	00001517          	auipc	a0,0x1
ffffffffc0201880:	57450513          	addi	a0,a0,1396 # ffffffffc0202df0 <default_pmm_manager+0x38>
    pmm_manager = &default_pmm_manager;
ffffffffc0201884:	00006417          	auipc	s0,0x6
ffffffffc0201888:	bfc40413          	addi	s0,s0,-1028 # ffffffffc0207480 <pmm_manager>
void pmm_init(void) {
ffffffffc020188c:	f406                	sd	ra,40(sp)
ffffffffc020188e:	ec26                	sd	s1,24(sp)
ffffffffc0201890:	e44e                	sd	s3,8(sp)
ffffffffc0201892:	e84a                	sd	s2,16(sp)
ffffffffc0201894:	e052                	sd	s4,0(sp)
    pmm_manager = &default_pmm_manager;
ffffffffc0201896:	e01c                	sd	a5,0(s0)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0201898:	87bfe0ef          	jal	ra,ffffffffc0200112 <cprintf>
    pmm_manager->init();
ffffffffc020189c:	601c                	ld	a5,0(s0)
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc020189e:	00006497          	auipc	s1,0x6
ffffffffc02018a2:	bfa48493          	addi	s1,s1,-1030 # ffffffffc0207498 <va_pa_offset>
    pmm_manager->init();
ffffffffc02018a6:	679c                	ld	a5,8(a5)
ffffffffc02018a8:	9782                	jalr	a5
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc02018aa:	57f5                	li	a5,-3
ffffffffc02018ac:	07fa                	slli	a5,a5,0x1e
ffffffffc02018ae:	e09c                	sd	a5,0(s1)
    uint64_t mem_begin = get_memory_base();
ffffffffc02018b0:	fa5fe0ef          	jal	ra,ffffffffc0200854 <get_memory_base>
ffffffffc02018b4:	89aa                	mv	s3,a0
    uint64_t mem_size  = get_memory_size();
ffffffffc02018b6:	fa9fe0ef          	jal	ra,ffffffffc020085e <get_memory_size>
    if (mem_size == 0) {
ffffffffc02018ba:	16050163          	beqz	a0,ffffffffc0201a1c <pmm_init+0x1ae>
    uint64_t mem_end   = mem_begin + mem_size;
ffffffffc02018be:	892a                	mv	s2,a0
    cprintf("physcial memory map:\n");
ffffffffc02018c0:	00001517          	auipc	a0,0x1
ffffffffc02018c4:	57850513          	addi	a0,a0,1400 # ffffffffc0202e38 <default_pmm_manager+0x80>
ffffffffc02018c8:	84bfe0ef          	jal	ra,ffffffffc0200112 <cprintf>
    uint64_t mem_end   = mem_begin + mem_size;
ffffffffc02018cc:	01298a33          	add	s4,s3,s2
    cprintf("  memory: 0x%016lx, [0x%016lx, 0x%016lx].\n", mem_size, mem_begin,
ffffffffc02018d0:	864e                	mv	a2,s3
ffffffffc02018d2:	fffa0693          	addi	a3,s4,-1
ffffffffc02018d6:	85ca                	mv	a1,s2
ffffffffc02018d8:	00001517          	auipc	a0,0x1
ffffffffc02018dc:	57850513          	addi	a0,a0,1400 # ffffffffc0202e50 <default_pmm_manager+0x98>
ffffffffc02018e0:	833fe0ef          	jal	ra,ffffffffc0200112 <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc02018e4:	c80007b7          	lui	a5,0xc8000
ffffffffc02018e8:	8652                	mv	a2,s4
ffffffffc02018ea:	0d47e863          	bltu	a5,s4,ffffffffc02019ba <pmm_init+0x14c>
ffffffffc02018ee:	00007797          	auipc	a5,0x7
ffffffffc02018f2:	bb978793          	addi	a5,a5,-1095 # ffffffffc02084a7 <end+0xfff>
ffffffffc02018f6:	757d                	lui	a0,0xfffff
ffffffffc02018f8:	8d7d                	and	a0,a0,a5
ffffffffc02018fa:	8231                	srli	a2,a2,0xc
ffffffffc02018fc:	00006597          	auipc	a1,0x6
ffffffffc0201900:	b7458593          	addi	a1,a1,-1164 # ffffffffc0207470 <npage>
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc0201904:	00006817          	auipc	a6,0x6
ffffffffc0201908:	b7480813          	addi	a6,a6,-1164 # ffffffffc0207478 <pages>
    npage = maxpa / PGSIZE;
ffffffffc020190c:	e190                	sd	a2,0(a1)
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc020190e:	00a83023          	sd	a0,0(a6)
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc0201912:	000807b7          	lui	a5,0x80
ffffffffc0201916:	02f60663          	beq	a2,a5,ffffffffc0201942 <pmm_init+0xd4>
ffffffffc020191a:	4701                	li	a4,0
ffffffffc020191c:	4781                	li	a5,0
ffffffffc020191e:	4305                	li	t1,1
ffffffffc0201920:	fff808b7          	lui	a7,0xfff80
        SetPageReserved(pages + i);
ffffffffc0201924:	953a                	add	a0,a0,a4
ffffffffc0201926:	00850693          	addi	a3,a0,8 # fffffffffffff008 <end+0x3fdf7b60>
ffffffffc020192a:	4066b02f          	amoor.d	zero,t1,(a3)
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc020192e:	6190                	ld	a2,0(a1)
ffffffffc0201930:	0785                	addi	a5,a5,1
        SetPageReserved(pages + i);
ffffffffc0201932:	00083503          	ld	a0,0(a6)
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc0201936:	011606b3          	add	a3,a2,a7
ffffffffc020193a:	02870713          	addi	a4,a4,40
ffffffffc020193e:	fed7e3e3          	bltu	a5,a3,ffffffffc0201924 <pmm_init+0xb6>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc0201942:	00261693          	slli	a3,a2,0x2
ffffffffc0201946:	96b2                	add	a3,a3,a2
ffffffffc0201948:	fec007b7          	lui	a5,0xfec00
ffffffffc020194c:	97aa                	add	a5,a5,a0
ffffffffc020194e:	068e                	slli	a3,a3,0x3
ffffffffc0201950:	96be                	add	a3,a3,a5
ffffffffc0201952:	c02007b7          	lui	a5,0xc0200
ffffffffc0201956:	0af6e763          	bltu	a3,a5,ffffffffc0201a04 <pmm_init+0x196>
ffffffffc020195a:	6098                	ld	a4,0(s1)
    mem_end = ROUNDDOWN(mem_end, PGSIZE);
ffffffffc020195c:	77fd                	lui	a5,0xfffff
ffffffffc020195e:	00fa75b3          	and	a1,s4,a5
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc0201962:	8e99                	sub	a3,a3,a4
    if (freemem < mem_end) {
ffffffffc0201964:	04b6ee63          	bltu	a3,a1,ffffffffc02019c0 <pmm_init+0x152>
    satp_physical = PADDR(satp_virtual);
    cprintf("satp virtual address: 0x%016lx\nsatp physical address: 0x%016lx\n", satp_virtual, satp_physical);
}

static void check_alloc_page(void) {
    pmm_manager->check();
ffffffffc0201968:	601c                	ld	a5,0(s0)
ffffffffc020196a:	7b9c                	ld	a5,48(a5)
ffffffffc020196c:	9782                	jalr	a5
    cprintf("check_alloc_page() succeeded!\n");
ffffffffc020196e:	00001517          	auipc	a0,0x1
ffffffffc0201972:	56a50513          	addi	a0,a0,1386 # ffffffffc0202ed8 <default_pmm_manager+0x120>
ffffffffc0201976:	f9cfe0ef          	jal	ra,ffffffffc0200112 <cprintf>
    satp_virtual = (pte_t*)boot_page_table_sv39;
ffffffffc020197a:	00004597          	auipc	a1,0x4
ffffffffc020197e:	68658593          	addi	a1,a1,1670 # ffffffffc0206000 <boot_page_table_sv39>
ffffffffc0201982:	00006797          	auipc	a5,0x6
ffffffffc0201986:	b0b7b723          	sd	a1,-1266(a5) # ffffffffc0207490 <satp_virtual>
    satp_physical = PADDR(satp_virtual);
ffffffffc020198a:	c02007b7          	lui	a5,0xc0200
ffffffffc020198e:	0af5e363          	bltu	a1,a5,ffffffffc0201a34 <pmm_init+0x1c6>
ffffffffc0201992:	6090                	ld	a2,0(s1)
}
ffffffffc0201994:	7402                	ld	s0,32(sp)
ffffffffc0201996:	70a2                	ld	ra,40(sp)
ffffffffc0201998:	64e2                	ld	s1,24(sp)
ffffffffc020199a:	6942                	ld	s2,16(sp)
ffffffffc020199c:	69a2                	ld	s3,8(sp)
ffffffffc020199e:	6a02                	ld	s4,0(sp)
    satp_physical = PADDR(satp_virtual);
ffffffffc02019a0:	40c58633          	sub	a2,a1,a2
ffffffffc02019a4:	00006797          	auipc	a5,0x6
ffffffffc02019a8:	aec7b223          	sd	a2,-1308(a5) # ffffffffc0207488 <satp_physical>
    cprintf("satp virtual address: 0x%016lx\nsatp physical address: 0x%016lx\n", satp_virtual, satp_physical);
ffffffffc02019ac:	00001517          	auipc	a0,0x1
ffffffffc02019b0:	54c50513          	addi	a0,a0,1356 # ffffffffc0202ef8 <default_pmm_manager+0x140>
}
ffffffffc02019b4:	6145                	addi	sp,sp,48
    cprintf("satp virtual address: 0x%016lx\nsatp physical address: 0x%016lx\n", satp_virtual, satp_physical);
ffffffffc02019b6:	f5cfe06f          	j	ffffffffc0200112 <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc02019ba:	c8000637          	lui	a2,0xc8000
ffffffffc02019be:	bf05                	j	ffffffffc02018ee <pmm_init+0x80>
    mem_begin = ROUNDUP(freemem, PGSIZE);
ffffffffc02019c0:	6705                	lui	a4,0x1
ffffffffc02019c2:	177d                	addi	a4,a4,-1
ffffffffc02019c4:	96ba                	add	a3,a3,a4
ffffffffc02019c6:	8efd                	and	a3,a3,a5
static inline int page_ref_dec(struct Page *page) {
    page->ref -= 1;
    return page->ref;
}
static inline struct Page *pa2page(uintptr_t pa) {
    if (PPN(pa) >= npage) {
ffffffffc02019c8:	00c6d793          	srli	a5,a3,0xc
ffffffffc02019cc:	02c7f063          	bgeu	a5,a2,ffffffffc02019ec <pmm_init+0x17e>
    pmm_manager->init_memmap(base, n);
ffffffffc02019d0:	6010                	ld	a2,0(s0)
        panic("pa2page called with invalid pa");
    }
    return &pages[PPN(pa) - nbase];
ffffffffc02019d2:	fff80737          	lui	a4,0xfff80
ffffffffc02019d6:	973e                	add	a4,a4,a5
ffffffffc02019d8:	00271793          	slli	a5,a4,0x2
ffffffffc02019dc:	97ba                	add	a5,a5,a4
ffffffffc02019de:	6a18                	ld	a4,16(a2)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
ffffffffc02019e0:	8d95                	sub	a1,a1,a3
ffffffffc02019e2:	078e                	slli	a5,a5,0x3
    pmm_manager->init_memmap(base, n);
ffffffffc02019e4:	81b1                	srli	a1,a1,0xc
ffffffffc02019e6:	953e                	add	a0,a0,a5
ffffffffc02019e8:	9702                	jalr	a4
}
ffffffffc02019ea:	bfbd                	j	ffffffffc0201968 <pmm_init+0xfa>
        panic("pa2page called with invalid pa");
ffffffffc02019ec:	00001617          	auipc	a2,0x1
ffffffffc02019f0:	4bc60613          	addi	a2,a2,1212 # ffffffffc0202ea8 <default_pmm_manager+0xf0>
ffffffffc02019f4:	06b00593          	li	a1,107
ffffffffc02019f8:	00001517          	auipc	a0,0x1
ffffffffc02019fc:	4d050513          	addi	a0,a0,1232 # ffffffffc0202ec8 <default_pmm_manager+0x110>
ffffffffc0201a00:	a0dfe0ef          	jal	ra,ffffffffc020040c <__panic>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc0201a04:	00001617          	auipc	a2,0x1
ffffffffc0201a08:	47c60613          	addi	a2,a2,1148 # ffffffffc0202e80 <default_pmm_manager+0xc8>
ffffffffc0201a0c:	07100593          	li	a1,113
ffffffffc0201a10:	00001517          	auipc	a0,0x1
ffffffffc0201a14:	41850513          	addi	a0,a0,1048 # ffffffffc0202e28 <default_pmm_manager+0x70>
ffffffffc0201a18:	9f5fe0ef          	jal	ra,ffffffffc020040c <__panic>
        panic("DTB memory info not available");
ffffffffc0201a1c:	00001617          	auipc	a2,0x1
ffffffffc0201a20:	3ec60613          	addi	a2,a2,1004 # ffffffffc0202e08 <default_pmm_manager+0x50>
ffffffffc0201a24:	05a00593          	li	a1,90
ffffffffc0201a28:	00001517          	auipc	a0,0x1
ffffffffc0201a2c:	40050513          	addi	a0,a0,1024 # ffffffffc0202e28 <default_pmm_manager+0x70>
ffffffffc0201a30:	9ddfe0ef          	jal	ra,ffffffffc020040c <__panic>
    satp_physical = PADDR(satp_virtual);
ffffffffc0201a34:	86ae                	mv	a3,a1
ffffffffc0201a36:	00001617          	auipc	a2,0x1
ffffffffc0201a3a:	44a60613          	addi	a2,a2,1098 # ffffffffc0202e80 <default_pmm_manager+0xc8>
ffffffffc0201a3e:	08c00593          	li	a1,140
ffffffffc0201a42:	00001517          	auipc	a0,0x1
ffffffffc0201a46:	3e650513          	addi	a0,a0,998 # ffffffffc0202e28 <default_pmm_manager+0x70>
ffffffffc0201a4a:	9c3fe0ef          	jal	ra,ffffffffc020040c <__panic>

ffffffffc0201a4e <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
ffffffffc0201a4e:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc0201a52:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
ffffffffc0201a54:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc0201a58:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
ffffffffc0201a5a:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc0201a5e:	f022                	sd	s0,32(sp)
ffffffffc0201a60:	ec26                	sd	s1,24(sp)
ffffffffc0201a62:	e84a                	sd	s2,16(sp)
ffffffffc0201a64:	f406                	sd	ra,40(sp)
ffffffffc0201a66:	e44e                	sd	s3,8(sp)
ffffffffc0201a68:	84aa                	mv	s1,a0
ffffffffc0201a6a:	892e                	mv	s2,a1
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
ffffffffc0201a6c:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
ffffffffc0201a70:	2a01                	sext.w	s4,s4
    if (num >= base) {
ffffffffc0201a72:	03067e63          	bgeu	a2,a6,ffffffffc0201aae <printnum+0x60>
ffffffffc0201a76:	89be                	mv	s3,a5
        while (-- width > 0)
ffffffffc0201a78:	00805763          	blez	s0,ffffffffc0201a86 <printnum+0x38>
ffffffffc0201a7c:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
ffffffffc0201a7e:	85ca                	mv	a1,s2
ffffffffc0201a80:	854e                	mv	a0,s3
ffffffffc0201a82:	9482                	jalr	s1
        while (-- width > 0)
ffffffffc0201a84:	fc65                	bnez	s0,ffffffffc0201a7c <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201a86:	1a02                	slli	s4,s4,0x20
ffffffffc0201a88:	00001797          	auipc	a5,0x1
ffffffffc0201a8c:	4b078793          	addi	a5,a5,1200 # ffffffffc0202f38 <default_pmm_manager+0x180>
ffffffffc0201a90:	020a5a13          	srli	s4,s4,0x20
ffffffffc0201a94:	9a3e                	add	s4,s4,a5
}
ffffffffc0201a96:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201a98:	000a4503          	lbu	a0,0(s4)
}
ffffffffc0201a9c:	70a2                	ld	ra,40(sp)
ffffffffc0201a9e:	69a2                	ld	s3,8(sp)
ffffffffc0201aa0:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201aa2:	85ca                	mv	a1,s2
ffffffffc0201aa4:	87a6                	mv	a5,s1
}
ffffffffc0201aa6:	6942                	ld	s2,16(sp)
ffffffffc0201aa8:	64e2                	ld	s1,24(sp)
ffffffffc0201aaa:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201aac:	8782                	jr	a5
        printnum(putch, putdat, result, base, width - 1, padc);
ffffffffc0201aae:	03065633          	divu	a2,a2,a6
ffffffffc0201ab2:	8722                	mv	a4,s0
ffffffffc0201ab4:	f9bff0ef          	jal	ra,ffffffffc0201a4e <printnum>
ffffffffc0201ab8:	b7f9                	j	ffffffffc0201a86 <printnum+0x38>

ffffffffc0201aba <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
ffffffffc0201aba:	7119                	addi	sp,sp,-128
ffffffffc0201abc:	f4a6                	sd	s1,104(sp)
ffffffffc0201abe:	f0ca                	sd	s2,96(sp)
ffffffffc0201ac0:	ecce                	sd	s3,88(sp)
ffffffffc0201ac2:	e8d2                	sd	s4,80(sp)
ffffffffc0201ac4:	e4d6                	sd	s5,72(sp)
ffffffffc0201ac6:	e0da                	sd	s6,64(sp)
ffffffffc0201ac8:	fc5e                	sd	s7,56(sp)
ffffffffc0201aca:	f06a                	sd	s10,32(sp)
ffffffffc0201acc:	fc86                	sd	ra,120(sp)
ffffffffc0201ace:	f8a2                	sd	s0,112(sp)
ffffffffc0201ad0:	f862                	sd	s8,48(sp)
ffffffffc0201ad2:	f466                	sd	s9,40(sp)
ffffffffc0201ad4:	ec6e                	sd	s11,24(sp)
ffffffffc0201ad6:	892a                	mv	s2,a0
ffffffffc0201ad8:	84ae                	mv	s1,a1
ffffffffc0201ada:	8d32                	mv	s10,a2
ffffffffc0201adc:	8a36                	mv	s4,a3
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0201ade:	02500993          	li	s3,37
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
ffffffffc0201ae2:	5b7d                	li	s6,-1
ffffffffc0201ae4:	00001a97          	auipc	s5,0x1
ffffffffc0201ae8:	488a8a93          	addi	s5,s5,1160 # ffffffffc0202f6c <default_pmm_manager+0x1b4>
        case 'e':
            err = va_arg(ap, int);
            if (err < 0) {
                err = -err;
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0201aec:	00001b97          	auipc	s7,0x1
ffffffffc0201af0:	65cb8b93          	addi	s7,s7,1628 # ffffffffc0203148 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0201af4:	000d4503          	lbu	a0,0(s10)
ffffffffc0201af8:	001d0413          	addi	s0,s10,1
ffffffffc0201afc:	01350a63          	beq	a0,s3,ffffffffc0201b10 <vprintfmt+0x56>
            if (ch == '\0') {
ffffffffc0201b00:	c121                	beqz	a0,ffffffffc0201b40 <vprintfmt+0x86>
            putch(ch, putdat);
ffffffffc0201b02:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0201b04:	0405                	addi	s0,s0,1
            putch(ch, putdat);
ffffffffc0201b06:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc0201b08:	fff44503          	lbu	a0,-1(s0)
ffffffffc0201b0c:	ff351ae3          	bne	a0,s3,ffffffffc0201b00 <vprintfmt+0x46>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201b10:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
ffffffffc0201b14:	02000793          	li	a5,32
        lflag = altflag = 0;
ffffffffc0201b18:	4c81                	li	s9,0
ffffffffc0201b1a:	4881                	li	a7,0
        width = precision = -1;
ffffffffc0201b1c:	5c7d                	li	s8,-1
ffffffffc0201b1e:	5dfd                	li	s11,-1
ffffffffc0201b20:	05500513          	li	a0,85
                if (ch < '0' || ch > '9') {
ffffffffc0201b24:	4825                	li	a6,9
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201b26:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0201b2a:	0ff5f593          	zext.b	a1,a1
ffffffffc0201b2e:	00140d13          	addi	s10,s0,1
ffffffffc0201b32:	04b56263          	bltu	a0,a1,ffffffffc0201b76 <vprintfmt+0xbc>
ffffffffc0201b36:	058a                	slli	a1,a1,0x2
ffffffffc0201b38:	95d6                	add	a1,a1,s5
ffffffffc0201b3a:	4194                	lw	a3,0(a1)
ffffffffc0201b3c:	96d6                	add	a3,a3,s5
ffffffffc0201b3e:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
ffffffffc0201b40:	70e6                	ld	ra,120(sp)
ffffffffc0201b42:	7446                	ld	s0,112(sp)
ffffffffc0201b44:	74a6                	ld	s1,104(sp)
ffffffffc0201b46:	7906                	ld	s2,96(sp)
ffffffffc0201b48:	69e6                	ld	s3,88(sp)
ffffffffc0201b4a:	6a46                	ld	s4,80(sp)
ffffffffc0201b4c:	6aa6                	ld	s5,72(sp)
ffffffffc0201b4e:	6b06                	ld	s6,64(sp)
ffffffffc0201b50:	7be2                	ld	s7,56(sp)
ffffffffc0201b52:	7c42                	ld	s8,48(sp)
ffffffffc0201b54:	7ca2                	ld	s9,40(sp)
ffffffffc0201b56:	7d02                	ld	s10,32(sp)
ffffffffc0201b58:	6de2                	ld	s11,24(sp)
ffffffffc0201b5a:	6109                	addi	sp,sp,128
ffffffffc0201b5c:	8082                	ret
            padc = '0';
ffffffffc0201b5e:	87b2                	mv	a5,a2
            goto reswitch;
ffffffffc0201b60:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201b64:	846a                	mv	s0,s10
ffffffffc0201b66:	00140d13          	addi	s10,s0,1
ffffffffc0201b6a:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0201b6e:	0ff5f593          	zext.b	a1,a1
ffffffffc0201b72:	fcb572e3          	bgeu	a0,a1,ffffffffc0201b36 <vprintfmt+0x7c>
            putch('%', putdat);
ffffffffc0201b76:	85a6                	mv	a1,s1
ffffffffc0201b78:	02500513          	li	a0,37
ffffffffc0201b7c:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
ffffffffc0201b7e:	fff44783          	lbu	a5,-1(s0)
ffffffffc0201b82:	8d22                	mv	s10,s0
ffffffffc0201b84:	f73788e3          	beq	a5,s3,ffffffffc0201af4 <vprintfmt+0x3a>
ffffffffc0201b88:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0201b8c:	1d7d                	addi	s10,s10,-1
ffffffffc0201b8e:	ff379de3          	bne	a5,s3,ffffffffc0201b88 <vprintfmt+0xce>
ffffffffc0201b92:	b78d                	j	ffffffffc0201af4 <vprintfmt+0x3a>
                precision = precision * 10 + ch - '0';
ffffffffc0201b94:	fd060c1b          	addiw	s8,a2,-48
                ch = *fmt;
ffffffffc0201b98:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201b9c:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
ffffffffc0201b9e:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
ffffffffc0201ba2:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc0201ba6:	02d86463          	bltu	a6,a3,ffffffffc0201bce <vprintfmt+0x114>
                ch = *fmt;
ffffffffc0201baa:	00144603          	lbu	a2,1(s0)
                precision = precision * 10 + ch - '0';
ffffffffc0201bae:	002c169b          	slliw	a3,s8,0x2
ffffffffc0201bb2:	0186873b          	addw	a4,a3,s8
ffffffffc0201bb6:	0017171b          	slliw	a4,a4,0x1
ffffffffc0201bba:	9f2d                	addw	a4,a4,a1
                if (ch < '0' || ch > '9') {
ffffffffc0201bbc:	fd06069b          	addiw	a3,a2,-48
            for (precision = 0; ; ++ fmt) {
ffffffffc0201bc0:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
ffffffffc0201bc2:	fd070c1b          	addiw	s8,a4,-48
                ch = *fmt;
ffffffffc0201bc6:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc0201bca:	fed870e3          	bgeu	a6,a3,ffffffffc0201baa <vprintfmt+0xf0>
            if (width < 0)
ffffffffc0201bce:	f40ddce3          	bgez	s11,ffffffffc0201b26 <vprintfmt+0x6c>
                width = precision, precision = -1;
ffffffffc0201bd2:	8de2                	mv	s11,s8
ffffffffc0201bd4:	5c7d                	li	s8,-1
ffffffffc0201bd6:	bf81                	j	ffffffffc0201b26 <vprintfmt+0x6c>
            if (width < 0)
ffffffffc0201bd8:	fffdc693          	not	a3,s11
ffffffffc0201bdc:	96fd                	srai	a3,a3,0x3f
ffffffffc0201bde:	00ddfdb3          	and	s11,s11,a3
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201be2:	00144603          	lbu	a2,1(s0)
ffffffffc0201be6:	2d81                	sext.w	s11,s11
ffffffffc0201be8:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc0201bea:	bf35                	j	ffffffffc0201b26 <vprintfmt+0x6c>
            precision = va_arg(ap, int);
ffffffffc0201bec:	000a2c03          	lw	s8,0(s4)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201bf0:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
ffffffffc0201bf4:	0a21                	addi	s4,s4,8
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201bf6:	846a                	mv	s0,s10
            goto process_precision;
ffffffffc0201bf8:	bfd9                	j	ffffffffc0201bce <vprintfmt+0x114>
    if (lflag >= 2) {
ffffffffc0201bfa:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0201bfc:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc0201c00:	01174463          	blt	a4,a7,ffffffffc0201c08 <vprintfmt+0x14e>
    else if (lflag) {
ffffffffc0201c04:	1a088e63          	beqz	a7,ffffffffc0201dc0 <vprintfmt+0x306>
        return va_arg(*ap, unsigned long);
ffffffffc0201c08:	000a3603          	ld	a2,0(s4)
ffffffffc0201c0c:	46c1                	li	a3,16
ffffffffc0201c0e:	8a2e                	mv	s4,a1
            printnum(putch, putdat, num, base, width, padc);
ffffffffc0201c10:	2781                	sext.w	a5,a5
ffffffffc0201c12:	876e                	mv	a4,s11
ffffffffc0201c14:	85a6                	mv	a1,s1
ffffffffc0201c16:	854a                	mv	a0,s2
ffffffffc0201c18:	e37ff0ef          	jal	ra,ffffffffc0201a4e <printnum>
            break;
ffffffffc0201c1c:	bde1                	j	ffffffffc0201af4 <vprintfmt+0x3a>
            putch(va_arg(ap, int), putdat);
ffffffffc0201c1e:	000a2503          	lw	a0,0(s4)
ffffffffc0201c22:	85a6                	mv	a1,s1
ffffffffc0201c24:	0a21                	addi	s4,s4,8
ffffffffc0201c26:	9902                	jalr	s2
            break;
ffffffffc0201c28:	b5f1                	j	ffffffffc0201af4 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc0201c2a:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0201c2c:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc0201c30:	01174463          	blt	a4,a7,ffffffffc0201c38 <vprintfmt+0x17e>
    else if (lflag) {
ffffffffc0201c34:	18088163          	beqz	a7,ffffffffc0201db6 <vprintfmt+0x2fc>
        return va_arg(*ap, unsigned long);
ffffffffc0201c38:	000a3603          	ld	a2,0(s4)
ffffffffc0201c3c:	46a9                	li	a3,10
ffffffffc0201c3e:	8a2e                	mv	s4,a1
ffffffffc0201c40:	bfc1                	j	ffffffffc0201c10 <vprintfmt+0x156>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201c42:	00144603          	lbu	a2,1(s0)
            altflag = 1;
ffffffffc0201c46:	4c85                	li	s9,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201c48:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc0201c4a:	bdf1                	j	ffffffffc0201b26 <vprintfmt+0x6c>
            putch(ch, putdat);
ffffffffc0201c4c:	85a6                	mv	a1,s1
ffffffffc0201c4e:	02500513          	li	a0,37
ffffffffc0201c52:	9902                	jalr	s2
            break;
ffffffffc0201c54:	b545                	j	ffffffffc0201af4 <vprintfmt+0x3a>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201c56:	00144603          	lbu	a2,1(s0)
            lflag ++;
ffffffffc0201c5a:	2885                	addiw	a7,a7,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201c5c:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc0201c5e:	b5e1                	j	ffffffffc0201b26 <vprintfmt+0x6c>
    if (lflag >= 2) {
ffffffffc0201c60:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0201c62:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc0201c66:	01174463          	blt	a4,a7,ffffffffc0201c6e <vprintfmt+0x1b4>
    else if (lflag) {
ffffffffc0201c6a:	14088163          	beqz	a7,ffffffffc0201dac <vprintfmt+0x2f2>
        return va_arg(*ap, unsigned long);
ffffffffc0201c6e:	000a3603          	ld	a2,0(s4)
ffffffffc0201c72:	46a1                	li	a3,8
ffffffffc0201c74:	8a2e                	mv	s4,a1
ffffffffc0201c76:	bf69                	j	ffffffffc0201c10 <vprintfmt+0x156>
            putch('0', putdat);
ffffffffc0201c78:	03000513          	li	a0,48
ffffffffc0201c7c:	85a6                	mv	a1,s1
ffffffffc0201c7e:	e03e                	sd	a5,0(sp)
ffffffffc0201c80:	9902                	jalr	s2
            putch('x', putdat);
ffffffffc0201c82:	85a6                	mv	a1,s1
ffffffffc0201c84:	07800513          	li	a0,120
ffffffffc0201c88:	9902                	jalr	s2
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc0201c8a:	0a21                	addi	s4,s4,8
            goto number;
ffffffffc0201c8c:	6782                	ld	a5,0(sp)
ffffffffc0201c8e:	46c1                	li	a3,16
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc0201c90:	ff8a3603          	ld	a2,-8(s4)
            goto number;
ffffffffc0201c94:	bfb5                	j	ffffffffc0201c10 <vprintfmt+0x156>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc0201c96:	000a3403          	ld	s0,0(s4)
ffffffffc0201c9a:	008a0713          	addi	a4,s4,8
ffffffffc0201c9e:	e03a                	sd	a4,0(sp)
ffffffffc0201ca0:	14040263          	beqz	s0,ffffffffc0201de4 <vprintfmt+0x32a>
            if (width > 0 && padc != '-') {
ffffffffc0201ca4:	0fb05763          	blez	s11,ffffffffc0201d92 <vprintfmt+0x2d8>
ffffffffc0201ca8:	02d00693          	li	a3,45
ffffffffc0201cac:	0cd79163          	bne	a5,a3,ffffffffc0201d6e <vprintfmt+0x2b4>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201cb0:	00044783          	lbu	a5,0(s0)
ffffffffc0201cb4:	0007851b          	sext.w	a0,a5
ffffffffc0201cb8:	cf85                	beqz	a5,ffffffffc0201cf0 <vprintfmt+0x236>
ffffffffc0201cba:	00140a13          	addi	s4,s0,1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201cbe:	05e00413          	li	s0,94
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201cc2:	000c4563          	bltz	s8,ffffffffc0201ccc <vprintfmt+0x212>
ffffffffc0201cc6:	3c7d                	addiw	s8,s8,-1
ffffffffc0201cc8:	036c0263          	beq	s8,s6,ffffffffc0201cec <vprintfmt+0x232>
                    putch('?', putdat);
ffffffffc0201ccc:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201cce:	0e0c8e63          	beqz	s9,ffffffffc0201dca <vprintfmt+0x310>
ffffffffc0201cd2:	3781                	addiw	a5,a5,-32
ffffffffc0201cd4:	0ef47b63          	bgeu	s0,a5,ffffffffc0201dca <vprintfmt+0x310>
                    putch('?', putdat);
ffffffffc0201cd8:	03f00513          	li	a0,63
ffffffffc0201cdc:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201cde:	000a4783          	lbu	a5,0(s4)
ffffffffc0201ce2:	3dfd                	addiw	s11,s11,-1
ffffffffc0201ce4:	0a05                	addi	s4,s4,1
ffffffffc0201ce6:	0007851b          	sext.w	a0,a5
ffffffffc0201cea:	ffe1                	bnez	a5,ffffffffc0201cc2 <vprintfmt+0x208>
            for (; width > 0; width --) {
ffffffffc0201cec:	01b05963          	blez	s11,ffffffffc0201cfe <vprintfmt+0x244>
ffffffffc0201cf0:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
ffffffffc0201cf2:	85a6                	mv	a1,s1
ffffffffc0201cf4:	02000513          	li	a0,32
ffffffffc0201cf8:	9902                	jalr	s2
            for (; width > 0; width --) {
ffffffffc0201cfa:	fe0d9be3          	bnez	s11,ffffffffc0201cf0 <vprintfmt+0x236>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc0201cfe:	6a02                	ld	s4,0(sp)
ffffffffc0201d00:	bbd5                	j	ffffffffc0201af4 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc0201d02:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0201d04:	008a0c93          	addi	s9,s4,8
    if (lflag >= 2) {
ffffffffc0201d08:	01174463          	blt	a4,a7,ffffffffc0201d10 <vprintfmt+0x256>
    else if (lflag) {
ffffffffc0201d0c:	08088d63          	beqz	a7,ffffffffc0201da6 <vprintfmt+0x2ec>
        return va_arg(*ap, long);
ffffffffc0201d10:	000a3403          	ld	s0,0(s4)
            if ((long long)num < 0) {
ffffffffc0201d14:	0a044d63          	bltz	s0,ffffffffc0201dce <vprintfmt+0x314>
            num = getint(&ap, lflag);
ffffffffc0201d18:	8622                	mv	a2,s0
ffffffffc0201d1a:	8a66                	mv	s4,s9
ffffffffc0201d1c:	46a9                	li	a3,10
ffffffffc0201d1e:	bdcd                	j	ffffffffc0201c10 <vprintfmt+0x156>
            err = va_arg(ap, int);
ffffffffc0201d20:	000a2783          	lw	a5,0(s4)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0201d24:	4719                	li	a4,6
            err = va_arg(ap, int);
ffffffffc0201d26:	0a21                	addi	s4,s4,8
            if (err < 0) {
ffffffffc0201d28:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0201d2c:	8fb5                	xor	a5,a5,a3
ffffffffc0201d2e:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc0201d32:	02d74163          	blt	a4,a3,ffffffffc0201d54 <vprintfmt+0x29a>
ffffffffc0201d36:	00369793          	slli	a5,a3,0x3
ffffffffc0201d3a:	97de                	add	a5,a5,s7
ffffffffc0201d3c:	639c                	ld	a5,0(a5)
ffffffffc0201d3e:	cb99                	beqz	a5,ffffffffc0201d54 <vprintfmt+0x29a>
                printfmt(putch, putdat, "%s", p);
ffffffffc0201d40:	86be                	mv	a3,a5
ffffffffc0201d42:	00001617          	auipc	a2,0x1
ffffffffc0201d46:	22660613          	addi	a2,a2,550 # ffffffffc0202f68 <default_pmm_manager+0x1b0>
ffffffffc0201d4a:	85a6                	mv	a1,s1
ffffffffc0201d4c:	854a                	mv	a0,s2
ffffffffc0201d4e:	0ce000ef          	jal	ra,ffffffffc0201e1c <printfmt>
ffffffffc0201d52:	b34d                	j	ffffffffc0201af4 <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
ffffffffc0201d54:	00001617          	auipc	a2,0x1
ffffffffc0201d58:	20460613          	addi	a2,a2,516 # ffffffffc0202f58 <default_pmm_manager+0x1a0>
ffffffffc0201d5c:	85a6                	mv	a1,s1
ffffffffc0201d5e:	854a                	mv	a0,s2
ffffffffc0201d60:	0bc000ef          	jal	ra,ffffffffc0201e1c <printfmt>
ffffffffc0201d64:	bb41                	j	ffffffffc0201af4 <vprintfmt+0x3a>
                p = "(null)";
ffffffffc0201d66:	00001417          	auipc	s0,0x1
ffffffffc0201d6a:	1ea40413          	addi	s0,s0,490 # ffffffffc0202f50 <default_pmm_manager+0x198>
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0201d6e:	85e2                	mv	a1,s8
ffffffffc0201d70:	8522                	mv	a0,s0
ffffffffc0201d72:	e43e                	sd	a5,8(sp)
ffffffffc0201d74:	200000ef          	jal	ra,ffffffffc0201f74 <strnlen>
ffffffffc0201d78:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0201d7c:	01b05b63          	blez	s11,ffffffffc0201d92 <vprintfmt+0x2d8>
                    putch(padc, putdat);
ffffffffc0201d80:	67a2                	ld	a5,8(sp)
ffffffffc0201d82:	00078a1b          	sext.w	s4,a5
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0201d86:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
ffffffffc0201d88:	85a6                	mv	a1,s1
ffffffffc0201d8a:	8552                	mv	a0,s4
ffffffffc0201d8c:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0201d8e:	fe0d9ce3          	bnez	s11,ffffffffc0201d86 <vprintfmt+0x2cc>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201d92:	00044783          	lbu	a5,0(s0)
ffffffffc0201d96:	00140a13          	addi	s4,s0,1
ffffffffc0201d9a:	0007851b          	sext.w	a0,a5
ffffffffc0201d9e:	d3a5                	beqz	a5,ffffffffc0201cfe <vprintfmt+0x244>
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201da0:	05e00413          	li	s0,94
ffffffffc0201da4:	bf39                	j	ffffffffc0201cc2 <vprintfmt+0x208>
        return va_arg(*ap, int);
ffffffffc0201da6:	000a2403          	lw	s0,0(s4)
ffffffffc0201daa:	b7ad                	j	ffffffffc0201d14 <vprintfmt+0x25a>
        return va_arg(*ap, unsigned int);
ffffffffc0201dac:	000a6603          	lwu	a2,0(s4)
ffffffffc0201db0:	46a1                	li	a3,8
ffffffffc0201db2:	8a2e                	mv	s4,a1
ffffffffc0201db4:	bdb1                	j	ffffffffc0201c10 <vprintfmt+0x156>
ffffffffc0201db6:	000a6603          	lwu	a2,0(s4)
ffffffffc0201dba:	46a9                	li	a3,10
ffffffffc0201dbc:	8a2e                	mv	s4,a1
ffffffffc0201dbe:	bd89                	j	ffffffffc0201c10 <vprintfmt+0x156>
ffffffffc0201dc0:	000a6603          	lwu	a2,0(s4)
ffffffffc0201dc4:	46c1                	li	a3,16
ffffffffc0201dc6:	8a2e                	mv	s4,a1
ffffffffc0201dc8:	b5a1                	j	ffffffffc0201c10 <vprintfmt+0x156>
                    putch(ch, putdat);
ffffffffc0201dca:	9902                	jalr	s2
ffffffffc0201dcc:	bf09                	j	ffffffffc0201cde <vprintfmt+0x224>
                putch('-', putdat);
ffffffffc0201dce:	85a6                	mv	a1,s1
ffffffffc0201dd0:	02d00513          	li	a0,45
ffffffffc0201dd4:	e03e                	sd	a5,0(sp)
ffffffffc0201dd6:	9902                	jalr	s2
                num = -(long long)num;
ffffffffc0201dd8:	6782                	ld	a5,0(sp)
ffffffffc0201dda:	8a66                	mv	s4,s9
ffffffffc0201ddc:	40800633          	neg	a2,s0
ffffffffc0201de0:	46a9                	li	a3,10
ffffffffc0201de2:	b53d                	j	ffffffffc0201c10 <vprintfmt+0x156>
            if (width > 0 && padc != '-') {
ffffffffc0201de4:	03b05163          	blez	s11,ffffffffc0201e06 <vprintfmt+0x34c>
ffffffffc0201de8:	02d00693          	li	a3,45
ffffffffc0201dec:	f6d79de3          	bne	a5,a3,ffffffffc0201d66 <vprintfmt+0x2ac>
                p = "(null)";
ffffffffc0201df0:	00001417          	auipc	s0,0x1
ffffffffc0201df4:	16040413          	addi	s0,s0,352 # ffffffffc0202f50 <default_pmm_manager+0x198>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201df8:	02800793          	li	a5,40
ffffffffc0201dfc:	02800513          	li	a0,40
ffffffffc0201e00:	00140a13          	addi	s4,s0,1
ffffffffc0201e04:	bd6d                	j	ffffffffc0201cbe <vprintfmt+0x204>
ffffffffc0201e06:	00001a17          	auipc	s4,0x1
ffffffffc0201e0a:	14ba0a13          	addi	s4,s4,331 # ffffffffc0202f51 <default_pmm_manager+0x199>
ffffffffc0201e0e:	02800513          	li	a0,40
ffffffffc0201e12:	02800793          	li	a5,40
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201e16:	05e00413          	li	s0,94
ffffffffc0201e1a:	b565                	j	ffffffffc0201cc2 <vprintfmt+0x208>

ffffffffc0201e1c <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0201e1c:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
ffffffffc0201e1e:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0201e22:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc0201e24:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc0201e26:	ec06                	sd	ra,24(sp)
ffffffffc0201e28:	f83a                	sd	a4,48(sp)
ffffffffc0201e2a:	fc3e                	sd	a5,56(sp)
ffffffffc0201e2c:	e0c2                	sd	a6,64(sp)
ffffffffc0201e2e:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc0201e30:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc0201e32:	c89ff0ef          	jal	ra,ffffffffc0201aba <vprintfmt>
}
ffffffffc0201e36:	60e2                	ld	ra,24(sp)
ffffffffc0201e38:	6161                	addi	sp,sp,80
ffffffffc0201e3a:	8082                	ret

ffffffffc0201e3c <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
ffffffffc0201e3c:	715d                	addi	sp,sp,-80
ffffffffc0201e3e:	e486                	sd	ra,72(sp)
ffffffffc0201e40:	e0a6                	sd	s1,64(sp)
ffffffffc0201e42:	fc4a                	sd	s2,56(sp)
ffffffffc0201e44:	f84e                	sd	s3,48(sp)
ffffffffc0201e46:	f452                	sd	s4,40(sp)
ffffffffc0201e48:	f056                	sd	s5,32(sp)
ffffffffc0201e4a:	ec5a                	sd	s6,24(sp)
ffffffffc0201e4c:	e85e                	sd	s7,16(sp)
    if (prompt != NULL) {
ffffffffc0201e4e:	c901                	beqz	a0,ffffffffc0201e5e <readline+0x22>
ffffffffc0201e50:	85aa                	mv	a1,a0
        cprintf("%s", prompt);
ffffffffc0201e52:	00001517          	auipc	a0,0x1
ffffffffc0201e56:	11650513          	addi	a0,a0,278 # ffffffffc0202f68 <default_pmm_manager+0x1b0>
ffffffffc0201e5a:	ab8fe0ef          	jal	ra,ffffffffc0200112 <cprintf>
readline(const char *prompt) {
ffffffffc0201e5e:	4481                	li	s1,0
    while (1) {
        c = getchar();
        if (c < 0) {
            return NULL;
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc0201e60:	497d                	li	s2,31
            cputchar(c);
            buf[i ++] = c;
        }
        else if (c == '\b' && i > 0) {
ffffffffc0201e62:	49a1                	li	s3,8
            cputchar(c);
            i --;
        }
        else if (c == '\n' || c == '\r') {
ffffffffc0201e64:	4aa9                	li	s5,10
ffffffffc0201e66:	4b35                	li	s6,13
            buf[i ++] = c;
ffffffffc0201e68:	00005b97          	auipc	s7,0x5
ffffffffc0201e6c:	1d8b8b93          	addi	s7,s7,472 # ffffffffc0207040 <buf>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc0201e70:	3fe00a13          	li	s4,1022
        c = getchar();
ffffffffc0201e74:	b16fe0ef          	jal	ra,ffffffffc020018a <getchar>
        if (c < 0) {
ffffffffc0201e78:	00054a63          	bltz	a0,ffffffffc0201e8c <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc0201e7c:	00a95a63          	bge	s2,a0,ffffffffc0201e90 <readline+0x54>
ffffffffc0201e80:	029a5263          	bge	s4,s1,ffffffffc0201ea4 <readline+0x68>
        c = getchar();
ffffffffc0201e84:	b06fe0ef          	jal	ra,ffffffffc020018a <getchar>
        if (c < 0) {
ffffffffc0201e88:	fe055ae3          	bgez	a0,ffffffffc0201e7c <readline+0x40>
            return NULL;
ffffffffc0201e8c:	4501                	li	a0,0
ffffffffc0201e8e:	a091                	j	ffffffffc0201ed2 <readline+0x96>
        else if (c == '\b' && i > 0) {
ffffffffc0201e90:	03351463          	bne	a0,s3,ffffffffc0201eb8 <readline+0x7c>
ffffffffc0201e94:	e8a9                	bnez	s1,ffffffffc0201ee6 <readline+0xaa>
        c = getchar();
ffffffffc0201e96:	af4fe0ef          	jal	ra,ffffffffc020018a <getchar>
        if (c < 0) {
ffffffffc0201e9a:	fe0549e3          	bltz	a0,ffffffffc0201e8c <readline+0x50>
        else if (c >= ' ' && i < BUFSIZE - 1) {
ffffffffc0201e9e:	fea959e3          	bge	s2,a0,ffffffffc0201e90 <readline+0x54>
ffffffffc0201ea2:	4481                	li	s1,0
            cputchar(c);
ffffffffc0201ea4:	e42a                	sd	a0,8(sp)
ffffffffc0201ea6:	aa2fe0ef          	jal	ra,ffffffffc0200148 <cputchar>
            buf[i ++] = c;
ffffffffc0201eaa:	6522                	ld	a0,8(sp)
ffffffffc0201eac:	009b87b3          	add	a5,s7,s1
ffffffffc0201eb0:	2485                	addiw	s1,s1,1
ffffffffc0201eb2:	00a78023          	sb	a0,0(a5)
ffffffffc0201eb6:	bf7d                	j	ffffffffc0201e74 <readline+0x38>
        else if (c == '\n' || c == '\r') {
ffffffffc0201eb8:	01550463          	beq	a0,s5,ffffffffc0201ec0 <readline+0x84>
ffffffffc0201ebc:	fb651ce3          	bne	a0,s6,ffffffffc0201e74 <readline+0x38>
            cputchar(c);
ffffffffc0201ec0:	a88fe0ef          	jal	ra,ffffffffc0200148 <cputchar>
            buf[i] = '\0';
ffffffffc0201ec4:	00005517          	auipc	a0,0x5
ffffffffc0201ec8:	17c50513          	addi	a0,a0,380 # ffffffffc0207040 <buf>
ffffffffc0201ecc:	94aa                	add	s1,s1,a0
ffffffffc0201ece:	00048023          	sb	zero,0(s1)
            return buf;
        }
    }
}
ffffffffc0201ed2:	60a6                	ld	ra,72(sp)
ffffffffc0201ed4:	6486                	ld	s1,64(sp)
ffffffffc0201ed6:	7962                	ld	s2,56(sp)
ffffffffc0201ed8:	79c2                	ld	s3,48(sp)
ffffffffc0201eda:	7a22                	ld	s4,40(sp)
ffffffffc0201edc:	7a82                	ld	s5,32(sp)
ffffffffc0201ede:	6b62                	ld	s6,24(sp)
ffffffffc0201ee0:	6bc2                	ld	s7,16(sp)
ffffffffc0201ee2:	6161                	addi	sp,sp,80
ffffffffc0201ee4:	8082                	ret
            cputchar(c);
ffffffffc0201ee6:	4521                	li	a0,8
ffffffffc0201ee8:	a60fe0ef          	jal	ra,ffffffffc0200148 <cputchar>
            i --;
ffffffffc0201eec:	34fd                	addiw	s1,s1,-1
ffffffffc0201eee:	b759                	j	ffffffffc0201e74 <readline+0x38>

ffffffffc0201ef0 <sbi_console_putchar>:
uint64_t SBI_REMOTE_SFENCE_VMA_ASID = 7;
uint64_t SBI_SHUTDOWN = 8;

uint64_t sbi_call(uint64_t sbi_type, uint64_t arg0, uint64_t arg1, uint64_t arg2) {
    uint64_t ret_val;
    __asm__ volatile (
ffffffffc0201ef0:	4781                	li	a5,0
ffffffffc0201ef2:	00005717          	auipc	a4,0x5
ffffffffc0201ef6:	12673703          	ld	a4,294(a4) # ffffffffc0207018 <SBI_CONSOLE_PUTCHAR>
ffffffffc0201efa:	88ba                	mv	a7,a4
ffffffffc0201efc:	852a                	mv	a0,a0
ffffffffc0201efe:	85be                	mv	a1,a5
ffffffffc0201f00:	863e                	mv	a2,a5
ffffffffc0201f02:	00000073          	ecall
ffffffffc0201f06:	87aa                	mv	a5,a0
    return ret_val;
}

void sbi_console_putchar(unsigned char ch) {
    sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
}
ffffffffc0201f08:	8082                	ret

ffffffffc0201f0a <sbi_set_timer>:
    __asm__ volatile (
ffffffffc0201f0a:	4781                	li	a5,0
ffffffffc0201f0c:	00005717          	auipc	a4,0x5
ffffffffc0201f10:	59473703          	ld	a4,1428(a4) # ffffffffc02074a0 <SBI_SET_TIMER>
ffffffffc0201f14:	88ba                	mv	a7,a4
ffffffffc0201f16:	852a                	mv	a0,a0
ffffffffc0201f18:	85be                	mv	a1,a5
ffffffffc0201f1a:	863e                	mv	a2,a5
ffffffffc0201f1c:	00000073          	ecall
ffffffffc0201f20:	87aa                	mv	a5,a0

void sbi_set_timer(unsigned long long stime_value) {
    sbi_call(SBI_SET_TIMER, stime_value, 0, 0);
}
ffffffffc0201f22:	8082                	ret

ffffffffc0201f24 <sbi_console_getchar>:
    __asm__ volatile (
ffffffffc0201f24:	4501                	li	a0,0
ffffffffc0201f26:	00005797          	auipc	a5,0x5
ffffffffc0201f2a:	0ea7b783          	ld	a5,234(a5) # ffffffffc0207010 <SBI_CONSOLE_GETCHAR>
ffffffffc0201f2e:	88be                	mv	a7,a5
ffffffffc0201f30:	852a                	mv	a0,a0
ffffffffc0201f32:	85aa                	mv	a1,a0
ffffffffc0201f34:	862a                	mv	a2,a0
ffffffffc0201f36:	00000073          	ecall
ffffffffc0201f3a:	852a                	mv	a0,a0

int sbi_console_getchar(void) {
    return sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0);
}
ffffffffc0201f3c:	2501                	sext.w	a0,a0
ffffffffc0201f3e:	8082                	ret

ffffffffc0201f40 <sbi_shutdown>:
    __asm__ volatile (
ffffffffc0201f40:	4781                	li	a5,0
ffffffffc0201f42:	00005717          	auipc	a4,0x5
ffffffffc0201f46:	0de73703          	ld	a4,222(a4) # ffffffffc0207020 <SBI_SHUTDOWN>
ffffffffc0201f4a:	88ba                	mv	a7,a4
ffffffffc0201f4c:	853e                	mv	a0,a5
ffffffffc0201f4e:	85be                	mv	a1,a5
ffffffffc0201f50:	863e                	mv	a2,a5
ffffffffc0201f52:	00000073          	ecall
ffffffffc0201f56:	87aa                	mv	a5,a0

void sbi_shutdown(void)
{
	sbi_call(SBI_SHUTDOWN, 0, 0, 0);
ffffffffc0201f58:	8082                	ret

ffffffffc0201f5a <strlen>:
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
ffffffffc0201f5a:	00054783          	lbu	a5,0(a0)
strlen(const char *s) {
ffffffffc0201f5e:	872a                	mv	a4,a0
    size_t cnt = 0;
ffffffffc0201f60:	4501                	li	a0,0
    while (*s ++ != '\0') {
ffffffffc0201f62:	cb81                	beqz	a5,ffffffffc0201f72 <strlen+0x18>
        cnt ++;
ffffffffc0201f64:	0505                	addi	a0,a0,1
    while (*s ++ != '\0') {
ffffffffc0201f66:	00a707b3          	add	a5,a4,a0
ffffffffc0201f6a:	0007c783          	lbu	a5,0(a5)
ffffffffc0201f6e:	fbfd                	bnez	a5,ffffffffc0201f64 <strlen+0xa>
ffffffffc0201f70:	8082                	ret
    }
    return cnt;
}
ffffffffc0201f72:	8082                	ret

ffffffffc0201f74 <strnlen>:
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
ffffffffc0201f74:	4781                	li	a5,0
    while (cnt < len && *s ++ != '\0') {
ffffffffc0201f76:	e589                	bnez	a1,ffffffffc0201f80 <strnlen+0xc>
ffffffffc0201f78:	a811                	j	ffffffffc0201f8c <strnlen+0x18>
        cnt ++;
ffffffffc0201f7a:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
ffffffffc0201f7c:	00f58863          	beq	a1,a5,ffffffffc0201f8c <strnlen+0x18>
ffffffffc0201f80:	00f50733          	add	a4,a0,a5
ffffffffc0201f84:	00074703          	lbu	a4,0(a4)
ffffffffc0201f88:	fb6d                	bnez	a4,ffffffffc0201f7a <strnlen+0x6>
ffffffffc0201f8a:	85be                	mv	a1,a5
    }
    return cnt;
}
ffffffffc0201f8c:	852e                	mv	a0,a1
ffffffffc0201f8e:	8082                	ret

ffffffffc0201f90 <strcmp>:
int
strcmp(const char *s1, const char *s2) {
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
#else
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0201f90:	00054783          	lbu	a5,0(a0)
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201f94:	0005c703          	lbu	a4,0(a1)
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0201f98:	cb89                	beqz	a5,ffffffffc0201faa <strcmp+0x1a>
        s1 ++, s2 ++;
ffffffffc0201f9a:	0505                	addi	a0,a0,1
ffffffffc0201f9c:	0585                	addi	a1,a1,1
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0201f9e:	fee789e3          	beq	a5,a4,ffffffffc0201f90 <strcmp>
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201fa2:	0007851b          	sext.w	a0,a5
#endif /* __HAVE_ARCH_STRCMP */
}
ffffffffc0201fa6:	9d19                	subw	a0,a0,a4
ffffffffc0201fa8:	8082                	ret
ffffffffc0201faa:	4501                	li	a0,0
ffffffffc0201fac:	bfed                	j	ffffffffc0201fa6 <strcmp+0x16>

ffffffffc0201fae <strncmp>:
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0201fae:	c20d                	beqz	a2,ffffffffc0201fd0 <strncmp+0x22>
ffffffffc0201fb0:	962e                	add	a2,a2,a1
ffffffffc0201fb2:	a031                	j	ffffffffc0201fbe <strncmp+0x10>
        n --, s1 ++, s2 ++;
ffffffffc0201fb4:	0505                	addi	a0,a0,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0201fb6:	00e79a63          	bne	a5,a4,ffffffffc0201fca <strncmp+0x1c>
ffffffffc0201fba:	00b60b63          	beq	a2,a1,ffffffffc0201fd0 <strncmp+0x22>
ffffffffc0201fbe:	00054783          	lbu	a5,0(a0)
        n --, s1 ++, s2 ++;
ffffffffc0201fc2:	0585                	addi	a1,a1,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0201fc4:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0201fc8:	f7f5                	bnez	a5,ffffffffc0201fb4 <strncmp+0x6>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201fca:	40e7853b          	subw	a0,a5,a4
}
ffffffffc0201fce:	8082                	ret
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201fd0:	4501                	li	a0,0
ffffffffc0201fd2:	8082                	ret

ffffffffc0201fd4 <strchr>:
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
ffffffffc0201fd4:	00054783          	lbu	a5,0(a0)
ffffffffc0201fd8:	c799                	beqz	a5,ffffffffc0201fe6 <strchr+0x12>
        if (*s == c) {
ffffffffc0201fda:	00f58763          	beq	a1,a5,ffffffffc0201fe8 <strchr+0x14>
    while (*s != '\0') {
ffffffffc0201fde:	00154783          	lbu	a5,1(a0)
            return (char *)s;
        }
        s ++;
ffffffffc0201fe2:	0505                	addi	a0,a0,1
    while (*s != '\0') {
ffffffffc0201fe4:	fbfd                	bnez	a5,ffffffffc0201fda <strchr+0x6>
    }
    return NULL;
ffffffffc0201fe6:	4501                	li	a0,0
}
ffffffffc0201fe8:	8082                	ret

ffffffffc0201fea <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
ffffffffc0201fea:	ca01                	beqz	a2,ffffffffc0201ffa <memset+0x10>
ffffffffc0201fec:	962a                	add	a2,a2,a0
    char *p = s;
ffffffffc0201fee:	87aa                	mv	a5,a0
        *p ++ = c;
ffffffffc0201ff0:	0785                	addi	a5,a5,1
ffffffffc0201ff2:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
ffffffffc0201ff6:	fec79de3          	bne	a5,a2,ffffffffc0201ff0 <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
ffffffffc0201ffa:	8082                	ret
