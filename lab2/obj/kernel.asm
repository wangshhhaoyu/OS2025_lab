
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
    .globl kern_entry
kern_entry:
    # a0: hartid
    # a1: dtb physical address
    # save hartid and dtb address
    la t0, boot_hartid
ffffffffc0200000:	00006297          	auipc	t0,0x6
ffffffffc0200004:	00028293          	mv	t0,t0
    sd a0, 0(t0)
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0206000 <boot_hartid>
    la t0, boot_dtb
ffffffffc020000c:	00006297          	auipc	t0,0x6
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0206008 <boot_dtb>
    sd a1, 0(t0)
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)

    # t0 := 三级页表的虚拟地址
    lui     t0, %hi(boot_page_table_sv39)
ffffffffc0200018:	c02052b7          	lui	t0,0xc0205
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
ffffffffc020003c:	c0205137          	lui	sp,0xc0205

    # 我们在虚拟内存空间中：随意跳转到虚拟地址！
    # 跳转到 kern_init
    lui t0, %hi(kern_init)
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
    addi t0, t0, %lo(kern_init)
ffffffffc0200044:	0d828293          	addi	t0,t0,216 # ffffffffc02000d8 <kern_init>
    jr t0
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <print_kerninfo>:
/* *
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void print_kerninfo(void) {
ffffffffc020004a:	1141                	addi	sp,sp,-16
    extern char etext[], edata[], end[];
    cprintf("Special kernel symbols:\n");
ffffffffc020004c:	00002517          	auipc	a0,0x2
ffffffffc0200050:	95c50513          	addi	a0,a0,-1700 # ffffffffc02019a8 <etext+0x2>
void print_kerninfo(void) {
ffffffffc0200054:	e406                	sd	ra,8(sp)
    cprintf("Special kernel symbols:\n");
ffffffffc0200056:	0f6000ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("  entry  0x%016lx (virtual)\n", (uintptr_t)kern_init);
ffffffffc020005a:	00000597          	auipc	a1,0x0
ffffffffc020005e:	07e58593          	addi	a1,a1,126 # ffffffffc02000d8 <kern_init>
ffffffffc0200062:	00002517          	auipc	a0,0x2
ffffffffc0200066:	96650513          	addi	a0,a0,-1690 # ffffffffc02019c8 <etext+0x22>
ffffffffc020006a:	0e2000ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("  etext  0x%016lx (virtual)\n", etext);
ffffffffc020006e:	00002597          	auipc	a1,0x2
ffffffffc0200072:	93858593          	addi	a1,a1,-1736 # ffffffffc02019a6 <etext>
ffffffffc0200076:	00002517          	auipc	a0,0x2
ffffffffc020007a:	97250513          	addi	a0,a0,-1678 # ffffffffc02019e8 <etext+0x42>
ffffffffc020007e:	0ce000ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("  edata  0x%016lx (virtual)\n", edata);
ffffffffc0200082:	00006597          	auipc	a1,0x6
ffffffffc0200086:	f9658593          	addi	a1,a1,-106 # ffffffffc0206018 <buddy>
ffffffffc020008a:	00002517          	auipc	a0,0x2
ffffffffc020008e:	97e50513          	addi	a0,a0,-1666 # ffffffffc0201a08 <etext+0x62>
ffffffffc0200092:	0ba000ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("  end    0x%016lx (virtual)\n", end);
ffffffffc0200096:	00006597          	auipc	a1,0x6
ffffffffc020009a:	1ca58593          	addi	a1,a1,458 # ffffffffc0206260 <end>
ffffffffc020009e:	00002517          	auipc	a0,0x2
ffffffffc02000a2:	98a50513          	addi	a0,a0,-1654 # ffffffffc0201a28 <etext+0x82>
ffffffffc02000a6:	0a6000ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n",
            (end - (char*)kern_init + 1023) / 1024);
ffffffffc02000aa:	00006597          	auipc	a1,0x6
ffffffffc02000ae:	5b558593          	addi	a1,a1,1461 # ffffffffc020665f <end+0x3ff>
ffffffffc02000b2:	00000797          	auipc	a5,0x0
ffffffffc02000b6:	02678793          	addi	a5,a5,38 # ffffffffc02000d8 <kern_init>
ffffffffc02000ba:	40f587b3          	sub	a5,a1,a5
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc02000be:	43f7d593          	srai	a1,a5,0x3f
}
ffffffffc02000c2:	60a2                	ld	ra,8(sp)
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc02000c4:	3ff5f593          	andi	a1,a1,1023
ffffffffc02000c8:	95be                	add	a1,a1,a5
ffffffffc02000ca:	85a9                	srai	a1,a1,0xa
ffffffffc02000cc:	00002517          	auipc	a0,0x2
ffffffffc02000d0:	97c50513          	addi	a0,a0,-1668 # ffffffffc0201a48 <etext+0xa2>
}
ffffffffc02000d4:	0141                	addi	sp,sp,16
    cprintf("Kernel executable memory footprint: %dKB\n",
ffffffffc02000d6:	a89d                	j	ffffffffc020014c <cprintf>

ffffffffc02000d8 <kern_init>:

int kern_init(void) {
    extern char edata[], end[];
    memset(edata, 0, end - edata);
ffffffffc02000d8:	00006517          	auipc	a0,0x6
ffffffffc02000dc:	f4050513          	addi	a0,a0,-192 # ffffffffc0206018 <buddy>
ffffffffc02000e0:	00006617          	auipc	a2,0x6
ffffffffc02000e4:	18060613          	addi	a2,a2,384 # ffffffffc0206260 <end>
int kern_init(void) {
ffffffffc02000e8:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
ffffffffc02000ea:	8e09                	sub	a2,a2,a0
ffffffffc02000ec:	4581                	li	a1,0
int kern_init(void) {
ffffffffc02000ee:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
ffffffffc02000f0:	0a5010ef          	jal	ra,ffffffffc0201994 <memset>
    dtb_init();
ffffffffc02000f4:	12c000ef          	jal	ra,ffffffffc0200220 <dtb_init>
    cons_init();  // init the console
ffffffffc02000f8:	11e000ef          	jal	ra,ffffffffc0200216 <cons_init>
    const char *message = "(THU.CST) os is loading ...\0";
    //cprintf("%s\n\n", message);
    cputs(message);
ffffffffc02000fc:	00002517          	auipc	a0,0x2
ffffffffc0200100:	97c50513          	addi	a0,a0,-1668 # ffffffffc0201a78 <etext+0xd2>
ffffffffc0200104:	07e000ef          	jal	ra,ffffffffc0200182 <cputs>

    print_kerninfo();
ffffffffc0200108:	f43ff0ef          	jal	ra,ffffffffc020004a <print_kerninfo>

    // grade_backtrace();
    pmm_init();  // init physical memory management
ffffffffc020010c:	22e010ef          	jal	ra,ffffffffc020133a <pmm_init>

    /* do nothing */
    while (1)
ffffffffc0200110:	a001                	j	ffffffffc0200110 <kern_init+0x38>

ffffffffc0200112 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
ffffffffc0200112:	1141                	addi	sp,sp,-16
ffffffffc0200114:	e022                	sd	s0,0(sp)
ffffffffc0200116:	e406                	sd	ra,8(sp)
ffffffffc0200118:	842e                	mv	s0,a1
    cons_putc(c);
ffffffffc020011a:	0fe000ef          	jal	ra,ffffffffc0200218 <cons_putc>
    (*cnt) ++;
ffffffffc020011e:	401c                	lw	a5,0(s0)
}
ffffffffc0200120:	60a2                	ld	ra,8(sp)
    (*cnt) ++;
ffffffffc0200122:	2785                	addiw	a5,a5,1
ffffffffc0200124:	c01c                	sw	a5,0(s0)
}
ffffffffc0200126:	6402                	ld	s0,0(sp)
ffffffffc0200128:	0141                	addi	sp,sp,16
ffffffffc020012a:	8082                	ret

ffffffffc020012c <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
ffffffffc020012c:	1101                	addi	sp,sp,-32
ffffffffc020012e:	862a                	mv	a2,a0
ffffffffc0200130:	86ae                	mv	a3,a1
    int cnt = 0;
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc0200132:	00000517          	auipc	a0,0x0
ffffffffc0200136:	fe050513          	addi	a0,a0,-32 # ffffffffc0200112 <cputch>
ffffffffc020013a:	006c                	addi	a1,sp,12
vcprintf(const char *fmt, va_list ap) {
ffffffffc020013c:	ec06                	sd	ra,24(sp)
    int cnt = 0;
ffffffffc020013e:	c602                	sw	zero,12(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc0200140:	43e010ef          	jal	ra,ffffffffc020157e <vprintfmt>
    return cnt;
}
ffffffffc0200144:	60e2                	ld	ra,24(sp)
ffffffffc0200146:	4532                	lw	a0,12(sp)
ffffffffc0200148:	6105                	addi	sp,sp,32
ffffffffc020014a:	8082                	ret

ffffffffc020014c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
ffffffffc020014c:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
ffffffffc020014e:	02810313          	addi	t1,sp,40 # ffffffffc0205028 <boot_page_table_sv39+0x28>
cprintf(const char *fmt, ...) {
ffffffffc0200152:	8e2a                	mv	t3,a0
ffffffffc0200154:	f42e                	sd	a1,40(sp)
ffffffffc0200156:	f832                	sd	a2,48(sp)
ffffffffc0200158:	fc36                	sd	a3,56(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc020015a:	00000517          	auipc	a0,0x0
ffffffffc020015e:	fb850513          	addi	a0,a0,-72 # ffffffffc0200112 <cputch>
ffffffffc0200162:	004c                	addi	a1,sp,4
ffffffffc0200164:	869a                	mv	a3,t1
ffffffffc0200166:	8672                	mv	a2,t3
cprintf(const char *fmt, ...) {
ffffffffc0200168:	ec06                	sd	ra,24(sp)
ffffffffc020016a:	e0ba                	sd	a4,64(sp)
ffffffffc020016c:	e4be                	sd	a5,72(sp)
ffffffffc020016e:	e8c2                	sd	a6,80(sp)
ffffffffc0200170:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
ffffffffc0200172:	e41a                	sd	t1,8(sp)
    int cnt = 0;
ffffffffc0200174:	c202                	sw	zero,4(sp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
ffffffffc0200176:	408010ef          	jal	ra,ffffffffc020157e <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
ffffffffc020017a:	60e2                	ld	ra,24(sp)
ffffffffc020017c:	4512                	lw	a0,4(sp)
ffffffffc020017e:	6125                	addi	sp,sp,96
ffffffffc0200180:	8082                	ret

ffffffffc0200182 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
ffffffffc0200182:	1101                	addi	sp,sp,-32
ffffffffc0200184:	e822                	sd	s0,16(sp)
ffffffffc0200186:	ec06                	sd	ra,24(sp)
ffffffffc0200188:	e426                	sd	s1,8(sp)
ffffffffc020018a:	842a                	mv	s0,a0
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
ffffffffc020018c:	00054503          	lbu	a0,0(a0)
ffffffffc0200190:	c51d                	beqz	a0,ffffffffc02001be <cputs+0x3c>
ffffffffc0200192:	0405                	addi	s0,s0,1
ffffffffc0200194:	4485                	li	s1,1
ffffffffc0200196:	9c81                	subw	s1,s1,s0
    cons_putc(c);
ffffffffc0200198:	080000ef          	jal	ra,ffffffffc0200218 <cons_putc>
    while ((c = *str ++) != '\0') {
ffffffffc020019c:	00044503          	lbu	a0,0(s0)
ffffffffc02001a0:	008487bb          	addw	a5,s1,s0
ffffffffc02001a4:	0405                	addi	s0,s0,1
ffffffffc02001a6:	f96d                	bnez	a0,ffffffffc0200198 <cputs+0x16>
    (*cnt) ++;
ffffffffc02001a8:	0017841b          	addiw	s0,a5,1
    cons_putc(c);
ffffffffc02001ac:	4529                	li	a0,10
ffffffffc02001ae:	06a000ef          	jal	ra,ffffffffc0200218 <cons_putc>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
    return cnt;
}
ffffffffc02001b2:	60e2                	ld	ra,24(sp)
ffffffffc02001b4:	8522                	mv	a0,s0
ffffffffc02001b6:	6442                	ld	s0,16(sp)
ffffffffc02001b8:	64a2                	ld	s1,8(sp)
ffffffffc02001ba:	6105                	addi	sp,sp,32
ffffffffc02001bc:	8082                	ret
    while ((c = *str ++) != '\0') {
ffffffffc02001be:	4405                	li	s0,1
ffffffffc02001c0:	b7f5                	j	ffffffffc02001ac <cputs+0x2a>

ffffffffc02001c2 <__panic>:
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
ffffffffc02001c2:	00006317          	auipc	t1,0x6
ffffffffc02001c6:	05630313          	addi	t1,t1,86 # ffffffffc0206218 <is_panic>
ffffffffc02001ca:	00032e03          	lw	t3,0(t1)
__panic(const char *file, int line, const char *fmt, ...) {
ffffffffc02001ce:	715d                	addi	sp,sp,-80
ffffffffc02001d0:	ec06                	sd	ra,24(sp)
ffffffffc02001d2:	e822                	sd	s0,16(sp)
ffffffffc02001d4:	f436                	sd	a3,40(sp)
ffffffffc02001d6:	f83a                	sd	a4,48(sp)
ffffffffc02001d8:	fc3e                	sd	a5,56(sp)
ffffffffc02001da:	e0c2                	sd	a6,64(sp)
ffffffffc02001dc:	e4c6                	sd	a7,72(sp)
    if (is_panic) {
ffffffffc02001de:	000e0363          	beqz	t3,ffffffffc02001e4 <__panic+0x22>
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    while (1) {
ffffffffc02001e2:	a001                	j	ffffffffc02001e2 <__panic+0x20>
    is_panic = 1;
ffffffffc02001e4:	4785                	li	a5,1
ffffffffc02001e6:	00f32023          	sw	a5,0(t1)
    va_start(ap, fmt);
ffffffffc02001ea:	8432                	mv	s0,a2
ffffffffc02001ec:	103c                	addi	a5,sp,40
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02001ee:	862e                	mv	a2,a1
ffffffffc02001f0:	85aa                	mv	a1,a0
ffffffffc02001f2:	00002517          	auipc	a0,0x2
ffffffffc02001f6:	8a650513          	addi	a0,a0,-1882 # ffffffffc0201a98 <etext+0xf2>
    va_start(ap, fmt);
ffffffffc02001fa:	e43e                	sd	a5,8(sp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
ffffffffc02001fc:	f51ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    vcprintf(fmt, ap);
ffffffffc0200200:	65a2                	ld	a1,8(sp)
ffffffffc0200202:	8522                	mv	a0,s0
ffffffffc0200204:	f29ff0ef          	jal	ra,ffffffffc020012c <vcprintf>
    cprintf("\n");
ffffffffc0200208:	00002517          	auipc	a0,0x2
ffffffffc020020c:	86850513          	addi	a0,a0,-1944 # ffffffffc0201a70 <etext+0xca>
ffffffffc0200210:	f3dff0ef          	jal	ra,ffffffffc020014c <cprintf>
ffffffffc0200214:	b7f9                	j	ffffffffc02001e2 <__panic+0x20>

ffffffffc0200216 <cons_init>:

/* serial_intr - try to feed input characters from serial port */
void serial_intr(void) {}

/* cons_init - initializes the console devices */
void cons_init(void) {}
ffffffffc0200216:	8082                	ret

ffffffffc0200218 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) { sbi_console_putchar((unsigned char)c); }
ffffffffc0200218:	0ff57513          	zext.b	a0,a0
ffffffffc020021c:	6e40106f          	j	ffffffffc0201900 <sbi_console_putchar>

ffffffffc0200220 <dtb_init>:

// 保存解析出的系统物理内存信息
static uint64_t memory_base = 0;
static uint64_t memory_size = 0;

void dtb_init(void) {
ffffffffc0200220:	7119                	addi	sp,sp,-128
    cprintf("DTB Init\n");
ffffffffc0200222:	00002517          	auipc	a0,0x2
ffffffffc0200226:	89650513          	addi	a0,a0,-1898 # ffffffffc0201ab8 <etext+0x112>
void dtb_init(void) {
ffffffffc020022a:	fc86                	sd	ra,120(sp)
ffffffffc020022c:	f8a2                	sd	s0,112(sp)
ffffffffc020022e:	e8d2                	sd	s4,80(sp)
ffffffffc0200230:	f4a6                	sd	s1,104(sp)
ffffffffc0200232:	f0ca                	sd	s2,96(sp)
ffffffffc0200234:	ecce                	sd	s3,88(sp)
ffffffffc0200236:	e4d6                	sd	s5,72(sp)
ffffffffc0200238:	e0da                	sd	s6,64(sp)
ffffffffc020023a:	fc5e                	sd	s7,56(sp)
ffffffffc020023c:	f862                	sd	s8,48(sp)
ffffffffc020023e:	f466                	sd	s9,40(sp)
ffffffffc0200240:	f06a                	sd	s10,32(sp)
ffffffffc0200242:	ec6e                	sd	s11,24(sp)
    cprintf("DTB Init\n");
ffffffffc0200244:	f09ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("HartID: %ld\n", boot_hartid);
ffffffffc0200248:	00006597          	auipc	a1,0x6
ffffffffc020024c:	db85b583          	ld	a1,-584(a1) # ffffffffc0206000 <boot_hartid>
ffffffffc0200250:	00002517          	auipc	a0,0x2
ffffffffc0200254:	87850513          	addi	a0,a0,-1928 # ffffffffc0201ac8 <etext+0x122>
ffffffffc0200258:	ef5ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("DTB Address: 0x%lx\n", boot_dtb);
ffffffffc020025c:	00006417          	auipc	s0,0x6
ffffffffc0200260:	dac40413          	addi	s0,s0,-596 # ffffffffc0206008 <boot_dtb>
ffffffffc0200264:	600c                	ld	a1,0(s0)
ffffffffc0200266:	00002517          	auipc	a0,0x2
ffffffffc020026a:	87250513          	addi	a0,a0,-1934 # ffffffffc0201ad8 <etext+0x132>
ffffffffc020026e:	edfff0ef          	jal	ra,ffffffffc020014c <cprintf>
    
    if (boot_dtb == 0) {
ffffffffc0200272:	00043a03          	ld	s4,0(s0)
        cprintf("Error: DTB address is null\n");
ffffffffc0200276:	00002517          	auipc	a0,0x2
ffffffffc020027a:	87a50513          	addi	a0,a0,-1926 # ffffffffc0201af0 <etext+0x14a>
    if (boot_dtb == 0) {
ffffffffc020027e:	120a0463          	beqz	s4,ffffffffc02003a6 <dtb_init+0x186>
        return;
    }
    
    // 转换为虚拟地址
    uintptr_t dtb_vaddr = boot_dtb + PHYSICAL_MEMORY_OFFSET;
ffffffffc0200282:	57f5                	li	a5,-3
ffffffffc0200284:	07fa                	slli	a5,a5,0x1e
ffffffffc0200286:	00fa0733          	add	a4,s4,a5
    const struct fdt_header *header = (const struct fdt_header *)dtb_vaddr;
    
    // 验证DTB
    uint32_t magic = fdt32_to_cpu(header->magic);
ffffffffc020028a:	431c                	lw	a5,0(a4)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020028c:	00ff0637          	lui	a2,0xff0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200290:	6b41                	lui	s6,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200292:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200296:	0187969b          	slliw	a3,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020029a:	0187d51b          	srliw	a0,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020029e:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002a2:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002a6:	8df1                	and	a1,a1,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002a8:	8ec9                	or	a3,a3,a0
ffffffffc02002aa:	0087979b          	slliw	a5,a5,0x8
ffffffffc02002ae:	1b7d                	addi	s6,s6,-1
ffffffffc02002b0:	0167f7b3          	and	a5,a5,s6
ffffffffc02002b4:	8dd5                	or	a1,a1,a3
ffffffffc02002b6:	8ddd                	or	a1,a1,a5
    if (magic != 0xd00dfeed) {
ffffffffc02002b8:	d00e07b7          	lui	a5,0xd00e0
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002bc:	2581                	sext.w	a1,a1
    if (magic != 0xd00dfeed) {
ffffffffc02002be:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfed9c8d>
ffffffffc02002c2:	10f59163          	bne	a1,a5,ffffffffc02003c4 <dtb_init+0x1a4>
        return;
    }
    
    // 提取内存信息
    uint64_t mem_base, mem_size;
    if (extract_memory_info(dtb_vaddr, header, &mem_base, &mem_size) == 0) {
ffffffffc02002c6:	471c                	lw	a5,8(a4)
ffffffffc02002c8:	4754                	lw	a3,12(a4)
    int in_memory_node = 0;
ffffffffc02002ca:	4c81                	li	s9,0
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002cc:	0087d59b          	srliw	a1,a5,0x8
ffffffffc02002d0:	0086d51b          	srliw	a0,a3,0x8
ffffffffc02002d4:	0186941b          	slliw	s0,a3,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002d8:	0186d89b          	srliw	a7,a3,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002dc:	01879a1b          	slliw	s4,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002e0:	0187d81b          	srliw	a6,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002e4:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002e8:	0106d69b          	srliw	a3,a3,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002ec:	0105959b          	slliw	a1,a1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002f0:	0107d79b          	srliw	a5,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02002f4:	8d71                	and	a0,a0,a2
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02002f6:	01146433          	or	s0,s0,a7
ffffffffc02002fa:	0086969b          	slliw	a3,a3,0x8
ffffffffc02002fe:	010a6a33          	or	s4,s4,a6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200302:	8e6d                	and	a2,a2,a1
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200304:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200308:	8c49                	or	s0,s0,a0
ffffffffc020030a:	0166f6b3          	and	a3,a3,s6
ffffffffc020030e:	00ca6a33          	or	s4,s4,a2
ffffffffc0200312:	0167f7b3          	and	a5,a5,s6
ffffffffc0200316:	8c55                	or	s0,s0,a3
ffffffffc0200318:	00fa6a33          	or	s4,s4,a5
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc020031c:	1402                	slli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc020031e:	1a02                	slli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc0200320:	9001                	srli	s0,s0,0x20
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc0200322:	020a5a13          	srli	s4,s4,0x20
    const char *strings_base = (const char *)(dtb_vaddr + strings_offset);
ffffffffc0200326:	943a                	add	s0,s0,a4
    const uint32_t *struct_ptr = (const uint32_t *)(dtb_vaddr + struct_offset);
ffffffffc0200328:	9a3a                	add	s4,s4,a4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020032a:	00ff0c37          	lui	s8,0xff0
        switch (token) {
ffffffffc020032e:	4b8d                	li	s7,3
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200330:	00002917          	auipc	s2,0x2
ffffffffc0200334:	81090913          	addi	s2,s2,-2032 # ffffffffc0201b40 <etext+0x19a>
ffffffffc0200338:	49bd                	li	s3,15
        switch (token) {
ffffffffc020033a:	4d91                	li	s11,4
ffffffffc020033c:	4d05                	li	s10,1
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc020033e:	00001497          	auipc	s1,0x1
ffffffffc0200342:	7fa48493          	addi	s1,s1,2042 # ffffffffc0201b38 <etext+0x192>
        uint32_t token = fdt32_to_cpu(*struct_ptr++);
ffffffffc0200346:	000a2703          	lw	a4,0(s4)
ffffffffc020034a:	004a0a93          	addi	s5,s4,4
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020034e:	0087569b          	srliw	a3,a4,0x8
ffffffffc0200352:	0187179b          	slliw	a5,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200356:	0187561b          	srliw	a2,a4,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020035a:	0106969b          	slliw	a3,a3,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020035e:	0107571b          	srliw	a4,a4,0x10
ffffffffc0200362:	8fd1                	or	a5,a5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200364:	0186f6b3          	and	a3,a3,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200368:	0087171b          	slliw	a4,a4,0x8
ffffffffc020036c:	8fd5                	or	a5,a5,a3
ffffffffc020036e:	00eb7733          	and	a4,s6,a4
ffffffffc0200372:	8fd9                	or	a5,a5,a4
ffffffffc0200374:	2781                	sext.w	a5,a5
        switch (token) {
ffffffffc0200376:	09778c63          	beq	a5,s7,ffffffffc020040e <dtb_init+0x1ee>
ffffffffc020037a:	00fbea63          	bltu	s7,a5,ffffffffc020038e <dtb_init+0x16e>
ffffffffc020037e:	07a78663          	beq	a5,s10,ffffffffc02003ea <dtb_init+0x1ca>
ffffffffc0200382:	4709                	li	a4,2
ffffffffc0200384:	00e79763          	bne	a5,a4,ffffffffc0200392 <dtb_init+0x172>
ffffffffc0200388:	4c81                	li	s9,0
ffffffffc020038a:	8a56                	mv	s4,s5
ffffffffc020038c:	bf6d                	j	ffffffffc0200346 <dtb_init+0x126>
ffffffffc020038e:	ffb78ee3          	beq	a5,s11,ffffffffc020038a <dtb_init+0x16a>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
        // 保存到全局变量，供 PMM 查询
        memory_base = mem_base;
        memory_size = mem_size;
    } else {
        cprintf("Warning: Could not extract memory info from DTB\n");
ffffffffc0200392:	00002517          	auipc	a0,0x2
ffffffffc0200396:	82650513          	addi	a0,a0,-2010 # ffffffffc0201bb8 <etext+0x212>
ffffffffc020039a:	db3ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    }
    cprintf("DTB init completed\n");
ffffffffc020039e:	00002517          	auipc	a0,0x2
ffffffffc02003a2:	85250513          	addi	a0,a0,-1966 # ffffffffc0201bf0 <etext+0x24a>
}
ffffffffc02003a6:	7446                	ld	s0,112(sp)
ffffffffc02003a8:	70e6                	ld	ra,120(sp)
ffffffffc02003aa:	74a6                	ld	s1,104(sp)
ffffffffc02003ac:	7906                	ld	s2,96(sp)
ffffffffc02003ae:	69e6                	ld	s3,88(sp)
ffffffffc02003b0:	6a46                	ld	s4,80(sp)
ffffffffc02003b2:	6aa6                	ld	s5,72(sp)
ffffffffc02003b4:	6b06                	ld	s6,64(sp)
ffffffffc02003b6:	7be2                	ld	s7,56(sp)
ffffffffc02003b8:	7c42                	ld	s8,48(sp)
ffffffffc02003ba:	7ca2                	ld	s9,40(sp)
ffffffffc02003bc:	7d02                	ld	s10,32(sp)
ffffffffc02003be:	6de2                	ld	s11,24(sp)
ffffffffc02003c0:	6109                	addi	sp,sp,128
    cprintf("DTB init completed\n");
ffffffffc02003c2:	b369                	j	ffffffffc020014c <cprintf>
}
ffffffffc02003c4:	7446                	ld	s0,112(sp)
ffffffffc02003c6:	70e6                	ld	ra,120(sp)
ffffffffc02003c8:	74a6                	ld	s1,104(sp)
ffffffffc02003ca:	7906                	ld	s2,96(sp)
ffffffffc02003cc:	69e6                	ld	s3,88(sp)
ffffffffc02003ce:	6a46                	ld	s4,80(sp)
ffffffffc02003d0:	6aa6                	ld	s5,72(sp)
ffffffffc02003d2:	6b06                	ld	s6,64(sp)
ffffffffc02003d4:	7be2                	ld	s7,56(sp)
ffffffffc02003d6:	7c42                	ld	s8,48(sp)
ffffffffc02003d8:	7ca2                	ld	s9,40(sp)
ffffffffc02003da:	7d02                	ld	s10,32(sp)
ffffffffc02003dc:	6de2                	ld	s11,24(sp)
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02003de:	00001517          	auipc	a0,0x1
ffffffffc02003e2:	73250513          	addi	a0,a0,1842 # ffffffffc0201b10 <etext+0x16a>
}
ffffffffc02003e6:	6109                	addi	sp,sp,128
        cprintf("Error: Invalid DTB magic number: 0x%x\n", magic);
ffffffffc02003e8:	b395                	j	ffffffffc020014c <cprintf>
                int name_len = strlen(name);
ffffffffc02003ea:	8556                	mv	a0,s5
ffffffffc02003ec:	52e010ef          	jal	ra,ffffffffc020191a <strlen>
ffffffffc02003f0:	8a2a                	mv	s4,a0
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02003f2:	4619                	li	a2,6
ffffffffc02003f4:	85a6                	mv	a1,s1
ffffffffc02003f6:	8556                	mv	a0,s5
                int name_len = strlen(name);
ffffffffc02003f8:	2a01                	sext.w	s4,s4
                if (strncmp(name, "memory", 6) == 0) {
ffffffffc02003fa:	574010ef          	jal	ra,ffffffffc020196e <strncmp>
ffffffffc02003fe:	e111                	bnez	a0,ffffffffc0200402 <dtb_init+0x1e2>
                    in_memory_node = 1;
ffffffffc0200400:	4c85                	li	s9,1
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + name_len + 4) & ~3);
ffffffffc0200402:	0a91                	addi	s5,s5,4
ffffffffc0200404:	9ad2                	add	s5,s5,s4
ffffffffc0200406:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc020040a:	8a56                	mv	s4,s5
ffffffffc020040c:	bf2d                	j	ffffffffc0200346 <dtb_init+0x126>
                uint32_t prop_len = fdt32_to_cpu(*struct_ptr++);
ffffffffc020040e:	004a2783          	lw	a5,4(s4)
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc0200412:	00ca0693          	addi	a3,s4,12
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200416:	0087d71b          	srliw	a4,a5,0x8
ffffffffc020041a:	01879a9b          	slliw	s5,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020041e:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200422:	0107171b          	slliw	a4,a4,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200426:	0107d79b          	srliw	a5,a5,0x10
ffffffffc020042a:	00caeab3          	or	s5,s5,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020042e:	01877733          	and	a4,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200432:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200436:	00eaeab3          	or	s5,s5,a4
ffffffffc020043a:	00fb77b3          	and	a5,s6,a5
ffffffffc020043e:	00faeab3          	or	s5,s5,a5
ffffffffc0200442:	2a81                	sext.w	s5,s5
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200444:	000c9c63          	bnez	s9,ffffffffc020045c <dtb_init+0x23c>
                struct_ptr = (const uint32_t *)(((uintptr_t)struct_ptr + prop_len + 3) & ~3);
ffffffffc0200448:	1a82                	slli	s5,s5,0x20
ffffffffc020044a:	00368793          	addi	a5,a3,3
ffffffffc020044e:	020ada93          	srli	s5,s5,0x20
ffffffffc0200452:	9abe                	add	s5,s5,a5
ffffffffc0200454:	ffcafa93          	andi	s5,s5,-4
        switch (token) {
ffffffffc0200458:	8a56                	mv	s4,s5
ffffffffc020045a:	b5f5                	j	ffffffffc0200346 <dtb_init+0x126>
                uint32_t prop_nameoff = fdt32_to_cpu(*struct_ptr++);
ffffffffc020045c:	008a2783          	lw	a5,8(s4)
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc0200460:	85ca                	mv	a1,s2
ffffffffc0200462:	e436                	sd	a3,8(sp)
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200464:	0087d51b          	srliw	a0,a5,0x8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200468:	0187d61b          	srliw	a2,a5,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020046c:	0187971b          	slliw	a4,a5,0x18
ffffffffc0200470:	0105151b          	slliw	a0,a0,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200474:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200478:	8f51                	or	a4,a4,a2
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020047a:	01857533          	and	a0,a0,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020047e:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200482:	8d59                	or	a0,a0,a4
ffffffffc0200484:	00fb77b3          	and	a5,s6,a5
ffffffffc0200488:	8d5d                	or	a0,a0,a5
                const char *prop_name = strings_base + prop_nameoff;
ffffffffc020048a:	1502                	slli	a0,a0,0x20
ffffffffc020048c:	9101                	srli	a0,a0,0x20
                if (in_memory_node && strcmp(prop_name, "reg") == 0 && prop_len >= 16) {
ffffffffc020048e:	9522                	add	a0,a0,s0
ffffffffc0200490:	4c0010ef          	jal	ra,ffffffffc0201950 <strcmp>
ffffffffc0200494:	66a2                	ld	a3,8(sp)
ffffffffc0200496:	f94d                	bnez	a0,ffffffffc0200448 <dtb_init+0x228>
ffffffffc0200498:	fb59f8e3          	bgeu	s3,s5,ffffffffc0200448 <dtb_init+0x228>
                    *mem_base = fdt64_to_cpu(reg_data[0]);
ffffffffc020049c:	00ca3783          	ld	a5,12(s4)
                    *mem_size = fdt64_to_cpu(reg_data[1]);
ffffffffc02004a0:	014a3703          	ld	a4,20(s4)
        cprintf("Physical Memory from DTB:\n");
ffffffffc02004a4:	00001517          	auipc	a0,0x1
ffffffffc02004a8:	6a450513          	addi	a0,a0,1700 # ffffffffc0201b48 <etext+0x1a2>
           fdt32_to_cpu(x >> 32);
ffffffffc02004ac:	4207d613          	srai	a2,a5,0x20
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02004b0:	0087d31b          	srliw	t1,a5,0x8
           fdt32_to_cpu(x >> 32);
ffffffffc02004b4:	42075593          	srai	a1,a4,0x20
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02004b8:	0187de1b          	srliw	t3,a5,0x18
ffffffffc02004bc:	0186581b          	srliw	a6,a2,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02004c0:	0187941b          	slliw	s0,a5,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02004c4:	0107d89b          	srliw	a7,a5,0x10
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02004c8:	0187d693          	srli	a3,a5,0x18
ffffffffc02004cc:	01861f1b          	slliw	t5,a2,0x18
ffffffffc02004d0:	0087579b          	srliw	a5,a4,0x8
ffffffffc02004d4:	0103131b          	slliw	t1,t1,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02004d8:	0106561b          	srliw	a2,a2,0x10
ffffffffc02004dc:	010f6f33          	or	t5,t5,a6
ffffffffc02004e0:	0187529b          	srliw	t0,a4,0x18
ffffffffc02004e4:	0185df9b          	srliw	t6,a1,0x18
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02004e8:	01837333          	and	t1,t1,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02004ec:	01c46433          	or	s0,s0,t3
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc02004f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02004f4:	01859e1b          	slliw	t3,a1,0x18
ffffffffc02004f8:	01871e9b          	slliw	t4,a4,0x18
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc02004fc:	0107581b          	srliw	a6,a4,0x10
ffffffffc0200500:	0086161b          	slliw	a2,a2,0x8
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200504:	8361                	srli	a4,a4,0x18
ffffffffc0200506:	0107979b          	slliw	a5,a5,0x10
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020050a:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020050e:	01e6e6b3          	or	a3,a3,t5
ffffffffc0200512:	00cb7633          	and	a2,s6,a2
ffffffffc0200516:	0088181b          	slliw	a6,a6,0x8
ffffffffc020051a:	0085959b          	slliw	a1,a1,0x8
ffffffffc020051e:	00646433          	or	s0,s0,t1
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc0200522:	0187f7b3          	and	a5,a5,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc0200526:	01fe6333          	or	t1,t3,t6
    return ((x & 0xff) << 24) | (((x >> 8) & 0xff) << 16) | 
ffffffffc020052a:	01877c33          	and	s8,a4,s8
           (((x >> 16) & 0xff) << 8) | ((x >> 24) & 0xff);
ffffffffc020052e:	0088989b          	slliw	a7,a7,0x8
ffffffffc0200532:	011b78b3          	and	a7,s6,a7
ffffffffc0200536:	005eeeb3          	or	t4,t4,t0
ffffffffc020053a:	00c6e733          	or	a4,a3,a2
ffffffffc020053e:	006c6c33          	or	s8,s8,t1
ffffffffc0200542:	010b76b3          	and	a3,s6,a6
ffffffffc0200546:	00bb7b33          	and	s6,s6,a1
ffffffffc020054a:	01d7e7b3          	or	a5,a5,t4
ffffffffc020054e:	016c6b33          	or	s6,s8,s6
ffffffffc0200552:	01146433          	or	s0,s0,a7
ffffffffc0200556:	8fd5                	or	a5,a5,a3
           fdt32_to_cpu(x >> 32);
ffffffffc0200558:	1702                	slli	a4,a4,0x20
ffffffffc020055a:	1b02                	slli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc020055c:	1782                	slli	a5,a5,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc020055e:	9301                	srli	a4,a4,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc0200560:	1402                	slli	s0,s0,0x20
           fdt32_to_cpu(x >> 32);
ffffffffc0200562:	020b5b13          	srli	s6,s6,0x20
    return ((uint64_t)fdt32_to_cpu(x & 0xffffffff) << 32) | 
ffffffffc0200566:	0167eb33          	or	s6,a5,s6
ffffffffc020056a:	8c59                	or	s0,s0,a4
        cprintf("Physical Memory from DTB:\n");
ffffffffc020056c:	be1ff0ef          	jal	ra,ffffffffc020014c <cprintf>
        cprintf("  Base: 0x%016lx\n", mem_base);
ffffffffc0200570:	85a2                	mv	a1,s0
ffffffffc0200572:	00001517          	auipc	a0,0x1
ffffffffc0200576:	5f650513          	addi	a0,a0,1526 # ffffffffc0201b68 <etext+0x1c2>
ffffffffc020057a:	bd3ff0ef          	jal	ra,ffffffffc020014c <cprintf>
        cprintf("  Size: 0x%016lx (%ld MB)\n", mem_size, mem_size / (1024 * 1024));
ffffffffc020057e:	014b5613          	srli	a2,s6,0x14
ffffffffc0200582:	85da                	mv	a1,s6
ffffffffc0200584:	00001517          	auipc	a0,0x1
ffffffffc0200588:	5fc50513          	addi	a0,a0,1532 # ffffffffc0201b80 <etext+0x1da>
ffffffffc020058c:	bc1ff0ef          	jal	ra,ffffffffc020014c <cprintf>
        cprintf("  End:  0x%016lx\n", mem_base + mem_size - 1);
ffffffffc0200590:	008b05b3          	add	a1,s6,s0
ffffffffc0200594:	15fd                	addi	a1,a1,-1
ffffffffc0200596:	00001517          	auipc	a0,0x1
ffffffffc020059a:	60a50513          	addi	a0,a0,1546 # ffffffffc0201ba0 <etext+0x1fa>
ffffffffc020059e:	bafff0ef          	jal	ra,ffffffffc020014c <cprintf>
    cprintf("DTB init completed\n");
ffffffffc02005a2:	00001517          	auipc	a0,0x1
ffffffffc02005a6:	64e50513          	addi	a0,a0,1614 # ffffffffc0201bf0 <etext+0x24a>
        memory_base = mem_base;
ffffffffc02005aa:	00006797          	auipc	a5,0x6
ffffffffc02005ae:	c687bb23          	sd	s0,-906(a5) # ffffffffc0206220 <memory_base>
        memory_size = mem_size;
ffffffffc02005b2:	00006797          	auipc	a5,0x6
ffffffffc02005b6:	c767bb23          	sd	s6,-906(a5) # ffffffffc0206228 <memory_size>
    cprintf("DTB init completed\n");
ffffffffc02005ba:	b3f5                	j	ffffffffc02003a6 <dtb_init+0x186>

ffffffffc02005bc <get_memory_base>:

uint64_t get_memory_base(void) {
    return memory_base;
}
ffffffffc02005bc:	00006517          	auipc	a0,0x6
ffffffffc02005c0:	c6453503          	ld	a0,-924(a0) # ffffffffc0206220 <memory_base>
ffffffffc02005c4:	8082                	ret

ffffffffc02005c6 <get_memory_size>:

uint64_t get_memory_size(void) {
    return memory_size;
ffffffffc02005c6:	00006517          	auipc	a0,0x6
ffffffffc02005ca:	c6253503          	ld	a0,-926(a0) # ffffffffc0206228 <memory_size>
ffffffffc02005ce:	8082                	ret

ffffffffc02005d0 <buddy_init>:
    while ((x & 1) == 0) { x >>= 1; ++c; }
    return c;
}

static inline void flist_init(void) {
    for (int i = 0; i <= MAX_BUDDY_ORDER; ++i) {
ffffffffc02005d0:	00006617          	auipc	a2,0x6
ffffffffc02005d4:	a4860613          	addi	a2,a2,-1464 # ffffffffc0206018 <buddy>
ffffffffc02005d8:	00006717          	auipc	a4,0x6
ffffffffc02005dc:	b9070713          	addi	a4,a4,-1136 # ffffffffc0206168 <buddy+0x150>
ffffffffc02005e0:	87b2                	mv	a5,a2
ffffffffc02005e2:	86ba                	mv	a3,a4
 * list_init - initialize a new entry
 * @elm:        new entry to be initialized
 * */
static inline void
list_init(list_entry_t *elm) {
    elm->prev = elm->next = elm;
ffffffffc02005e4:	e79c                	sd	a5,8(a5)
ffffffffc02005e6:	e39c                	sd	a5,0(a5)
        list_init(&buddy.freelist[i]);
        buddy.nblocks[i] = 0;
ffffffffc02005e8:	00073023          	sd	zero,0(a4)
    for (int i = 0; i <= MAX_BUDDY_ORDER; ++i) {
ffffffffc02005ec:	07c1                	addi	a5,a5,16
ffffffffc02005ee:	0721                	addi	a4,a4,8
ffffffffc02005f0:	fed79ae3          	bne	a5,a3,ffffffffc02005e4 <buddy_init+0x14>
}

static void buddy_init(void) {
    flist_init();
    // runtime bound: cannot exceed both MAX_BUDDY_ORDER and the physical span
    int max_by_npage = ilog2_floor(npage > 0 ? npage : 1);
ffffffffc02005f4:	00006797          	auipc	a5,0x6
ffffffffc02005f8:	c3c7b783          	ld	a5,-964(a5) # ffffffffc0206230 <npage>
ffffffffc02005fc:	e391                	bnez	a5,ffffffffc0200600 <buddy_init+0x30>
ffffffffc02005fe:	4785                	li	a5,1
ffffffffc0200600:	577d                	li	a4,-1
    while (x) { x >>= 1; ++l; }
ffffffffc0200602:	8385                	srli	a5,a5,0x1
ffffffffc0200604:	2705                	addiw	a4,a4,1
ffffffffc0200606:	fff5                	bnez	a5,ffffffffc0200602 <buddy_init+0x32>
    buddy.max_order = max_by_npage < MAX_BUDDY_ORDER ? max_by_npage : MAX_BUDDY_ORDER;
ffffffffc0200608:	46d1                	li	a3,20
ffffffffc020060a:	87ba                	mv	a5,a4
ffffffffc020060c:	00e6d363          	bge	a3,a4,ffffffffc0200612 <buddy_init+0x42>
ffffffffc0200610:	47d1                	li	a5,20
ffffffffc0200612:	1ef62c23          	sw	a5,504(a2)
}
ffffffffc0200616:	8082                	ret

ffffffffc0200618 <buddy_nr_free_pages>:
    }
}

static size_t buddy_nr_free_pages(void) {
    size_t total = 0;
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200618:	00006617          	auipc	a2,0x6
ffffffffc020061c:	bf862603          	lw	a2,-1032(a2) # ffffffffc0206210 <buddy+0x1f8>
ffffffffc0200620:	02064263          	bltz	a2,ffffffffc0200644 <buddy_nr_free_pages+0x2c>
ffffffffc0200624:	00006697          	auipc	a3,0x6
ffffffffc0200628:	b4468693          	addi	a3,a3,-1212 # ffffffffc0206168 <buddy+0x150>
ffffffffc020062c:	2605                	addiw	a2,a2,1
ffffffffc020062e:	4781                	li	a5,0
    size_t total = 0;
ffffffffc0200630:	4501                	li	a0,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200632:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200634:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200636:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc020063a:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc020063c:	953a                	add	a0,a0,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc020063e:	fec79ae3          	bne	a5,a2,ffffffffc0200632 <buddy_nr_free_pages+0x1a>
ffffffffc0200642:	8082                	ret
    size_t total = 0;
ffffffffc0200644:	4501                	li	a0,0
    }
    return total;
}
ffffffffc0200646:	8082                	ret

ffffffffc0200648 <verify_invariants>:
}

// verify free-list invariants across all orders
static void verify_invariants(void) {
    size_t counted = 0;
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200648:	00006517          	auipc	a0,0x6
ffffffffc020064c:	9d050513          	addi	a0,a0,-1584 # ffffffffc0206018 <buddy>
ffffffffc0200650:	1f852303          	lw	t1,504(a0)
ffffffffc0200654:	0c034b63          	bltz	t1,ffffffffc020072a <verify_invariants+0xe2>
static void verify_invariants(void) {
ffffffffc0200658:	1141                	addi	sp,sp,-16
ffffffffc020065a:	00006e97          	auipc	t4,0x6
ffffffffc020065e:	b0ee8e93          	addi	t4,t4,-1266 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200662:	e406                	sd	ra,8(sp)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200664:	88f6                	mv	a7,t4
ffffffffc0200666:	4801                	li	a6,0
    size_t counted = 0;
ffffffffc0200668:	4581                	li	a1,0
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc020066a:	4e05                	li	t3,1
 * list_next - get the next entry
 * @listelm:    the list head
 **/
static inline list_entry_t *
list_next(list_entry_t *listelm) {
    return listelm->next;
ffffffffc020066c:	651c                	ld	a5,8(a0)
        size_t blocks = 0;
        list_entry_t *le = &buddy.freelist[o];
        while ((le = list_next(le)) != &buddy.freelist[o]) {
ffffffffc020066e:	04f50c63          	beq	a0,a5,ffffffffc02006c6 <verify_invariants+0x7e>
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200672:	010e1633          	sll	a2,t3,a6
        size_t blocks = 0;
ffffffffc0200676:	4681                	li	a3,0
            struct Page *p = le2page(le, page_link);
            assert(PageProperty(p));
ffffffffc0200678:	ff07b703          	ld	a4,-16(a5)
ffffffffc020067c:	8b09                	andi	a4,a4,2
ffffffffc020067e:	c731                	beqz	a4,ffffffffc02006ca <verify_invariants+0x82>
            assert(p->property == order_size(o));
ffffffffc0200680:	ff87e703          	lwu	a4,-8(a5)
ffffffffc0200684:	06c71363          	bne	a4,a2,ffffffffc02006ea <verify_invariants+0xa2>
ffffffffc0200688:	679c                	ld	a5,8(a5)
            blocks += 1;
ffffffffc020068a:	0685                	addi	a3,a3,1
            counted += order_size(o);
ffffffffc020068c:	95b2                	add	a1,a1,a2
        while ((le = list_next(le)) != &buddy.freelist[o]) {
ffffffffc020068e:	fea795e3          	bne	a5,a0,ffffffffc0200678 <verify_invariants+0x30>
        }
        assert(blocks == buddy.nblocks[o]);
ffffffffc0200692:	0008b783          	ld	a5,0(a7)
ffffffffc0200696:	06d79a63          	bne	a5,a3,ffffffffc020070a <verify_invariants+0xc2>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc020069a:	2805                	addiw	a6,a6,1
ffffffffc020069c:	0541                	addi	a0,a0,16
ffffffffc020069e:	08a1                	addi	a7,a7,8
ffffffffc02006a0:	fd0356e3          	bge	t1,a6,ffffffffc020066c <verify_invariants+0x24>
ffffffffc02006a4:	2305                	addiw	t1,t1,1
ffffffffc02006a6:	4681                	li	a3,0
ffffffffc02006a8:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc02006aa:	000eb703          	ld	a4,0(t4)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02006ae:	0ea1                	addi	t4,t4,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc02006b0:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02006b4:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc02006b6:	96ba                	add	a3,a3,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02006b8:	fe6799e3          	bne	a5,t1,ffffffffc02006aa <verify_invariants+0x62>
    }
    assert(counted == buddy_nr_free_pages());
ffffffffc02006bc:	06b69863          	bne	a3,a1,ffffffffc020072c <verify_invariants+0xe4>
}
ffffffffc02006c0:	60a2                	ld	ra,8(sp)
ffffffffc02006c2:	0141                	addi	sp,sp,16
ffffffffc02006c4:	8082                	ret
        size_t blocks = 0;
ffffffffc02006c6:	4681                	li	a3,0
ffffffffc02006c8:	b7e9                	j	ffffffffc0200692 <verify_invariants+0x4a>
            assert(PageProperty(p));
ffffffffc02006ca:	00001697          	auipc	a3,0x1
ffffffffc02006ce:	53e68693          	addi	a3,a3,1342 # ffffffffc0201c08 <etext+0x262>
ffffffffc02006d2:	00001617          	auipc	a2,0x1
ffffffffc02006d6:	54660613          	addi	a2,a2,1350 # ffffffffc0201c18 <etext+0x272>
ffffffffc02006da:	0f800593          	li	a1,248
ffffffffc02006de:	00001517          	auipc	a0,0x1
ffffffffc02006e2:	55250513          	addi	a0,a0,1362 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02006e6:	addff0ef          	jal	ra,ffffffffc02001c2 <__panic>
            assert(p->property == order_size(o));
ffffffffc02006ea:	00001697          	auipc	a3,0x1
ffffffffc02006ee:	55e68693          	addi	a3,a3,1374 # ffffffffc0201c48 <etext+0x2a2>
ffffffffc02006f2:	00001617          	auipc	a2,0x1
ffffffffc02006f6:	52660613          	addi	a2,a2,1318 # ffffffffc0201c18 <etext+0x272>
ffffffffc02006fa:	0f900593          	li	a1,249
ffffffffc02006fe:	00001517          	auipc	a0,0x1
ffffffffc0200702:	53250513          	addi	a0,a0,1330 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200706:	abdff0ef          	jal	ra,ffffffffc02001c2 <__panic>
        assert(blocks == buddy.nblocks[o]);
ffffffffc020070a:	00001697          	auipc	a3,0x1
ffffffffc020070e:	55e68693          	addi	a3,a3,1374 # ffffffffc0201c68 <etext+0x2c2>
ffffffffc0200712:	00001617          	auipc	a2,0x1
ffffffffc0200716:	50660613          	addi	a2,a2,1286 # ffffffffc0201c18 <etext+0x272>
ffffffffc020071a:	0fd00593          	li	a1,253
ffffffffc020071e:	00001517          	auipc	a0,0x1
ffffffffc0200722:	51250513          	addi	a0,a0,1298 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200726:	a9dff0ef          	jal	ra,ffffffffc02001c2 <__panic>
ffffffffc020072a:	8082                	ret
    assert(counted == buddy_nr_free_pages());
ffffffffc020072c:	00001697          	auipc	a3,0x1
ffffffffc0200730:	55c68693          	addi	a3,a3,1372 # ffffffffc0201c88 <etext+0x2e2>
ffffffffc0200734:	00001617          	auipc	a2,0x1
ffffffffc0200738:	4e460613          	addi	a2,a2,1252 # ffffffffc0201c18 <etext+0x272>
ffffffffc020073c:	0ff00593          	li	a1,255
ffffffffc0200740:	00001517          	auipc	a0,0x1
ffffffffc0200744:	4f050513          	addi	a0,a0,1264 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200748:	a7bff0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc020074c <dump_buddy_state>:
static void dump_buddy_state(const char *tag) {
ffffffffc020074c:	7179                	addi	sp,sp,-48
ffffffffc020074e:	e84a                	sd	s2,16(sp)
    cprintf("[buddy] %s: max_order=%d total_free=%lu pages\n", tag, buddy.max_order, (unsigned long)buddy_nr_free_pages());
ffffffffc0200750:	00006917          	auipc	s2,0x6
ffffffffc0200754:	8c890913          	addi	s2,s2,-1848 # ffffffffc0206018 <buddy>
ffffffffc0200758:	1f892603          	lw	a2,504(s2)
static void dump_buddy_state(const char *tag) {
ffffffffc020075c:	f406                	sd	ra,40(sp)
ffffffffc020075e:	f022                	sd	s0,32(sp)
ffffffffc0200760:	ec26                	sd	s1,24(sp)
ffffffffc0200762:	e44e                	sd	s3,8(sp)
ffffffffc0200764:	85aa                	mv	a1,a0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200766:	08064163          	bltz	a2,ffffffffc02007e8 <dump_buddy_state+0x9c>
ffffffffc020076a:	00006817          	auipc	a6,0x6
ffffffffc020076e:	9fe80813          	addi	a6,a6,-1538 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200772:	0016089b          	addiw	a7,a2,1
    size_t total = 0;
ffffffffc0200776:	4681                	li	a3,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200778:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc020077a:	00083703          	ld	a4,0(a6)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc020077e:	0821                	addi	a6,a6,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200780:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200784:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200786:	96ba                	add	a3,a3,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200788:	ff1799e3          	bne	a5,a7,ffffffffc020077a <dump_buddy_state+0x2e>
    cprintf("[buddy] %s: max_order=%d total_free=%lu pages\n", tag, buddy.max_order, (unsigned long)buddy_nr_free_pages());
ffffffffc020078c:	00001517          	auipc	a0,0x1
ffffffffc0200790:	52450513          	addi	a0,a0,1316 # ffffffffc0201cb0 <etext+0x30a>
ffffffffc0200794:	9b9ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200798:	1f892783          	lw	a5,504(s2)
ffffffffc020079c:	0207cf63          	bltz	a5,ffffffffc02007da <dump_buddy_state+0x8e>
ffffffffc02007a0:	00006497          	auipc	s1,0x6
ffffffffc02007a4:	9c848493          	addi	s1,s1,-1592 # ffffffffc0206168 <buddy+0x150>
ffffffffc02007a8:	4401                	li	s0,0
            cprintf("  order %2d: blocks=%lu pages=%lu\n", o, (unsigned long)cnt, (unsigned long)(cnt * order_size(o)));
ffffffffc02007aa:	00001997          	auipc	s3,0x1
ffffffffc02007ae:	53698993          	addi	s3,s3,1334 # ffffffffc0201ce0 <etext+0x33a>
ffffffffc02007b2:	a031                	j	ffffffffc02007be <dump_buddy_state+0x72>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02007b4:	1f892783          	lw	a5,504(s2)
ffffffffc02007b8:	2405                	addiw	s0,s0,1
ffffffffc02007ba:	0287c063          	blt	a5,s0,ffffffffc02007da <dump_buddy_state+0x8e>
        size_t cnt = buddy.nblocks[o];
ffffffffc02007be:	6090                	ld	a2,0(s1)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02007c0:	04a1                	addi	s1,s1,8
        if (cnt != 0) {
ffffffffc02007c2:	da6d                	beqz	a2,ffffffffc02007b4 <dump_buddy_state+0x68>
            cprintf("  order %2d: blocks=%lu pages=%lu\n", o, (unsigned long)cnt, (unsigned long)(cnt * order_size(o)));
ffffffffc02007c4:	008616b3          	sll	a3,a2,s0
ffffffffc02007c8:	85a2                	mv	a1,s0
ffffffffc02007ca:	854e                	mv	a0,s3
ffffffffc02007cc:	981ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02007d0:	1f892783          	lw	a5,504(s2)
ffffffffc02007d4:	2405                	addiw	s0,s0,1
ffffffffc02007d6:	fe87d4e3          	bge	a5,s0,ffffffffc02007be <dump_buddy_state+0x72>
}
ffffffffc02007da:	70a2                	ld	ra,40(sp)
ffffffffc02007dc:	7402                	ld	s0,32(sp)
ffffffffc02007de:	64e2                	ld	s1,24(sp)
ffffffffc02007e0:	6942                	ld	s2,16(sp)
ffffffffc02007e2:	69a2                	ld	s3,8(sp)
ffffffffc02007e4:	6145                	addi	sp,sp,48
ffffffffc02007e6:	8082                	ret
    size_t total = 0;
ffffffffc02007e8:	4681                	li	a3,0
ffffffffc02007ea:	b74d                	j	ffffffffc020078c <dump_buddy_state+0x40>

ffffffffc02007ec <buddy_free_pages.part.0>:
    for (; p != base + n; ++p) {
ffffffffc02007ec:	00259793          	slli	a5,a1,0x2
ffffffffc02007f0:	97ae                	add	a5,a5,a1
static void buddy_free_pages(struct Page *base, size_t n) {
ffffffffc02007f2:	7179                	addi	sp,sp,-48
    for (; p != base + n; ++p) {
ffffffffc02007f4:	078e                	slli	a5,a5,0x3
ffffffffc02007f6:	00f506b3          	add	a3,a0,a5
static void buddy_free_pages(struct Page *base, size_t n) {
ffffffffc02007fa:	f406                	sd	ra,40(sp)
ffffffffc02007fc:	f022                	sd	s0,32(sp)
ffffffffc02007fe:	ec26                	sd	s1,24(sp)
ffffffffc0200800:	e84a                	sd	s2,16(sp)
ffffffffc0200802:	e44e                	sd	s3,8(sp)
ffffffffc0200804:	e052                	sd	s4,0(sp)
ffffffffc0200806:	87aa                	mv	a5,a0
    for (; p != base + n; ++p) {
ffffffffc0200808:	00d50e63          	beq	a0,a3,ffffffffc0200824 <buddy_free_pages.part.0+0x38>
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc020080c:	6798                	ld	a4,8(a5)
ffffffffc020080e:	8b0d                	andi	a4,a4,3
ffffffffc0200810:	16071263          	bnez	a4,ffffffffc0200974 <buddy_free_pages.part.0+0x188>
        p->flags = 0;
ffffffffc0200814:	0007b423          	sd	zero,8(a5)



static inline int page_ref(struct Page *page) { return page->ref; }

static inline void set_page_ref(struct Page *page, int val) { page->ref = val; }
ffffffffc0200818:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; ++p) {
ffffffffc020081c:	02878793          	addi	a5,a5,40
ffffffffc0200820:	fed796e3          	bne	a5,a3,ffffffffc020080c <buddy_free_pages.part.0+0x20>
    while (remain > 0) {
ffffffffc0200824:	10058763          	beqz	a1,ffffffffc0200932 <buddy_free_pages.part.0+0x146>
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200828:	00005e97          	auipc	t4,0x5
ffffffffc020082c:	7f0e8e93          	addi	t4,t4,2032 # ffffffffc0206018 <buddy>
ffffffffc0200830:	1f8ea603          	lw	a2,504(t4)
    return (size_t)(p - pages + nbase);
ffffffffc0200834:	00006e17          	auipc	t3,0x6
ffffffffc0200838:	a04e3e03          	ld	t3,-1532(t3) # ffffffffc0206238 <pages>
ffffffffc020083c:	00002317          	auipc	t1,0x2
ffffffffc0200840:	b4433303          	ld	t1,-1212(t1) # ffffffffc0202380 <nbase>
ffffffffc0200844:	00002897          	auipc	a7,0x2
ffffffffc0200848:	b348b883          	ld	a7,-1228(a7) # ffffffffc0202378 <error_string+0x38>
ffffffffc020084c:	8fb2                	mv	t6,a2
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc020084e:	4805                	li	a6,1
        cur += order_size(ord);
ffffffffc0200850:	02800f13          	li	t5,40
    return (size_t)(p - pages + nbase);
ffffffffc0200854:	41c507b3          	sub	a5,a0,t3
ffffffffc0200858:	878d                	srai	a5,a5,0x3
ffffffffc020085a:	031787b3          	mul	a5,a5,a7
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc020085e:	86b2                	mv	a3,a2
    return (size_t)(p - pages + nbase);
ffffffffc0200860:	979a                	add	a5,a5,t1
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200862:	cb91                	beqz	a5,ffffffffc0200876 <buddy_free_pages.part.0+0x8a>
    while ((x & 1) == 0) { x >>= 1; ++c; }
ffffffffc0200864:	0017f713          	andi	a4,a5,1
    int c = 0;
ffffffffc0200868:	4681                	li	a3,0
    while ((x & 1) == 0) { x >>= 1; ++c; }
ffffffffc020086a:	e711                	bnez	a4,ffffffffc0200876 <buddy_free_pages.part.0+0x8a>
ffffffffc020086c:	8385                	srli	a5,a5,0x1
ffffffffc020086e:	0017f713          	andi	a4,a5,1
ffffffffc0200872:	2685                	addiw	a3,a3,1
ffffffffc0200874:	df65                	beqz	a4,ffffffffc020086c <buddy_free_pages.part.0+0x80>
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200876:	87ae                	mv	a5,a1
    int l = -1;
ffffffffc0200878:	577d                	li	a4,-1
    while (x) { x >>= 1; ++l; }
ffffffffc020087a:	8385                	srli	a5,a5,0x1
ffffffffc020087c:	2705                	addiw	a4,a4,1
ffffffffc020087e:	fff5                	bnez	a5,ffffffffc020087a <buddy_free_pages.part.0+0x8e>
        if (ord > buddy.max_order) ord = buddy.max_order;
ffffffffc0200880:	000f839b          	sext.w	t2,t6
ffffffffc0200884:	00c6d463          	bge	a3,a2,ffffffffc020088c <buddy_free_pages.part.0+0xa0>
ffffffffc0200888:	0006839b          	sext.w	t2,a3
ffffffffc020088c:	0003879b          	sext.w	a5,t2
ffffffffc0200890:	00f75463          	bge	a4,a5,ffffffffc0200898 <buddy_free_pages.part.0+0xac>
ffffffffc0200894:	0007039b          	sext.w	t2,a4
        int co_ord = ord;
ffffffffc0200898:	02a38413          	addi	s0,t2,42
ffffffffc020089c:	00439293          	slli	t0,t2,0x4
ffffffffc02008a0:	040e                	slli	s0,s0,0x3
ffffffffc02008a2:	92f6                	add	t0,t0,t4
ffffffffc02008a4:	9476                	add	s0,s0,t4
ffffffffc02008a6:	849e                	mv	s1,t2
    while (x) { x >>= 1; ++l; }
ffffffffc02008a8:	892a                	mv	s2,a0
    return (size_t)(p - pages + nbase);
ffffffffc02008aa:	41c907b3          	sub	a5,s2,t3
ffffffffc02008ae:	878d                	srai	a5,a5,0x3
ffffffffc02008b0:	031787b3          	mul	a5,a5,a7
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc02008b4:	009819b3          	sll	s3,a6,s1
    return (size_t)(p - pages + nbase);
ffffffffc02008b8:	979a                	add	a5,a5,t1
            size_t buddy_idx = blk_idx ^ order_size(co_ord);
ffffffffc02008ba:	0137c733          	xor	a4,a5,s3
            struct Page *buddy_blk = blk + (buddy_idx - blk_idx);
ffffffffc02008be:	40f707b3          	sub	a5,a4,a5
ffffffffc02008c2:	00279713          	slli	a4,a5,0x2
ffffffffc02008c6:	973e                	add	a4,a4,a5
ffffffffc02008c8:	070e                	slli	a4,a4,0x3
ffffffffc02008ca:	974a                	add	a4,a4,s2
            if (PageProperty(buddy_blk) && buddy_blk->property == order_size(co_ord)) {
ffffffffc02008cc:	671c                	ld	a5,8(a4)
ffffffffc02008ce:	8b89                	andi	a5,a5,2
ffffffffc02008d0:	cf91                	beqz	a5,ffffffffc02008ec <buddy_free_pages.part.0+0x100>
ffffffffc02008d2:	01076783          	lwu	a5,16(a4)
ffffffffc02008d6:	00f99b63          	bne	s3,a5,ffffffffc02008ec <buddy_free_pages.part.0+0x100>
    list_entry_t *le = &buddy.freelist[order];
ffffffffc02008da:	8796                	mv	a5,t0
ffffffffc02008dc:	a029                	j	ffffffffc02008e6 <buddy_free_pages.part.0+0xfa>
        struct Page *p = le2page(le, page_link);
ffffffffc02008de:	fe878693          	addi	a3,a5,-24
        if (p == target) {
ffffffffc02008e2:	06d70063          	beq	a4,a3,ffffffffc0200942 <buddy_free_pages.part.0+0x156>
ffffffffc02008e6:	679c                	ld	a5,8(a5)
    while ((le = list_next(le)) != &buddy.freelist[order]) {
ffffffffc02008e8:	fe579be3          	bne	a5,t0,ffffffffc02008de <buddy_free_pages.part.0+0xf2>
    SetPageProperty(head);
ffffffffc02008ec:	00893683          	ld	a3,8(s2)
    __list_add(elm, listelm, listelm->next);
ffffffffc02008f0:	00449713          	slli	a4,s1,0x4
ffffffffc02008f4:	9776                	add	a4,a4,t4
    buddy.nblocks[order] += 1;
ffffffffc02008f6:	02a48793          	addi	a5,s1,42
ffffffffc02008fa:	6700                	ld	s0,8(a4)
ffffffffc02008fc:	078e                	slli	a5,a5,0x3
ffffffffc02008fe:	97f6                	add	a5,a5,t4
    SetPageProperty(head);
ffffffffc0200900:	0026e693          	ori	a3,a3,2
ffffffffc0200904:	00d93423          	sd	a3,8(s2)
    head->property = order_size(order); // store block size in pages for readability
ffffffffc0200908:	01392823          	sw	s3,16(s2)
    buddy.nblocks[order] += 1;
ffffffffc020090c:	6394                	ld	a3,0(a5)
    list_add(&buddy.freelist[order], &(head->page_link));
ffffffffc020090e:	01890493          	addi	s1,s2,24
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_add(list_entry_t *elm, list_entry_t *prev, list_entry_t *next) {
    prev->next = next->prev = elm;
ffffffffc0200912:	e004                	sd	s1,0(s0)
ffffffffc0200914:	e704                	sd	s1,8(a4)
    elm->next = next;
ffffffffc0200916:	02893023          	sd	s0,32(s2)
    elm->prev = prev;
ffffffffc020091a:	00593c23          	sd	t0,24(s2)
    buddy.nblocks[order] += 1;
ffffffffc020091e:	00168713          	addi	a4,a3,1
ffffffffc0200922:	e398                	sd	a4,0(a5)
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200924:	007817b3          	sll	a5,a6,t2
        remain -= order_size(ord);
ffffffffc0200928:	8d9d                	sub	a1,a1,a5
        cur += order_size(ord);
ffffffffc020092a:	007f13b3          	sll	t2,t5,t2
ffffffffc020092e:	951e                	add	a0,a0,t2
    while (remain > 0) {
ffffffffc0200930:	f195                	bnez	a1,ffffffffc0200854 <buddy_free_pages.part.0+0x68>
}
ffffffffc0200932:	70a2                	ld	ra,40(sp)
ffffffffc0200934:	7402                	ld	s0,32(sp)
ffffffffc0200936:	64e2                	ld	s1,24(sp)
ffffffffc0200938:	6942                	ld	s2,16(sp)
ffffffffc020093a:	69a2                	ld	s3,8(sp)
ffffffffc020093c:	6a02                	ld	s4,0(sp)
ffffffffc020093e:	6145                	addi	sp,sp,48
ffffffffc0200940:	8082                	ret
    __list_del(listelm->prev, listelm->next);
ffffffffc0200942:	0007ba03          	ld	s4,0(a5)
ffffffffc0200946:	0087b983          	ld	s3,8(a5)
    buddy.nblocks[order] -= 1;
ffffffffc020094a:	6014                	ld	a3,0(s0)
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 * */
static inline void
__list_del(list_entry_t *prev, list_entry_t *next) {
    prev->next = next;
ffffffffc020094c:	013a3423          	sd	s3,8(s4)
    next->prev = prev;
ffffffffc0200950:	0149b023          	sd	s4,0(s3)
ffffffffc0200954:	16fd                	addi	a3,a3,-1
ffffffffc0200956:	e014                	sd	a3,0(s0)
            ClearPageProperty(p);
ffffffffc0200958:	ff07b683          	ld	a3,-16(a5)
ffffffffc020095c:	9af5                	andi	a3,a3,-3
ffffffffc020095e:	fed7b823          	sd	a3,-16(a5)
                    if (buddy_blk < blk) blk = buddy_blk;
ffffffffc0200962:	01277363          	bgeu	a4,s2,ffffffffc0200968 <buddy_free_pages.part.0+0x17c>
ffffffffc0200966:	893a                	mv	s2,a4
                    co_ord += 1;
ffffffffc0200968:	2485                	addiw	s1,s1,1
                    if (co_ord > buddy.max_order) {
ffffffffc020096a:	02c1                	addi	t0,t0,16
ffffffffc020096c:	0421                	addi	s0,s0,8
ffffffffc020096e:	fa964be3          	blt	a2,s1,ffffffffc0200924 <buddy_free_pages.part.0+0x138>
ffffffffc0200972:	bf25                	j	ffffffffc02008aa <buddy_free_pages.part.0+0xbe>
        assert(!PageReserved(p) && !PageProperty(p));
ffffffffc0200974:	00001697          	auipc	a3,0x1
ffffffffc0200978:	39468693          	addi	a3,a3,916 # ffffffffc0201d08 <etext+0x362>
ffffffffc020097c:	00001617          	auipc	a2,0x1
ffffffffc0200980:	29c60613          	addi	a2,a2,668 # ffffffffc0201c18 <etext+0x272>
ffffffffc0200984:	0a700593          	li	a1,167
ffffffffc0200988:	00001517          	auipc	a0,0x1
ffffffffc020098c:	2a850513          	addi	a0,a0,680 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200990:	833ff0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc0200994 <buddy_free_pages>:
    assert(n > 0);
ffffffffc0200994:	c191                	beqz	a1,ffffffffc0200998 <buddy_free_pages+0x4>
ffffffffc0200996:	bd99                	j	ffffffffc02007ec <buddy_free_pages.part.0>
static void buddy_free_pages(struct Page *base, size_t n) {
ffffffffc0200998:	1141                	addi	sp,sp,-16
    assert(n > 0);
ffffffffc020099a:	00001697          	auipc	a3,0x1
ffffffffc020099e:	39668693          	addi	a3,a3,918 # ffffffffc0201d30 <etext+0x38a>
ffffffffc02009a2:	00001617          	auipc	a2,0x1
ffffffffc02009a6:	27660613          	addi	a2,a2,630 # ffffffffc0201c18 <etext+0x272>
ffffffffc02009aa:	0a300593          	li	a1,163
ffffffffc02009ae:	00001517          	auipc	a0,0x1
ffffffffc02009b2:	28250513          	addi	a0,a0,642 # ffffffffc0201c30 <etext+0x28a>
static void buddy_free_pages(struct Page *base, size_t n) {
ffffffffc02009b6:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc02009b8:	80bff0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc02009bc <buddy_init_memmap>:
static void buddy_init_memmap(struct Page *base, size_t n) {
ffffffffc02009bc:	1101                	addi	sp,sp,-32
ffffffffc02009be:	ec06                	sd	ra,24(sp)
ffffffffc02009c0:	e822                	sd	s0,16(sp)
ffffffffc02009c2:	e426                	sd	s1,8(sp)
ffffffffc02009c4:	87ae                	mv	a5,a1
ffffffffc02009c6:	577d                	li	a4,-1
    assert(n > 0);
ffffffffc02009c8:	14058063          	beqz	a1,ffffffffc0200b08 <buddy_init_memmap+0x14c>
    while (x) { x >>= 1; ++l; }
ffffffffc02009cc:	8385                	srli	a5,a5,0x1
ffffffffc02009ce:	2705                	addiw	a4,a4,1
ffffffffc02009d0:	fff5                	bnez	a5,ffffffffc02009cc <buddy_init_memmap+0x10>
    int new_max = max_by_n < MAX_BUDDY_ORDER ? max_by_n : MAX_BUDDY_ORDER;
ffffffffc02009d2:	46d1                	li	a3,20
ffffffffc02009d4:	87ba                	mv	a5,a4
ffffffffc02009d6:	0ee6cd63          	blt	a3,a4,ffffffffc0200ad0 <buddy_init_memmap+0x114>
    if (new_max > buddy.max_order) buddy.max_order = new_max;
ffffffffc02009da:	00005817          	auipc	a6,0x5
ffffffffc02009de:	63e80813          	addi	a6,a6,1598 # ffffffffc0206018 <buddy>
ffffffffc02009e2:	1f882683          	lw	a3,504(a6)
    int new_max = max_by_n < MAX_BUDDY_ORDER ? max_by_n : MAX_BUDDY_ORDER;
ffffffffc02009e6:	0007871b          	sext.w	a4,a5
    if (new_max > buddy.max_order) buddy.max_order = new_max;
ffffffffc02009ea:	0ee6c063          	blt	a3,a4,ffffffffc0200aca <buddy_init_memmap+0x10e>
    for (; p != base + n; ++p) {
ffffffffc02009ee:	00259693          	slli	a3,a1,0x2
ffffffffc02009f2:	96ae                	add	a3,a3,a1
ffffffffc02009f4:	068e                	slli	a3,a3,0x3
ffffffffc02009f6:	96aa                	add	a3,a3,a0
ffffffffc02009f8:	87aa                	mv	a5,a0
ffffffffc02009fa:	00d50f63          	beq	a0,a3,ffffffffc0200a18 <buddy_init_memmap+0x5c>
        assert(PageReserved(p));
ffffffffc02009fe:	6798                	ld	a4,8(a5)
ffffffffc0200a00:	8b05                	andi	a4,a4,1
ffffffffc0200a02:	c37d                	beqz	a4,ffffffffc0200ae8 <buddy_init_memmap+0x12c>
        p->flags = 0;
ffffffffc0200a04:	0007b423          	sd	zero,8(a5)
        p->property = 0;
ffffffffc0200a08:	0007a823          	sw	zero,16(a5)
ffffffffc0200a0c:	0007a023          	sw	zero,0(a5)
    for (; p != base + n; ++p) {
ffffffffc0200a10:	02878793          	addi	a5,a5,40
ffffffffc0200a14:	fed795e3          	bne	a5,a3,ffffffffc02009fe <buddy_init_memmap+0x42>
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200a18:	1f882883          	lw	a7,504(a6)
    return (size_t)(p - pages + nbase);
ffffffffc0200a1c:	00006297          	auipc	t0,0x6
ffffffffc0200a20:	81c2b283          	ld	t0,-2020(t0) # ffffffffc0206238 <pages>
ffffffffc0200a24:	00002f97          	auipc	t6,0x2
ffffffffc0200a28:	95cfbf83          	ld	t6,-1700(t6) # ffffffffc0202380 <nbase>
ffffffffc0200a2c:	00002f17          	auipc	t5,0x2
ffffffffc0200a30:	94cf3f03          	ld	t5,-1716(t5) # ffffffffc0202378 <error_string+0x38>
ffffffffc0200a34:	8ec6                	mv	t4,a7
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200a36:	4e05                	li	t3,1
        cur += order_size(ord);
ffffffffc0200a38:	02800313          	li	t1,40
    return (size_t)(p - pages + nbase);
ffffffffc0200a3c:	405507b3          	sub	a5,a0,t0
ffffffffc0200a40:	878d                	srai	a5,a5,0x3
ffffffffc0200a42:	03e787b3          	mul	a5,a5,t5
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200a46:	86c6                	mv	a3,a7
    return (size_t)(p - pages + nbase);
ffffffffc0200a48:	97fe                	add	a5,a5,t6
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200a4a:	cb91                	beqz	a5,ffffffffc0200a5e <buddy_init_memmap+0xa2>
    while ((x & 1) == 0) { x >>= 1; ++c; }
ffffffffc0200a4c:	0017f713          	andi	a4,a5,1
    int c = 0;
ffffffffc0200a50:	4681                	li	a3,0
    while ((x & 1) == 0) { x >>= 1; ++c; }
ffffffffc0200a52:	e711                	bnez	a4,ffffffffc0200a5e <buddy_init_memmap+0xa2>
ffffffffc0200a54:	8385                	srli	a5,a5,0x1
ffffffffc0200a56:	0017f713          	andi	a4,a5,1
ffffffffc0200a5a:	2685                	addiw	a3,a3,1
ffffffffc0200a5c:	df65                	beqz	a4,ffffffffc0200a54 <buddy_init_memmap+0x98>
    if (x == 0) return buddy.max_order; // treat as fully aligned (won't usually happen for DRAM base)
ffffffffc0200a5e:	87ae                	mv	a5,a1
    int l = -1;
ffffffffc0200a60:	577d                	li	a4,-1
    while (x) { x >>= 1; ++l; }
ffffffffc0200a62:	8385                	srli	a5,a5,0x1
ffffffffc0200a64:	2705                	addiw	a4,a4,1
ffffffffc0200a66:	fff5                	bnez	a5,ffffffffc0200a62 <buddy_init_memmap+0xa6>
        if (ord > buddy.max_order) ord = buddy.max_order;
ffffffffc0200a68:	87f6                	mv	a5,t4
ffffffffc0200a6a:	0116d363          	bge	a3,a7,ffffffffc0200a70 <buddy_init_memmap+0xb4>
ffffffffc0200a6e:	87b6                	mv	a5,a3
ffffffffc0200a70:	0007869b          	sext.w	a3,a5
ffffffffc0200a74:	00d75363          	bge	a4,a3,ffffffffc0200a7a <buddy_init_memmap+0xbe>
ffffffffc0200a78:	87ba                	mv	a5,a4
ffffffffc0200a7a:	0007869b          	sext.w	a3,a5
    SetPageProperty(head);
ffffffffc0200a7e:	00853383          	ld	t2,8(a0)
    __list_add(elm, listelm, listelm->next);
ffffffffc0200a82:	00469613          	slli	a2,a3,0x4
ffffffffc0200a86:	9642                	add	a2,a2,a6
    buddy.nblocks[order] += 1;
ffffffffc0200a88:	02a68713          	addi	a4,a3,42
ffffffffc0200a8c:	6600                	ld	s0,8(a2)
ffffffffc0200a8e:	070e                	slli	a4,a4,0x3
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200a90:	00fe17b3          	sll	a5,t3,a5
    buddy.nblocks[order] += 1;
ffffffffc0200a94:	9742                	add	a4,a4,a6
    SetPageProperty(head);
ffffffffc0200a96:	0023e393          	ori	t2,t2,2
ffffffffc0200a9a:	00753423          	sd	t2,8(a0)
    head->property = order_size(order); // store block size in pages for readability
ffffffffc0200a9e:	c91c                	sw	a5,16(a0)
    buddy.nblocks[order] += 1;
ffffffffc0200aa0:	00073383          	ld	t2,0(a4)
    list_add(&buddy.freelist[order], &(head->page_link));
ffffffffc0200aa4:	01850493          	addi	s1,a0,24
    prev->next = next->prev = elm;
ffffffffc0200aa8:	e004                	sd	s1,0(s0)
ffffffffc0200aaa:	e604                	sd	s1,8(a2)
    elm->prev = prev;
ffffffffc0200aac:	ed10                	sd	a2,24(a0)
    elm->next = next;
ffffffffc0200aae:	f100                	sd	s0,32(a0)
    buddy.nblocks[order] += 1;
ffffffffc0200ab0:	00138613          	addi	a2,t2,1
        cur += order_size(ord);
ffffffffc0200ab4:	00d316b3          	sll	a3,t1,a3
    buddy.nblocks[order] += 1;
ffffffffc0200ab8:	e310                	sd	a2,0(a4)
        remain -= order_size(ord);
ffffffffc0200aba:	8d9d                	sub	a1,a1,a5
        cur += order_size(ord);
ffffffffc0200abc:	9536                	add	a0,a0,a3
    while (remain > 0) {
ffffffffc0200abe:	fdbd                	bnez	a1,ffffffffc0200a3c <buddy_init_memmap+0x80>
}
ffffffffc0200ac0:	60e2                	ld	ra,24(sp)
ffffffffc0200ac2:	6442                	ld	s0,16(sp)
ffffffffc0200ac4:	64a2                	ld	s1,8(sp)
ffffffffc0200ac6:	6105                	addi	sp,sp,32
ffffffffc0200ac8:	8082                	ret
    if (new_max > buddy.max_order) buddy.max_order = new_max;
ffffffffc0200aca:	1ef82c23          	sw	a5,504(a6)
ffffffffc0200ace:	b705                	j	ffffffffc02009ee <buddy_init_memmap+0x32>
ffffffffc0200ad0:	00005817          	auipc	a6,0x5
ffffffffc0200ad4:	54880813          	addi	a6,a6,1352 # ffffffffc0206018 <buddy>
ffffffffc0200ad8:	1f882683          	lw	a3,504(a6)
    int new_max = max_by_n < MAX_BUDDY_ORDER ? max_by_n : MAX_BUDDY_ORDER;
ffffffffc0200adc:	47d1                	li	a5,20
ffffffffc0200ade:	0007871b          	sext.w	a4,a5
    if (new_max > buddy.max_order) buddy.max_order = new_max;
ffffffffc0200ae2:	f0e6d6e3          	bge	a3,a4,ffffffffc02009ee <buddy_init_memmap+0x32>
ffffffffc0200ae6:	b7d5                	j	ffffffffc0200aca <buddy_init_memmap+0x10e>
        assert(PageReserved(p));
ffffffffc0200ae8:	00001697          	auipc	a3,0x1
ffffffffc0200aec:	25068693          	addi	a3,a3,592 # ffffffffc0201d38 <etext+0x392>
ffffffffc0200af0:	00001617          	auipc	a2,0x1
ffffffffc0200af4:	12860613          	addi	a2,a2,296 # ffffffffc0201c18 <etext+0x272>
ffffffffc0200af8:	07100593          	li	a1,113
ffffffffc0200afc:	00001517          	auipc	a0,0x1
ffffffffc0200b00:	13450513          	addi	a0,a0,308 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200b04:	ebeff0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(n > 0);
ffffffffc0200b08:	00001697          	auipc	a3,0x1
ffffffffc0200b0c:	22868693          	addi	a3,a3,552 # ffffffffc0201d30 <etext+0x38a>
ffffffffc0200b10:	00001617          	auipc	a2,0x1
ffffffffc0200b14:	10860613          	addi	a2,a2,264 # ffffffffc0201c18 <etext+0x272>
ffffffffc0200b18:	06900593          	li	a1,105
ffffffffc0200b1c:	00001517          	auipc	a0,0x1
ffffffffc0200b20:	11450513          	addi	a0,a0,276 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0200b24:	e9eff0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc0200b28 <buddy_alloc_pages>:
    assert(n > 0);
ffffffffc0200b28:	c569                	beqz	a0,ffffffffc0200bf2 <buddy_alloc_pages+0xca>
    if (x <= 1) return (x == 0) ? 0 : 0;
ffffffffc0200b2a:	4785                	li	a5,1
ffffffffc0200b2c:	4881                	li	a7,0
ffffffffc0200b2e:	00f50963          	beq	a0,a5,ffffffffc0200b40 <buddy_alloc_pages+0x18>
    int f = ilog2_floor(x - 1);
ffffffffc0200b32:	157d                	addi	a0,a0,-1
    int l = -1;
ffffffffc0200b34:	57fd                	li	a5,-1
    while (x) { x >>= 1; ++l; }
ffffffffc0200b36:	8105                	srli	a0,a0,0x1
ffffffffc0200b38:	88be                	mv	a7,a5
ffffffffc0200b3a:	2785                	addiw	a5,a5,1
ffffffffc0200b3c:	fd6d                	bnez	a0,ffffffffc0200b36 <buddy_alloc_pages+0xe>
    return f + 1;
ffffffffc0200b3e:	2889                	addiw	a7,a7,2
    if (need_ord > buddy.max_order) return NULL;
ffffffffc0200b40:	00005597          	auipc	a1,0x5
ffffffffc0200b44:	4d858593          	addi	a1,a1,1240 # ffffffffc0206018 <buddy>
ffffffffc0200b48:	1f85a683          	lw	a3,504(a1)
ffffffffc0200b4c:	0116ce63          	blt	a3,a7,ffffffffc0200b68 <buddy_alloc_pages+0x40>
ffffffffc0200b50:	00489713          	slli	a4,a7,0x4
ffffffffc0200b54:	972e                	add	a4,a4,a1
ffffffffc0200b56:	87c6                	mv	a5,a7
    return list->next == list;
ffffffffc0200b58:	00873803          	ld	a6,8(a4)
    while (o <= buddy.max_order && list_empty(&buddy.freelist[o])) {
ffffffffc0200b5c:	00e81863          	bne	a6,a4,ffffffffc0200b6c <buddy_alloc_pages+0x44>
        ++o;
ffffffffc0200b60:	2785                	addiw	a5,a5,1
    while (o <= buddy.max_order && list_empty(&buddy.freelist[o])) {
ffffffffc0200b62:	0741                	addi	a4,a4,16
ffffffffc0200b64:	fef6dae3          	bge	a3,a5,ffffffffc0200b58 <buddy_alloc_pages+0x30>
    if (need_ord > buddy.max_order) return NULL;
ffffffffc0200b68:	4501                	li	a0,0
}
ffffffffc0200b6a:	8082                	ret
    if (o > buddy.max_order) return NULL; // out of memory
ffffffffc0200b6c:	fef6cee3          	blt	a3,a5,ffffffffc0200b68 <buddy_alloc_pages+0x40>
    buddy.nblocks[order] -= 1;
ffffffffc0200b70:	02a78713          	addi	a4,a5,42
ffffffffc0200b74:	070e                	slli	a4,a4,0x3
    __list_del(listelm->prev, listelm->next);
ffffffffc0200b76:	00083503          	ld	a0,0(a6)
ffffffffc0200b7a:	00883603          	ld	a2,8(a6)
ffffffffc0200b7e:	972e                	add	a4,a4,a1
ffffffffc0200b80:	6314                	ld	a3,0(a4)
    prev->next = next;
ffffffffc0200b82:	e510                	sd	a2,8(a0)
    next->prev = prev;
ffffffffc0200b84:	e208                	sd	a0,0(a2)
ffffffffc0200b86:	16fd                	addi	a3,a3,-1
ffffffffc0200b88:	e314                	sd	a3,0(a4)
    struct Page *p = le2page(le, page_link);
ffffffffc0200b8a:	fe880513          	addi	a0,a6,-24
    while (o > need_ord) {
ffffffffc0200b8e:	04f8dc63          	bge	a7,a5,ffffffffc0200be6 <buddy_alloc_pages+0xbe>
ffffffffc0200b92:	fff78693          	addi	a3,a5,-1
ffffffffc0200b96:	02978613          	addi	a2,a5,41
ffffffffc0200b9a:	0692                	slli	a3,a3,0x4
ffffffffc0200b9c:	060e                	slli	a2,a2,0x3
ffffffffc0200b9e:	96ae                	add	a3,a3,a1
ffffffffc0200ba0:	962e                	add	a2,a2,a1
        struct Page *right = blk + order_size(o);
ffffffffc0200ba2:	02800f13          	li	t5,40
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200ba6:	4e85                	li	t4,1
        o -= 1;
ffffffffc0200ba8:	37fd                	addiw	a5,a5,-1
        struct Page *right = blk + order_size(o);
ffffffffc0200baa:	00ff1733          	sll	a4,t5,a5
ffffffffc0200bae:	972a                	add	a4,a4,a0
    SetPageProperty(head);
ffffffffc0200bb0:	670c                	ld	a1,8(a4)
    __list_add(elm, listelm, listelm->next);
ffffffffc0200bb2:	0086b303          	ld	t1,8(a3)
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200bb6:	00fe9e33          	sll	t3,t4,a5
    SetPageProperty(head);
ffffffffc0200bba:	0025e593          	ori	a1,a1,2
ffffffffc0200bbe:	e70c                	sd	a1,8(a4)
    buddy.nblocks[order] += 1;
ffffffffc0200bc0:	620c                	ld	a1,0(a2)
    head->property = order_size(order); // store block size in pages for readability
ffffffffc0200bc2:	01c72823          	sw	t3,16(a4)
    list_add(&buddy.freelist[order], &(head->page_link));
ffffffffc0200bc6:	01870e13          	addi	t3,a4,24
    prev->next = next->prev = elm;
ffffffffc0200bca:	01c33023          	sd	t3,0(t1)
ffffffffc0200bce:	01c6b423          	sd	t3,8(a3)
    elm->prev = prev;
ffffffffc0200bd2:	ef14                	sd	a3,24(a4)
    elm->next = next;
ffffffffc0200bd4:	02673023          	sd	t1,32(a4)
    buddy.nblocks[order] += 1;
ffffffffc0200bd8:	00158713          	addi	a4,a1,1
ffffffffc0200bdc:	e218                	sd	a4,0(a2)
    while (o > need_ord) {
ffffffffc0200bde:	16c1                	addi	a3,a3,-16
ffffffffc0200be0:	1661                	addi	a2,a2,-8
ffffffffc0200be2:	fd1793e3          	bne	a5,a7,ffffffffc0200ba8 <buddy_alloc_pages+0x80>
    ClearPageProperty(blk);
ffffffffc0200be6:	ff083783          	ld	a5,-16(a6)
ffffffffc0200bea:	9bf5                	andi	a5,a5,-3
ffffffffc0200bec:	fef83823          	sd	a5,-16(a6)
    return blk;
ffffffffc0200bf0:	8082                	ret
static struct Page *buddy_alloc_pages(size_t n) {
ffffffffc0200bf2:	1141                	addi	sp,sp,-16
    assert(n > 0);
ffffffffc0200bf4:	00001697          	auipc	a3,0x1
ffffffffc0200bf8:	13c68693          	addi	a3,a3,316 # ffffffffc0201d30 <etext+0x38a>
ffffffffc0200bfc:	00001617          	auipc	a2,0x1
ffffffffc0200c00:	01c60613          	addi	a2,a2,28 # ffffffffc0201c18 <etext+0x272>
ffffffffc0200c04:	08700593          	li	a1,135
ffffffffc0200c08:	00001517          	auipc	a0,0x1
ffffffffc0200c0c:	02850513          	addi	a0,a0,40 # ffffffffc0201c30 <etext+0x28a>
static struct Page *buddy_alloc_pages(size_t n) {
ffffffffc0200c10:	e406                	sd	ra,8(sp)
    assert(n > 0);
ffffffffc0200c12:	db0ff0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc0200c16 <buddy_check>:
    buddy_free_pages(c, 4); // free rounded allocation size to restore full capacity
    assert(buddy_nr_free_pages() == before);
    dump_buddy_state("end basic_check");
}

static void buddy_check(void) {
ffffffffc0200c16:	72f9                	lui	t0,0xffffe
ffffffffc0200c18:	7119                	addi	sp,sp,-128
ffffffffc0200c1a:	40028293          	addi	t0,t0,1024 # ffffffffffffe400 <end+0x3fdf81a0>
ffffffffc0200c1e:	ecce                	sd	s3,88(sp)
ffffffffc0200c20:	fc86                	sd	ra,120(sp)
ffffffffc0200c22:	f8a2                	sd	s0,112(sp)
ffffffffc0200c24:	f4a6                	sd	s1,104(sp)
ffffffffc0200c26:	f0ca                	sd	s2,96(sp)
ffffffffc0200c28:	e8d2                	sd	s4,80(sp)
ffffffffc0200c2a:	e4d6                	sd	s5,72(sp)
ffffffffc0200c2c:	e0da                	sd	s6,64(sp)
ffffffffc0200c2e:	fc5e                	sd	s7,56(sp)
ffffffffc0200c30:	f862                	sd	s8,48(sp)
ffffffffc0200c32:	f466                	sd	s9,40(sp)
ffffffffc0200c34:	f06a                	sd	s10,32(sp)
ffffffffc0200c36:	ec6e                	sd	s11,24(sp)
ffffffffc0200c38:	9116                	add	sp,sp,t0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c3a:	00005997          	auipc	s3,0x5
ffffffffc0200c3e:	3de98993          	addi	s3,s3,990 # ffffffffc0206018 <buddy>
    verify_invariants();
ffffffffc0200c42:	a07ff0ef          	jal	ra,ffffffffc0200648 <verify_invariants>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c46:	1f89a603          	lw	a2,504(s3)
ffffffffc0200c4a:	58064463          	bltz	a2,ffffffffc02011d2 <buddy_check+0x5bc>
ffffffffc0200c4e:	00005697          	auipc	a3,0x5
ffffffffc0200c52:	51a68693          	addi	a3,a3,1306 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200c56:	2605                	addiw	a2,a2,1
    size_t total = 0;
ffffffffc0200c58:	4401                	li	s0,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c5a:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200c5c:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c5e:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200c60:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c64:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200c66:	943a                	add	s0,s0,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200c68:	fec79ae3          	bne	a5,a2,ffffffffc0200c5c <buddy_check+0x46>
    dump_buddy_state("begin basic_check");
ffffffffc0200c6c:	00001517          	auipc	a0,0x1
ffffffffc0200c70:	0dc50513          	addi	a0,a0,220 # ffffffffc0201d48 <etext+0x3a2>
ffffffffc0200c74:	ad9ff0ef          	jal	ra,ffffffffc020074c <dump_buddy_state>
    struct Page *a = buddy_alloc_pages(1);
ffffffffc0200c78:	4505                	li	a0,1
ffffffffc0200c7a:	eafff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
ffffffffc0200c7e:	892a                	mv	s2,a0
    assert(a != NULL);
ffffffffc0200c80:	66050d63          	beqz	a0,ffffffffc02012fa <buddy_check+0x6e4>
    cprintf("[buddy] allocated a(1 page)\n");
ffffffffc0200c84:	00001517          	auipc	a0,0x1
ffffffffc0200c88:	0ec50513          	addi	a0,a0,236 # ffffffffc0201d70 <etext+0x3ca>
ffffffffc0200c8c:	cc0ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    struct Page *b = buddy_alloc_pages(2);
ffffffffc0200c90:	4509                	li	a0,2
ffffffffc0200c92:	e97ff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
ffffffffc0200c96:	8a2a                	mv	s4,a0
    if (b == NULL) {
ffffffffc0200c98:	4c050563          	beqz	a0,ffffffffc0201162 <buddy_check+0x54c>
    cprintf("[buddy] allocated b(2 pages)\n");
ffffffffc0200c9c:	00001517          	auipc	a0,0x1
ffffffffc0200ca0:	2dc50513          	addi	a0,a0,732 # ffffffffc0201f78 <etext+0x5d2>
ffffffffc0200ca4:	ca8ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    struct Page *c = buddy_alloc_pages(3); // rounded to 4
ffffffffc0200ca8:	450d                	li	a0,3
ffffffffc0200caa:	e7fff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
ffffffffc0200cae:	84aa                	mv	s1,a0
    assert(c != NULL);
ffffffffc0200cb0:	62050563          	beqz	a0,ffffffffc02012da <buddy_check+0x6c4>
    cprintf("[buddy] allocated c(3->4 pages)\n");
ffffffffc0200cb4:	00001517          	auipc	a0,0x1
ffffffffc0200cb8:	17450513          	addi	a0,a0,372 # ffffffffc0201e28 <etext+0x482>
ffffffffc0200cbc:	c90ff0ef          	jal	ra,ffffffffc020014c <cprintf>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200cc0:	1f89a583          	lw	a1,504(s3)
ffffffffc0200cc4:	5005c363          	bltz	a1,ffffffffc02011ca <buddy_check+0x5b4>
ffffffffc0200cc8:	00005697          	auipc	a3,0x5
ffffffffc0200ccc:	4a068693          	addi	a3,a3,1184 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200cd0:	2585                	addiw	a1,a1,1
    size_t total = 0;
ffffffffc0200cd2:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200cd4:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200cd6:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200cd8:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200cda:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200cde:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200ce0:	963a                	add	a2,a2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200ce2:	feb79ae3          	bne	a5,a1,ffffffffc0200cd6 <buddy_check+0xc0>
    assert(buddy_nr_free_pages() + used == before);
ffffffffc0200ce6:	061d                	addi	a2,a2,7
ffffffffc0200ce8:	58861963          	bne	a2,s0,ffffffffc020127a <buddy_check+0x664>
    assert(n > 0);
ffffffffc0200cec:	4585                	li	a1,1
ffffffffc0200cee:	854a                	mv	a0,s2
ffffffffc0200cf0:	afdff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
ffffffffc0200cf4:	4589                	li	a1,2
ffffffffc0200cf6:	8552                	mv	a0,s4
ffffffffc0200cf8:	af5ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
ffffffffc0200cfc:	4591                	li	a1,4
ffffffffc0200cfe:	8526                	mv	a0,s1
ffffffffc0200d00:	aedff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d04:	1f89a583          	lw	a1,504(s3)
ffffffffc0200d08:	4c05c363          	bltz	a1,ffffffffc02011ce <buddy_check+0x5b8>
ffffffffc0200d0c:	00005697          	auipc	a3,0x5
ffffffffc0200d10:	45c68693          	addi	a3,a3,1116 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200d14:	2585                	addiw	a1,a1,1
    size_t total = 0;
ffffffffc0200d16:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d18:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d1a:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d1c:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d1e:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d22:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d24:	963a                	add	a2,a2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d26:	feb79ae3          	bne	a5,a1,ffffffffc0200d1a <buddy_check+0x104>
    assert(buddy_nr_free_pages() == before);
ffffffffc0200d2a:	58c41863          	bne	s0,a2,ffffffffc02012ba <buddy_check+0x6a4>
    dump_buddy_state("end basic_check");
ffffffffc0200d2e:	00001517          	auipc	a0,0x1
ffffffffc0200d32:	16a50513          	addi	a0,a0,362 # ffffffffc0201e98 <etext+0x4f2>
ffffffffc0200d36:	a17ff0ef          	jal	ra,ffffffffc020074c <dump_buddy_state>
    buddy_basic_check();
    verify_invariants();
ffffffffc0200d3a:	90fff0ef          	jal	ra,ffffffffc0200648 <verify_invariants>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d3e:	1f89a603          	lw	a2,504(s3)
ffffffffc0200d42:	48064a63          	bltz	a2,ffffffffc02011d6 <buddy_check+0x5c0>
ffffffffc0200d46:	00005c17          	auipc	s8,0x5
ffffffffc0200d4a:	422c0c13          	addi	s8,s8,1058 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200d4e:	2605                	addiw	a2,a2,1
ffffffffc0200d50:	86e2                	mv	a3,s8
    size_t total = 0;
ffffffffc0200d52:	4901                	li	s2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d54:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d56:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d58:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d5a:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d5e:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200d60:	993a                	add	s2,s2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200d62:	fec79ae3          	bne	a5,a2,ffffffffc0200d56 <buddy_check+0x140>
ffffffffc0200d66:	4481                	li	s1,0
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200d68:	4a05                	li	s4,1
    return (size_t)(p - pages + nbase);
ffffffffc0200d6a:	00005b97          	auipc	s7,0x5
ffffffffc0200d6e:	4ceb8b93          	addi	s7,s7,1230 # ffffffffc0206238 <pages>
ffffffffc0200d72:	00001b17          	auipc	s6,0x1
ffffffffc0200d76:	606b3b03          	ld	s6,1542(s6) # ffffffffc0202378 <error_string+0x38>
ffffffffc0200d7a:	00001a97          	auipc	s5,0x1
ffffffffc0200d7e:	606a8a93          	addi	s5,s5,1542 # ffffffffc0202380 <nbase>
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200d82:	009a1cb3          	sll	s9,s4,s1

    // Test 1: split-down and exact free restore for multiple orders
    size_t baseline = buddy_nr_free_pages();
    for (int o = 0; o <= buddy.max_order; ++o) {
        size_t need = order_size(o);
        struct Page *p = buddy_alloc_pages(need);
ffffffffc0200d86:	8566                	mv	a0,s9
ffffffffc0200d88:	da1ff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
        if (p == NULL) continue; // not enough memory for this order currently
ffffffffc0200d8c:	3a050d63          	beqz	a0,ffffffffc0201146 <buddy_check+0x530>
    return (size_t)(p - pages + nbase);
ffffffffc0200d90:	000bb683          	ld	a3,0(s7)
ffffffffc0200d94:	000ab703          	ld	a4,0(s5)
        // pages allocated should be aligned to need boundary in PPN index
        assert((page_index(p) & (need - 1)) == 0);
ffffffffc0200d98:	fffc8413          	addi	s0,s9,-1
    return (size_t)(p - pages + nbase);
ffffffffc0200d9c:	40d507b3          	sub	a5,a0,a3
ffffffffc0200da0:	878d                	srai	a5,a5,0x3
ffffffffc0200da2:	036787b3          	mul	a5,a5,s6
ffffffffc0200da6:	97ba                	add	a5,a5,a4
        assert((page_index(p) & (need - 1)) == 0);
ffffffffc0200da8:	8c7d                	and	s0,s0,a5
ffffffffc0200daa:	46041863          	bnez	s0,ffffffffc020121a <buddy_check+0x604>
    assert(n > 0);
ffffffffc0200dae:	420c8663          	beqz	s9,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc0200db2:	85e6                	mv	a1,s9
ffffffffc0200db4:	a39ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200db8:	1f89ad03          	lw	s10,504(s3)
ffffffffc0200dbc:	000d4e63          	bltz	s10,ffffffffc0200dd8 <buddy_check+0x1c2>
ffffffffc0200dc0:	001d061b          	addiw	a2,s10,1
ffffffffc0200dc4:	86e2                	mv	a3,s8
ffffffffc0200dc6:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200dc8:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200dca:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200dcc:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200dd0:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200dd2:	943a                	add	s0,s0,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200dd4:	fec79ae3          	bne	a5,a2,ffffffffc0200dc8 <buddy_check+0x1b2>
        buddy_free_pages(p, need);
        assert(buddy_nr_free_pages() == baseline);
ffffffffc0200dd8:	48891163          	bne	s2,s0,ffffffffc020125a <buddy_check+0x644>
        verify_invariants();
ffffffffc0200ddc:	86dff0ef          	jal	ra,ffffffffc0200648 <verify_invariants>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200de0:	2485                	addiw	s1,s1,1
ffffffffc0200de2:	fa9d50e3          	bge	s10,s1,ffffffffc0200d82 <buddy_check+0x16c>
    }

    // Test 2: coalesce across two buddies (allocate 2 blocks of same order and free)
    for (int o = 0; o < buddy.max_order; ++o) {
ffffffffc0200de6:	09a05f63          	blez	s10,ffffffffc0200e84 <buddy_check+0x26e>
ffffffffc0200dea:	4401                	li	s0,0
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200dec:	4485                	li	s1,1
        if (!b) { buddy_free_pages(a, sz); continue; }
        // The two blocks may or may not be buddies; freeing both should not leak
        size_t before = buddy_nr_free_pages();
        buddy_free_pages(a, sz);
        buddy_free_pages(b, sz);
        assert(buddy_nr_free_pages() == before + sz + sz);
ffffffffc0200dee:	4909                	li	s2,2
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200df0:	00849b33          	sll	s6,s1,s0
        struct Page *a = buddy_alloc_pages(sz);
ffffffffc0200df4:	855a                	mv	a0,s6
ffffffffc0200df6:	d33ff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
ffffffffc0200dfa:	8aaa                	mv	s5,a0
        if (!a) continue;
ffffffffc0200dfc:	34050e63          	beqz	a0,ffffffffc0201158 <buddy_check+0x542>
        struct Page *b = buddy_alloc_pages(sz);
ffffffffc0200e00:	855a                	mv	a0,s6
ffffffffc0200e02:	d27ff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
ffffffffc0200e06:	8baa                	mv	s7,a0
        if (!b) { buddy_free_pages(a, sz); continue; }
ffffffffc0200e08:	34050263          	beqz	a0,ffffffffc020114c <buddy_check+0x536>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e0c:	1f89a603          	lw	a2,504(s3)
    size_t total = 0;
ffffffffc0200e10:	4a01                	li	s4,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e12:	02064163          	bltz	a2,ffffffffc0200e34 <buddy_check+0x21e>
ffffffffc0200e16:	00005697          	auipc	a3,0x5
ffffffffc0200e1a:	35268693          	addi	a3,a3,850 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200e1e:	2605                	addiw	a2,a2,1
    size_t total = 0;
ffffffffc0200e20:	4a01                	li	s4,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e22:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e24:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e26:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e28:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e2c:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e2e:	9a3a                	add	s4,s4,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e30:	fec79ae3          	bne	a5,a2,ffffffffc0200e24 <buddy_check+0x20e>
    assert(n > 0);
ffffffffc0200e34:	3a0b0363          	beqz	s6,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc0200e38:	85da                	mv	a1,s6
ffffffffc0200e3a:	8556                	mv	a0,s5
ffffffffc0200e3c:	9b1ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
ffffffffc0200e40:	85da                	mv	a1,s6
ffffffffc0200e42:	855e                	mv	a0,s7
ffffffffc0200e44:	9a9ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e48:	1f89ad03          	lw	s10,504(s3)
ffffffffc0200e4c:	300d4963          	bltz	s10,ffffffffc020115e <buddy_check+0x548>
ffffffffc0200e50:	00005697          	auipc	a3,0x5
ffffffffc0200e54:	31868693          	addi	a3,a3,792 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200e58:	001d059b          	addiw	a1,s10,1
    size_t total = 0;
ffffffffc0200e5c:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e5e:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e60:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e62:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e64:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e68:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200e6a:	963a                	add	a2,a2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e6c:	feb79ae3          	bne	a5,a1,ffffffffc0200e60 <buddy_check+0x24a>
        assert(buddy_nr_free_pages() == before + sz + sz);
ffffffffc0200e70:	008917b3          	sll	a5,s2,s0
ffffffffc0200e74:	9a3e                	add	s4,s4,a5
ffffffffc0200e76:	3cca1263          	bne	s4,a2,ffffffffc020123a <buddy_check+0x624>
        verify_invariants();
ffffffffc0200e7a:	fceff0ef          	jal	ra,ffffffffc0200648 <verify_invariants>
    for (int o = 0; o < buddy.max_order; ++o) {
ffffffffc0200e7e:	2405                	addiw	s0,s0,1
ffffffffc0200e80:	f7a448e3          	blt	s0,s10,ffffffffc0200df0 <buddy_check+0x1da>
    }

    // Test 3: exhaust at an order then free back
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200e84:	4a01                	li	s4,0
ffffffffc0200e86:	340d4863          	bltz	s10,ffffffffc02011d6 <buddy_check+0x5c0>
        while (cnt < 128) {
            struct Page *p = buddy_alloc_pages(sz);
            if (!p) break;
            vec[cnt++] = p;
        }
        for (int i = 0; i < cnt; ++i) buddy_free_pages(vec[i], sz);
ffffffffc0200e8a:	6709                	lui	a4,0x2
ffffffffc0200e8c:	0814                	addi	a3,sp,16
ffffffffc0200e8e:	c0070793          	addi	a5,a4,-1024 # 1c00 <kern_entry-0xffffffffc01fe400>
ffffffffc0200e92:	7bf9                	lui	s7,0xffffe
ffffffffc0200e94:	97b6                	add	a5,a5,a3
ffffffffc0200e96:	400b8b13          	addi	s6,s7,1024 # ffffffffffffe400 <end+0x3fdf81a0>
ffffffffc0200e9a:	9bbe                	add	s7,s7,a5
ffffffffc0200e9c:	c0070793          	addi	a5,a4,-1024
ffffffffc0200ea0:	97b6                	add	a5,a5,a3
ffffffffc0200ea2:	97da                	add	a5,a5,s6
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200ea4:	4c05                	li	s8,1
        while (cnt < 128) {
ffffffffc0200ea6:	08000913          	li	s2,128
ffffffffc0200eaa:	e43e                	sd	a5,8(sp)
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc0200eac:	00005a97          	auipc	s5,0x5
ffffffffc0200eb0:	2bca8a93          	addi	s5,s5,700 # ffffffffc0206168 <buddy+0x150>
ffffffffc0200eb4:	014c1433          	sll	s0,s8,s4
ffffffffc0200eb8:	86d6                	mv	a3,s5
    size_t total = 0;
ffffffffc0200eba:	4481                	li	s1,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200ebc:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200ebe:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200ec0:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200ec2:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200ec6:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200ec8:	94ba                	add	s1,s1,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200eca:	fefd5ae3          	bge	s10,a5,ffffffffc0200ebe <buddy_check+0x2a8>
ffffffffc0200ece:	6789                	lui	a5,0x2
ffffffffc0200ed0:	c0078793          	addi	a5,a5,-1024 # 1c00 <kern_entry-0xffffffffc01fe400>
ffffffffc0200ed4:	0818                	addi	a4,sp,16
ffffffffc0200ed6:	97ba                	add	a5,a5,a4
ffffffffc0200ed8:	01678db3          	add	s11,a5,s6
        int cnt = 0;
ffffffffc0200edc:	4d01                	li	s10,0
ffffffffc0200ede:	a039                	j	ffffffffc0200eec <buddy_check+0x2d6>
            vec[cnt++] = p;
ffffffffc0200ee0:	00adb023          	sd	a0,0(s11)
ffffffffc0200ee4:	2d05                	addiw	s10,s10,1
        while (cnt < 128) {
ffffffffc0200ee6:	0da1                	addi	s11,s11,8
ffffffffc0200ee8:	012d0863          	beq	s10,s2,ffffffffc0200ef8 <buddy_check+0x2e2>
            struct Page *p = buddy_alloc_pages(sz);
ffffffffc0200eec:	8522                	mv	a0,s0
ffffffffc0200eee:	c3bff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
            if (!p) break;
ffffffffc0200ef2:	f57d                	bnez	a0,ffffffffc0200ee0 <buddy_check+0x2ca>
        for (int i = 0; i < cnt; ++i) buddy_free_pages(vec[i], sz);
ffffffffc0200ef4:	020d0463          	beqz	s10,ffffffffc0200f1c <buddy_check+0x306>
ffffffffc0200ef8:	400bb503          	ld	a0,1024(s7)
    assert(n > 0);
ffffffffc0200efc:	2c040f63          	beqz	s0,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc0200f00:	67a2                	ld	a5,8(sp)
ffffffffc0200f02:	4d81                	li	s11,0
ffffffffc0200f04:	00878c93          	addi	s9,a5,8
ffffffffc0200f08:	a021                	j	ffffffffc0200f10 <buddy_check+0x2fa>
        for (int i = 0; i < cnt; ++i) buddy_free_pages(vec[i], sz);
ffffffffc0200f0a:	000cb503          	ld	a0,0(s9)
    assert(n > 0);
ffffffffc0200f0e:	0ca1                	addi	s9,s9,8
        for (int i = 0; i < cnt; ++i) buddy_free_pages(vec[i], sz);
ffffffffc0200f10:	2d85                	addiw	s11,s11,1
ffffffffc0200f12:	85a2                	mv	a1,s0
ffffffffc0200f14:	8d9ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
ffffffffc0200f18:	ffadc9e3          	blt	s11,s10,ffffffffc0200f0a <buddy_check+0x2f4>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f1c:	1f89ad03          	lw	s10,504(s3)
    size_t total = 0;
ffffffffc0200f20:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f22:	020d4263          	bltz	s10,ffffffffc0200f46 <buddy_check+0x330>
ffffffffc0200f26:	001d059b          	addiw	a1,s10,1
ffffffffc0200f2a:	00005697          	auipc	a3,0x5
ffffffffc0200f2e:	23e68693          	addi	a3,a3,574 # ffffffffc0206168 <buddy+0x150>
    size_t total = 0;
ffffffffc0200f32:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f34:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f36:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f38:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f3a:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f3e:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f40:	963a                	add	a2,a2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f42:	fef59ae3          	bne	a1,a5,ffffffffc0200f36 <buddy_check+0x320>
        assert(buddy_nr_free_pages() == before);
ffffffffc0200f46:	34c49a63          	bne	s1,a2,ffffffffc020129a <buddy_check+0x684>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f4a:	2a05                	addiw	s4,s4,1
        verify_invariants();
ffffffffc0200f4c:	efcff0ef          	jal	ra,ffffffffc0200648 <verify_invariants>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f50:	f54d5ee3          	bge	s10,s4,ffffffffc0200eac <buddy_check+0x296>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f54:	280d4163          	bltz	s10,ffffffffc02011d6 <buddy_check+0x5c0>
ffffffffc0200f58:	2d05                	addiw	s10,s10,1
    size_t total = 0;
ffffffffc0200f5a:	4a01                	li	s4,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f5c:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f5e:	000ab703          	ld	a4,0(s5)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f62:	0aa1                	addi	s5,s5,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f64:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f68:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0200f6a:	9a3a                	add	s4,s4,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0200f6c:	ffa799e3          	bne	a5,s10,ffffffffc0200f5e <buddy_check+0x348>
ffffffffc0200f70:	6709                	lui	a4,0x2
            rec[rc].len = need;
            rc++;
        } else if (rc > 0) {
            // free random one
            int k = (int)(rnd_lcg(&seed) % rc);
            buddy_free_pages(rec[k].p, rec[k].len);
ffffffffc0200f72:	797d                	lui	s2,0xfffff
ffffffffc0200f74:	0814                	addi	a3,sp,16
ffffffffc0200f76:	c0070793          	addi	a5,a4,-1024 # 1c00 <kern_entry-0xffffffffc01fe400>
ffffffffc0200f7a:	80090a93          	addi	s5,s2,-2048 # ffffffffffffe800 <end+0x3fdf85a0>
ffffffffc0200f7e:	97b6                	add	a5,a5,a3
ffffffffc0200f80:	9abe                	add	s5,s5,a5
ffffffffc0200f82:	c0070793          	addi	a5,a4,-1024
    unsigned long seed = 1234567;
ffffffffc0200f86:	0012d437          	lui	s0,0x12d
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0200f8a:	00196db7          	lui	s11,0x196
ffffffffc0200f8e:	3c6efd37          	lui	s10,0x3c6ef
            buddy_free_pages(rec[k].p, rec[k].len);
ffffffffc0200f92:	97b6                	add	a5,a5,a3
    size_t total = 0;
ffffffffc0200f94:	1f400c93          	li	s9,500
    unsigned long seed = 1234567;
ffffffffc0200f98:	68740413          	addi	s0,s0,1671 # 12d687 <kern_entry-0xffffffffc00d2979>
    int rc = 0;
ffffffffc0200f9c:	4c01                	li	s8,0
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0200f9e:	60dd8d93          	addi	s11,s11,1549 # 19660d <kern_entry-0xffffffffc00699f3>
ffffffffc0200fa2:	35fd0d13          	addi	s10,s10,863 # 3c6ef35f <kern_entry-0xffffffff83b10ca1>
            buddy_free_pages(rec[k].p, rec[k].len);
ffffffffc0200fa6:	993e                	add	s2,s2,a5
    return (size_t)(p - pages + nbase);
ffffffffc0200fa8:	00001b17          	auipc	s6,0x1
ffffffffc0200fac:	3d0b3b03          	ld	s6,976(s6) # ffffffffc0202378 <error_string+0x38>
ffffffffc0200fb0:	020a8b93          	addi	s7,s5,32
ffffffffc0200fb4:	a8b1                	j	ffffffffc0201010 <buddy_check+0x3fa>
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0200fb6:	03b40433          	mul	s0,s0,s11
        if ((rnd_lcg(&seed) & 3) != 0 && rc < 256) {
ffffffffc0200fba:	0ff00793          	li	a5,255
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0200fbe:	946a                	add	s0,s0,s10
        if ((rnd_lcg(&seed) & 3) != 0 && rc < 256) {
ffffffffc0200fc0:	0787d463          	bge	a5,s8,ffffffffc0201028 <buddy_check+0x412>
            int k = (int)(rnd_lcg(&seed) % rc);
ffffffffc0200fc4:	038474b3          	remu	s1,s0,s8
ffffffffc0200fc8:	0004879b          	sext.w	a5,s1
            buddy_free_pages(rec[k].p, rec[k].len);
ffffffffc0200fcc:	00179493          	slli	s1,a5,0x1
ffffffffc0200fd0:	94be                	add	s1,s1,a5
ffffffffc0200fd2:	048e                	slli	s1,s1,0x3
ffffffffc0200fd4:	94ca                	add	s1,s1,s2
ffffffffc0200fd6:	8104b583          	ld	a1,-2032(s1)
ffffffffc0200fda:	8004b503          	ld	a0,-2048(s1)
    assert(n > 0);
ffffffffc0200fde:	1e058e63          	beqz	a1,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc0200fe2:	80bff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
            rec[k] = rec[rc - 1];
ffffffffc0200fe6:	3c7d                	addiw	s8,s8,-1
ffffffffc0200fe8:	001c1793          	slli	a5,s8,0x1
ffffffffc0200fec:	97e2                	add	a5,a5,s8
ffffffffc0200fee:	078e                	slli	a5,a5,0x3
ffffffffc0200ff0:	97ca                	add	a5,a5,s2
ffffffffc0200ff2:	8007b703          	ld	a4,-2048(a5)
ffffffffc0200ff6:	80e4b023          	sd	a4,-2048(s1)
ffffffffc0200ffa:	8087b703          	ld	a4,-2040(a5)
ffffffffc0200ffe:	80e4b423          	sd	a4,-2040(s1)
ffffffffc0201002:	8107b783          	ld	a5,-2032(a5)
ffffffffc0201006:	80f4b823          	sd	a5,-2032(s1)
    for (int step = 0; step < 500; ++step) {
ffffffffc020100a:	3cfd                	addiw	s9,s9,-1
ffffffffc020100c:	0a0c8763          	beqz	s9,ffffffffc02010ba <buddy_check+0x4a4>
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0201010:	03b40433          	mul	s0,s0,s11
ffffffffc0201014:	946a                	add	s0,s0,s10
        if ((rnd_lcg(&seed) & 3) != 0 && rc < 256) {
ffffffffc0201016:	00347793          	andi	a5,s0,3
ffffffffc020101a:	ffd1                	bnez	a5,ffffffffc0200fb6 <buddy_check+0x3a0>
        } else if (rc > 0) {
ffffffffc020101c:	fe0c07e3          	beqz	s8,ffffffffc020100a <buddy_check+0x3f4>
    *seed = (*seed) * 1664525UL + 1013904223UL;
ffffffffc0201020:	03b40433          	mul	s0,s0,s11
ffffffffc0201024:	946a                	add	s0,s0,s10
ffffffffc0201026:	bf79                	j	ffffffffc0200fc4 <buddy_check+0x3ae>
            int omax = buddy.max_order < 6 ? buddy.max_order : 6;
ffffffffc0201028:	1f89a783          	lw	a5,504(s3)
ffffffffc020102c:	4719                	li	a4,6
ffffffffc020102e:	0007869b          	sext.w	a3,a5
ffffffffc0201032:	00d75363          	bge	a4,a3,ffffffffc0201038 <buddy_check+0x422>
ffffffffc0201036:	4799                	li	a5,6
            int o = (int)(rnd_lcg(&seed) % (omax + 1));
ffffffffc0201038:	2785                	addiw	a5,a5,1
ffffffffc020103a:	02f477b3          	remu	a5,s0,a5
static inline size_t order_size(int order) { return ((size_t)1) << order; }
ffffffffc020103e:	4485                	li	s1,1
ffffffffc0201040:	00f494b3          	sll	s1,s1,a5
            struct Page *p = buddy_alloc_pages(need);
ffffffffc0201044:	8526                	mv	a0,s1
ffffffffc0201046:	ae3ff0ef          	jal	ra,ffffffffc0200b28 <buddy_alloc_pages>
            if (!p) continue;
ffffffffc020104a:	d161                	beqz	a0,ffffffffc020100a <buddy_check+0x3f4>
    return (size_t)(p - pages + nbase);
ffffffffc020104c:	00005617          	auipc	a2,0x5
ffffffffc0201050:	1ec63603          	ld	a2,492(a2) # ffffffffc0206238 <pages>
ffffffffc0201054:	40c50633          	sub	a2,a0,a2
ffffffffc0201058:	860d                	srai	a2,a2,0x3
ffffffffc020105a:	03660633          	mul	a2,a2,s6
ffffffffc020105e:	00001797          	auipc	a5,0x1
ffffffffc0201062:	3227b783          	ld	a5,802(a5) # ffffffffc0202380 <nbase>
ffffffffc0201066:	963e                	add	a2,a2,a5
            for (int i = 0; i < rc; ++i) {
ffffffffc0201068:	020c0a63          	beqz	s8,ffffffffc020109c <buddy_check+0x486>
ffffffffc020106c:	fffc059b          	addiw	a1,s8,-1
ffffffffc0201070:	02059793          	slli	a5,a1,0x20
ffffffffc0201074:	9381                	srli	a5,a5,0x20
ffffffffc0201076:	00179593          	slli	a1,a5,0x1
ffffffffc020107a:	95be                	add	a1,a1,a5
ffffffffc020107c:	058e                	slli	a1,a1,0x3
                size_t b0 = idx, b1 = idx + need;
ffffffffc020107e:	00c48833          	add	a6,s1,a2
ffffffffc0201082:	008a8793          	addi	a5,s5,8
ffffffffc0201086:	95de                	add	a1,a1,s7
                size_t a0 = rec[i].idx, a1 = rec[i].idx + rec[i].len;
ffffffffc0201088:	6394                	ld	a3,0(a5)
ffffffffc020108a:	6798                	ld	a4,8(a5)
ffffffffc020108c:	9736                	add	a4,a4,a3
                assert(!(b0 < a1 && a0 < b1));
ffffffffc020108e:	00e67463          	bgeu	a2,a4,ffffffffc0201096 <buddy_check+0x480>
ffffffffc0201092:	1706e463          	bltu	a3,a6,ffffffffc02011fa <buddy_check+0x5e4>
            for (int i = 0; i < rc; ++i) {
ffffffffc0201096:	07e1                	addi	a5,a5,24
ffffffffc0201098:	feb798e3          	bne	a5,a1,ffffffffc0201088 <buddy_check+0x472>
            rec[rc].p = p;
ffffffffc020109c:	001c1713          	slli	a4,s8,0x1
ffffffffc02010a0:	9762                	add	a4,a4,s8
ffffffffc02010a2:	070e                	slli	a4,a4,0x3
ffffffffc02010a4:	974a                	add	a4,a4,s2
ffffffffc02010a6:	80a73023          	sd	a0,-2048(a4)
            rec[rc].idx = idx;
ffffffffc02010aa:	80c73423          	sd	a2,-2040(a4)
            rec[rc].len = need;
ffffffffc02010ae:	80973823          	sd	s1,-2032(a4)
    for (int step = 0; step < 500; ++step) {
ffffffffc02010b2:	3cfd                	addiw	s9,s9,-1
            rc++;
ffffffffc02010b4:	2c05                	addiw	s8,s8,1
    for (int step = 0; step < 500; ++step) {
ffffffffc02010b6:	f40c9de3          	bnez	s9,ffffffffc0201010 <buddy_check+0x3fa>
            rc--;
        }
    }
    // free remaining
    while (rc > 0) { rc--; buddy_free_pages(rec[rc].p, rec[rc].len); }
ffffffffc02010ba:	020c0c63          	beqz	s8,ffffffffc02010f2 <buddy_check+0x4dc>
ffffffffc02010be:	6709                	lui	a4,0x2
ffffffffc02010c0:	001c1793          	slli	a5,s8,0x1
ffffffffc02010c4:	747d                	lui	s0,0xfffff
ffffffffc02010c6:	c0070713          	addi	a4,a4,-1024 # 1c00 <kern_entry-0xffffffffc01fe400>
ffffffffc02010ca:	0814                	addi	a3,sp,16
ffffffffc02010cc:	97e2                	add	a5,a5,s8
ffffffffc02010ce:	80040413          	addi	s0,s0,-2048 # ffffffffffffe800 <end+0x3fdf85a0>
ffffffffc02010d2:	9736                	add	a4,a4,a3
ffffffffc02010d4:	943a                	add	s0,s0,a4
ffffffffc02010d6:	078e                	slli	a5,a5,0x3
ffffffffc02010d8:	943e                	add	s0,s0,a5
ffffffffc02010da:	ff843583          	ld	a1,-8(s0)
ffffffffc02010de:	fe843503          	ld	a0,-24(s0)
ffffffffc02010e2:	3c7d                	addiw	s8,s8,-1
    assert(n > 0);
ffffffffc02010e4:	0e058b63          	beqz	a1,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc02010e8:	f04ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
    while (rc > 0) { rc--; buddy_free_pages(rec[rc].p, rec[rc].len); }
ffffffffc02010ec:	1421                	addi	s0,s0,-24
ffffffffc02010ee:	fe0c16e3          	bnez	s8,ffffffffc02010da <buddy_check+0x4c4>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02010f2:	1f89a583          	lw	a1,504(s3)
    size_t total = 0;
ffffffffc02010f6:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02010f8:	0205c163          	bltz	a1,ffffffffc020111a <buddy_check+0x504>
ffffffffc02010fc:	00005697          	auipc	a3,0x5
ffffffffc0201100:	06c68693          	addi	a3,a3,108 # ffffffffc0206168 <buddy+0x150>
ffffffffc0201104:	2585                	addiw	a1,a1,1
    size_t total = 0;
ffffffffc0201106:	4601                	li	a2,0
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0201108:	4781                	li	a5,0
        total += buddy.nblocks[o] * order_size(o);
ffffffffc020110a:	6298                	ld	a4,0(a3)
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc020110c:	06a1                	addi	a3,a3,8
        total += buddy.nblocks[o] * order_size(o);
ffffffffc020110e:	00f71733          	sll	a4,a4,a5
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0201112:	2785                	addiw	a5,a5,1
        total += buddy.nblocks[o] * order_size(o);
ffffffffc0201114:	963a                	add	a2,a2,a4
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0201116:	fef59ae3          	bne	a1,a5,ffffffffc020110a <buddy_check+0x4f4>
    assert(buddy_nr_free_pages() >= start_free);
ffffffffc020111a:	21466063          	bltu	a2,s4,ffffffffc020131a <buddy_check+0x704>
    verify_invariants();
}
ffffffffc020111e:	6289                	lui	t0,0x2
ffffffffc0201120:	c0028293          	addi	t0,t0,-1024 # 1c00 <kern_entry-0xffffffffc01fe400>
ffffffffc0201124:	9116                	add	sp,sp,t0
ffffffffc0201126:	70e6                	ld	ra,120(sp)
ffffffffc0201128:	7446                	ld	s0,112(sp)
ffffffffc020112a:	74a6                	ld	s1,104(sp)
ffffffffc020112c:	7906                	ld	s2,96(sp)
ffffffffc020112e:	69e6                	ld	s3,88(sp)
ffffffffc0201130:	6a46                	ld	s4,80(sp)
ffffffffc0201132:	6aa6                	ld	s5,72(sp)
ffffffffc0201134:	6b06                	ld	s6,64(sp)
ffffffffc0201136:	7be2                	ld	s7,56(sp)
ffffffffc0201138:	7c42                	ld	s8,48(sp)
ffffffffc020113a:	7ca2                	ld	s9,40(sp)
ffffffffc020113c:	7d02                	ld	s10,32(sp)
ffffffffc020113e:	6de2                	ld	s11,24(sp)
ffffffffc0201140:	6109                	addi	sp,sp,128
    verify_invariants();
ffffffffc0201142:	d06ff06f          	j	ffffffffc0200648 <verify_invariants>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc0201146:	1f89ad03          	lw	s10,504(s3)
ffffffffc020114a:	b959                	j	ffffffffc0200de0 <buddy_check+0x1ca>
    assert(n > 0);
ffffffffc020114c:	080b0763          	beqz	s6,ffffffffc02011da <buddy_check+0x5c4>
ffffffffc0201150:	85da                	mv	a1,s6
ffffffffc0201152:	8556                	mv	a0,s5
ffffffffc0201154:	e98ff0ef          	jal	ra,ffffffffc02007ec <buddy_free_pages.part.0>
    for (int o = 0; o < buddy.max_order; ++o) {
ffffffffc0201158:	1f89ad03          	lw	s10,504(s3)
        if (!b) { buddy_free_pages(a, sz); continue; }
ffffffffc020115c:	b30d                	j	ffffffffc0200e7e <buddy_check+0x268>
    size_t total = 0;
ffffffffc020115e:	4601                	li	a2,0
ffffffffc0201160:	bb01                	j	ffffffffc0200e70 <buddy_check+0x25a>
        cprintf("[buddy] alloc b(2 pages) failed\n");
ffffffffc0201162:	00001517          	auipc	a0,0x1
ffffffffc0201166:	c2e50513          	addi	a0,a0,-978 # ffffffffc0201d90 <etext+0x3ea>
ffffffffc020116a:	fe3fe0ef          	jal	ra,ffffffffc020014c <cprintf>
        dump_buddy_state("after a, before b");
ffffffffc020116e:	00001517          	auipc	a0,0x1
ffffffffc0201172:	c4a50513          	addi	a0,a0,-950 # ffffffffc0201db8 <etext+0x412>
ffffffffc0201176:	dd6ff0ef          	jal	ra,ffffffffc020074c <dump_buddy_state>
        for (int o = buddy.max_order; o > 1; --o) {
ffffffffc020117a:	1f89a583          	lw	a1,504(s3)
ffffffffc020117e:	4785                	li	a5,1
ffffffffc0201180:	02b7d563          	bge	a5,a1,ffffffffc02011aa <buddy_check+0x594>
ffffffffc0201184:	00459793          	slli	a5,a1,0x4
ffffffffc0201188:	99be                	add	s3,s3,a5
ffffffffc020118a:	4705                	li	a4,1
ffffffffc020118c:	a029                	j	ffffffffc0201196 <buddy_check+0x580>
ffffffffc020118e:	35fd                	addiw	a1,a1,-1
ffffffffc0201190:	19c1                	addi	s3,s3,-16
ffffffffc0201192:	00e58c63          	beq	a1,a4,ffffffffc02011aa <buddy_check+0x594>
            if (!list_empty(&buddy.freelist[o])) {
ffffffffc0201196:	0089b783          	ld	a5,8(s3)
ffffffffc020119a:	fef98ae3          	beq	s3,a5,ffffffffc020118e <buddy_check+0x578>
                cprintf("[buddy] diagnostic: found non-empty order %d before b allocation\n", o);
ffffffffc020119e:	00001517          	auipc	a0,0x1
ffffffffc02011a2:	c3250513          	addi	a0,a0,-974 # ffffffffc0201dd0 <etext+0x42a>
ffffffffc02011a6:	fa7fe0ef          	jal	ra,ffffffffc020014c <cprintf>
    assert(b != NULL);
ffffffffc02011aa:	00001697          	auipc	a3,0x1
ffffffffc02011ae:	dbe68693          	addi	a3,a3,-578 # ffffffffc0201f68 <etext+0x5c2>
ffffffffc02011b2:	00001617          	auipc	a2,0x1
ffffffffc02011b6:	a6660613          	addi	a2,a2,-1434 # ffffffffc0201c18 <etext+0x272>
ffffffffc02011ba:	11500593          	li	a1,277
ffffffffc02011be:	00001517          	auipc	a0,0x1
ffffffffc02011c2:	a7250513          	addi	a0,a0,-1422 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02011c6:	ffdfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    for (int o = 0; o <= buddy.max_order; ++o) {
ffffffffc02011ca:	461d                	li	a2,7
ffffffffc02011cc:	be31                	j	ffffffffc0200ce8 <buddy_check+0xd2>
    size_t total = 0;
ffffffffc02011ce:	4601                	li	a2,0
ffffffffc02011d0:	bea9                	j	ffffffffc0200d2a <buddy_check+0x114>
ffffffffc02011d2:	4401                	li	s0,0
ffffffffc02011d4:	bc61                	j	ffffffffc0200c6c <buddy_check+0x56>
ffffffffc02011d6:	4a01                	li	s4,0
ffffffffc02011d8:	bb61                	j	ffffffffc0200f70 <buddy_check+0x35a>
    assert(n > 0);
ffffffffc02011da:	00001697          	auipc	a3,0x1
ffffffffc02011de:	b5668693          	addi	a3,a3,-1194 # ffffffffc0201d30 <etext+0x38a>
ffffffffc02011e2:	00001617          	auipc	a2,0x1
ffffffffc02011e6:	a3660613          	addi	a2,a2,-1482 # ffffffffc0201c18 <etext+0x272>
ffffffffc02011ea:	0a300593          	li	a1,163
ffffffffc02011ee:	00001517          	auipc	a0,0x1
ffffffffc02011f2:	a4250513          	addi	a0,a0,-1470 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02011f6:	fcdfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
                assert(!(b0 < a1 && a0 < b1));
ffffffffc02011fa:	00001697          	auipc	a3,0x1
ffffffffc02011fe:	d2e68693          	addi	a3,a3,-722 # ffffffffc0201f28 <etext+0x582>
ffffffffc0201202:	00001617          	auipc	a2,0x1
ffffffffc0201206:	a1660613          	addi	a2,a2,-1514 # ffffffffc0201c18 <etext+0x272>
ffffffffc020120a:	16800593          	li	a1,360
ffffffffc020120e:	00001517          	auipc	a0,0x1
ffffffffc0201212:	a2250513          	addi	a0,a0,-1502 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201216:	fadfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
        assert((page_index(p) & (need - 1)) == 0);
ffffffffc020121a:	00001697          	auipc	a3,0x1
ffffffffc020121e:	c8e68693          	addi	a3,a3,-882 # ffffffffc0201ea8 <etext+0x502>
ffffffffc0201222:	00001617          	auipc	a2,0x1
ffffffffc0201226:	9f660613          	addi	a2,a2,-1546 # ffffffffc0201c18 <etext+0x272>
ffffffffc020122a:	13000593          	li	a1,304
ffffffffc020122e:	00001517          	auipc	a0,0x1
ffffffffc0201232:	a0250513          	addi	a0,a0,-1534 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201236:	f8dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
        assert(buddy_nr_free_pages() == before + sz + sz);
ffffffffc020123a:	00001697          	auipc	a3,0x1
ffffffffc020123e:	cbe68693          	addi	a3,a3,-834 # ffffffffc0201ef8 <etext+0x552>
ffffffffc0201242:	00001617          	auipc	a2,0x1
ffffffffc0201246:	9d660613          	addi	a2,a2,-1578 # ffffffffc0201c18 <etext+0x272>
ffffffffc020124a:	14100593          	li	a1,321
ffffffffc020124e:	00001517          	auipc	a0,0x1
ffffffffc0201252:	9e250513          	addi	a0,a0,-1566 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201256:	f6dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
        assert(buddy_nr_free_pages() == baseline);
ffffffffc020125a:	00001697          	auipc	a3,0x1
ffffffffc020125e:	c7668693          	addi	a3,a3,-906 # ffffffffc0201ed0 <etext+0x52a>
ffffffffc0201262:	00001617          	auipc	a2,0x1
ffffffffc0201266:	9b660613          	addi	a2,a2,-1610 # ffffffffc0201c18 <etext+0x272>
ffffffffc020126a:	13200593          	li	a1,306
ffffffffc020126e:	00001517          	auipc	a0,0x1
ffffffffc0201272:	9c250513          	addi	a0,a0,-1598 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201276:	f4dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(buddy_nr_free_pages() + used == before);
ffffffffc020127a:	00001697          	auipc	a3,0x1
ffffffffc020127e:	bd668693          	addi	a3,a3,-1066 # ffffffffc0201e50 <etext+0x4aa>
ffffffffc0201282:	00001617          	auipc	a2,0x1
ffffffffc0201286:	99660613          	addi	a2,a2,-1642 # ffffffffc0201c18 <etext+0x272>
ffffffffc020128a:	11b00593          	li	a1,283
ffffffffc020128e:	00001517          	auipc	a0,0x1
ffffffffc0201292:	9a250513          	addi	a0,a0,-1630 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201296:	f2dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
        assert(buddy_nr_free_pages() == before);
ffffffffc020129a:	00001697          	auipc	a3,0x1
ffffffffc020129e:	bde68693          	addi	a3,a3,-1058 # ffffffffc0201e78 <etext+0x4d2>
ffffffffc02012a2:	00001617          	auipc	a2,0x1
ffffffffc02012a6:	97660613          	addi	a2,a2,-1674 # ffffffffc0201c18 <etext+0x272>
ffffffffc02012aa:	15100593          	li	a1,337
ffffffffc02012ae:	00001517          	auipc	a0,0x1
ffffffffc02012b2:	98250513          	addi	a0,a0,-1662 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02012b6:	f0dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(buddy_nr_free_pages() == before);
ffffffffc02012ba:	00001697          	auipc	a3,0x1
ffffffffc02012be:	bbe68693          	addi	a3,a3,-1090 # ffffffffc0201e78 <etext+0x4d2>
ffffffffc02012c2:	00001617          	auipc	a2,0x1
ffffffffc02012c6:	95660613          	addi	a2,a2,-1706 # ffffffffc0201c18 <etext+0x272>
ffffffffc02012ca:	12000593          	li	a1,288
ffffffffc02012ce:	00001517          	auipc	a0,0x1
ffffffffc02012d2:	96250513          	addi	a0,a0,-1694 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02012d6:	eedfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(c != NULL);
ffffffffc02012da:	00001697          	auipc	a3,0x1
ffffffffc02012de:	b3e68693          	addi	a3,a3,-1218 # ffffffffc0201e18 <etext+0x472>
ffffffffc02012e2:	00001617          	auipc	a2,0x1
ffffffffc02012e6:	93660613          	addi	a2,a2,-1738 # ffffffffc0201c18 <etext+0x272>
ffffffffc02012ea:	11800593          	li	a1,280
ffffffffc02012ee:	00001517          	auipc	a0,0x1
ffffffffc02012f2:	94250513          	addi	a0,a0,-1726 # ffffffffc0201c30 <etext+0x28a>
ffffffffc02012f6:	ecdfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(a != NULL);
ffffffffc02012fa:	00001697          	auipc	a3,0x1
ffffffffc02012fe:	a6668693          	addi	a3,a3,-1434 # ffffffffc0201d60 <etext+0x3ba>
ffffffffc0201302:	00001617          	auipc	a2,0x1
ffffffffc0201306:	91660613          	addi	a2,a2,-1770 # ffffffffc0201c18 <etext+0x272>
ffffffffc020130a:	10700593          	li	a1,263
ffffffffc020130e:	00001517          	auipc	a0,0x1
ffffffffc0201312:	92250513          	addi	a0,a0,-1758 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201316:	eadfe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    assert(buddy_nr_free_pages() >= start_free);
ffffffffc020131a:	00001697          	auipc	a3,0x1
ffffffffc020131e:	c2668693          	addi	a3,a3,-986 # ffffffffc0201f40 <etext+0x59a>
ffffffffc0201322:	00001617          	auipc	a2,0x1
ffffffffc0201326:	8f660613          	addi	a2,a2,-1802 # ffffffffc0201c18 <etext+0x272>
ffffffffc020132a:	17800593          	li	a1,376
ffffffffc020132e:	00001517          	auipc	a0,0x1
ffffffffc0201332:	90250513          	addi	a0,a0,-1790 # ffffffffc0201c30 <etext+0x28a>
ffffffffc0201336:	e8dfe0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc020133a <pmm_init>:
// init_pmm_manager - initialize a pmm_manager instance
static void init_pmm_manager(void) {
    // 默认使用 First-Fit，如需切换可改为 Best-Fit 或 Buddy：
    // pmm_manager = &best_fit_pmm_manager;
    // pmm_manager = &buddy_pmm_manager;
    pmm_manager = &buddy_pmm_manager;
ffffffffc020133a:	00001797          	auipc	a5,0x1
ffffffffc020133e:	c7678793          	addi	a5,a5,-906 # ffffffffc0201fb0 <buddy_pmm_manager>
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0201342:	638c                	ld	a1,0(a5)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
    }
}

/* pmm_init - initialize the physical memory management */
void pmm_init(void) {
ffffffffc0201344:	7179                	addi	sp,sp,-48
ffffffffc0201346:	f022                	sd	s0,32(sp)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0201348:	00001517          	auipc	a0,0x1
ffffffffc020134c:	ca050513          	addi	a0,a0,-864 # ffffffffc0201fe8 <buddy_pmm_manager+0x38>
    pmm_manager = &buddy_pmm_manager;
ffffffffc0201350:	00005417          	auipc	s0,0x5
ffffffffc0201354:	ef040413          	addi	s0,s0,-272 # ffffffffc0206240 <pmm_manager>
void pmm_init(void) {
ffffffffc0201358:	f406                	sd	ra,40(sp)
ffffffffc020135a:	ec26                	sd	s1,24(sp)
ffffffffc020135c:	e44e                	sd	s3,8(sp)
ffffffffc020135e:	e84a                	sd	s2,16(sp)
ffffffffc0201360:	e052                	sd	s4,0(sp)
    pmm_manager = &buddy_pmm_manager;
ffffffffc0201362:	e01c                	sd	a5,0(s0)
    cprintf("memory management: %s\n", pmm_manager->name);
ffffffffc0201364:	de9fe0ef          	jal	ra,ffffffffc020014c <cprintf>
    pmm_manager->init();
ffffffffc0201368:	601c                	ld	a5,0(s0)
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc020136a:	00005497          	auipc	s1,0x5
ffffffffc020136e:	eee48493          	addi	s1,s1,-274 # ffffffffc0206258 <va_pa_offset>
    pmm_manager->init();
ffffffffc0201372:	679c                	ld	a5,8(a5)
ffffffffc0201374:	9782                	jalr	a5
    va_pa_offset = PHYSICAL_MEMORY_OFFSET;
ffffffffc0201376:	57f5                	li	a5,-3
ffffffffc0201378:	07fa                	slli	a5,a5,0x1e
ffffffffc020137a:	e09c                	sd	a5,0(s1)
    uint64_t mem_begin = get_memory_base();
ffffffffc020137c:	a40ff0ef          	jal	ra,ffffffffc02005bc <get_memory_base>
ffffffffc0201380:	89aa                	mv	s3,a0
    uint64_t mem_size  = get_memory_size();
ffffffffc0201382:	a44ff0ef          	jal	ra,ffffffffc02005c6 <get_memory_size>
    if (mem_size == 0) {
ffffffffc0201386:	14050d63          	beqz	a0,ffffffffc02014e0 <pmm_init+0x1a6>
    uint64_t mem_end   = mem_begin + mem_size;
ffffffffc020138a:	892a                	mv	s2,a0
    cprintf("physcial memory map:\n");
ffffffffc020138c:	00001517          	auipc	a0,0x1
ffffffffc0201390:	ca450513          	addi	a0,a0,-860 # ffffffffc0202030 <buddy_pmm_manager+0x80>
ffffffffc0201394:	db9fe0ef          	jal	ra,ffffffffc020014c <cprintf>
    uint64_t mem_end   = mem_begin + mem_size;
ffffffffc0201398:	01298a33          	add	s4,s3,s2
    cprintf("  memory: 0x%016lx, [0x%016lx, 0x%016lx].\n", mem_size, mem_begin,
ffffffffc020139c:	864e                	mv	a2,s3
ffffffffc020139e:	fffa0693          	addi	a3,s4,-1
ffffffffc02013a2:	85ca                	mv	a1,s2
ffffffffc02013a4:	00001517          	auipc	a0,0x1
ffffffffc02013a8:	ca450513          	addi	a0,a0,-860 # ffffffffc0202048 <buddy_pmm_manager+0x98>
ffffffffc02013ac:	da1fe0ef          	jal	ra,ffffffffc020014c <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc02013b0:	c80007b7          	lui	a5,0xc8000
ffffffffc02013b4:	8652                	mv	a2,s4
ffffffffc02013b6:	0d47e463          	bltu	a5,s4,ffffffffc020147e <pmm_init+0x144>
ffffffffc02013ba:	00006797          	auipc	a5,0x6
ffffffffc02013be:	ea578793          	addi	a5,a5,-347 # ffffffffc020725f <end+0xfff>
ffffffffc02013c2:	757d                	lui	a0,0xfffff
ffffffffc02013c4:	8d7d                	and	a0,a0,a5
ffffffffc02013c6:	8231                	srli	a2,a2,0xc
ffffffffc02013c8:	00005797          	auipc	a5,0x5
ffffffffc02013cc:	e6c7b423          	sd	a2,-408(a5) # ffffffffc0206230 <npage>
    pages = (struct Page *)ROUNDUP((void *)end, PGSIZE);
ffffffffc02013d0:	00005797          	auipc	a5,0x5
ffffffffc02013d4:	e6a7b423          	sd	a0,-408(a5) # ffffffffc0206238 <pages>
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc02013d8:	000807b7          	lui	a5,0x80
ffffffffc02013dc:	002005b7          	lui	a1,0x200
ffffffffc02013e0:	02f60563          	beq	a2,a5,ffffffffc020140a <pmm_init+0xd0>
ffffffffc02013e4:	00261593          	slli	a1,a2,0x2
ffffffffc02013e8:	00c586b3          	add	a3,a1,a2
ffffffffc02013ec:	fec007b7          	lui	a5,0xfec00
ffffffffc02013f0:	97aa                	add	a5,a5,a0
ffffffffc02013f2:	068e                	slli	a3,a3,0x3
ffffffffc02013f4:	96be                	add	a3,a3,a5
ffffffffc02013f6:	87aa                	mv	a5,a0
        SetPageReserved(pages + i);
ffffffffc02013f8:	6798                	ld	a4,8(a5)
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc02013fa:	02878793          	addi	a5,a5,40 # fffffffffec00028 <end+0x3e9f9dc8>
        SetPageReserved(pages + i);
ffffffffc02013fe:	00176713          	ori	a4,a4,1
ffffffffc0201402:	fee7b023          	sd	a4,-32(a5)
    for (size_t i = 0; i < npage - nbase; i++) {
ffffffffc0201406:	fef699e3          	bne	a3,a5,ffffffffc02013f8 <pmm_init+0xbe>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc020140a:	95b2                	add	a1,a1,a2
ffffffffc020140c:	fec006b7          	lui	a3,0xfec00
ffffffffc0201410:	96aa                	add	a3,a3,a0
ffffffffc0201412:	058e                	slli	a1,a1,0x3
ffffffffc0201414:	96ae                	add	a3,a3,a1
ffffffffc0201416:	c02007b7          	lui	a5,0xc0200
ffffffffc020141a:	0af6e763          	bltu	a3,a5,ffffffffc02014c8 <pmm_init+0x18e>
ffffffffc020141e:	6098                	ld	a4,0(s1)
    mem_end = ROUNDDOWN(mem_end, PGSIZE);
ffffffffc0201420:	77fd                	lui	a5,0xfffff
ffffffffc0201422:	00fa75b3          	and	a1,s4,a5
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc0201426:	8e99                	sub	a3,a3,a4
    if (freemem < mem_end) {
ffffffffc0201428:	04b6ee63          	bltu	a3,a1,ffffffffc0201484 <pmm_init+0x14a>
    cprintf("[slub] selftest passed\n");
#endif
}

static void check_alloc_page(void) {
    pmm_manager->check();
ffffffffc020142c:	601c                	ld	a5,0(s0)
ffffffffc020142e:	7b9c                	ld	a5,48(a5)
ffffffffc0201430:	9782                	jalr	a5
    cprintf("check_alloc_page() succeeded!\n");
ffffffffc0201432:	00001517          	auipc	a0,0x1
ffffffffc0201436:	c9e50513          	addi	a0,a0,-866 # ffffffffc02020d0 <buddy_pmm_manager+0x120>
ffffffffc020143a:	d13fe0ef          	jal	ra,ffffffffc020014c <cprintf>
    satp_virtual = (pte_t*)boot_page_table_sv39;
ffffffffc020143e:	00004597          	auipc	a1,0x4
ffffffffc0201442:	bc258593          	addi	a1,a1,-1086 # ffffffffc0205000 <boot_page_table_sv39>
ffffffffc0201446:	00005797          	auipc	a5,0x5
ffffffffc020144a:	e0b7b523          	sd	a1,-502(a5) # ffffffffc0206250 <satp_virtual>
    satp_physical = PADDR(satp_virtual);
ffffffffc020144e:	c02007b7          	lui	a5,0xc0200
ffffffffc0201452:	0af5e363          	bltu	a1,a5,ffffffffc02014f8 <pmm_init+0x1be>
ffffffffc0201456:	6090                	ld	a2,0(s1)
}
ffffffffc0201458:	7402                	ld	s0,32(sp)
ffffffffc020145a:	70a2                	ld	ra,40(sp)
ffffffffc020145c:	64e2                	ld	s1,24(sp)
ffffffffc020145e:	6942                	ld	s2,16(sp)
ffffffffc0201460:	69a2                	ld	s3,8(sp)
ffffffffc0201462:	6a02                	ld	s4,0(sp)
    satp_physical = PADDR(satp_virtual);
ffffffffc0201464:	40c58633          	sub	a2,a1,a2
ffffffffc0201468:	00005797          	auipc	a5,0x5
ffffffffc020146c:	dec7b023          	sd	a2,-544(a5) # ffffffffc0206248 <satp_physical>
    cprintf("satp virtual address: 0x%016lx\nsatp physical address: 0x%016lx\n", satp_virtual, satp_physical);
ffffffffc0201470:	00001517          	auipc	a0,0x1
ffffffffc0201474:	c8050513          	addi	a0,a0,-896 # ffffffffc02020f0 <buddy_pmm_manager+0x140>
}
ffffffffc0201478:	6145                	addi	sp,sp,48
    cprintf("satp virtual address: 0x%016lx\nsatp physical address: 0x%016lx\n", satp_virtual, satp_physical);
ffffffffc020147a:	cd3fe06f          	j	ffffffffc020014c <cprintf>
    npage = maxpa / PGSIZE;
ffffffffc020147e:	c8000637          	lui	a2,0xc8000
ffffffffc0201482:	bf25                	j	ffffffffc02013ba <pmm_init+0x80>
    mem_begin = ROUNDUP(freemem, PGSIZE);
ffffffffc0201484:	6705                	lui	a4,0x1
ffffffffc0201486:	177d                	addi	a4,a4,-1
ffffffffc0201488:	96ba                	add	a3,a3,a4
ffffffffc020148a:	8efd                	and	a3,a3,a5
static inline int page_ref_dec(struct Page *page) {
    page->ref -= 1;
    return page->ref;
}
static inline struct Page *pa2page(uintptr_t pa) {
    if (PPN(pa) >= npage) {
ffffffffc020148c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201490:	02c7f063          	bgeu	a5,a2,ffffffffc02014b0 <pmm_init+0x176>
    pmm_manager->init_memmap(base, n);
ffffffffc0201494:	6010                	ld	a2,0(s0)
        panic("pa2page called with invalid pa");
    }
    return &pages[PPN(pa) - nbase];
ffffffffc0201496:	fff80737          	lui	a4,0xfff80
ffffffffc020149a:	973e                	add	a4,a4,a5
ffffffffc020149c:	00271793          	slli	a5,a4,0x2
ffffffffc02014a0:	97ba                	add	a5,a5,a4
ffffffffc02014a2:	6a18                	ld	a4,16(a2)
        init_memmap(pa2page(mem_begin), (mem_end - mem_begin) / PGSIZE);
ffffffffc02014a4:	8d95                	sub	a1,a1,a3
ffffffffc02014a6:	078e                	slli	a5,a5,0x3
    pmm_manager->init_memmap(base, n);
ffffffffc02014a8:	81b1                	srli	a1,a1,0xc
ffffffffc02014aa:	953e                	add	a0,a0,a5
ffffffffc02014ac:	9702                	jalr	a4
}
ffffffffc02014ae:	bfbd                	j	ffffffffc020142c <pmm_init+0xf2>
        panic("pa2page called with invalid pa");
ffffffffc02014b0:	00001617          	auipc	a2,0x1
ffffffffc02014b4:	bf060613          	addi	a2,a2,-1040 # ffffffffc02020a0 <buddy_pmm_manager+0xf0>
ffffffffc02014b8:	06a00593          	li	a1,106
ffffffffc02014bc:	00001517          	auipc	a0,0x1
ffffffffc02014c0:	c0450513          	addi	a0,a0,-1020 # ffffffffc02020c0 <buddy_pmm_manager+0x110>
ffffffffc02014c4:	cfffe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    uintptr_t freemem = PADDR((uintptr_t)pages + sizeof(struct Page) * (npage - nbase));
ffffffffc02014c8:	00001617          	auipc	a2,0x1
ffffffffc02014cc:	bb060613          	addi	a2,a2,-1104 # ffffffffc0202078 <buddy_pmm_manager+0xc8>
ffffffffc02014d0:	06300593          	li	a1,99
ffffffffc02014d4:	00001517          	auipc	a0,0x1
ffffffffc02014d8:	b4c50513          	addi	a0,a0,-1204 # ffffffffc0202020 <buddy_pmm_manager+0x70>
ffffffffc02014dc:	ce7fe0ef          	jal	ra,ffffffffc02001c2 <__panic>
        panic("DTB memory info not available");
ffffffffc02014e0:	00001617          	auipc	a2,0x1
ffffffffc02014e4:	b2060613          	addi	a2,a2,-1248 # ffffffffc0202000 <buddy_pmm_manager+0x50>
ffffffffc02014e8:	04b00593          	li	a1,75
ffffffffc02014ec:	00001517          	auipc	a0,0x1
ffffffffc02014f0:	b3450513          	addi	a0,a0,-1228 # ffffffffc0202020 <buddy_pmm_manager+0x70>
ffffffffc02014f4:	ccffe0ef          	jal	ra,ffffffffc02001c2 <__panic>
    satp_physical = PADDR(satp_virtual);
ffffffffc02014f8:	86ae                	mv	a3,a1
ffffffffc02014fa:	00001617          	auipc	a2,0x1
ffffffffc02014fe:	b7e60613          	addi	a2,a2,-1154 # ffffffffc0202078 <buddy_pmm_manager+0xc8>
ffffffffc0201502:	07e00593          	li	a1,126
ffffffffc0201506:	00001517          	auipc	a0,0x1
ffffffffc020150a:	b1a50513          	addi	a0,a0,-1254 # ffffffffc0202020 <buddy_pmm_manager+0x70>
ffffffffc020150e:	cb5fe0ef          	jal	ra,ffffffffc02001c2 <__panic>

ffffffffc0201512 <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
ffffffffc0201512:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc0201516:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
ffffffffc0201518:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc020151c:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
ffffffffc020151e:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
ffffffffc0201522:	f022                	sd	s0,32(sp)
ffffffffc0201524:	ec26                	sd	s1,24(sp)
ffffffffc0201526:	e84a                	sd	s2,16(sp)
ffffffffc0201528:	f406                	sd	ra,40(sp)
ffffffffc020152a:	e44e                	sd	s3,8(sp)
ffffffffc020152c:	84aa                	mv	s1,a0
ffffffffc020152e:	892e                	mv	s2,a1
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
ffffffffc0201530:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
ffffffffc0201534:	2a01                	sext.w	s4,s4
    if (num >= base) {
ffffffffc0201536:	03067e63          	bgeu	a2,a6,ffffffffc0201572 <printnum+0x60>
ffffffffc020153a:	89be                	mv	s3,a5
        while (-- width > 0)
ffffffffc020153c:	00805763          	blez	s0,ffffffffc020154a <printnum+0x38>
ffffffffc0201540:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
ffffffffc0201542:	85ca                	mv	a1,s2
ffffffffc0201544:	854e                	mv	a0,s3
ffffffffc0201546:	9482                	jalr	s1
        while (-- width > 0)
ffffffffc0201548:	fc65                	bnez	s0,ffffffffc0201540 <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
ffffffffc020154a:	1a02                	slli	s4,s4,0x20
ffffffffc020154c:	00001797          	auipc	a5,0x1
ffffffffc0201550:	be478793          	addi	a5,a5,-1052 # ffffffffc0202130 <buddy_pmm_manager+0x180>
ffffffffc0201554:	020a5a13          	srli	s4,s4,0x20
ffffffffc0201558:	9a3e                	add	s4,s4,a5
}
ffffffffc020155a:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc020155c:	000a4503          	lbu	a0,0(s4)
}
ffffffffc0201560:	70a2                	ld	ra,40(sp)
ffffffffc0201562:	69a2                	ld	s3,8(sp)
ffffffffc0201564:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201566:	85ca                	mv	a1,s2
ffffffffc0201568:	87a6                	mv	a5,s1
}
ffffffffc020156a:	6942                	ld	s2,16(sp)
ffffffffc020156c:	64e2                	ld	s1,24(sp)
ffffffffc020156e:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
ffffffffc0201570:	8782                	jr	a5
        printnum(putch, putdat, result, base, width - 1, padc);
ffffffffc0201572:	03065633          	divu	a2,a2,a6
ffffffffc0201576:	8722                	mv	a4,s0
ffffffffc0201578:	f9bff0ef          	jal	ra,ffffffffc0201512 <printnum>
ffffffffc020157c:	b7f9                	j	ffffffffc020154a <printnum+0x38>

ffffffffc020157e <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
ffffffffc020157e:	7119                	addi	sp,sp,-128
ffffffffc0201580:	f4a6                	sd	s1,104(sp)
ffffffffc0201582:	f0ca                	sd	s2,96(sp)
ffffffffc0201584:	ecce                	sd	s3,88(sp)
ffffffffc0201586:	e8d2                	sd	s4,80(sp)
ffffffffc0201588:	e4d6                	sd	s5,72(sp)
ffffffffc020158a:	e0da                	sd	s6,64(sp)
ffffffffc020158c:	fc5e                	sd	s7,56(sp)
ffffffffc020158e:	f06a                	sd	s10,32(sp)
ffffffffc0201590:	fc86                	sd	ra,120(sp)
ffffffffc0201592:	f8a2                	sd	s0,112(sp)
ffffffffc0201594:	f862                	sd	s8,48(sp)
ffffffffc0201596:	f466                	sd	s9,40(sp)
ffffffffc0201598:	ec6e                	sd	s11,24(sp)
ffffffffc020159a:	892a                	mv	s2,a0
ffffffffc020159c:	84ae                	mv	s1,a1
ffffffffc020159e:	8d32                	mv	s10,a2
ffffffffc02015a0:	8a36                	mv	s4,a3
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc02015a2:	02500993          	li	s3,37
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
ffffffffc02015a6:	5b7d                	li	s6,-1
ffffffffc02015a8:	00001a97          	auipc	s5,0x1
ffffffffc02015ac:	bbca8a93          	addi	s5,s5,-1092 # ffffffffc0202164 <buddy_pmm_manager+0x1b4>
        case 'e':
            err = va_arg(ap, int);
            if (err < 0) {
                err = -err;
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc02015b0:	00001b97          	auipc	s7,0x1
ffffffffc02015b4:	d90b8b93          	addi	s7,s7,-624 # ffffffffc0202340 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc02015b8:	000d4503          	lbu	a0,0(s10)
ffffffffc02015bc:	001d0413          	addi	s0,s10,1
ffffffffc02015c0:	01350a63          	beq	a0,s3,ffffffffc02015d4 <vprintfmt+0x56>
            if (ch == '\0') {
ffffffffc02015c4:	c121                	beqz	a0,ffffffffc0201604 <vprintfmt+0x86>
            putch(ch, putdat);
ffffffffc02015c6:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc02015c8:	0405                	addi	s0,s0,1
            putch(ch, putdat);
ffffffffc02015ca:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
ffffffffc02015cc:	fff44503          	lbu	a0,-1(s0)
ffffffffc02015d0:	ff351ae3          	bne	a0,s3,ffffffffc02015c4 <vprintfmt+0x46>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02015d4:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
ffffffffc02015d8:	02000793          	li	a5,32
        lflag = altflag = 0;
ffffffffc02015dc:	4c81                	li	s9,0
ffffffffc02015de:	4881                	li	a7,0
        width = precision = -1;
ffffffffc02015e0:	5c7d                	li	s8,-1
ffffffffc02015e2:	5dfd                	li	s11,-1
ffffffffc02015e4:	05500513          	li	a0,85
                if (ch < '0' || ch > '9') {
ffffffffc02015e8:	4825                	li	a6,9
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02015ea:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02015ee:	0ff5f593          	zext.b	a1,a1
ffffffffc02015f2:	00140d13          	addi	s10,s0,1
ffffffffc02015f6:	04b56263          	bltu	a0,a1,ffffffffc020163a <vprintfmt+0xbc>
ffffffffc02015fa:	058a                	slli	a1,a1,0x2
ffffffffc02015fc:	95d6                	add	a1,a1,s5
ffffffffc02015fe:	4194                	lw	a3,0(a1)
ffffffffc0201600:	96d6                	add	a3,a3,s5
ffffffffc0201602:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
ffffffffc0201604:	70e6                	ld	ra,120(sp)
ffffffffc0201606:	7446                	ld	s0,112(sp)
ffffffffc0201608:	74a6                	ld	s1,104(sp)
ffffffffc020160a:	7906                	ld	s2,96(sp)
ffffffffc020160c:	69e6                	ld	s3,88(sp)
ffffffffc020160e:	6a46                	ld	s4,80(sp)
ffffffffc0201610:	6aa6                	ld	s5,72(sp)
ffffffffc0201612:	6b06                	ld	s6,64(sp)
ffffffffc0201614:	7be2                	ld	s7,56(sp)
ffffffffc0201616:	7c42                	ld	s8,48(sp)
ffffffffc0201618:	7ca2                	ld	s9,40(sp)
ffffffffc020161a:	7d02                	ld	s10,32(sp)
ffffffffc020161c:	6de2                	ld	s11,24(sp)
ffffffffc020161e:	6109                	addi	sp,sp,128
ffffffffc0201620:	8082                	ret
            padc = '0';
ffffffffc0201622:	87b2                	mv	a5,a2
            goto reswitch;
ffffffffc0201624:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201628:	846a                	mv	s0,s10
ffffffffc020162a:	00140d13          	addi	s10,s0,1
ffffffffc020162e:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0201632:	0ff5f593          	zext.b	a1,a1
ffffffffc0201636:	fcb572e3          	bgeu	a0,a1,ffffffffc02015fa <vprintfmt+0x7c>
            putch('%', putdat);
ffffffffc020163a:	85a6                	mv	a1,s1
ffffffffc020163c:	02500513          	li	a0,37
ffffffffc0201640:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
ffffffffc0201642:	fff44783          	lbu	a5,-1(s0)
ffffffffc0201646:	8d22                	mv	s10,s0
ffffffffc0201648:	f73788e3          	beq	a5,s3,ffffffffc02015b8 <vprintfmt+0x3a>
ffffffffc020164c:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0201650:	1d7d                	addi	s10,s10,-1
ffffffffc0201652:	ff379de3          	bne	a5,s3,ffffffffc020164c <vprintfmt+0xce>
ffffffffc0201656:	b78d                	j	ffffffffc02015b8 <vprintfmt+0x3a>
                precision = precision * 10 + ch - '0';
ffffffffc0201658:	fd060c1b          	addiw	s8,a2,-48
                ch = *fmt;
ffffffffc020165c:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201660:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
ffffffffc0201662:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
ffffffffc0201666:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc020166a:	02d86463          	bltu	a6,a3,ffffffffc0201692 <vprintfmt+0x114>
                ch = *fmt;
ffffffffc020166e:	00144603          	lbu	a2,1(s0)
                precision = precision * 10 + ch - '0';
ffffffffc0201672:	002c169b          	slliw	a3,s8,0x2
ffffffffc0201676:	0186873b          	addw	a4,a3,s8
ffffffffc020167a:	0017171b          	slliw	a4,a4,0x1
ffffffffc020167e:	9f2d                	addw	a4,a4,a1
                if (ch < '0' || ch > '9') {
ffffffffc0201680:	fd06069b          	addiw	a3,a2,-48
            for (precision = 0; ; ++ fmt) {
ffffffffc0201684:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
ffffffffc0201686:	fd070c1b          	addiw	s8,a4,-48
                ch = *fmt;
ffffffffc020168a:	0006059b          	sext.w	a1,a2
                if (ch < '0' || ch > '9') {
ffffffffc020168e:	fed870e3          	bgeu	a6,a3,ffffffffc020166e <vprintfmt+0xf0>
            if (width < 0)
ffffffffc0201692:	f40ddce3          	bgez	s11,ffffffffc02015ea <vprintfmt+0x6c>
                width = precision, precision = -1;
ffffffffc0201696:	8de2                	mv	s11,s8
ffffffffc0201698:	5c7d                	li	s8,-1
ffffffffc020169a:	bf81                	j	ffffffffc02015ea <vprintfmt+0x6c>
            if (width < 0)
ffffffffc020169c:	fffdc693          	not	a3,s11
ffffffffc02016a0:	96fd                	srai	a3,a3,0x3f
ffffffffc02016a2:	00ddfdb3          	and	s11,s11,a3
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02016a6:	00144603          	lbu	a2,1(s0)
ffffffffc02016aa:	2d81                	sext.w	s11,s11
ffffffffc02016ac:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc02016ae:	bf35                	j	ffffffffc02015ea <vprintfmt+0x6c>
            precision = va_arg(ap, int);
ffffffffc02016b0:	000a2c03          	lw	s8,0(s4)
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02016b4:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
ffffffffc02016b8:	0a21                	addi	s4,s4,8
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc02016ba:	846a                	mv	s0,s10
            goto process_precision;
ffffffffc02016bc:	bfd9                	j	ffffffffc0201692 <vprintfmt+0x114>
    if (lflag >= 2) {
ffffffffc02016be:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02016c0:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02016c4:	01174463          	blt	a4,a7,ffffffffc02016cc <vprintfmt+0x14e>
    else if (lflag) {
ffffffffc02016c8:	1a088e63          	beqz	a7,ffffffffc0201884 <vprintfmt+0x306>
        return va_arg(*ap, unsigned long);
ffffffffc02016cc:	000a3603          	ld	a2,0(s4)
ffffffffc02016d0:	46c1                	li	a3,16
ffffffffc02016d2:	8a2e                	mv	s4,a1
            printnum(putch, putdat, num, base, width, padc);
ffffffffc02016d4:	2781                	sext.w	a5,a5
ffffffffc02016d6:	876e                	mv	a4,s11
ffffffffc02016d8:	85a6                	mv	a1,s1
ffffffffc02016da:	854a                	mv	a0,s2
ffffffffc02016dc:	e37ff0ef          	jal	ra,ffffffffc0201512 <printnum>
            break;
ffffffffc02016e0:	bde1                	j	ffffffffc02015b8 <vprintfmt+0x3a>
            putch(va_arg(ap, int), putdat);
ffffffffc02016e2:	000a2503          	lw	a0,0(s4)
ffffffffc02016e6:	85a6                	mv	a1,s1
ffffffffc02016e8:	0a21                	addi	s4,s4,8
ffffffffc02016ea:	9902                	jalr	s2
            break;
ffffffffc02016ec:	b5f1                	j	ffffffffc02015b8 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc02016ee:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02016f0:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc02016f4:	01174463          	blt	a4,a7,ffffffffc02016fc <vprintfmt+0x17e>
    else if (lflag) {
ffffffffc02016f8:	18088163          	beqz	a7,ffffffffc020187a <vprintfmt+0x2fc>
        return va_arg(*ap, unsigned long);
ffffffffc02016fc:	000a3603          	ld	a2,0(s4)
ffffffffc0201700:	46a9                	li	a3,10
ffffffffc0201702:	8a2e                	mv	s4,a1
ffffffffc0201704:	bfc1                	j	ffffffffc02016d4 <vprintfmt+0x156>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201706:	00144603          	lbu	a2,1(s0)
            altflag = 1;
ffffffffc020170a:	4c85                	li	s9,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020170c:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc020170e:	bdf1                	j	ffffffffc02015ea <vprintfmt+0x6c>
            putch(ch, putdat);
ffffffffc0201710:	85a6                	mv	a1,s1
ffffffffc0201712:	02500513          	li	a0,37
ffffffffc0201716:	9902                	jalr	s2
            break;
ffffffffc0201718:	b545                	j	ffffffffc02015b8 <vprintfmt+0x3a>
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc020171a:	00144603          	lbu	a2,1(s0)
            lflag ++;
ffffffffc020171e:	2885                	addiw	a7,a7,1
        switch (ch = *(unsigned char *)fmt ++) {
ffffffffc0201720:	846a                	mv	s0,s10
            goto reswitch;
ffffffffc0201722:	b5e1                	j	ffffffffc02015ea <vprintfmt+0x6c>
    if (lflag >= 2) {
ffffffffc0201724:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc0201726:	008a0593          	addi	a1,s4,8
    if (lflag >= 2) {
ffffffffc020172a:	01174463          	blt	a4,a7,ffffffffc0201732 <vprintfmt+0x1b4>
    else if (lflag) {
ffffffffc020172e:	14088163          	beqz	a7,ffffffffc0201870 <vprintfmt+0x2f2>
        return va_arg(*ap, unsigned long);
ffffffffc0201732:	000a3603          	ld	a2,0(s4)
ffffffffc0201736:	46a1                	li	a3,8
ffffffffc0201738:	8a2e                	mv	s4,a1
ffffffffc020173a:	bf69                	j	ffffffffc02016d4 <vprintfmt+0x156>
            putch('0', putdat);
ffffffffc020173c:	03000513          	li	a0,48
ffffffffc0201740:	85a6                	mv	a1,s1
ffffffffc0201742:	e03e                	sd	a5,0(sp)
ffffffffc0201744:	9902                	jalr	s2
            putch('x', putdat);
ffffffffc0201746:	85a6                	mv	a1,s1
ffffffffc0201748:	07800513          	li	a0,120
ffffffffc020174c:	9902                	jalr	s2
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc020174e:	0a21                	addi	s4,s4,8
            goto number;
ffffffffc0201750:	6782                	ld	a5,0(sp)
ffffffffc0201752:	46c1                	li	a3,16
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
ffffffffc0201754:	ff8a3603          	ld	a2,-8(s4)
            goto number;
ffffffffc0201758:	bfb5                	j	ffffffffc02016d4 <vprintfmt+0x156>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc020175a:	000a3403          	ld	s0,0(s4)
ffffffffc020175e:	008a0713          	addi	a4,s4,8
ffffffffc0201762:	e03a                	sd	a4,0(sp)
ffffffffc0201764:	14040263          	beqz	s0,ffffffffc02018a8 <vprintfmt+0x32a>
            if (width > 0 && padc != '-') {
ffffffffc0201768:	0fb05763          	blez	s11,ffffffffc0201856 <vprintfmt+0x2d8>
ffffffffc020176c:	02d00693          	li	a3,45
ffffffffc0201770:	0cd79163          	bne	a5,a3,ffffffffc0201832 <vprintfmt+0x2b4>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201774:	00044783          	lbu	a5,0(s0)
ffffffffc0201778:	0007851b          	sext.w	a0,a5
ffffffffc020177c:	cf85                	beqz	a5,ffffffffc02017b4 <vprintfmt+0x236>
ffffffffc020177e:	00140a13          	addi	s4,s0,1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201782:	05e00413          	li	s0,94
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201786:	000c4563          	bltz	s8,ffffffffc0201790 <vprintfmt+0x212>
ffffffffc020178a:	3c7d                	addiw	s8,s8,-1
ffffffffc020178c:	036c0263          	beq	s8,s6,ffffffffc02017b0 <vprintfmt+0x232>
                    putch('?', putdat);
ffffffffc0201790:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201792:	0e0c8e63          	beqz	s9,ffffffffc020188e <vprintfmt+0x310>
ffffffffc0201796:	3781                	addiw	a5,a5,-32
ffffffffc0201798:	0ef47b63          	bgeu	s0,a5,ffffffffc020188e <vprintfmt+0x310>
                    putch('?', putdat);
ffffffffc020179c:	03f00513          	li	a0,63
ffffffffc02017a0:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc02017a2:	000a4783          	lbu	a5,0(s4)
ffffffffc02017a6:	3dfd                	addiw	s11,s11,-1
ffffffffc02017a8:	0a05                	addi	s4,s4,1
ffffffffc02017aa:	0007851b          	sext.w	a0,a5
ffffffffc02017ae:	ffe1                	bnez	a5,ffffffffc0201786 <vprintfmt+0x208>
            for (; width > 0; width --) {
ffffffffc02017b0:	01b05963          	blez	s11,ffffffffc02017c2 <vprintfmt+0x244>
ffffffffc02017b4:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
ffffffffc02017b6:	85a6                	mv	a1,s1
ffffffffc02017b8:	02000513          	li	a0,32
ffffffffc02017bc:	9902                	jalr	s2
            for (; width > 0; width --) {
ffffffffc02017be:	fe0d9be3          	bnez	s11,ffffffffc02017b4 <vprintfmt+0x236>
            if ((p = va_arg(ap, char *)) == NULL) {
ffffffffc02017c2:	6a02                	ld	s4,0(sp)
ffffffffc02017c4:	bbd5                	j	ffffffffc02015b8 <vprintfmt+0x3a>
    if (lflag >= 2) {
ffffffffc02017c6:	4705                	li	a4,1
            precision = va_arg(ap, int);
ffffffffc02017c8:	008a0c93          	addi	s9,s4,8
    if (lflag >= 2) {
ffffffffc02017cc:	01174463          	blt	a4,a7,ffffffffc02017d4 <vprintfmt+0x256>
    else if (lflag) {
ffffffffc02017d0:	08088d63          	beqz	a7,ffffffffc020186a <vprintfmt+0x2ec>
        return va_arg(*ap, long);
ffffffffc02017d4:	000a3403          	ld	s0,0(s4)
            if ((long long)num < 0) {
ffffffffc02017d8:	0a044d63          	bltz	s0,ffffffffc0201892 <vprintfmt+0x314>
            num = getint(&ap, lflag);
ffffffffc02017dc:	8622                	mv	a2,s0
ffffffffc02017de:	8a66                	mv	s4,s9
ffffffffc02017e0:	46a9                	li	a3,10
ffffffffc02017e2:	bdcd                	j	ffffffffc02016d4 <vprintfmt+0x156>
            err = va_arg(ap, int);
ffffffffc02017e4:	000a2783          	lw	a5,0(s4)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc02017e8:	4719                	li	a4,6
            err = va_arg(ap, int);
ffffffffc02017ea:	0a21                	addi	s4,s4,8
            if (err < 0) {
ffffffffc02017ec:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc02017f0:	8fb5                	xor	a5,a5,a3
ffffffffc02017f2:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
ffffffffc02017f6:	02d74163          	blt	a4,a3,ffffffffc0201818 <vprintfmt+0x29a>
ffffffffc02017fa:	00369793          	slli	a5,a3,0x3
ffffffffc02017fe:	97de                	add	a5,a5,s7
ffffffffc0201800:	639c                	ld	a5,0(a5)
ffffffffc0201802:	cb99                	beqz	a5,ffffffffc0201818 <vprintfmt+0x29a>
                printfmt(putch, putdat, "%s", p);
ffffffffc0201804:	86be                	mv	a3,a5
ffffffffc0201806:	00001617          	auipc	a2,0x1
ffffffffc020180a:	95a60613          	addi	a2,a2,-1702 # ffffffffc0202160 <buddy_pmm_manager+0x1b0>
ffffffffc020180e:	85a6                	mv	a1,s1
ffffffffc0201810:	854a                	mv	a0,s2
ffffffffc0201812:	0ce000ef          	jal	ra,ffffffffc02018e0 <printfmt>
ffffffffc0201816:	b34d                	j	ffffffffc02015b8 <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
ffffffffc0201818:	00001617          	auipc	a2,0x1
ffffffffc020181c:	93860613          	addi	a2,a2,-1736 # ffffffffc0202150 <buddy_pmm_manager+0x1a0>
ffffffffc0201820:	85a6                	mv	a1,s1
ffffffffc0201822:	854a                	mv	a0,s2
ffffffffc0201824:	0bc000ef          	jal	ra,ffffffffc02018e0 <printfmt>
ffffffffc0201828:	bb41                	j	ffffffffc02015b8 <vprintfmt+0x3a>
                p = "(null)";
ffffffffc020182a:	00001417          	auipc	s0,0x1
ffffffffc020182e:	91e40413          	addi	s0,s0,-1762 # ffffffffc0202148 <buddy_pmm_manager+0x198>
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0201832:	85e2                	mv	a1,s8
ffffffffc0201834:	8522                	mv	a0,s0
ffffffffc0201836:	e43e                	sd	a5,8(sp)
ffffffffc0201838:	0fc000ef          	jal	ra,ffffffffc0201934 <strnlen>
ffffffffc020183c:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0201840:	01b05b63          	blez	s11,ffffffffc0201856 <vprintfmt+0x2d8>
                    putch(padc, putdat);
ffffffffc0201844:	67a2                	ld	a5,8(sp)
ffffffffc0201846:	00078a1b          	sext.w	s4,a5
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc020184a:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
ffffffffc020184c:	85a6                	mv	a1,s1
ffffffffc020184e:	8552                	mv	a0,s4
ffffffffc0201850:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
ffffffffc0201852:	fe0d9ce3          	bnez	s11,ffffffffc020184a <vprintfmt+0x2cc>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc0201856:	00044783          	lbu	a5,0(s0)
ffffffffc020185a:	00140a13          	addi	s4,s0,1
ffffffffc020185e:	0007851b          	sext.w	a0,a5
ffffffffc0201862:	d3a5                	beqz	a5,ffffffffc02017c2 <vprintfmt+0x244>
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc0201864:	05e00413          	li	s0,94
ffffffffc0201868:	bf39                	j	ffffffffc0201786 <vprintfmt+0x208>
        return va_arg(*ap, int);
ffffffffc020186a:	000a2403          	lw	s0,0(s4)
ffffffffc020186e:	b7ad                	j	ffffffffc02017d8 <vprintfmt+0x25a>
        return va_arg(*ap, unsigned int);
ffffffffc0201870:	000a6603          	lwu	a2,0(s4)
ffffffffc0201874:	46a1                	li	a3,8
ffffffffc0201876:	8a2e                	mv	s4,a1
ffffffffc0201878:	bdb1                	j	ffffffffc02016d4 <vprintfmt+0x156>
ffffffffc020187a:	000a6603          	lwu	a2,0(s4)
ffffffffc020187e:	46a9                	li	a3,10
ffffffffc0201880:	8a2e                	mv	s4,a1
ffffffffc0201882:	bd89                	j	ffffffffc02016d4 <vprintfmt+0x156>
ffffffffc0201884:	000a6603          	lwu	a2,0(s4)
ffffffffc0201888:	46c1                	li	a3,16
ffffffffc020188a:	8a2e                	mv	s4,a1
ffffffffc020188c:	b5a1                	j	ffffffffc02016d4 <vprintfmt+0x156>
                    putch(ch, putdat);
ffffffffc020188e:	9902                	jalr	s2
ffffffffc0201890:	bf09                	j	ffffffffc02017a2 <vprintfmt+0x224>
                putch('-', putdat);
ffffffffc0201892:	85a6                	mv	a1,s1
ffffffffc0201894:	02d00513          	li	a0,45
ffffffffc0201898:	e03e                	sd	a5,0(sp)
ffffffffc020189a:	9902                	jalr	s2
                num = -(long long)num;
ffffffffc020189c:	6782                	ld	a5,0(sp)
ffffffffc020189e:	8a66                	mv	s4,s9
ffffffffc02018a0:	40800633          	neg	a2,s0
ffffffffc02018a4:	46a9                	li	a3,10
ffffffffc02018a6:	b53d                	j	ffffffffc02016d4 <vprintfmt+0x156>
            if (width > 0 && padc != '-') {
ffffffffc02018a8:	03b05163          	blez	s11,ffffffffc02018ca <vprintfmt+0x34c>
ffffffffc02018ac:	02d00693          	li	a3,45
ffffffffc02018b0:	f6d79de3          	bne	a5,a3,ffffffffc020182a <vprintfmt+0x2ac>
                p = "(null)";
ffffffffc02018b4:	00001417          	auipc	s0,0x1
ffffffffc02018b8:	89440413          	addi	s0,s0,-1900 # ffffffffc0202148 <buddy_pmm_manager+0x198>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
ffffffffc02018bc:	02800793          	li	a5,40
ffffffffc02018c0:	02800513          	li	a0,40
ffffffffc02018c4:	00140a13          	addi	s4,s0,1
ffffffffc02018c8:	bd6d                	j	ffffffffc0201782 <vprintfmt+0x204>
ffffffffc02018ca:	00001a17          	auipc	s4,0x1
ffffffffc02018ce:	87fa0a13          	addi	s4,s4,-1921 # ffffffffc0202149 <buddy_pmm_manager+0x199>
ffffffffc02018d2:	02800513          	li	a0,40
ffffffffc02018d6:	02800793          	li	a5,40
                if (altflag && (ch < ' ' || ch > '~')) {
ffffffffc02018da:	05e00413          	li	s0,94
ffffffffc02018de:	b565                	j	ffffffffc0201786 <vprintfmt+0x208>

ffffffffc02018e0 <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02018e0:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
ffffffffc02018e2:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02018e6:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc02018e8:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
ffffffffc02018ea:	ec06                	sd	ra,24(sp)
ffffffffc02018ec:	f83a                	sd	a4,48(sp)
ffffffffc02018ee:	fc3e                	sd	a5,56(sp)
ffffffffc02018f0:	e0c2                	sd	a6,64(sp)
ffffffffc02018f2:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
ffffffffc02018f4:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
ffffffffc02018f6:	c89ff0ef          	jal	ra,ffffffffc020157e <vprintfmt>
}
ffffffffc02018fa:	60e2                	ld	ra,24(sp)
ffffffffc02018fc:	6161                	addi	sp,sp,80
ffffffffc02018fe:	8082                	ret

ffffffffc0201900 <sbi_console_putchar>:
uint64_t SBI_REMOTE_SFENCE_VMA_ASID = 7;
uint64_t SBI_SHUTDOWN = 8;

uint64_t sbi_call(uint64_t sbi_type, uint64_t arg0, uint64_t arg1, uint64_t arg2) {
    uint64_t ret_val;
    __asm__ volatile (
ffffffffc0201900:	4781                	li	a5,0
ffffffffc0201902:	00004717          	auipc	a4,0x4
ffffffffc0201906:	70e73703          	ld	a4,1806(a4) # ffffffffc0206010 <SBI_CONSOLE_PUTCHAR>
ffffffffc020190a:	88ba                	mv	a7,a4
ffffffffc020190c:	852a                	mv	a0,a0
ffffffffc020190e:	85be                	mv	a1,a5
ffffffffc0201910:	863e                	mv	a2,a5
ffffffffc0201912:	00000073          	ecall
ffffffffc0201916:	87aa                	mv	a5,a0
    return ret_val;
}

void sbi_console_putchar(unsigned char ch) {
    sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
}
ffffffffc0201918:	8082                	ret

ffffffffc020191a <strlen>:
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
ffffffffc020191a:	00054783          	lbu	a5,0(a0)
strlen(const char *s) {
ffffffffc020191e:	872a                	mv	a4,a0
    size_t cnt = 0;
ffffffffc0201920:	4501                	li	a0,0
    while (*s ++ != '\0') {
ffffffffc0201922:	cb81                	beqz	a5,ffffffffc0201932 <strlen+0x18>
        cnt ++;
ffffffffc0201924:	0505                	addi	a0,a0,1
    while (*s ++ != '\0') {
ffffffffc0201926:	00a707b3          	add	a5,a4,a0
ffffffffc020192a:	0007c783          	lbu	a5,0(a5)
ffffffffc020192e:	fbfd                	bnez	a5,ffffffffc0201924 <strlen+0xa>
ffffffffc0201930:	8082                	ret
    }
    return cnt;
}
ffffffffc0201932:	8082                	ret

ffffffffc0201934 <strnlen>:
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
ffffffffc0201934:	4781                	li	a5,0
    while (cnt < len && *s ++ != '\0') {
ffffffffc0201936:	e589                	bnez	a1,ffffffffc0201940 <strnlen+0xc>
ffffffffc0201938:	a811                	j	ffffffffc020194c <strnlen+0x18>
        cnt ++;
ffffffffc020193a:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
ffffffffc020193c:	00f58863          	beq	a1,a5,ffffffffc020194c <strnlen+0x18>
ffffffffc0201940:	00f50733          	add	a4,a0,a5
ffffffffc0201944:	00074703          	lbu	a4,0(a4)
ffffffffc0201948:	fb6d                	bnez	a4,ffffffffc020193a <strnlen+0x6>
ffffffffc020194a:	85be                	mv	a1,a5
    }
    return cnt;
}
ffffffffc020194c:	852e                	mv	a0,a1
ffffffffc020194e:	8082                	ret

ffffffffc0201950 <strcmp>:
int
strcmp(const char *s1, const char *s2) {
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
#else
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0201950:	00054783          	lbu	a5,0(a0)
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201954:	0005c703          	lbu	a4,0(a1)
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc0201958:	cb89                	beqz	a5,ffffffffc020196a <strcmp+0x1a>
        s1 ++, s2 ++;
ffffffffc020195a:	0505                	addi	a0,a0,1
ffffffffc020195c:	0585                	addi	a1,a1,1
    while (*s1 != '\0' && *s1 == *s2) {
ffffffffc020195e:	fee789e3          	beq	a5,a4,ffffffffc0201950 <strcmp>
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201962:	0007851b          	sext.w	a0,a5
#endif /* __HAVE_ARCH_STRCMP */
}
ffffffffc0201966:	9d19                	subw	a0,a0,a4
ffffffffc0201968:	8082                	ret
ffffffffc020196a:	4501                	li	a0,0
ffffffffc020196c:	bfed                	j	ffffffffc0201966 <strcmp+0x16>

ffffffffc020196e <strncmp>:
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc020196e:	c20d                	beqz	a2,ffffffffc0201990 <strncmp+0x22>
ffffffffc0201970:	962e                	add	a2,a2,a1
ffffffffc0201972:	a031                	j	ffffffffc020197e <strncmp+0x10>
        n --, s1 ++, s2 ++;
ffffffffc0201974:	0505                	addi	a0,a0,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0201976:	00e79a63          	bne	a5,a4,ffffffffc020198a <strncmp+0x1c>
ffffffffc020197a:	00b60b63          	beq	a2,a1,ffffffffc0201990 <strncmp+0x22>
ffffffffc020197e:	00054783          	lbu	a5,0(a0)
        n --, s1 ++, s2 ++;
ffffffffc0201982:	0585                	addi	a1,a1,1
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
ffffffffc0201984:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0201988:	f7f5                	bnez	a5,ffffffffc0201974 <strncmp+0x6>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc020198a:	40e7853b          	subw	a0,a5,a4
}
ffffffffc020198e:	8082                	ret
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
ffffffffc0201990:	4501                	li	a0,0
ffffffffc0201992:	8082                	ret

ffffffffc0201994 <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
ffffffffc0201994:	ca01                	beqz	a2,ffffffffc02019a4 <memset+0x10>
ffffffffc0201996:	962a                	add	a2,a2,a0
    char *p = s;
ffffffffc0201998:	87aa                	mv	a5,a0
        *p ++ = c;
ffffffffc020199a:	0785                	addi	a5,a5,1
ffffffffc020199c:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
ffffffffc02019a0:	fec79de3          	bne	a5,a2,ffffffffc020199a <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
ffffffffc02019a4:	8082                	ret
