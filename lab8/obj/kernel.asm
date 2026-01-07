
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	3da0b0ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	43e58593          	addi	a1,a1,1086 # ffffffffc020b4a8 <etext+0x2>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	45650513          	addi	a0,a0,1110 # ffffffffc020b4c8 <etext+0x22>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	24b020ef          	jal	ra,ffffffffc0202ad0 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	6d7030ef          	jal	ra,ffffffffc0203f68 <vmm_init>
ffffffffc0200096:	136070ef          	jal	ra,ffffffffc02071cc <sched_init>
ffffffffc020009a:	53d060ef          	jal	ra,ffffffffc0206dd6 <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	108050ef          	jal	ra,ffffffffc02051aa <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	6f5060ef          	jal	ra,ffffffffc0206fa2 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	40850513          	addi	a0,a0,1032 # ffffffffc020b4d0 <etext+0x2a>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	6150a0ef          	jal	ra,ffffffffc020afae <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	5d90a0ef          	jal	ra,ffffffffc020afae <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	19a0b0ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	2780b0ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	2aa50513          	addi	a0,a0,682 # ffffffffc020b4d8 <etext+0x32>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	2b450513          	addi	a0,a0,692 # ffffffffc020b4f8 <etext+0x52>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	25658593          	addi	a1,a1,598 # ffffffffc020b4a6 <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	2c050513          	addi	a0,a0,704 # ffffffffc020b518 <etext+0x72>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	2cc50513          	addi	a0,a0,716 # ffffffffc020b538 <etext+0x92>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	2d850513          	addi	a0,a0,728 # ffffffffc020b558 <etext+0xb2>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	2ca50513          	addi	a0,a0,714 # ffffffffc020b578 <etext+0xd2>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	2ec60613          	addi	a2,a2,748 # ffffffffc020b5a8 <etext+0x102>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	2f850513          	addi	a0,a0,760 # ffffffffc020b5c0 <etext+0x11a>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	30060613          	addi	a2,a2,768 # ffffffffc020b5d8 <etext+0x132>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	31858593          	addi	a1,a1,792 # ffffffffc020b5f8 <etext+0x152>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	31850513          	addi	a0,a0,792 # ffffffffc020b600 <etext+0x15a>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	31a60613          	addi	a2,a2,794 # ffffffffc020b610 <etext+0x16a>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	33a58593          	addi	a1,a1,826 # ffffffffc020b638 <etext+0x192>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	2fa50513          	addi	a0,a0,762 # ffffffffc020b600 <etext+0x15a>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	33660613          	addi	a2,a2,822 # ffffffffc020b648 <etext+0x1a2>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	34e58593          	addi	a1,a1,846 # ffffffffc020b668 <etext+0x1c2>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	2de50513          	addi	a0,a0,734 # ffffffffc020b600 <etext+0x15a>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	31c50513          	addi	a0,a0,796 # ffffffffc020b678 <etext+0x1d2>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	32250513          	addi	a0,a0,802 # ffffffffc020b6a0 <etext+0x1fa>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	37cc0c13          	addi	s8,s8,892 # ffffffffc020b710 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	32c90913          	addi	s2,s2,812 # ffffffffc020b6c8 <etext+0x222>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	32c48493          	addi	s1,s1,812 # ffffffffc020b6d0 <etext+0x22a>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	32ab0b13          	addi	s6,s6,810 # ffffffffc020b6d8 <etext+0x232>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	242a0a13          	addi	s4,s4,578 # ffffffffc020b5f8 <etext+0x152>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	338d0d13          	addi	s10,s10,824 # ffffffffc020b710 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	7fd0a0ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	7e90a0ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	7ef0a0ef          	jal	ra,ffffffffc020b426 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	7b10a0ef          	jal	ra,ffffffffc020b426 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	26850513          	addi	a0,a0,616 # ffffffffc020b6f8 <etext+0x252>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	28c50513          	addi	a0,a0,652 # ffffffffc020b758 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	53650513          	addi	a0,a0,1334 # ffffffffc020ca18 <default_pmm_manager+0x610>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	26250513          	addi	a0,a0,610 # ffffffffc020b778 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000c517          	auipc	a0,0xc
ffffffffc020053a:	4e250513          	addi	a0,a0,1250 # ffffffffc020ca18 <default_pmm_manager+0x610>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	23050513          	addi	a0,a0,560 # ffffffffc020b798 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	10a50513          	addi	a0,a0,266 # ffffffffc020b7b8 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	0ec50513          	addi	a0,a0,236 # ffffffffc020b7c8 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	0e650513          	addi	a0,a0,230 # ffffffffc020b7d8 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	0ee50513          	addi	a0,a0,238 # ffffffffc020b7f0 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	08490913          	addi	s2,s2,132 # ffffffffc020b840 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	06e48493          	addi	s1,s1,110 # ffffffffc020b838 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	09a50513          	addi	a0,a0,154 # ffffffffc020b8b8 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	0c650513          	addi	a0,a0,198 # ffffffffc020b8f0 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	fa650513          	addi	a0,a0,-90 # ffffffffc020b810 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	3230a0ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	37b0a0ef          	jal	ra,ffffffffc020b400 <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	2c70a0ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	f1850513          	addi	a0,a0,-232 # ffffffffc020b848 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	e6a50513          	addi	a0,a0,-406 # ffffffffc020b868 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	e7050513          	addi	a0,a0,-400 # ffffffffc020b880 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	e7e50513          	addi	a0,a0,-386 # ffffffffc020b8a0 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	ec250513          	addi	a0,a0,-318 # ffffffffc020b8f0 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	e5068693          	addi	a3,a3,-432 # ffffffffc020b908 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	e6060613          	addi	a2,a2,-416 # ffffffffc020b920 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	e6e50513          	addi	a0,a0,-402 # ffffffffc020b938 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	e7a68693          	addi	a3,a3,-390 # ffffffffc020b950 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	e4260613          	addi	a2,a2,-446 # ffffffffc020b920 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	e5050513          	addi	a0,a0,-432 # ffffffffc020b938 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	dd268693          	addi	a3,a3,-558 # ffffffffc020b968 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	d8260613          	addi	a2,a2,-638 # ffffffffc020b920 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	d8e50513          	addi	a0,a0,-626 # ffffffffc020b938 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	dda68693          	addi	a3,a3,-550 # ffffffffc020b990 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	d6260613          	addi	a2,a2,-670 # ffffffffc020b920 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	d6e50513          	addi	a0,a0,-658 # ffffffffc020b938 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	d3c68693          	addi	a3,a3,-708 # ffffffffc020b968 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	cec60613          	addi	a2,a2,-788 # ffffffffc020b920 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	cf850513          	addi	a0,a0,-776 # ffffffffc020b938 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	d4468693          	addi	a3,a3,-700 # ffffffffc020b990 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	ccc60613          	addi	a2,a2,-820 # ffffffffc020b920 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	cd850513          	addi	a0,a0,-808 # ffffffffc020b938 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	7f60a0ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	7cc0a0ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	7580a0ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	cd650513          	addi	a0,a0,-810 # ffffffffc020b9e8 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	d0c58593          	addi	a1,a1,-756 # ffffffffc020ba40 <commands+0x330>
ffffffffc0200d3c:	6940a0ef          	jal	ra,ffffffffc020b3d0 <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	c5450513          	addi	a0,a0,-940 # ffffffffc020b9d0 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	c8660613          	addi	a2,a2,-890 # ffffffffc020ba10 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	c9250513          	addi	a0,a0,-878 # ffffffffc020ba28 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	c8c50513          	addi	a0,a0,-884 # ffffffffc020ba50 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	c9450513          	addi	a0,a0,-876 # ffffffffc020ba68 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	c9e50513          	addi	a0,a0,-866 # ffffffffc020ba80 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	ca850513          	addi	a0,a0,-856 # ffffffffc020ba98 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	cb250513          	addi	a0,a0,-846 # ffffffffc020bab0 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	cbc50513          	addi	a0,a0,-836 # ffffffffc020bac8 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	cc650513          	addi	a0,a0,-826 # ffffffffc020bae0 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	cd050513          	addi	a0,a0,-816 # ffffffffc020baf8 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	cda50513          	addi	a0,a0,-806 # ffffffffc020bb10 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	ce450513          	addi	a0,a0,-796 # ffffffffc020bb28 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	cee50513          	addi	a0,a0,-786 # ffffffffc020bb40 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	cf850513          	addi	a0,a0,-776 # ffffffffc020bb58 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	d0250513          	addi	a0,a0,-766 # ffffffffc020bb70 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	d0c50513          	addi	a0,a0,-756 # ffffffffc020bb88 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	d1650513          	addi	a0,a0,-746 # ffffffffc020bba0 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	d2050513          	addi	a0,a0,-736 # ffffffffc020bbb8 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	d2a50513          	addi	a0,a0,-726 # ffffffffc020bbd0 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	d3450513          	addi	a0,a0,-716 # ffffffffc020bbe8 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	d3e50513          	addi	a0,a0,-706 # ffffffffc020bc00 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	d4850513          	addi	a0,a0,-696 # ffffffffc020bc18 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	d5250513          	addi	a0,a0,-686 # ffffffffc020bc30 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	d5c50513          	addi	a0,a0,-676 # ffffffffc020bc48 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	d6650513          	addi	a0,a0,-666 # ffffffffc020bc60 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	d7050513          	addi	a0,a0,-656 # ffffffffc020bc78 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	d7a50513          	addi	a0,a0,-646 # ffffffffc020bc90 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	d8450513          	addi	a0,a0,-636 # ffffffffc020bca8 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	d8e50513          	addi	a0,a0,-626 # ffffffffc020bcc0 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	d9850513          	addi	a0,a0,-616 # ffffffffc020bcd8 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	da250513          	addi	a0,a0,-606 # ffffffffc020bcf0 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	dac50513          	addi	a0,a0,-596 # ffffffffc020bd08 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	db650513          	addi	a0,a0,-586 # ffffffffc020bd20 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	dbc50513          	addi	a0,a0,-580 # ffffffffc020bd38 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	dbe50513          	addi	a0,a0,-578 # ffffffffc020bd50 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	dbe50513          	addi	a0,a0,-578 # ffffffffc020bd68 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	dc650513          	addi	a0,a0,-570 # ffffffffc020bd80 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	dce50513          	addi	a0,a0,-562 # ffffffffc020bd98 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	dca50513          	addi	a0,a0,-566 # ffffffffc020bda8 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	e6670713          	addi	a4,a4,-410 # ffffffffc020be60 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	e1450513          	addi	a0,a0,-492 # ffffffffc020be20 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	de850513          	addi	a0,a0,-536 # ffffffffc020be00 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	d9c50513          	addi	a0,a0,-612 # ffffffffc020bdc0 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	db050513          	addi	a0,a0,-592 # ffffffffc020bde0 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	48a060ef          	jal	ra,ffffffffc02074dc <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	34f0706f          	j	ffffffffc0208bac <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	dde50513          	addi	a0,a0,-546 # ffffffffc020be40 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	f9e70713          	addi	a4,a4,-98 # ffffffffc020c020 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	ee450513          	addi	a0,a0,-284 # ffffffffc020bf78 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	6420606f          	j	ffffffffc02076f2 <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	ee450513          	addi	a0,a0,-284 # ffffffffc020bf98 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	ef250513          	addi	a0,a0,-270 # ffffffffc020bfb8 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	f0850513          	addi	a0,a0,-248 # ffffffffc020bfd8 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	f1650513          	addi	a0,a0,-234 # ffffffffc020bff0 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	f2450513          	addi	a0,a0,-220 # ffffffffc020c008 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	da250513          	addi	a0,a0,-606 # ffffffffc020be90 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	db850513          	addi	a0,a0,-584 # ffffffffc020beb0 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	dce50513          	addi	a0,a0,-562 # ffffffffc020bed0 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	ddc50513          	addi	a0,a0,-548 # ffffffffc020bee8 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	de250513          	addi	a0,a0,-542 # ffffffffc020bef8 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	df850513          	addi	a0,a0,-520 # ffffffffc020bf18 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	e3650513          	addi	a0,a0,-458 # ffffffffc020bf60 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	df260613          	addi	a2,a2,-526 # ffffffffc020bf30 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	dfe50513          	addi	a0,a0,-514 # ffffffffc020bf48 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	0fe0606f          	j	ffffffffc02072d0 <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	631040ef          	jal	ra,ffffffffc0206008 <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000e617          	auipc	a2,0xe
ffffffffc020136a:	40263603          	ld	a2,1026(a2) # ffffffffc020f768 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	ab468693          	addi	a3,a3,-1356 # ffffffffc020c060 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	36c60613          	addi	a2,a2,876 # ffffffffc020b920 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	ab050513          	addi	a0,a0,-1360 # ffffffffc020c070 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	b3c68693          	addi	a3,a3,-1220 # ffffffffc020c108 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	34c60613          	addi	a2,a2,844 # ffffffffc020b920 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	a9050513          	addi	a0,a0,-1392 # ffffffffc020c070 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c130 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	32c60613          	addi	a2,a2,812 # ffffffffc020b920 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	a7050513          	addi	a0,a0,-1424 # ffffffffc020c070 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	b6468693          	addi	a3,a3,-1180 # ffffffffc020c170 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	30c60613          	addi	a2,a2,780 # ffffffffc020b920 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	a5050513          	addi	a0,a0,-1456 # ffffffffc020c070 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	bcc68693          	addi	a3,a3,-1076 # ffffffffc020c1f8 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	2ec60613          	addi	a2,a2,748 # ffffffffc020b920 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	a3050513          	addi	a0,a0,-1488 # ffffffffc020c070 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c0a8 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	2cc60613          	addi	a2,a2,716 # ffffffffc020b920 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	a1050513          	addi	a0,a0,-1520 # ffffffffc020c070 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	b7c68693          	addi	a3,a3,-1156 # ffffffffc020c1e8 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	2ac60613          	addi	a2,a2,684 # ffffffffc020b920 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	9f050513          	addi	a0,a0,-1552 # ffffffffc020c070 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	28c60613          	addi	a2,a2,652 # ffffffffc020b920 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	9d050513          	addi	a0,a0,-1584 # ffffffffc020c070 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	b0468693          	addi	a3,a3,-1276 # ffffffffc020c1b0 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	26c60613          	addi	a2,a2,620 # ffffffffc020b920 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	9b050513          	addi	a0,a0,-1616 # ffffffffc020c070 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	b7468693          	addi	a3,a3,-1164 # ffffffffc020c240 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	24c60613          	addi	a2,a2,588 # ffffffffc020b920 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	99050513          	addi	a0,a0,-1648 # ffffffffc020c070 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c230 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	22c60613          	addi	a2,a2,556 # ffffffffc020b920 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	97050513          	addi	a0,a0,-1680 # ffffffffc020c070 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	ac468693          	addi	a3,a3,-1340 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	20c60613          	addi	a2,a2,524 # ffffffffc020b920 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	95050513          	addi	a0,a0,-1712 # ffffffffc020c070 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	ae468693          	addi	a3,a3,-1308 # ffffffffc020c210 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	1ec60613          	addi	a2,a2,492 # ffffffffc020b920 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	93050513          	addi	a0,a0,-1744 # ffffffffc020c070 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c0a8 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	1cc60613          	addi	a2,a2,460 # ffffffffc020b920 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	91050513          	addi	a0,a0,-1776 # ffffffffc020c070 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	a6468693          	addi	a3,a3,-1436 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	1ac60613          	addi	a2,a2,428 # ffffffffc020b920 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	8f050513          	addi	a0,a0,-1808 # ffffffffc020c070 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c0e8 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	18c60613          	addi	a2,a2,396 # ffffffffc020b920 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	8d050513          	addi	a0,a0,-1840 # ffffffffc020c070 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	91c68693          	addi	a3,a3,-1764 # ffffffffc020c0c8 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	16c60613          	addi	a2,a2,364 # ffffffffc020b920 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	8b050513          	addi	a0,a0,-1872 # ffffffffc020c070 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	91c68693          	addi	a3,a3,-1764 # ffffffffc020c0e8 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	14c60613          	addi	a2,a2,332 # ffffffffc020b920 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	89050513          	addi	a0,a0,-1904 # ffffffffc020c070 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	ba468693          	addi	a3,a3,-1116 # ffffffffc020c390 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	12c60613          	addi	a2,a2,300 # ffffffffc020b920 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	87050513          	addi	a0,a0,-1936 # ffffffffc020c070 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	a2468693          	addi	a3,a3,-1500 # ffffffffc020c230 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	10c60613          	addi	a2,a2,268 # ffffffffc020b920 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000b517          	auipc	a0,0xb
ffffffffc0201824:	85050513          	addi	a0,a0,-1968 # ffffffffc020c070 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	9a468693          	addi	a3,a3,-1628 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	0ec60613          	addi	a2,a2,236 # ffffffffc020b920 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000b517          	auipc	a0,0xb
ffffffffc0201844:	83050513          	addi	a0,a0,-2000 # ffffffffc020c070 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	94468693          	addi	a3,a3,-1724 # ffffffffc020c190 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	0cc60613          	addi	a2,a2,204 # ffffffffc020b920 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000b517          	auipc	a0,0xb
ffffffffc0201864:	81050513          	addi	a0,a0,-2032 # ffffffffc020c070 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	ae468693          	addi	a3,a3,-1308 # ffffffffc020c350 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	0ac60613          	addi	a2,a2,172 # ffffffffc020b920 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000a517          	auipc	a0,0xa
ffffffffc0201884:	7f050513          	addi	a0,a0,2032 # ffffffffc020c070 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	aa468693          	addi	a3,a3,-1372 # ffffffffc020c330 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	08c60613          	addi	a2,a2,140 # ffffffffc020b920 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000a517          	auipc	a0,0xa
ffffffffc02018a4:	7d050513          	addi	a0,a0,2000 # ffffffffc020c070 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c308 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	06c60613          	addi	a2,a2,108 # ffffffffc020b920 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000a517          	auipc	a0,0xa
ffffffffc02018c4:	7b050513          	addi	a0,a0,1968 # ffffffffc020c070 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	a1468693          	addi	a3,a3,-1516 # ffffffffc020c2e0 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	04c60613          	addi	a2,a2,76 # ffffffffc020b920 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000a517          	auipc	a0,0xa
ffffffffc02018e4:	79050513          	addi	a0,a0,1936 # ffffffffc020c070 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	9e468693          	addi	a3,a3,-1564 # ffffffffc020c2d0 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	02c60613          	addi	a2,a2,44 # ffffffffc020b920 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	77050513          	addi	a0,a0,1904 # ffffffffc020c070 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	8c468693          	addi	a3,a3,-1852 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	00c60613          	addi	a2,a2,12 # ffffffffc020b920 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	75050513          	addi	a0,a0,1872 # ffffffffc020c070 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	98468693          	addi	a3,a3,-1660 # ffffffffc020c2b0 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	fec60613          	addi	a2,a2,-20 # ffffffffc020b920 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	73050513          	addi	a0,a0,1840 # ffffffffc020c070 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	93468693          	addi	a3,a3,-1740 # ffffffffc020c280 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	fcc60613          	addi	a2,a2,-52 # ffffffffc020b920 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	71050513          	addi	a0,a0,1808 # ffffffffc020c070 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	8fc68693          	addi	a3,a3,-1796 # ffffffffc020c268 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	fac60613          	addi	a2,a2,-84 # ffffffffc020b920 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	6f050513          	addi	a0,a0,1776 # ffffffffc020c070 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000b697          	auipc	a3,0xb
ffffffffc0201990:	84468693          	addi	a3,a3,-1980 # ffffffffc020c1d0 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	f8c60613          	addi	a2,a2,-116 # ffffffffc020b920 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	6d050513          	addi	a0,a0,1744 # ffffffffc020c070 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	8a468693          	addi	a3,a3,-1884 # ffffffffc020c250 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	f6c60613          	addi	a2,a2,-148 # ffffffffc020b920 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	6b050513          	addi	a0,a0,1712 # ffffffffc020c070 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	9a468693          	addi	a3,a3,-1628 # ffffffffc020c370 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	f4c60613          	addi	a2,a2,-180 # ffffffffc020b920 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	69050513          	addi	a0,a0,1680 # ffffffffc020c070 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	9b468693          	addi	a3,a3,-1612 # ffffffffc020c3a0 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	f2c60613          	addi	a2,a2,-212 # ffffffffc020b920 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	67050513          	addi	a0,a0,1648 # ffffffffc020c070 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	67c68693          	addi	a3,a3,1660 # ffffffffc020c088 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	f0c60613          	addi	a2,a2,-244 # ffffffffc020b920 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	65050513          	addi	a0,a0,1616 # ffffffffc020c070 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	69c68693          	addi	a3,a3,1692 # ffffffffc020c0c8 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	eec60613          	addi	a2,a2,-276 # ffffffffc020b920 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	63050513          	addi	a0,a0,1584 # ffffffffc020c070 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000b697          	auipc	a3,0xb
ffffffffc0201b7c:	84068693          	addi	a3,a3,-1984 # ffffffffc020c3b8 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	da060613          	addi	a2,a2,-608 # ffffffffc020b920 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	4e450513          	addi	a0,a0,1252 # ffffffffc020c070 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000b697          	auipc	a3,0xb
ffffffffc0201b9c:	81868693          	addi	a3,a3,-2024 # ffffffffc020c3b0 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	d8060613          	addi	a2,a2,-640 # ffffffffc020b920 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	4c450513          	addi	a0,a0,1220 # ffffffffc020c070 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000a697          	auipc	a3,0xa
ffffffffc0201c4e:	76668693          	addi	a3,a3,1894 # ffffffffc020c3b0 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	cce60613          	addi	a2,a2,-818 # ffffffffc020b920 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	41250513          	addi	a0,a0,1042 # ffffffffc020c070 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000a697          	auipc	a3,0xa
ffffffffc0201d20:	6c468693          	addi	a3,a3,1732 # ffffffffc020c3e0 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	bfc60613          	addi	a2,a2,-1028 # ffffffffc020b920 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	34050513          	addi	a0,a0,832 # ffffffffc020c070 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	67468693          	addi	a3,a3,1652 # ffffffffc020c3b0 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	bdc60613          	addi	a2,a2,-1060 # ffffffffc020b920 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	32050513          	addi	a0,a0,800 # ffffffffc020c070 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000e697          	auipc	a3,0xe
ffffffffc0201e30:	93c6b683          	ld	a3,-1732(a3) # ffffffffc020f768 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000a617          	auipc	a2,0xa
ffffffffc0201e60:	5e460613          	addi	a2,a2,1508 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	60050513          	addi	a0,a0,1536 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000a697          	auipc	a3,0xa
ffffffffc0201f4e:	52e68693          	addi	a3,a3,1326 # ffffffffc020c478 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	9ce60613          	addi	a2,a2,-1586 # ffffffffc020b920 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	53a50513          	addi	a0,a0,1338 # ffffffffc020c498 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	54450513          	addi	a0,a0,1348 # ffffffffc020c4b0 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	54c50513          	addi	a0,a0,1356 # ffffffffc020c4c8 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000d517          	auipc	a0,0xd
ffffffffc02020a8:	6c453503          	ld	a0,1732(a0) # ffffffffc020f768 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	40e60613          	addi	a2,a2,1038 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	35a50513          	addi	a0,a0,858 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	3cc60613          	addi	a2,a2,972 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	34050513          	addi	a0,a0,832 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	3da60613          	addi	a2,a2,986 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	32650513          	addi	a0,a0,806 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	3de60613          	addi	a2,a2,990 # ffffffffc020c530 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	30a50513          	addi	a0,a0,778 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	180090ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	0de090ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	05860613          	addi	a2,a2,88 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	16450513          	addi	a0,a0,356 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	04060613          	addi	a2,a2,64 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	14c50513          	addi	a0,a0,332 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	02660613          	addi	a2,a2,38 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	13250513          	addi	a0,a0,306 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	00c60613          	addi	a2,a2,12 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	11850513          	addi	a0,a0,280 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	0ae68693          	addi	a3,a3,174 # ffffffffc020c580 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	44660613          	addi	a2,a2,1094 # ffffffffc020b920 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	07250513          	addi	a0,a0,114 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	07668693          	addi	a3,a3,118 # ffffffffc020c568 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	42660613          	addi	a2,a2,1062 # ffffffffc020b920 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	05250513          	addi	a0,a0,82 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	f2868693          	addi	a3,a3,-216 # ffffffffc020c590 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	2b060613          	addi	a2,a2,688 # ffffffffc020b920 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	edc50513          	addi	a0,a0,-292 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	f3868693          	addi	a3,a3,-200 # ffffffffc020c5c0 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	29060613          	addi	a2,a2,656 # ffffffffc020b920 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	ebc50513          	addi	a0,a0,-324 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	cae68693          	addi	a3,a3,-850 # ffffffffc020c590 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	03660613          	addi	a2,a2,54 # ffffffffc020b920 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	c6250513          	addi	a0,a0,-926 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	b3e60613          	addi	a2,a2,-1218 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	b5a50513          	addi	a0,a0,-1190 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	ca268693          	addi	a3,a3,-862 # ffffffffc020c5c0 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	ffa60613          	addi	a2,a2,-6 # ffffffffc020b920 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	c2650513          	addi	a0,a0,-986 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <page_remove>:
ffffffffc020293e:	7179                	addi	sp,sp,-48
ffffffffc0202940:	4601                	li	a2,0
ffffffffc0202942:	ec26                	sd	s1,24(sp)
ffffffffc0202944:	f406                	sd	ra,40(sp)
ffffffffc0202946:	f022                	sd	s0,32(sp)
ffffffffc0202948:	84ae                	mv	s1,a1
ffffffffc020294a:	8dbff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020294e:	c511                	beqz	a0,ffffffffc020295a <page_remove+0x1c>
ffffffffc0202950:	611c                	ld	a5,0(a0)
ffffffffc0202952:	842a                	mv	s0,a0
ffffffffc0202954:	0017f713          	andi	a4,a5,1
ffffffffc0202958:	e711                	bnez	a4,ffffffffc0202964 <page_remove+0x26>
ffffffffc020295a:	70a2                	ld	ra,40(sp)
ffffffffc020295c:	7402                	ld	s0,32(sp)
ffffffffc020295e:	64e2                	ld	s1,24(sp)
ffffffffc0202960:	6145                	addi	sp,sp,48
ffffffffc0202962:	8082                	ret
ffffffffc0202964:	078a                	slli	a5,a5,0x2
ffffffffc0202966:	83b1                	srli	a5,a5,0xc
ffffffffc0202968:	00094717          	auipc	a4,0x94
ffffffffc020296c:	f3873703          	ld	a4,-200(a4) # ffffffffc02968a0 <npage>
ffffffffc0202970:	06e7f363          	bgeu	a5,a4,ffffffffc02029d6 <page_remove+0x98>
ffffffffc0202974:	fff80537          	lui	a0,0xfff80
ffffffffc0202978:	97aa                	add	a5,a5,a0
ffffffffc020297a:	079a                	slli	a5,a5,0x6
ffffffffc020297c:	00094517          	auipc	a0,0x94
ffffffffc0202980:	f2c53503          	ld	a0,-212(a0) # ffffffffc02968a8 <pages>
ffffffffc0202984:	953e                	add	a0,a0,a5
ffffffffc0202986:	411c                	lw	a5,0(a0)
ffffffffc0202988:	fff7871b          	addiw	a4,a5,-1
ffffffffc020298c:	c118                	sw	a4,0(a0)
ffffffffc020298e:	cb11                	beqz	a4,ffffffffc02029a2 <page_remove+0x64>
ffffffffc0202990:	00043023          	sd	zero,0(s0)
ffffffffc0202994:	12048073          	sfence.vma	s1
ffffffffc0202998:	70a2                	ld	ra,40(sp)
ffffffffc020299a:	7402                	ld	s0,32(sp)
ffffffffc020299c:	64e2                	ld	s1,24(sp)
ffffffffc020299e:	6145                	addi	sp,sp,48
ffffffffc02029a0:	8082                	ret
ffffffffc02029a2:	100027f3          	csrr	a5,sstatus
ffffffffc02029a6:	8b89                	andi	a5,a5,2
ffffffffc02029a8:	eb89                	bnez	a5,ffffffffc02029ba <page_remove+0x7c>
ffffffffc02029aa:	00094797          	auipc	a5,0x94
ffffffffc02029ae:	f067b783          	ld	a5,-250(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029b2:	739c                	ld	a5,32(a5)
ffffffffc02029b4:	4585                	li	a1,1
ffffffffc02029b6:	9782                	jalr	a5
ffffffffc02029b8:	bfe1                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029ba:	e42a                	sd	a0,8(sp)
ffffffffc02029bc:	ab6fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02029c0:	00094797          	auipc	a5,0x94
ffffffffc02029c4:	ef07b783          	ld	a5,-272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029c8:	739c                	ld	a5,32(a5)
ffffffffc02029ca:	6522                	ld	a0,8(sp)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	9782                	jalr	a5
ffffffffc02029d0:	a9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02029d4:	bf75                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029d6:	f5eff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02029da <page_insert>:
ffffffffc02029da:	7139                	addi	sp,sp,-64
ffffffffc02029dc:	e852                	sd	s4,16(sp)
ffffffffc02029de:	8a32                	mv	s4,a2
ffffffffc02029e0:	f822                	sd	s0,48(sp)
ffffffffc02029e2:	4605                	li	a2,1
ffffffffc02029e4:	842e                	mv	s0,a1
ffffffffc02029e6:	85d2                	mv	a1,s4
ffffffffc02029e8:	f426                	sd	s1,40(sp)
ffffffffc02029ea:	fc06                	sd	ra,56(sp)
ffffffffc02029ec:	f04a                	sd	s2,32(sp)
ffffffffc02029ee:	ec4e                	sd	s3,24(sp)
ffffffffc02029f0:	e456                	sd	s5,8(sp)
ffffffffc02029f2:	84b6                	mv	s1,a3
ffffffffc02029f4:	831ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029f8:	c961                	beqz	a0,ffffffffc0202ac8 <page_insert+0xee>
ffffffffc02029fa:	4014                	lw	a3,0(s0)
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	89aa                	mv	s3,a0
ffffffffc0202a00:	0016871b          	addiw	a4,a3,1
ffffffffc0202a04:	c018                	sw	a4,0(s0)
ffffffffc0202a06:	0017f713          	andi	a4,a5,1
ffffffffc0202a0a:	ef05                	bnez	a4,ffffffffc0202a42 <page_insert+0x68>
ffffffffc0202a0c:	00094717          	auipc	a4,0x94
ffffffffc0202a10:	e9c73703          	ld	a4,-356(a4) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	8c19                	sub	s0,s0,a4
ffffffffc0202a16:	000807b7          	lui	a5,0x80
ffffffffc0202a1a:	8419                	srai	s0,s0,0x6
ffffffffc0202a1c:	943e                	add	s0,s0,a5
ffffffffc0202a1e:	042a                	slli	s0,s0,0xa
ffffffffc0202a20:	8cc1                	or	s1,s1,s0
ffffffffc0202a22:	0014e493          	ori	s1,s1,1
ffffffffc0202a26:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202a2a:	120a0073          	sfence.vma	s4
ffffffffc0202a2e:	4501                	li	a0,0
ffffffffc0202a30:	70e2                	ld	ra,56(sp)
ffffffffc0202a32:	7442                	ld	s0,48(sp)
ffffffffc0202a34:	74a2                	ld	s1,40(sp)
ffffffffc0202a36:	7902                	ld	s2,32(sp)
ffffffffc0202a38:	69e2                	ld	s3,24(sp)
ffffffffc0202a3a:	6a42                	ld	s4,16(sp)
ffffffffc0202a3c:	6aa2                	ld	s5,8(sp)
ffffffffc0202a3e:	6121                	addi	sp,sp,64
ffffffffc0202a40:	8082                	ret
ffffffffc0202a42:	078a                	slli	a5,a5,0x2
ffffffffc0202a44:	83b1                	srli	a5,a5,0xc
ffffffffc0202a46:	00094717          	auipc	a4,0x94
ffffffffc0202a4a:	e5a73703          	ld	a4,-422(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a4e:	06e7ff63          	bgeu	a5,a4,ffffffffc0202acc <page_insert+0xf2>
ffffffffc0202a52:	00094a97          	auipc	s5,0x94
ffffffffc0202a56:	e56a8a93          	addi	s5,s5,-426 # ffffffffc02968a8 <pages>
ffffffffc0202a5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202a5e:	fff80937          	lui	s2,0xfff80
ffffffffc0202a62:	993e                	add	s2,s2,a5
ffffffffc0202a64:	091a                	slli	s2,s2,0x6
ffffffffc0202a66:	993a                	add	s2,s2,a4
ffffffffc0202a68:	01240c63          	beq	s0,s2,ffffffffc0202a80 <page_insert+0xa6>
ffffffffc0202a6c:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202a70:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202a74:	00d92023          	sw	a3,0(s2)
ffffffffc0202a78:	c691                	beqz	a3,ffffffffc0202a84 <page_insert+0xaa>
ffffffffc0202a7a:	120a0073          	sfence.vma	s4
ffffffffc0202a7e:	bf59                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a80:	c014                	sw	a3,0(s0)
ffffffffc0202a82:	bf49                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a84:	100027f3          	csrr	a5,sstatus
ffffffffc0202a88:	8b89                	andi	a5,a5,2
ffffffffc0202a8a:	ef91                	bnez	a5,ffffffffc0202aa6 <page_insert+0xcc>
ffffffffc0202a8c:	00094797          	auipc	a5,0x94
ffffffffc0202a90:	e247b783          	ld	a5,-476(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a94:	739c                	ld	a5,32(a5)
ffffffffc0202a96:	4585                	li	a1,1
ffffffffc0202a98:	854a                	mv	a0,s2
ffffffffc0202a9a:	9782                	jalr	a5
ffffffffc0202a9c:	000ab703          	ld	a4,0(s5)
ffffffffc0202aa0:	120a0073          	sfence.vma	s4
ffffffffc0202aa4:	bf85                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202aa6:	9ccfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202aaa:	00094797          	auipc	a5,0x94
ffffffffc0202aae:	e067b783          	ld	a5,-506(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202ab2:	739c                	ld	a5,32(a5)
ffffffffc0202ab4:	4585                	li	a1,1
ffffffffc0202ab6:	854a                	mv	a0,s2
ffffffffc0202ab8:	9782                	jalr	a5
ffffffffc0202aba:	9b2fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202abe:	000ab703          	ld	a4,0(s5)
ffffffffc0202ac2:	120a0073          	sfence.vma	s4
ffffffffc0202ac6:	b7b9                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202ac8:	5571                	li	a0,-4
ffffffffc0202aca:	b79d                	j	ffffffffc0202a30 <page_insert+0x56>
ffffffffc0202acc:	e68ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202ad0 <pmm_init>:
ffffffffc0202ad0:	0000a797          	auipc	a5,0xa
ffffffffc0202ad4:	93878793          	addi	a5,a5,-1736 # ffffffffc020c408 <default_pmm_manager>
ffffffffc0202ad8:	638c                	ld	a1,0(a5)
ffffffffc0202ada:	7159                	addi	sp,sp,-112
ffffffffc0202adc:	f85a                	sd	s6,48(sp)
ffffffffc0202ade:	0000a517          	auipc	a0,0xa
ffffffffc0202ae2:	afa50513          	addi	a0,a0,-1286 # ffffffffc020c5d8 <default_pmm_manager+0x1d0>
ffffffffc0202ae6:	00094b17          	auipc	s6,0x94
ffffffffc0202aea:	dcab0b13          	addi	s6,s6,-566 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202aee:	f486                	sd	ra,104(sp)
ffffffffc0202af0:	e8ca                	sd	s2,80(sp)
ffffffffc0202af2:	e4ce                	sd	s3,72(sp)
ffffffffc0202af4:	f0a2                	sd	s0,96(sp)
ffffffffc0202af6:	eca6                	sd	s1,88(sp)
ffffffffc0202af8:	e0d2                	sd	s4,64(sp)
ffffffffc0202afa:	fc56                	sd	s5,56(sp)
ffffffffc0202afc:	f45e                	sd	s7,40(sp)
ffffffffc0202afe:	f062                	sd	s8,32(sp)
ffffffffc0202b00:	ec66                	sd	s9,24(sp)
ffffffffc0202b02:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b06:	ea0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b0a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b0e:	00094997          	auipc	s3,0x94
ffffffffc0202b12:	daa98993          	addi	s3,s3,-598 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202b16:	679c                	ld	a5,8(a5)
ffffffffc0202b18:	9782                	jalr	a5
ffffffffc0202b1a:	57f5                	li	a5,-3
ffffffffc0202b1c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b1e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b22:	f27fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202b26:	892a                	mv	s2,a0
ffffffffc0202b28:	f2bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202b2c:	280502e3          	beqz	a0,ffffffffc02035b0 <pmm_init+0xae0>
ffffffffc0202b30:	84aa                	mv	s1,a0
ffffffffc0202b32:	0000a517          	auipc	a0,0xa
ffffffffc0202b36:	ade50513          	addi	a0,a0,-1314 # ffffffffc020c610 <default_pmm_manager+0x208>
ffffffffc0202b3a:	e6cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b3e:	00990433          	add	s0,s2,s1
ffffffffc0202b42:	fff40693          	addi	a3,s0,-1
ffffffffc0202b46:	864a                	mv	a2,s2
ffffffffc0202b48:	85a6                	mv	a1,s1
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	ade50513          	addi	a0,a0,-1314 # ffffffffc020c628 <default_pmm_manager+0x220>
ffffffffc0202b52:	e54fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b56:	c8000737          	lui	a4,0xc8000
ffffffffc0202b5a:	87a2                	mv	a5,s0
ffffffffc0202b5c:	5e876e63          	bltu	a4,s0,ffffffffc0203158 <pmm_init+0x688>
ffffffffc0202b60:	757d                	lui	a0,0xfffff
ffffffffc0202b62:	00095617          	auipc	a2,0x95
ffffffffc0202b66:	dad60613          	addi	a2,a2,-595 # ffffffffc029790f <end+0xfff>
ffffffffc0202b6a:	8e69                	and	a2,a2,a0
ffffffffc0202b6c:	00094497          	auipc	s1,0x94
ffffffffc0202b70:	d3448493          	addi	s1,s1,-716 # ffffffffc02968a0 <npage>
ffffffffc0202b74:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202b78:	00094b97          	auipc	s7,0x94
ffffffffc0202b7c:	d30b8b93          	addi	s7,s7,-720 # ffffffffc02968a8 <pages>
ffffffffc0202b80:	e088                	sd	a0,0(s1)
ffffffffc0202b82:	00cbb023          	sd	a2,0(s7)
ffffffffc0202b86:	000807b7          	lui	a5,0x80
ffffffffc0202b8a:	86b2                	mv	a3,a2
ffffffffc0202b8c:	02f50863          	beq	a0,a5,ffffffffc0202bbc <pmm_init+0xec>
ffffffffc0202b90:	4781                	li	a5,0
ffffffffc0202b92:	4585                	li	a1,1
ffffffffc0202b94:	fff806b7          	lui	a3,0xfff80
ffffffffc0202b98:	00679513          	slli	a0,a5,0x6
ffffffffc0202b9c:	9532                	add	a0,a0,a2
ffffffffc0202b9e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202ba2:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202ba6:	6088                	ld	a0,0(s1)
ffffffffc0202ba8:	0785                	addi	a5,a5,1
ffffffffc0202baa:	000bb603          	ld	a2,0(s7)
ffffffffc0202bae:	00d50733          	add	a4,a0,a3
ffffffffc0202bb2:	fee7e3e3          	bltu	a5,a4,ffffffffc0202b98 <pmm_init+0xc8>
ffffffffc0202bb6:	071a                	slli	a4,a4,0x6
ffffffffc0202bb8:	00e606b3          	add	a3,a2,a4
ffffffffc0202bbc:	c02007b7          	lui	a5,0xc0200
ffffffffc0202bc0:	3af6eae3          	bltu	a3,a5,ffffffffc0203774 <pmm_init+0xca4>
ffffffffc0202bc4:	0009b583          	ld	a1,0(s3)
ffffffffc0202bc8:	77fd                	lui	a5,0xfffff
ffffffffc0202bca:	8c7d                	and	s0,s0,a5
ffffffffc0202bcc:	8e8d                	sub	a3,a3,a1
ffffffffc0202bce:	5e86e363          	bltu	a3,s0,ffffffffc02031b4 <pmm_init+0x6e4>
ffffffffc0202bd2:	0000a517          	auipc	a0,0xa
ffffffffc0202bd6:	a7e50513          	addi	a0,a0,-1410 # ffffffffc020c650 <default_pmm_manager+0x248>
ffffffffc0202bda:	dccfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bde:	000b3783          	ld	a5,0(s6)
ffffffffc0202be2:	7b9c                	ld	a5,48(a5)
ffffffffc0202be4:	9782                	jalr	a5
ffffffffc0202be6:	0000a517          	auipc	a0,0xa
ffffffffc0202bea:	a8250513          	addi	a0,a0,-1406 # ffffffffc020c668 <default_pmm_manager+0x260>
ffffffffc0202bee:	db8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0202bf6:	8b89                	andi	a5,a5,2
ffffffffc0202bf8:	5a079363          	bnez	a5,ffffffffc020319e <pmm_init+0x6ce>
ffffffffc0202bfc:	000b3783          	ld	a5,0(s6)
ffffffffc0202c00:	4505                	li	a0,1
ffffffffc0202c02:	6f9c                	ld	a5,24(a5)
ffffffffc0202c04:	9782                	jalr	a5
ffffffffc0202c06:	842a                	mv	s0,a0
ffffffffc0202c08:	180408e3          	beqz	s0,ffffffffc0203598 <pmm_init+0xac8>
ffffffffc0202c0c:	000bb683          	ld	a3,0(s7)
ffffffffc0202c10:	5a7d                	li	s4,-1
ffffffffc0202c12:	6098                	ld	a4,0(s1)
ffffffffc0202c14:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c18:	8699                	srai	a3,a3,0x6
ffffffffc0202c1a:	00080437          	lui	s0,0x80
ffffffffc0202c1e:	96a2                	add	a3,a3,s0
ffffffffc0202c20:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c24:	8ff5                	and	a5,a5,a3
ffffffffc0202c26:	06b2                	slli	a3,a3,0xc
ffffffffc0202c28:	30e7fde3          	bgeu	a5,a4,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202c2c:	0009b403          	ld	s0,0(s3)
ffffffffc0202c30:	6605                	lui	a2,0x1
ffffffffc0202c32:	4581                	li	a1,0
ffffffffc0202c34:	9436                	add	s0,s0,a3
ffffffffc0202c36:	8522                	mv	a0,s0
ffffffffc0202c38:	005080ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0202c3c:	0009b683          	ld	a3,0(s3)
ffffffffc0202c40:	77fd                	lui	a5,0xfffff
ffffffffc0202c42:	0000a917          	auipc	s2,0xa
ffffffffc0202c46:	86390913          	addi	s2,s2,-1949 # ffffffffc020c4a5 <default_pmm_manager+0x9d>
ffffffffc0202c4a:	00f97933          	and	s2,s2,a5
ffffffffc0202c4e:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c52:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202c56:	964a                	add	a2,a2,s2
ffffffffc0202c58:	4729                	li	a4,10
ffffffffc0202c5a:	40da86b3          	sub	a3,s5,a3
ffffffffc0202c5e:	c02005b7          	lui	a1,0xc0200
ffffffffc0202c62:	8522                	mv	a0,s0
ffffffffc0202c64:	fe8ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c68:	c8000637          	lui	a2,0xc8000
ffffffffc0202c6c:	41260633          	sub	a2,a2,s2
ffffffffc0202c70:	3f596ce3          	bltu	s2,s5,ffffffffc0203868 <pmm_init+0xd98>
ffffffffc0202c74:	0009b683          	ld	a3,0(s3)
ffffffffc0202c78:	85ca                	mv	a1,s2
ffffffffc0202c7a:	4719                	li	a4,6
ffffffffc0202c7c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202c80:	8522                	mv	a0,s0
ffffffffc0202c82:	00094917          	auipc	s2,0x94
ffffffffc0202c86:	c1690913          	addi	s2,s2,-1002 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202c8a:	fc2ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c8e:	00893023          	sd	s0,0(s2)
ffffffffc0202c92:	2d5464e3          	bltu	s0,s5,ffffffffc020375a <pmm_init+0xc8a>
ffffffffc0202c96:	0009b783          	ld	a5,0(s3)
ffffffffc0202c9a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202c9c:	8c1d                	sub	s0,s0,a5
ffffffffc0202c9e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202ca2:	00094717          	auipc	a4,0x94
ffffffffc0202ca6:	be873723          	sd	s0,-1042(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202caa:	0147ea33          	or	s4,a5,s4
ffffffffc0202cae:	180a1073          	csrw	satp,s4
ffffffffc0202cb2:	12000073          	sfence.vma
ffffffffc0202cb6:	0000a517          	auipc	a0,0xa
ffffffffc0202cba:	9f250513          	addi	a0,a0,-1550 # ffffffffc020c6a8 <default_pmm_manager+0x2a0>
ffffffffc0202cbe:	ce8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc2:	0000e717          	auipc	a4,0xe
ffffffffc0202cc6:	33e70713          	addi	a4,a4,830 # ffffffffc0211000 <bootstack>
ffffffffc0202cca:	0000e797          	auipc	a5,0xe
ffffffffc0202cce:	33678793          	addi	a5,a5,822 # ffffffffc0211000 <bootstack>
ffffffffc0202cd2:	5cf70d63          	beq	a4,a5,ffffffffc02032ac <pmm_init+0x7dc>
ffffffffc0202cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202cda:	8b89                	andi	a5,a5,2
ffffffffc0202cdc:	4a079763          	bnez	a5,ffffffffc020318a <pmm_init+0x6ba>
ffffffffc0202ce0:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce4:	779c                	ld	a5,40(a5)
ffffffffc0202ce6:	9782                	jalr	a5
ffffffffc0202ce8:	842a                	mv	s0,a0
ffffffffc0202cea:	6098                	ld	a4,0(s1)
ffffffffc0202cec:	c80007b7          	lui	a5,0xc8000
ffffffffc0202cf0:	83b1                	srli	a5,a5,0xc
ffffffffc0202cf2:	08e7e3e3          	bltu	a5,a4,ffffffffc0203578 <pmm_init+0xaa8>
ffffffffc0202cf6:	00093503          	ld	a0,0(s2)
ffffffffc0202cfa:	04050fe3          	beqz	a0,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202cfe:	03451793          	slli	a5,a0,0x34
ffffffffc0202d02:	04079be3          	bnez	a5,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202d06:	4601                	li	a2,0
ffffffffc0202d08:	4581                	li	a1,0
ffffffffc0202d0a:	809ff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202d0e:	2e0511e3          	bnez	a0,ffffffffc02037f0 <pmm_init+0xd20>
ffffffffc0202d12:	100027f3          	csrr	a5,sstatus
ffffffffc0202d16:	8b89                	andi	a5,a5,2
ffffffffc0202d18:	44079e63          	bnez	a5,ffffffffc0203174 <pmm_init+0x6a4>
ffffffffc0202d1c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d20:	4505                	li	a0,1
ffffffffc0202d22:	6f9c                	ld	a5,24(a5)
ffffffffc0202d24:	9782                	jalr	a5
ffffffffc0202d26:	8a2a                	mv	s4,a0
ffffffffc0202d28:	00093503          	ld	a0,0(s2)
ffffffffc0202d2c:	4681                	li	a3,0
ffffffffc0202d2e:	4601                	li	a2,0
ffffffffc0202d30:	85d2                	mv	a1,s4
ffffffffc0202d32:	ca9ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202d36:	26051be3          	bnez	a0,ffffffffc02037ac <pmm_init+0xcdc>
ffffffffc0202d3a:	00093503          	ld	a0,0(s2)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	4581                	li	a1,0
ffffffffc0202d42:	ce2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202d46:	280505e3          	beqz	a0,ffffffffc02037d0 <pmm_init+0xd00>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0017f713          	andi	a4,a5,1
ffffffffc0202d50:	26070ee3          	beqz	a4,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202d54:	6098                	ld	a4,0(s1)
ffffffffc0202d56:	078a                	slli	a5,a5,0x2
ffffffffc0202d58:	83b1                	srli	a5,a5,0xc
ffffffffc0202d5a:	62e7f363          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202d5e:	000bb683          	ld	a3,0(s7)
ffffffffc0202d62:	fff80637          	lui	a2,0xfff80
ffffffffc0202d66:	97b2                	add	a5,a5,a2
ffffffffc0202d68:	079a                	slli	a5,a5,0x6
ffffffffc0202d6a:	97b6                	add	a5,a5,a3
ffffffffc0202d6c:	2afa12e3          	bne	s4,a5,ffffffffc0203810 <pmm_init+0xd40>
ffffffffc0202d70:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202d74:	4785                	li	a5,1
ffffffffc0202d76:	2cf699e3          	bne	a3,a5,ffffffffc0203848 <pmm_init+0xd78>
ffffffffc0202d7a:	00093503          	ld	a0,0(s2)
ffffffffc0202d7e:	77fd                	lui	a5,0xfffff
ffffffffc0202d80:	6114                	ld	a3,0(a0)
ffffffffc0202d82:	068a                	slli	a3,a3,0x2
ffffffffc0202d84:	8efd                	and	a3,a3,a5
ffffffffc0202d86:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202d8a:	2ae673e3          	bgeu	a2,a4,ffffffffc0203830 <pmm_init+0xd60>
ffffffffc0202d8e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202d92:	96e2                	add	a3,a3,s8
ffffffffc0202d94:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202d98:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d9a:	00fafab3          	and	s5,s5,a5
ffffffffc0202d9e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202da2:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203608 <pmm_init+0xb38>
ffffffffc0202da6:	4601                	li	a2,0
ffffffffc0202da8:	6585                	lui	a1,0x1
ffffffffc0202daa:	9ae2                	add	s5,s5,s8
ffffffffc0202dac:	c78ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202db0:	0aa1                	addi	s5,s5,8
ffffffffc0202db2:	03551be3          	bne	a0,s5,ffffffffc02035e8 <pmm_init+0xb18>
ffffffffc0202db6:	100027f3          	csrr	a5,sstatus
ffffffffc0202dba:	8b89                	andi	a5,a5,2
ffffffffc0202dbc:	3a079163          	bnez	a5,ffffffffc020315e <pmm_init+0x68e>
ffffffffc0202dc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202dc4:	4505                	li	a0,1
ffffffffc0202dc6:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc8:	9782                	jalr	a5
ffffffffc0202dca:	8c2a                	mv	s8,a0
ffffffffc0202dcc:	00093503          	ld	a0,0(s2)
ffffffffc0202dd0:	46d1                	li	a3,20
ffffffffc0202dd2:	6605                	lui	a2,0x1
ffffffffc0202dd4:	85e2                	mv	a1,s8
ffffffffc0202dd6:	c05ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202dda:	1a0519e3          	bnez	a0,ffffffffc020378c <pmm_init+0xcbc>
ffffffffc0202dde:	00093503          	ld	a0,0(s2)
ffffffffc0202de2:	4601                	li	a2,0
ffffffffc0202de4:	6585                	lui	a1,0x1
ffffffffc0202de6:	c3eff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202dea:	10050ce3          	beqz	a0,ffffffffc0203702 <pmm_init+0xc32>
ffffffffc0202dee:	611c                	ld	a5,0(a0)
ffffffffc0202df0:	0107f713          	andi	a4,a5,16
ffffffffc0202df4:	0e0707e3          	beqz	a4,ffffffffc02036e2 <pmm_init+0xc12>
ffffffffc0202df8:	8b91                	andi	a5,a5,4
ffffffffc0202dfa:	0c0784e3          	beqz	a5,ffffffffc02036c2 <pmm_init+0xbf2>
ffffffffc0202dfe:	00093503          	ld	a0,0(s2)
ffffffffc0202e02:	611c                	ld	a5,0(a0)
ffffffffc0202e04:	8bc1                	andi	a5,a5,16
ffffffffc0202e06:	08078ee3          	beqz	a5,ffffffffc02036a2 <pmm_init+0xbd2>
ffffffffc0202e0a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e0e:	4785                	li	a5,1
ffffffffc0202e10:	06f719e3          	bne	a4,a5,ffffffffc0203682 <pmm_init+0xbb2>
ffffffffc0202e14:	4681                	li	a3,0
ffffffffc0202e16:	6605                	lui	a2,0x1
ffffffffc0202e18:	85d2                	mv	a1,s4
ffffffffc0202e1a:	bc1ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202e1e:	040512e3          	bnez	a0,ffffffffc0203662 <pmm_init+0xb92>
ffffffffc0202e22:	000a2703          	lw	a4,0(s4)
ffffffffc0202e26:	4789                	li	a5,2
ffffffffc0202e28:	00f71de3          	bne	a4,a5,ffffffffc0203642 <pmm_init+0xb72>
ffffffffc0202e2c:	000c2783          	lw	a5,0(s8)
ffffffffc0202e30:	7e079963          	bnez	a5,ffffffffc0203622 <pmm_init+0xb52>
ffffffffc0202e34:	00093503          	ld	a0,0(s2)
ffffffffc0202e38:	4601                	li	a2,0
ffffffffc0202e3a:	6585                	lui	a1,0x1
ffffffffc0202e3c:	be8ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202e40:	54050263          	beqz	a0,ffffffffc0203384 <pmm_init+0x8b4>
ffffffffc0202e44:	6118                	ld	a4,0(a0)
ffffffffc0202e46:	00177793          	andi	a5,a4,1
ffffffffc0202e4a:	180781e3          	beqz	a5,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202e4e:	6094                	ld	a3,0(s1)
ffffffffc0202e50:	00271793          	slli	a5,a4,0x2
ffffffffc0202e54:	83b1                	srli	a5,a5,0xc
ffffffffc0202e56:	52d7f563          	bgeu	a5,a3,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202e5a:	000bb683          	ld	a3,0(s7)
ffffffffc0202e5e:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202e62:	97d6                	add	a5,a5,s5
ffffffffc0202e64:	079a                	slli	a5,a5,0x6
ffffffffc0202e66:	97b6                	add	a5,a5,a3
ffffffffc0202e68:	58fa1e63          	bne	s4,a5,ffffffffc0203404 <pmm_init+0x934>
ffffffffc0202e6c:	8b41                	andi	a4,a4,16
ffffffffc0202e6e:	56071b63          	bnez	a4,ffffffffc02033e4 <pmm_init+0x914>
ffffffffc0202e72:	00093503          	ld	a0,0(s2)
ffffffffc0202e76:	4581                	li	a1,0
ffffffffc0202e78:	ac7ff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e7c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202e80:	4785                	li	a5,1
ffffffffc0202e82:	5cfc9163          	bne	s9,a5,ffffffffc0203444 <pmm_init+0x974>
ffffffffc0202e86:	000c2783          	lw	a5,0(s8)
ffffffffc0202e8a:	58079d63          	bnez	a5,ffffffffc0203424 <pmm_init+0x954>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	6585                	lui	a1,0x1
ffffffffc0202e94:	aabff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e98:	000a2783          	lw	a5,0(s4)
ffffffffc0202e9c:	200793e3          	bnez	a5,ffffffffc02038a2 <pmm_init+0xdd2>
ffffffffc0202ea0:	000c2783          	lw	a5,0(s8)
ffffffffc0202ea4:	1c079fe3          	bnez	a5,ffffffffc0203882 <pmm_init+0xdb2>
ffffffffc0202ea8:	00093a03          	ld	s4,0(s2)
ffffffffc0202eac:	608c                	ld	a1,0(s1)
ffffffffc0202eae:	000a3683          	ld	a3,0(s4)
ffffffffc0202eb2:	068a                	slli	a3,a3,0x2
ffffffffc0202eb4:	82b1                	srli	a3,a3,0xc
ffffffffc0202eb6:	4cb6f563          	bgeu	a3,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202eba:	000bb503          	ld	a0,0(s7)
ffffffffc0202ebe:	96d6                	add	a3,a3,s5
ffffffffc0202ec0:	069a                	slli	a3,a3,0x6
ffffffffc0202ec2:	00d507b3          	add	a5,a0,a3
ffffffffc0202ec6:	439c                	lw	a5,0(a5)
ffffffffc0202ec8:	4f979e63          	bne	a5,s9,ffffffffc02033c4 <pmm_init+0x8f4>
ffffffffc0202ecc:	8699                	srai	a3,a3,0x6
ffffffffc0202ece:	00080637          	lui	a2,0x80
ffffffffc0202ed2:	96b2                	add	a3,a3,a2
ffffffffc0202ed4:	00c69713          	slli	a4,a3,0xc
ffffffffc0202ed8:	8331                	srli	a4,a4,0xc
ffffffffc0202eda:	06b2                	slli	a3,a3,0xc
ffffffffc0202edc:	06b773e3          	bgeu	a4,a1,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202ee0:	0009b703          	ld	a4,0(s3)
ffffffffc0202ee4:	96ba                	add	a3,a3,a4
ffffffffc0202ee6:	629c                	ld	a5,0(a3)
ffffffffc0202ee8:	078a                	slli	a5,a5,0x2
ffffffffc0202eea:	83b1                	srli	a5,a5,0xc
ffffffffc0202eec:	48b7fa63          	bgeu	a5,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202ef0:	8f91                	sub	a5,a5,a2
ffffffffc0202ef2:	079a                	slli	a5,a5,0x6
ffffffffc0202ef4:	953e                	add	a0,a0,a5
ffffffffc0202ef6:	100027f3          	csrr	a5,sstatus
ffffffffc0202efa:	8b89                	andi	a5,a5,2
ffffffffc0202efc:	32079463          	bnez	a5,ffffffffc0203224 <pmm_init+0x754>
ffffffffc0202f00:	000b3783          	ld	a5,0(s6)
ffffffffc0202f04:	4585                	li	a1,1
ffffffffc0202f06:	739c                	ld	a5,32(a5)
ffffffffc0202f08:	9782                	jalr	a5
ffffffffc0202f0a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f0e:	6098                	ld	a4,0(s1)
ffffffffc0202f10:	078a                	slli	a5,a5,0x2
ffffffffc0202f12:	83b1                	srli	a5,a5,0xc
ffffffffc0202f14:	46e7f663          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202f18:	000bb503          	ld	a0,0(s7)
ffffffffc0202f1c:	fff80737          	lui	a4,0xfff80
ffffffffc0202f20:	97ba                	add	a5,a5,a4
ffffffffc0202f22:	079a                	slli	a5,a5,0x6
ffffffffc0202f24:	953e                	add	a0,a0,a5
ffffffffc0202f26:	100027f3          	csrr	a5,sstatus
ffffffffc0202f2a:	8b89                	andi	a5,a5,2
ffffffffc0202f2c:	2e079063          	bnez	a5,ffffffffc020320c <pmm_init+0x73c>
ffffffffc0202f30:	000b3783          	ld	a5,0(s6)
ffffffffc0202f34:	4585                	li	a1,1
ffffffffc0202f36:	739c                	ld	a5,32(a5)
ffffffffc0202f38:	9782                	jalr	a5
ffffffffc0202f3a:	00093783          	ld	a5,0(s2)
ffffffffc0202f3e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f42:	12000073          	sfence.vma
ffffffffc0202f46:	100027f3          	csrr	a5,sstatus
ffffffffc0202f4a:	8b89                	andi	a5,a5,2
ffffffffc0202f4c:	2a079663          	bnez	a5,ffffffffc02031f8 <pmm_init+0x728>
ffffffffc0202f50:	000b3783          	ld	a5,0(s6)
ffffffffc0202f54:	779c                	ld	a5,40(a5)
ffffffffc0202f56:	9782                	jalr	a5
ffffffffc0202f58:	8a2a                	mv	s4,a0
ffffffffc0202f5a:	7d441463          	bne	s0,s4,ffffffffc0203722 <pmm_init+0xc52>
ffffffffc0202f5e:	0000a517          	auipc	a0,0xa
ffffffffc0202f62:	aa250513          	addi	a0,a0,-1374 # ffffffffc020ca00 <default_pmm_manager+0x5f8>
ffffffffc0202f66:	a40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202f6a:	100027f3          	csrr	a5,sstatus
ffffffffc0202f6e:	8b89                	andi	a5,a5,2
ffffffffc0202f70:	26079a63          	bnez	a5,ffffffffc02031e4 <pmm_init+0x714>
ffffffffc0202f74:	000b3783          	ld	a5,0(s6)
ffffffffc0202f78:	779c                	ld	a5,40(a5)
ffffffffc0202f7a:	9782                	jalr	a5
ffffffffc0202f7c:	8c2a                	mv	s8,a0
ffffffffc0202f7e:	6098                	ld	a4,0(s1)
ffffffffc0202f80:	c0200437          	lui	s0,0xc0200
ffffffffc0202f84:	7afd                	lui	s5,0xfffff
ffffffffc0202f86:	00c71793          	slli	a5,a4,0xc
ffffffffc0202f8a:	6a05                	lui	s4,0x1
ffffffffc0202f8c:	02f47c63          	bgeu	s0,a5,ffffffffc0202fc4 <pmm_init+0x4f4>
ffffffffc0202f90:	00c45793          	srli	a5,s0,0xc
ffffffffc0202f94:	00093503          	ld	a0,0(s2)
ffffffffc0202f98:	3ae7f763          	bgeu	a5,a4,ffffffffc0203346 <pmm_init+0x876>
ffffffffc0202f9c:	0009b583          	ld	a1,0(s3)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	95a2                	add	a1,a1,s0
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	36050f63          	beqz	a0,ffffffffc0203326 <pmm_init+0x856>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	078a                	slli	a5,a5,0x2
ffffffffc0202fb0:	0157f7b3          	and	a5,a5,s5
ffffffffc0202fb4:	3a879663          	bne	a5,s0,ffffffffc0203360 <pmm_init+0x890>
ffffffffc0202fb8:	6098                	ld	a4,0(s1)
ffffffffc0202fba:	9452                	add	s0,s0,s4
ffffffffc0202fbc:	00c71793          	slli	a5,a4,0xc
ffffffffc0202fc0:	fcf468e3          	bltu	s0,a5,ffffffffc0202f90 <pmm_init+0x4c0>
ffffffffc0202fc4:	00093783          	ld	a5,0(s2)
ffffffffc0202fc8:	639c                	ld	a5,0(a5)
ffffffffc0202fca:	48079d63          	bnez	a5,ffffffffc0203464 <pmm_init+0x994>
ffffffffc0202fce:	100027f3          	csrr	a5,sstatus
ffffffffc0202fd2:	8b89                	andi	a5,a5,2
ffffffffc0202fd4:	26079463          	bnez	a5,ffffffffc020323c <pmm_init+0x76c>
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	4505                	li	a0,1
ffffffffc0202fde:	6f9c                	ld	a5,24(a5)
ffffffffc0202fe0:	9782                	jalr	a5
ffffffffc0202fe2:	8a2a                	mv	s4,a0
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4699                	li	a3,6
ffffffffc0202fea:	10000613          	li	a2,256
ffffffffc0202fee:	85d2                	mv	a1,s4
ffffffffc0202ff0:	9ebff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202ff4:	4a051863          	bnez	a0,ffffffffc02034a4 <pmm_init+0x9d4>
ffffffffc0202ff8:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202ffc:	4785                	li	a5,1
ffffffffc0202ffe:	48f71363          	bne	a4,a5,ffffffffc0203484 <pmm_init+0x9b4>
ffffffffc0203002:	00093503          	ld	a0,0(s2)
ffffffffc0203006:	6405                	lui	s0,0x1
ffffffffc0203008:	4699                	li	a3,6
ffffffffc020300a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020300e:	85d2                	mv	a1,s4
ffffffffc0203010:	9cbff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203014:	38051863          	bnez	a0,ffffffffc02033a4 <pmm_init+0x8d4>
ffffffffc0203018:	000a2703          	lw	a4,0(s4)
ffffffffc020301c:	4789                	li	a5,2
ffffffffc020301e:	4ef71363          	bne	a4,a5,ffffffffc0203504 <pmm_init+0xa34>
ffffffffc0203022:	0000a597          	auipc	a1,0xa
ffffffffc0203026:	b2658593          	addi	a1,a1,-1242 # ffffffffc020cb48 <default_pmm_manager+0x740>
ffffffffc020302a:	10000513          	li	a0,256
ffffffffc020302e:	3a2080ef          	jal	ra,ffffffffc020b3d0 <strcpy>
ffffffffc0203032:	10040593          	addi	a1,s0,256
ffffffffc0203036:	10000513          	li	a0,256
ffffffffc020303a:	3a8080ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc020303e:	4a051363          	bnez	a0,ffffffffc02034e4 <pmm_init+0xa14>
ffffffffc0203042:	000bb683          	ld	a3,0(s7)
ffffffffc0203046:	00080737          	lui	a4,0x80
ffffffffc020304a:	547d                	li	s0,-1
ffffffffc020304c:	40da06b3          	sub	a3,s4,a3
ffffffffc0203050:	8699                	srai	a3,a3,0x6
ffffffffc0203052:	609c                	ld	a5,0(s1)
ffffffffc0203054:	96ba                	add	a3,a3,a4
ffffffffc0203056:	8031                	srli	s0,s0,0xc
ffffffffc0203058:	0086f733          	and	a4,a3,s0
ffffffffc020305c:	06b2                	slli	a3,a3,0xc
ffffffffc020305e:	6ef77263          	bgeu	a4,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203062:	0009b783          	ld	a5,0(s3)
ffffffffc0203066:	10000513          	li	a0,256
ffffffffc020306a:	96be                	add	a3,a3,a5
ffffffffc020306c:	10068023          	sb	zero,256(a3)
ffffffffc0203070:	32a080ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc0203074:	44051863          	bnez	a0,ffffffffc02034c4 <pmm_init+0x9f4>
ffffffffc0203078:	00093a83          	ld	s5,0(s2)
ffffffffc020307c:	609c                	ld	a5,0(s1)
ffffffffc020307e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203082:	068a                	slli	a3,a3,0x2
ffffffffc0203084:	82b1                	srli	a3,a3,0xc
ffffffffc0203086:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc020308a:	8c75                	and	s0,s0,a3
ffffffffc020308c:	06b2                	slli	a3,a3,0xc
ffffffffc020308e:	6af47a63          	bgeu	s0,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203092:	0009b403          	ld	s0,0(s3)
ffffffffc0203096:	9436                	add	s0,s0,a3
ffffffffc0203098:	100027f3          	csrr	a5,sstatus
ffffffffc020309c:	8b89                	andi	a5,a5,2
ffffffffc020309e:	1e079c63          	bnez	a5,ffffffffc0203296 <pmm_init+0x7c6>
ffffffffc02030a2:	000b3783          	ld	a5,0(s6)
ffffffffc02030a6:	4585                	li	a1,1
ffffffffc02030a8:	8552                	mv	a0,s4
ffffffffc02030aa:	739c                	ld	a5,32(a5)
ffffffffc02030ac:	9782                	jalr	a5
ffffffffc02030ae:	601c                	ld	a5,0(s0)
ffffffffc02030b0:	6098                	ld	a4,0(s1)
ffffffffc02030b2:	078a                	slli	a5,a5,0x2
ffffffffc02030b4:	83b1                	srli	a5,a5,0xc
ffffffffc02030b6:	2ce7f563          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ba:	000bb503          	ld	a0,0(s7)
ffffffffc02030be:	fff80737          	lui	a4,0xfff80
ffffffffc02030c2:	97ba                	add	a5,a5,a4
ffffffffc02030c4:	079a                	slli	a5,a5,0x6
ffffffffc02030c6:	953e                	add	a0,a0,a5
ffffffffc02030c8:	100027f3          	csrr	a5,sstatus
ffffffffc02030cc:	8b89                	andi	a5,a5,2
ffffffffc02030ce:	1a079863          	bnez	a5,ffffffffc020327e <pmm_init+0x7ae>
ffffffffc02030d2:	000b3783          	ld	a5,0(s6)
ffffffffc02030d6:	4585                	li	a1,1
ffffffffc02030d8:	739c                	ld	a5,32(a5)
ffffffffc02030da:	9782                	jalr	a5
ffffffffc02030dc:	000ab783          	ld	a5,0(s5)
ffffffffc02030e0:	6098                	ld	a4,0(s1)
ffffffffc02030e2:	078a                	slli	a5,a5,0x2
ffffffffc02030e4:	83b1                	srli	a5,a5,0xc
ffffffffc02030e6:	28e7fd63          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ea:	000bb503          	ld	a0,0(s7)
ffffffffc02030ee:	fff80737          	lui	a4,0xfff80
ffffffffc02030f2:	97ba                	add	a5,a5,a4
ffffffffc02030f4:	079a                	slli	a5,a5,0x6
ffffffffc02030f6:	953e                	add	a0,a0,a5
ffffffffc02030f8:	100027f3          	csrr	a5,sstatus
ffffffffc02030fc:	8b89                	andi	a5,a5,2
ffffffffc02030fe:	16079463          	bnez	a5,ffffffffc0203266 <pmm_init+0x796>
ffffffffc0203102:	000b3783          	ld	a5,0(s6)
ffffffffc0203106:	4585                	li	a1,1
ffffffffc0203108:	739c                	ld	a5,32(a5)
ffffffffc020310a:	9782                	jalr	a5
ffffffffc020310c:	00093783          	ld	a5,0(s2)
ffffffffc0203110:	0007b023          	sd	zero,0(a5)
ffffffffc0203114:	12000073          	sfence.vma
ffffffffc0203118:	100027f3          	csrr	a5,sstatus
ffffffffc020311c:	8b89                	andi	a5,a5,2
ffffffffc020311e:	12079a63          	bnez	a5,ffffffffc0203252 <pmm_init+0x782>
ffffffffc0203122:	000b3783          	ld	a5,0(s6)
ffffffffc0203126:	779c                	ld	a5,40(a5)
ffffffffc0203128:	9782                	jalr	a5
ffffffffc020312a:	842a                	mv	s0,a0
ffffffffc020312c:	488c1e63          	bne	s8,s0,ffffffffc02035c8 <pmm_init+0xaf8>
ffffffffc0203130:	0000a517          	auipc	a0,0xa
ffffffffc0203134:	a9050513          	addi	a0,a0,-1392 # ffffffffc020cbc0 <default_pmm_manager+0x7b8>
ffffffffc0203138:	86efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020313c:	7406                	ld	s0,96(sp)
ffffffffc020313e:	70a6                	ld	ra,104(sp)
ffffffffc0203140:	64e6                	ld	s1,88(sp)
ffffffffc0203142:	6946                	ld	s2,80(sp)
ffffffffc0203144:	69a6                	ld	s3,72(sp)
ffffffffc0203146:	6a06                	ld	s4,64(sp)
ffffffffc0203148:	7ae2                	ld	s5,56(sp)
ffffffffc020314a:	7b42                	ld	s6,48(sp)
ffffffffc020314c:	7ba2                	ld	s7,40(sp)
ffffffffc020314e:	7c02                	ld	s8,32(sp)
ffffffffc0203150:	6ce2                	ld	s9,24(sp)
ffffffffc0203152:	6165                	addi	sp,sp,112
ffffffffc0203154:	e17fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203158:	c80007b7          	lui	a5,0xc8000
ffffffffc020315c:	b411                	j	ffffffffc0202b60 <pmm_init+0x90>
ffffffffc020315e:	b15fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4505                	li	a0,1
ffffffffc0203168:	6f9c                	ld	a5,24(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	8c2a                	mv	s8,a0
ffffffffc020316e:	afffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203172:	b9a9                	j	ffffffffc0202dcc <pmm_init+0x2fc>
ffffffffc0203174:	afffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203178:	000b3783          	ld	a5,0(s6)
ffffffffc020317c:	4505                	li	a0,1
ffffffffc020317e:	6f9c                	ld	a5,24(a5)
ffffffffc0203180:	9782                	jalr	a5
ffffffffc0203182:	8a2a                	mv	s4,a0
ffffffffc0203184:	ae9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203188:	b645                	j	ffffffffc0202d28 <pmm_init+0x258>
ffffffffc020318a:	ae9fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020318e:	000b3783          	ld	a5,0(s6)
ffffffffc0203192:	779c                	ld	a5,40(a5)
ffffffffc0203194:	9782                	jalr	a5
ffffffffc0203196:	842a                	mv	s0,a0
ffffffffc0203198:	ad5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020319c:	b6b9                	j	ffffffffc0202cea <pmm_init+0x21a>
ffffffffc020319e:	ad5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031a2:	000b3783          	ld	a5,0(s6)
ffffffffc02031a6:	4505                	li	a0,1
ffffffffc02031a8:	6f9c                	ld	a5,24(a5)
ffffffffc02031aa:	9782                	jalr	a5
ffffffffc02031ac:	842a                	mv	s0,a0
ffffffffc02031ae:	abffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031b2:	bc99                	j	ffffffffc0202c08 <pmm_init+0x138>
ffffffffc02031b4:	6705                	lui	a4,0x1
ffffffffc02031b6:	177d                	addi	a4,a4,-1
ffffffffc02031b8:	96ba                	add	a3,a3,a4
ffffffffc02031ba:	8ff5                	and	a5,a5,a3
ffffffffc02031bc:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031c0:	1ca77063          	bgeu	a4,a0,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02031c4:	000b3683          	ld	a3,0(s6)
ffffffffc02031c8:	fff80537          	lui	a0,0xfff80
ffffffffc02031cc:	972a                	add	a4,a4,a0
ffffffffc02031ce:	6a94                	ld	a3,16(a3)
ffffffffc02031d0:	8c1d                	sub	s0,s0,a5
ffffffffc02031d2:	00671513          	slli	a0,a4,0x6
ffffffffc02031d6:	00c45593          	srli	a1,s0,0xc
ffffffffc02031da:	9532                	add	a0,a0,a2
ffffffffc02031dc:	9682                	jalr	a3
ffffffffc02031de:	0009b583          	ld	a1,0(s3)
ffffffffc02031e2:	bac5                	j	ffffffffc0202bd2 <pmm_init+0x102>
ffffffffc02031e4:	a8ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031e8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ec:	779c                	ld	a5,40(a5)
ffffffffc02031ee:	9782                	jalr	a5
ffffffffc02031f0:	8c2a                	mv	s8,a0
ffffffffc02031f2:	a7bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031f6:	b361                	j	ffffffffc0202f7e <pmm_init+0x4ae>
ffffffffc02031f8:	a7bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203200:	779c                	ld	a5,40(a5)
ffffffffc0203202:	9782                	jalr	a5
ffffffffc0203204:	8a2a                	mv	s4,a0
ffffffffc0203206:	a67fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020320a:	bb81                	j	ffffffffc0202f5a <pmm_init+0x48a>
ffffffffc020320c:	e42a                	sd	a0,8(sp)
ffffffffc020320e:	a65fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203212:	000b3783          	ld	a5,0(s6)
ffffffffc0203216:	6522                	ld	a0,8(sp)
ffffffffc0203218:	4585                	li	a1,1
ffffffffc020321a:	739c                	ld	a5,32(a5)
ffffffffc020321c:	9782                	jalr	a5
ffffffffc020321e:	a4ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203222:	bb21                	j	ffffffffc0202f3a <pmm_init+0x46a>
ffffffffc0203224:	e42a                	sd	a0,8(sp)
ffffffffc0203226:	a4dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020322a:	000b3783          	ld	a5,0(s6)
ffffffffc020322e:	6522                	ld	a0,8(sp)
ffffffffc0203230:	4585                	li	a1,1
ffffffffc0203232:	739c                	ld	a5,32(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	a37fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020323a:	b9c1                	j	ffffffffc0202f0a <pmm_init+0x43a>
ffffffffc020323c:	a37fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203240:	000b3783          	ld	a5,0(s6)
ffffffffc0203244:	4505                	li	a0,1
ffffffffc0203246:	6f9c                	ld	a5,24(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	a21fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203250:	bb51                	j	ffffffffc0202fe4 <pmm_init+0x514>
ffffffffc0203252:	a21fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203256:	000b3783          	ld	a5,0(s6)
ffffffffc020325a:	779c                	ld	a5,40(a5)
ffffffffc020325c:	9782                	jalr	a5
ffffffffc020325e:	842a                	mv	s0,a0
ffffffffc0203260:	a0dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203264:	b5e1                	j	ffffffffc020312c <pmm_init+0x65c>
ffffffffc0203266:	e42a                	sd	a0,8(sp)
ffffffffc0203268:	a0bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020326c:	000b3783          	ld	a5,0(s6)
ffffffffc0203270:	6522                	ld	a0,8(sp)
ffffffffc0203272:	4585                	li	a1,1
ffffffffc0203274:	739c                	ld	a5,32(a5)
ffffffffc0203276:	9782                	jalr	a5
ffffffffc0203278:	9f5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020327c:	bd41                	j	ffffffffc020310c <pmm_init+0x63c>
ffffffffc020327e:	e42a                	sd	a0,8(sp)
ffffffffc0203280:	9f3fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203284:	000b3783          	ld	a5,0(s6)
ffffffffc0203288:	6522                	ld	a0,8(sp)
ffffffffc020328a:	4585                	li	a1,1
ffffffffc020328c:	739c                	ld	a5,32(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	9ddfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203294:	b5a1                	j	ffffffffc02030dc <pmm_init+0x60c>
ffffffffc0203296:	9ddfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020329a:	000b3783          	ld	a5,0(s6)
ffffffffc020329e:	4585                	li	a1,1
ffffffffc02032a0:	8552                	mv	a0,s4
ffffffffc02032a2:	739c                	ld	a5,32(a5)
ffffffffc02032a4:	9782                	jalr	a5
ffffffffc02032a6:	9c7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032aa:	b511                	j	ffffffffc02030ae <pmm_init+0x5de>
ffffffffc02032ac:	00010417          	auipc	s0,0x10
ffffffffc02032b0:	d5440413          	addi	s0,s0,-684 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032b4:	00010797          	auipc	a5,0x10
ffffffffc02032b8:	d4c78793          	addi	a5,a5,-692 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032bc:	a0f41de3          	bne	s0,a5,ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc02032c0:	4581                	li	a1,0
ffffffffc02032c2:	6605                	lui	a2,0x1
ffffffffc02032c4:	8522                	mv	a0,s0
ffffffffc02032c6:	176080ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc02032ca:	0000d597          	auipc	a1,0xd
ffffffffc02032ce:	d3658593          	addi	a1,a1,-714 # ffffffffc0210000 <bootstackguard>
ffffffffc02032d2:	0000e797          	auipc	a5,0xe
ffffffffc02032d6:	d20786a3          	sb	zero,-723(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc02032da:	0000d797          	auipc	a5,0xd
ffffffffc02032de:	d2078323          	sb	zero,-730(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02032e2:	00093503          	ld	a0,0(s2)
ffffffffc02032e6:	2555ec63          	bltu	a1,s5,ffffffffc020353e <pmm_init+0xa6e>
ffffffffc02032ea:	0009b683          	ld	a3,0(s3)
ffffffffc02032ee:	4701                	li	a4,0
ffffffffc02032f0:	6605                	lui	a2,0x1
ffffffffc02032f2:	40d586b3          	sub	a3,a1,a3
ffffffffc02032f6:	956ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02032fa:	00093503          	ld	a0,0(s2)
ffffffffc02032fe:	23546363          	bltu	s0,s5,ffffffffc0203524 <pmm_init+0xa54>
ffffffffc0203302:	0009b683          	ld	a3,0(s3)
ffffffffc0203306:	4701                	li	a4,0
ffffffffc0203308:	6605                	lui	a2,0x1
ffffffffc020330a:	40d406b3          	sub	a3,s0,a3
ffffffffc020330e:	85a2                	mv	a1,s0
ffffffffc0203310:	93cff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0203314:	12000073          	sfence.vma
ffffffffc0203318:	00009517          	auipc	a0,0x9
ffffffffc020331c:	3b850513          	addi	a0,a0,952 # ffffffffc020c6d0 <default_pmm_manager+0x2c8>
ffffffffc0203320:	e87fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203324:	ba4d                	j	ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc0203326:	00009697          	auipc	a3,0x9
ffffffffc020332a:	6fa68693          	addi	a3,a3,1786 # ffffffffc020ca20 <default_pmm_manager+0x618>
ffffffffc020332e:	00008617          	auipc	a2,0x8
ffffffffc0203332:	5f260613          	addi	a2,a2,1522 # ffffffffc020b920 <commands+0x210>
ffffffffc0203336:	28c00593          	li	a1,652
ffffffffc020333a:	00009517          	auipc	a0,0x9
ffffffffc020333e:	21e50513          	addi	a0,a0,542 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203342:	95cfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203346:	86a2                	mv	a3,s0
ffffffffc0203348:	00009617          	auipc	a2,0x9
ffffffffc020334c:	0f860613          	addi	a2,a2,248 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0203350:	28c00593          	li	a1,652
ffffffffc0203354:	00009517          	auipc	a0,0x9
ffffffffc0203358:	20450513          	addi	a0,a0,516 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020335c:	942fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203360:	00009697          	auipc	a3,0x9
ffffffffc0203364:	70068693          	addi	a3,a3,1792 # ffffffffc020ca60 <default_pmm_manager+0x658>
ffffffffc0203368:	00008617          	auipc	a2,0x8
ffffffffc020336c:	5b860613          	addi	a2,a2,1464 # ffffffffc020b920 <commands+0x210>
ffffffffc0203370:	28d00593          	li	a1,653
ffffffffc0203374:	00009517          	auipc	a0,0x9
ffffffffc0203378:	1e450513          	addi	a0,a0,484 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020337c:	922fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203380:	db5fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203384:	00009697          	auipc	a3,0x9
ffffffffc0203388:	50468693          	addi	a3,a3,1284 # ffffffffc020c888 <default_pmm_manager+0x480>
ffffffffc020338c:	00008617          	auipc	a2,0x8
ffffffffc0203390:	59460613          	addi	a2,a2,1428 # ffffffffc020b920 <commands+0x210>
ffffffffc0203394:	26900593          	li	a1,617
ffffffffc0203398:	00009517          	auipc	a0,0x9
ffffffffc020339c:	1c050513          	addi	a0,a0,448 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02033a0:	8fefd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033a4:	00009697          	auipc	a3,0x9
ffffffffc02033a8:	74468693          	addi	a3,a3,1860 # ffffffffc020cae8 <default_pmm_manager+0x6e0>
ffffffffc02033ac:	00008617          	auipc	a2,0x8
ffffffffc02033b0:	57460613          	addi	a2,a2,1396 # ffffffffc020b920 <commands+0x210>
ffffffffc02033b4:	29600593          	li	a1,662
ffffffffc02033b8:	00009517          	auipc	a0,0x9
ffffffffc02033bc:	1a050513          	addi	a0,a0,416 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02033c0:	8defd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033c4:	00009697          	auipc	a3,0x9
ffffffffc02033c8:	5e468693          	addi	a3,a3,1508 # ffffffffc020c9a8 <default_pmm_manager+0x5a0>
ffffffffc02033cc:	00008617          	auipc	a2,0x8
ffffffffc02033d0:	55460613          	addi	a2,a2,1364 # ffffffffc020b920 <commands+0x210>
ffffffffc02033d4:	27500593          	li	a1,629
ffffffffc02033d8:	00009517          	auipc	a0,0x9
ffffffffc02033dc:	18050513          	addi	a0,a0,384 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02033e0:	8befd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033e4:	00009697          	auipc	a3,0x9
ffffffffc02033e8:	59468693          	addi	a3,a3,1428 # ffffffffc020c978 <default_pmm_manager+0x570>
ffffffffc02033ec:	00008617          	auipc	a2,0x8
ffffffffc02033f0:	53460613          	addi	a2,a2,1332 # ffffffffc020b920 <commands+0x210>
ffffffffc02033f4:	26b00593          	li	a1,619
ffffffffc02033f8:	00009517          	auipc	a0,0x9
ffffffffc02033fc:	16050513          	addi	a0,a0,352 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203400:	89efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203404:	00009697          	auipc	a3,0x9
ffffffffc0203408:	3e468693          	addi	a3,a3,996 # ffffffffc020c7e8 <default_pmm_manager+0x3e0>
ffffffffc020340c:	00008617          	auipc	a2,0x8
ffffffffc0203410:	51460613          	addi	a2,a2,1300 # ffffffffc020b920 <commands+0x210>
ffffffffc0203414:	26a00593          	li	a1,618
ffffffffc0203418:	00009517          	auipc	a0,0x9
ffffffffc020341c:	14050513          	addi	a0,a0,320 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203420:	87efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203424:	00009697          	auipc	a3,0x9
ffffffffc0203428:	53c68693          	addi	a3,a3,1340 # ffffffffc020c960 <default_pmm_manager+0x558>
ffffffffc020342c:	00008617          	auipc	a2,0x8
ffffffffc0203430:	4f460613          	addi	a2,a2,1268 # ffffffffc020b920 <commands+0x210>
ffffffffc0203434:	26f00593          	li	a1,623
ffffffffc0203438:	00009517          	auipc	a0,0x9
ffffffffc020343c:	12050513          	addi	a0,a0,288 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203440:	85efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203444:	00009697          	auipc	a3,0x9
ffffffffc0203448:	3bc68693          	addi	a3,a3,956 # ffffffffc020c800 <default_pmm_manager+0x3f8>
ffffffffc020344c:	00008617          	auipc	a2,0x8
ffffffffc0203450:	4d460613          	addi	a2,a2,1236 # ffffffffc020b920 <commands+0x210>
ffffffffc0203454:	26e00593          	li	a1,622
ffffffffc0203458:	00009517          	auipc	a0,0x9
ffffffffc020345c:	10050513          	addi	a0,a0,256 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203460:	83efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203464:	00009697          	auipc	a3,0x9
ffffffffc0203468:	61468693          	addi	a3,a3,1556 # ffffffffc020ca78 <default_pmm_manager+0x670>
ffffffffc020346c:	00008617          	auipc	a2,0x8
ffffffffc0203470:	4b460613          	addi	a2,a2,1204 # ffffffffc020b920 <commands+0x210>
ffffffffc0203474:	29000593          	li	a1,656
ffffffffc0203478:	00009517          	auipc	a0,0x9
ffffffffc020347c:	0e050513          	addi	a0,a0,224 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203480:	81efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203484:	00009697          	auipc	a3,0x9
ffffffffc0203488:	64c68693          	addi	a3,a3,1612 # ffffffffc020cad0 <default_pmm_manager+0x6c8>
ffffffffc020348c:	00008617          	auipc	a2,0x8
ffffffffc0203490:	49460613          	addi	a2,a2,1172 # ffffffffc020b920 <commands+0x210>
ffffffffc0203494:	29500593          	li	a1,661
ffffffffc0203498:	00009517          	auipc	a0,0x9
ffffffffc020349c:	0c050513          	addi	a0,a0,192 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02034a0:	ffffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034a4:	00009697          	auipc	a3,0x9
ffffffffc02034a8:	5ec68693          	addi	a3,a3,1516 # ffffffffc020ca90 <default_pmm_manager+0x688>
ffffffffc02034ac:	00008617          	auipc	a2,0x8
ffffffffc02034b0:	47460613          	addi	a2,a2,1140 # ffffffffc020b920 <commands+0x210>
ffffffffc02034b4:	29400593          	li	a1,660
ffffffffc02034b8:	00009517          	auipc	a0,0x9
ffffffffc02034bc:	0a050513          	addi	a0,a0,160 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02034c0:	fdffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034c4:	00009697          	auipc	a3,0x9
ffffffffc02034c8:	6d468693          	addi	a3,a3,1748 # ffffffffc020cb98 <default_pmm_manager+0x790>
ffffffffc02034cc:	00008617          	auipc	a2,0x8
ffffffffc02034d0:	45460613          	addi	a2,a2,1108 # ffffffffc020b920 <commands+0x210>
ffffffffc02034d4:	29e00593          	li	a1,670
ffffffffc02034d8:	00009517          	auipc	a0,0x9
ffffffffc02034dc:	08050513          	addi	a0,a0,128 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02034e0:	fbffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	67c68693          	addi	a3,a3,1660 # ffffffffc020cb60 <default_pmm_manager+0x758>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	43460613          	addi	a2,a2,1076 # ffffffffc020b920 <commands+0x210>
ffffffffc02034f4:	29b00593          	li	a1,667
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	06050513          	addi	a0,a0,96 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	00009697          	auipc	a3,0x9
ffffffffc0203508:	62c68693          	addi	a3,a3,1580 # ffffffffc020cb30 <default_pmm_manager+0x728>
ffffffffc020350c:	00008617          	auipc	a2,0x8
ffffffffc0203510:	41460613          	addi	a2,a2,1044 # ffffffffc020b920 <commands+0x210>
ffffffffc0203514:	29700593          	li	a1,663
ffffffffc0203518:	00009517          	auipc	a0,0x9
ffffffffc020351c:	04050513          	addi	a0,a0,64 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203520:	f7ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203524:	86a2                	mv	a3,s0
ffffffffc0203526:	00009617          	auipc	a2,0x9
ffffffffc020352a:	fc260613          	addi	a2,a2,-62 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc020352e:	0dc00593          	li	a1,220
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	02650513          	addi	a0,a0,38 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	86ae                	mv	a3,a1
ffffffffc0203540:	00009617          	auipc	a2,0x9
ffffffffc0203544:	fa860613          	addi	a2,a2,-88 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0203548:	0db00593          	li	a1,219
ffffffffc020354c:	00009517          	auipc	a0,0x9
ffffffffc0203550:	00c50513          	addi	a0,a0,12 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203554:	f4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203558:	00009697          	auipc	a3,0x9
ffffffffc020355c:	1c068693          	addi	a3,a3,448 # ffffffffc020c718 <default_pmm_manager+0x310>
ffffffffc0203560:	00008617          	auipc	a2,0x8
ffffffffc0203564:	3c060613          	addi	a2,a2,960 # ffffffffc020b920 <commands+0x210>
ffffffffc0203568:	24e00593          	li	a1,590
ffffffffc020356c:	00009517          	auipc	a0,0x9
ffffffffc0203570:	fec50513          	addi	a0,a0,-20 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203574:	f2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203578:	00009697          	auipc	a3,0x9
ffffffffc020357c:	18068693          	addi	a3,a3,384 # ffffffffc020c6f8 <default_pmm_manager+0x2f0>
ffffffffc0203580:	00008617          	auipc	a2,0x8
ffffffffc0203584:	3a060613          	addi	a2,a2,928 # ffffffffc020b920 <commands+0x210>
ffffffffc0203588:	24d00593          	li	a1,589
ffffffffc020358c:	00009517          	auipc	a0,0x9
ffffffffc0203590:	fcc50513          	addi	a0,a0,-52 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203594:	f0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203598:	00009617          	auipc	a2,0x9
ffffffffc020359c:	0f060613          	addi	a2,a2,240 # ffffffffc020c688 <default_pmm_manager+0x280>
ffffffffc02035a0:	0aa00593          	li	a1,170
ffffffffc02035a4:	00009517          	auipc	a0,0x9
ffffffffc02035a8:	fb450513          	addi	a0,a0,-76 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02035ac:	ef3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b0:	00009617          	auipc	a2,0x9
ffffffffc02035b4:	04060613          	addi	a2,a2,64 # ffffffffc020c5f0 <default_pmm_manager+0x1e8>
ffffffffc02035b8:	06500593          	li	a1,101
ffffffffc02035bc:	00009517          	auipc	a0,0x9
ffffffffc02035c0:	f9c50513          	addi	a0,a0,-100 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02035c4:	edbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c8:	00009697          	auipc	a3,0x9
ffffffffc02035cc:	41068693          	addi	a3,a3,1040 # ffffffffc020c9d8 <default_pmm_manager+0x5d0>
ffffffffc02035d0:	00008617          	auipc	a2,0x8
ffffffffc02035d4:	35060613          	addi	a2,a2,848 # ffffffffc020b920 <commands+0x210>
ffffffffc02035d8:	2a700593          	li	a1,679
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	f7c50513          	addi	a0,a0,-132 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	23068693          	addi	a3,a3,560 # ffffffffc020c818 <default_pmm_manager+0x410>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	33060613          	addi	a2,a2,816 # ffffffffc020b920 <commands+0x210>
ffffffffc02035f8:	25c00593          	li	a1,604
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	f5c50513          	addi	a0,a0,-164 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	86d6                	mv	a3,s5
ffffffffc020360a:	00009617          	auipc	a2,0x9
ffffffffc020360e:	e3660613          	addi	a2,a2,-458 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0203612:	25b00593          	li	a1,603
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	f4250513          	addi	a0,a0,-190 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	33e68693          	addi	a3,a3,830 # ffffffffc020c960 <default_pmm_manager+0x558>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	2f660613          	addi	a2,a2,758 # ffffffffc020b920 <commands+0x210>
ffffffffc0203632:	26800593          	li	a1,616
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	f2250513          	addi	a0,a0,-222 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	30668693          	addi	a3,a3,774 # ffffffffc020c948 <default_pmm_manager+0x540>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	2d660613          	addi	a2,a2,726 # ffffffffc020b920 <commands+0x210>
ffffffffc0203652:	26700593          	li	a1,615
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	f0250513          	addi	a0,a0,-254 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	2b668693          	addi	a3,a3,694 # ffffffffc020c918 <default_pmm_manager+0x510>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	2b660613          	addi	a2,a2,694 # ffffffffc020b920 <commands+0x210>
ffffffffc0203672:	26600593          	li	a1,614
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	ee250513          	addi	a0,a0,-286 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	27e68693          	addi	a3,a3,638 # ffffffffc020c900 <default_pmm_manager+0x4f8>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	29660613          	addi	a2,a2,662 # ffffffffc020b920 <commands+0x210>
ffffffffc0203692:	26400593          	li	a1,612
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	ec250513          	addi	a0,a0,-318 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	23e68693          	addi	a3,a3,574 # ffffffffc020c8e0 <default_pmm_manager+0x4d8>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	27660613          	addi	a2,a2,630 # ffffffffc020b920 <commands+0x210>
ffffffffc02036b2:	26300593          	li	a1,611
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	ea250513          	addi	a0,a0,-350 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	20e68693          	addi	a3,a3,526 # ffffffffc020c8d0 <default_pmm_manager+0x4c8>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	25660613          	addi	a2,a2,598 # ffffffffc020b920 <commands+0x210>
ffffffffc02036d2:	26200593          	li	a1,610
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	e8250513          	addi	a0,a0,-382 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	00009697          	auipc	a3,0x9
ffffffffc02036e6:	1de68693          	addi	a3,a3,478 # ffffffffc020c8c0 <default_pmm_manager+0x4b8>
ffffffffc02036ea:	00008617          	auipc	a2,0x8
ffffffffc02036ee:	23660613          	addi	a2,a2,566 # ffffffffc020b920 <commands+0x210>
ffffffffc02036f2:	26100593          	li	a1,609
ffffffffc02036f6:	00009517          	auipc	a0,0x9
ffffffffc02036fa:	e6250513          	addi	a0,a0,-414 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02036fe:	da1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203702:	00009697          	auipc	a3,0x9
ffffffffc0203706:	18668693          	addi	a3,a3,390 # ffffffffc020c888 <default_pmm_manager+0x480>
ffffffffc020370a:	00008617          	auipc	a2,0x8
ffffffffc020370e:	21660613          	addi	a2,a2,534 # ffffffffc020b920 <commands+0x210>
ffffffffc0203712:	26000593          	li	a1,608
ffffffffc0203716:	00009517          	auipc	a0,0x9
ffffffffc020371a:	e4250513          	addi	a0,a0,-446 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020371e:	d81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203722:	00009697          	auipc	a3,0x9
ffffffffc0203726:	2b668693          	addi	a3,a3,694 # ffffffffc020c9d8 <default_pmm_manager+0x5d0>
ffffffffc020372a:	00008617          	auipc	a2,0x8
ffffffffc020372e:	1f660613          	addi	a2,a2,502 # ffffffffc020b920 <commands+0x210>
ffffffffc0203732:	27d00593          	li	a1,637
ffffffffc0203736:	00009517          	auipc	a0,0x9
ffffffffc020373a:	e2250513          	addi	a0,a0,-478 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020373e:	d61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203742:	00009617          	auipc	a2,0x9
ffffffffc0203746:	cfe60613          	addi	a2,a2,-770 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc020374a:	07100593          	li	a1,113
ffffffffc020374e:	00009517          	auipc	a0,0x9
ffffffffc0203752:	d1a50513          	addi	a0,a0,-742 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0203756:	d49fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020375a:	86a2                	mv	a3,s0
ffffffffc020375c:	00009617          	auipc	a2,0x9
ffffffffc0203760:	d8c60613          	addi	a2,a2,-628 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0203764:	0ca00593          	li	a1,202
ffffffffc0203768:	00009517          	auipc	a0,0x9
ffffffffc020376c:	df050513          	addi	a0,a0,-528 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203770:	d2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203774:	00009617          	auipc	a2,0x9
ffffffffc0203778:	d7460613          	addi	a2,a2,-652 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc020377c:	08100593          	li	a1,129
ffffffffc0203780:	00009517          	auipc	a0,0x9
ffffffffc0203784:	dd850513          	addi	a0,a0,-552 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203788:	d17fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020378c:	00009697          	auipc	a3,0x9
ffffffffc0203790:	0bc68693          	addi	a3,a3,188 # ffffffffc020c848 <default_pmm_manager+0x440>
ffffffffc0203794:	00008617          	auipc	a2,0x8
ffffffffc0203798:	18c60613          	addi	a2,a2,396 # ffffffffc020b920 <commands+0x210>
ffffffffc020379c:	25f00593          	li	a1,607
ffffffffc02037a0:	00009517          	auipc	a0,0x9
ffffffffc02037a4:	db850513          	addi	a0,a0,-584 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02037a8:	cf7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ac:	00009697          	auipc	a3,0x9
ffffffffc02037b0:	fdc68693          	addi	a3,a3,-36 # ffffffffc020c788 <default_pmm_manager+0x380>
ffffffffc02037b4:	00008617          	auipc	a2,0x8
ffffffffc02037b8:	16c60613          	addi	a2,a2,364 # ffffffffc020b920 <commands+0x210>
ffffffffc02037bc:	25300593          	li	a1,595
ffffffffc02037c0:	00009517          	auipc	a0,0x9
ffffffffc02037c4:	d9850513          	addi	a0,a0,-616 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02037c8:	cd7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037cc:	985fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc02037d0:	00009697          	auipc	a3,0x9
ffffffffc02037d4:	fe868693          	addi	a3,a3,-24 # ffffffffc020c7b8 <default_pmm_manager+0x3b0>
ffffffffc02037d8:	00008617          	auipc	a2,0x8
ffffffffc02037dc:	14860613          	addi	a2,a2,328 # ffffffffc020b920 <commands+0x210>
ffffffffc02037e0:	25600593          	li	a1,598
ffffffffc02037e4:	00009517          	auipc	a0,0x9
ffffffffc02037e8:	d7450513          	addi	a0,a0,-652 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02037ec:	cb3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037f0:	00009697          	auipc	a3,0x9
ffffffffc02037f4:	f6868693          	addi	a3,a3,-152 # ffffffffc020c758 <default_pmm_manager+0x350>
ffffffffc02037f8:	00008617          	auipc	a2,0x8
ffffffffc02037fc:	12860613          	addi	a2,a2,296 # ffffffffc020b920 <commands+0x210>
ffffffffc0203800:	24f00593          	li	a1,591
ffffffffc0203804:	00009517          	auipc	a0,0x9
ffffffffc0203808:	d5450513          	addi	a0,a0,-684 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020380c:	c93fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203810:	00009697          	auipc	a3,0x9
ffffffffc0203814:	fd868693          	addi	a3,a3,-40 # ffffffffc020c7e8 <default_pmm_manager+0x3e0>
ffffffffc0203818:	00008617          	auipc	a2,0x8
ffffffffc020381c:	10860613          	addi	a2,a2,264 # ffffffffc020b920 <commands+0x210>
ffffffffc0203820:	25700593          	li	a1,599
ffffffffc0203824:	00009517          	auipc	a0,0x9
ffffffffc0203828:	d3450513          	addi	a0,a0,-716 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020382c:	c73fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203830:	00009617          	auipc	a2,0x9
ffffffffc0203834:	c1060613          	addi	a2,a2,-1008 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0203838:	25a00593          	li	a1,602
ffffffffc020383c:	00009517          	auipc	a0,0x9
ffffffffc0203840:	d1c50513          	addi	a0,a0,-740 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203844:	c5bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203848:	00009697          	auipc	a3,0x9
ffffffffc020384c:	fb868693          	addi	a3,a3,-72 # ffffffffc020c800 <default_pmm_manager+0x3f8>
ffffffffc0203850:	00008617          	auipc	a2,0x8
ffffffffc0203854:	0d060613          	addi	a2,a2,208 # ffffffffc020b920 <commands+0x210>
ffffffffc0203858:	25800593          	li	a1,600
ffffffffc020385c:	00009517          	auipc	a0,0x9
ffffffffc0203860:	cfc50513          	addi	a0,a0,-772 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203864:	c3bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203868:	86ca                	mv	a3,s2
ffffffffc020386a:	00009617          	auipc	a2,0x9
ffffffffc020386e:	c7e60613          	addi	a2,a2,-898 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0203872:	0c600593          	li	a1,198
ffffffffc0203876:	00009517          	auipc	a0,0x9
ffffffffc020387a:	ce250513          	addi	a0,a0,-798 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020387e:	c21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203882:	00009697          	auipc	a3,0x9
ffffffffc0203886:	0de68693          	addi	a3,a3,222 # ffffffffc020c960 <default_pmm_manager+0x558>
ffffffffc020388a:	00008617          	auipc	a2,0x8
ffffffffc020388e:	09660613          	addi	a2,a2,150 # ffffffffc020b920 <commands+0x210>
ffffffffc0203892:	27300593          	li	a1,627
ffffffffc0203896:	00009517          	auipc	a0,0x9
ffffffffc020389a:	cc250513          	addi	a0,a0,-830 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc020389e:	c01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a2:	00009697          	auipc	a3,0x9
ffffffffc02038a6:	0ee68693          	addi	a3,a3,238 # ffffffffc020c990 <default_pmm_manager+0x588>
ffffffffc02038aa:	00008617          	auipc	a2,0x8
ffffffffc02038ae:	07660613          	addi	a2,a2,118 # ffffffffc020b920 <commands+0x210>
ffffffffc02038b2:	27200593          	li	a1,626
ffffffffc02038b6:	00009517          	auipc	a0,0x9
ffffffffc02038ba:	ca250513          	addi	a0,a0,-862 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc02038be:	be1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02038c2 <copy_range>:
ffffffffc02038c2:	7159                	addi	sp,sp,-112
ffffffffc02038c4:	00d667b3          	or	a5,a2,a3
ffffffffc02038c8:	f486                	sd	ra,104(sp)
ffffffffc02038ca:	f0a2                	sd	s0,96(sp)
ffffffffc02038cc:	eca6                	sd	s1,88(sp)
ffffffffc02038ce:	e8ca                	sd	s2,80(sp)
ffffffffc02038d0:	e4ce                	sd	s3,72(sp)
ffffffffc02038d2:	e0d2                	sd	s4,64(sp)
ffffffffc02038d4:	fc56                	sd	s5,56(sp)
ffffffffc02038d6:	f85a                	sd	s6,48(sp)
ffffffffc02038d8:	f45e                	sd	s7,40(sp)
ffffffffc02038da:	f062                	sd	s8,32(sp)
ffffffffc02038dc:	ec66                	sd	s9,24(sp)
ffffffffc02038de:	e86a                	sd	s10,16(sp)
ffffffffc02038e0:	e46e                	sd	s11,8(sp)
ffffffffc02038e2:	17d2                	slli	a5,a5,0x34
ffffffffc02038e4:	20079f63          	bnez	a5,ffffffffc0203b02 <copy_range+0x240>
ffffffffc02038e8:	002007b7          	lui	a5,0x200
ffffffffc02038ec:	8432                	mv	s0,a2
ffffffffc02038ee:	1af66263          	bltu	a2,a5,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f2:	8936                	mv	s2,a3
ffffffffc02038f4:	18d67f63          	bgeu	a2,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f8:	4785                	li	a5,1
ffffffffc02038fa:	07fe                	slli	a5,a5,0x1f
ffffffffc02038fc:	18d7eb63          	bltu	a5,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc0203900:	5b7d                	li	s6,-1
ffffffffc0203902:	8aaa                	mv	s5,a0
ffffffffc0203904:	89ae                	mv	s3,a1
ffffffffc0203906:	6a05                	lui	s4,0x1
ffffffffc0203908:	00093c17          	auipc	s8,0x93
ffffffffc020390c:	f98c0c13          	addi	s8,s8,-104 # ffffffffc02968a0 <npage>
ffffffffc0203910:	00093b97          	auipc	s7,0x93
ffffffffc0203914:	f98b8b93          	addi	s7,s7,-104 # ffffffffc02968a8 <pages>
ffffffffc0203918:	00cb5b13          	srli	s6,s6,0xc
ffffffffc020391c:	00093c97          	auipc	s9,0x93
ffffffffc0203920:	f94c8c93          	addi	s9,s9,-108 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203924:	4601                	li	a2,0
ffffffffc0203926:	85a2                	mv	a1,s0
ffffffffc0203928:	854e                	mv	a0,s3
ffffffffc020392a:	8fbfe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020392e:	84aa                	mv	s1,a0
ffffffffc0203930:	0e050c63          	beqz	a0,ffffffffc0203a28 <copy_range+0x166>
ffffffffc0203934:	611c                	ld	a5,0(a0)
ffffffffc0203936:	8b85                	andi	a5,a5,1
ffffffffc0203938:	e785                	bnez	a5,ffffffffc0203960 <copy_range+0x9e>
ffffffffc020393a:	9452                	add	s0,s0,s4
ffffffffc020393c:	ff2464e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203940:	4501                	li	a0,0
ffffffffc0203942:	70a6                	ld	ra,104(sp)
ffffffffc0203944:	7406                	ld	s0,96(sp)
ffffffffc0203946:	64e6                	ld	s1,88(sp)
ffffffffc0203948:	6946                	ld	s2,80(sp)
ffffffffc020394a:	69a6                	ld	s3,72(sp)
ffffffffc020394c:	6a06                	ld	s4,64(sp)
ffffffffc020394e:	7ae2                	ld	s5,56(sp)
ffffffffc0203950:	7b42                	ld	s6,48(sp)
ffffffffc0203952:	7ba2                	ld	s7,40(sp)
ffffffffc0203954:	7c02                	ld	s8,32(sp)
ffffffffc0203956:	6ce2                	ld	s9,24(sp)
ffffffffc0203958:	6d42                	ld	s10,16(sp)
ffffffffc020395a:	6da2                	ld	s11,8(sp)
ffffffffc020395c:	6165                	addi	sp,sp,112
ffffffffc020395e:	8082                	ret
ffffffffc0203960:	4605                	li	a2,1
ffffffffc0203962:	85a2                	mv	a1,s0
ffffffffc0203964:	8556                	mv	a0,s5
ffffffffc0203966:	8bffe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020396a:	c56d                	beqz	a0,ffffffffc0203a54 <copy_range+0x192>
ffffffffc020396c:	609c                	ld	a5,0(s1)
ffffffffc020396e:	0017f713          	andi	a4,a5,1
ffffffffc0203972:	01f7f493          	andi	s1,a5,31
ffffffffc0203976:	16070a63          	beqz	a4,ffffffffc0203aea <copy_range+0x228>
ffffffffc020397a:	000c3683          	ld	a3,0(s8)
ffffffffc020397e:	078a                	slli	a5,a5,0x2
ffffffffc0203980:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203984:	14d77763          	bgeu	a4,a3,ffffffffc0203ad2 <copy_range+0x210>
ffffffffc0203988:	000bb783          	ld	a5,0(s7)
ffffffffc020398c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203990:	9736                	add	a4,a4,a3
ffffffffc0203992:	071a                	slli	a4,a4,0x6
ffffffffc0203994:	00e78db3          	add	s11,a5,a4
ffffffffc0203998:	10002773          	csrr	a4,sstatus
ffffffffc020399c:	8b09                	andi	a4,a4,2
ffffffffc020399e:	e345                	bnez	a4,ffffffffc0203a3e <copy_range+0x17c>
ffffffffc02039a0:	000cb703          	ld	a4,0(s9)
ffffffffc02039a4:	4505                	li	a0,1
ffffffffc02039a6:	6f18                	ld	a4,24(a4)
ffffffffc02039a8:	9702                	jalr	a4
ffffffffc02039aa:	8d2a                	mv	s10,a0
ffffffffc02039ac:	0c0d8363          	beqz	s11,ffffffffc0203a72 <copy_range+0x1b0>
ffffffffc02039b0:	100d0163          	beqz	s10,ffffffffc0203ab2 <copy_range+0x1f0>
ffffffffc02039b4:	000bb703          	ld	a4,0(s7)
ffffffffc02039b8:	000805b7          	lui	a1,0x80
ffffffffc02039bc:	000c3603          	ld	a2,0(s8)
ffffffffc02039c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02039c4:	8699                	srai	a3,a3,0x6
ffffffffc02039c6:	96ae                	add	a3,a3,a1
ffffffffc02039c8:	0166f7b3          	and	a5,a3,s6
ffffffffc02039cc:	06b2                	slli	a3,a3,0xc
ffffffffc02039ce:	08c7f663          	bgeu	a5,a2,ffffffffc0203a5a <copy_range+0x198>
ffffffffc02039d2:	40ed07b3          	sub	a5,s10,a4
ffffffffc02039d6:	00093717          	auipc	a4,0x93
ffffffffc02039da:	ee270713          	addi	a4,a4,-286 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02039de:	6308                	ld	a0,0(a4)
ffffffffc02039e0:	8799                	srai	a5,a5,0x6
ffffffffc02039e2:	97ae                	add	a5,a5,a1
ffffffffc02039e4:	0167f733          	and	a4,a5,s6
ffffffffc02039e8:	00a685b3          	add	a1,a3,a0
ffffffffc02039ec:	07b2                	slli	a5,a5,0xc
ffffffffc02039ee:	06c77563          	bgeu	a4,a2,ffffffffc0203a58 <copy_range+0x196>
ffffffffc02039f2:	6605                	lui	a2,0x1
ffffffffc02039f4:	953e                	add	a0,a0,a5
ffffffffc02039f6:	299070ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc02039fa:	86a6                	mv	a3,s1
ffffffffc02039fc:	8622                	mv	a2,s0
ffffffffc02039fe:	85ea                	mv	a1,s10
ffffffffc0203a00:	8556                	mv	a0,s5
ffffffffc0203a02:	fd9fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203a06:	d915                	beqz	a0,ffffffffc020393a <copy_range+0x78>
ffffffffc0203a08:	00009697          	auipc	a3,0x9
ffffffffc0203a0c:	1f868693          	addi	a3,a3,504 # ffffffffc020cc00 <default_pmm_manager+0x7f8>
ffffffffc0203a10:	00008617          	auipc	a2,0x8
ffffffffc0203a14:	f1060613          	addi	a2,a2,-240 # ffffffffc020b920 <commands+0x210>
ffffffffc0203a18:	1eb00593          	li	a1,491
ffffffffc0203a1c:	00009517          	auipc	a0,0x9
ffffffffc0203a20:	b3c50513          	addi	a0,a0,-1220 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203a24:	a7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a28:	00200637          	lui	a2,0x200
ffffffffc0203a2c:	9432                	add	s0,s0,a2
ffffffffc0203a2e:	ffe00637          	lui	a2,0xffe00
ffffffffc0203a32:	8c71                	and	s0,s0,a2
ffffffffc0203a34:	f00406e3          	beqz	s0,ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a38:	ef2466e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203a3c:	b711                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a3e:	a34fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a42:	000cb703          	ld	a4,0(s9)
ffffffffc0203a46:	4505                	li	a0,1
ffffffffc0203a48:	6f18                	ld	a4,24(a4)
ffffffffc0203a4a:	9702                	jalr	a4
ffffffffc0203a4c:	8d2a                	mv	s10,a0
ffffffffc0203a4e:	a1efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a52:	bfa9                	j	ffffffffc02039ac <copy_range+0xea>
ffffffffc0203a54:	5571                	li	a0,-4
ffffffffc0203a56:	b5f5                	j	ffffffffc0203942 <copy_range+0x80>
ffffffffc0203a58:	86be                	mv	a3,a5
ffffffffc0203a5a:	00009617          	auipc	a2,0x9
ffffffffc0203a5e:	9e660613          	addi	a2,a2,-1562 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0203a62:	07100593          	li	a1,113
ffffffffc0203a66:	00009517          	auipc	a0,0x9
ffffffffc0203a6a:	a0250513          	addi	a0,a0,-1534 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0203a6e:	a31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a72:	00009697          	auipc	a3,0x9
ffffffffc0203a76:	16e68693          	addi	a3,a3,366 # ffffffffc020cbe0 <default_pmm_manager+0x7d8>
ffffffffc0203a7a:	00008617          	auipc	a2,0x8
ffffffffc0203a7e:	ea660613          	addi	a2,a2,-346 # ffffffffc020b920 <commands+0x210>
ffffffffc0203a82:	1ce00593          	li	a1,462
ffffffffc0203a86:	00009517          	auipc	a0,0x9
ffffffffc0203a8a:	ad250513          	addi	a0,a0,-1326 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203a8e:	a11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a92:	00009697          	auipc	a3,0x9
ffffffffc0203a96:	b2e68693          	addi	a3,a3,-1234 # ffffffffc020c5c0 <default_pmm_manager+0x1b8>
ffffffffc0203a9a:	00008617          	auipc	a2,0x8
ffffffffc0203a9e:	e8660613          	addi	a2,a2,-378 # ffffffffc020b920 <commands+0x210>
ffffffffc0203aa2:	1b600593          	li	a1,438
ffffffffc0203aa6:	00009517          	auipc	a0,0x9
ffffffffc0203aaa:	ab250513          	addi	a0,a0,-1358 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203aae:	9f1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab2:	00009697          	auipc	a3,0x9
ffffffffc0203ab6:	13e68693          	addi	a3,a3,318 # ffffffffc020cbf0 <default_pmm_manager+0x7e8>
ffffffffc0203aba:	00008617          	auipc	a2,0x8
ffffffffc0203abe:	e6660613          	addi	a2,a2,-410 # ffffffffc020b920 <commands+0x210>
ffffffffc0203ac2:	1cf00593          	li	a1,463
ffffffffc0203ac6:	00009517          	auipc	a0,0x9
ffffffffc0203aca:	a9250513          	addi	a0,a0,-1390 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203ace:	9d1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ad2:	00009617          	auipc	a2,0x9
ffffffffc0203ad6:	a3e60613          	addi	a2,a2,-1474 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc0203ada:	06900593          	li	a1,105
ffffffffc0203ade:	00009517          	auipc	a0,0x9
ffffffffc0203ae2:	98a50513          	addi	a0,a0,-1654 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0203ae6:	9b9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	a4660613          	addi	a2,a2,-1466 # ffffffffc020c530 <default_pmm_manager+0x128>
ffffffffc0203af2:	07f00593          	li	a1,127
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	97250513          	addi	a0,a0,-1678 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	a8e68693          	addi	a3,a3,-1394 # ffffffffc020c590 <default_pmm_manager+0x188>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	e1660613          	addi	a2,a2,-490 # ffffffffc020b920 <commands+0x210>
ffffffffc0203b12:	1b500593          	li	a1,437
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	a4250513          	addi	a0,a0,-1470 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b22 <pgdir_alloc_page>:
ffffffffc0203b22:	7179                	addi	sp,sp,-48
ffffffffc0203b24:	ec26                	sd	s1,24(sp)
ffffffffc0203b26:	e84a                	sd	s2,16(sp)
ffffffffc0203b28:	e052                	sd	s4,0(sp)
ffffffffc0203b2a:	f406                	sd	ra,40(sp)
ffffffffc0203b2c:	f022                	sd	s0,32(sp)
ffffffffc0203b2e:	e44e                	sd	s3,8(sp)
ffffffffc0203b30:	8a2a                	mv	s4,a0
ffffffffc0203b32:	84ae                	mv	s1,a1
ffffffffc0203b34:	8932                	mv	s2,a2
ffffffffc0203b36:	100027f3          	csrr	a5,sstatus
ffffffffc0203b3a:	8b89                	andi	a5,a5,2
ffffffffc0203b3c:	00093997          	auipc	s3,0x93
ffffffffc0203b40:	d7498993          	addi	s3,s3,-652 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203b44:	ef8d                	bnez	a5,ffffffffc0203b7e <pgdir_alloc_page+0x5c>
ffffffffc0203b46:	0009b783          	ld	a5,0(s3)
ffffffffc0203b4a:	4505                	li	a0,1
ffffffffc0203b4c:	6f9c                	ld	a5,24(a5)
ffffffffc0203b4e:	9782                	jalr	a5
ffffffffc0203b50:	842a                	mv	s0,a0
ffffffffc0203b52:	cc09                	beqz	s0,ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203b54:	86ca                	mv	a3,s2
ffffffffc0203b56:	8626                	mv	a2,s1
ffffffffc0203b58:	85a2                	mv	a1,s0
ffffffffc0203b5a:	8552                	mv	a0,s4
ffffffffc0203b5c:	e7ffe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203b60:	e915                	bnez	a0,ffffffffc0203b94 <pgdir_alloc_page+0x72>
ffffffffc0203b62:	4018                	lw	a4,0(s0)
ffffffffc0203b64:	fc04                	sd	s1,56(s0)
ffffffffc0203b66:	4785                	li	a5,1
ffffffffc0203b68:	04f71e63          	bne	a4,a5,ffffffffc0203bc4 <pgdir_alloc_page+0xa2>
ffffffffc0203b6c:	70a2                	ld	ra,40(sp)
ffffffffc0203b6e:	8522                	mv	a0,s0
ffffffffc0203b70:	7402                	ld	s0,32(sp)
ffffffffc0203b72:	64e2                	ld	s1,24(sp)
ffffffffc0203b74:	6942                	ld	s2,16(sp)
ffffffffc0203b76:	69a2                	ld	s3,8(sp)
ffffffffc0203b78:	6a02                	ld	s4,0(sp)
ffffffffc0203b7a:	6145                	addi	sp,sp,48
ffffffffc0203b7c:	8082                	ret
ffffffffc0203b7e:	8f4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b82:	0009b783          	ld	a5,0(s3)
ffffffffc0203b86:	4505                	li	a0,1
ffffffffc0203b88:	6f9c                	ld	a5,24(a5)
ffffffffc0203b8a:	9782                	jalr	a5
ffffffffc0203b8c:	842a                	mv	s0,a0
ffffffffc0203b8e:	8defd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b92:	b7c1                	j	ffffffffc0203b52 <pgdir_alloc_page+0x30>
ffffffffc0203b94:	100027f3          	csrr	a5,sstatus
ffffffffc0203b98:	8b89                	andi	a5,a5,2
ffffffffc0203b9a:	eb89                	bnez	a5,ffffffffc0203bac <pgdir_alloc_page+0x8a>
ffffffffc0203b9c:	0009b783          	ld	a5,0(s3)
ffffffffc0203ba0:	8522                	mv	a0,s0
ffffffffc0203ba2:	4585                	li	a1,1
ffffffffc0203ba4:	739c                	ld	a5,32(a5)
ffffffffc0203ba6:	4401                	li	s0,0
ffffffffc0203ba8:	9782                	jalr	a5
ffffffffc0203baa:	b7c9                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bac:	8c6fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203bb0:	0009b783          	ld	a5,0(s3)
ffffffffc0203bb4:	8522                	mv	a0,s0
ffffffffc0203bb6:	4585                	li	a1,1
ffffffffc0203bb8:	739c                	ld	a5,32(a5)
ffffffffc0203bba:	4401                	li	s0,0
ffffffffc0203bbc:	9782                	jalr	a5
ffffffffc0203bbe:	8aefd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203bc2:	b76d                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bc4:	00009697          	auipc	a3,0x9
ffffffffc0203bc8:	04c68693          	addi	a3,a3,76 # ffffffffc020cc10 <default_pmm_manager+0x808>
ffffffffc0203bcc:	00008617          	auipc	a2,0x8
ffffffffc0203bd0:	d5460613          	addi	a2,a2,-684 # ffffffffc020b920 <commands+0x210>
ffffffffc0203bd4:	23400593          	li	a1,564
ffffffffc0203bd8:	00009517          	auipc	a0,0x9
ffffffffc0203bdc:	98050513          	addi	a0,a0,-1664 # ffffffffc020c558 <default_pmm_manager+0x150>
ffffffffc0203be0:	8bffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203be4 <check_vma_overlap.part.0>:
ffffffffc0203be4:	1141                	addi	sp,sp,-16
ffffffffc0203be6:	00009697          	auipc	a3,0x9
ffffffffc0203bea:	04268693          	addi	a3,a3,66 # ffffffffc020cc28 <default_pmm_manager+0x820>
ffffffffc0203bee:	00008617          	auipc	a2,0x8
ffffffffc0203bf2:	d3260613          	addi	a2,a2,-718 # ffffffffc020b920 <commands+0x210>
ffffffffc0203bf6:	07400593          	li	a1,116
ffffffffc0203bfa:	00009517          	auipc	a0,0x9
ffffffffc0203bfe:	04e50513          	addi	a0,a0,78 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203c02:	e406                	sd	ra,8(sp)
ffffffffc0203c04:	89bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c08 <mm_create>:
ffffffffc0203c08:	1141                	addi	sp,sp,-16
ffffffffc0203c0a:	05800513          	li	a0,88
ffffffffc0203c0e:	e022                	sd	s0,0(sp)
ffffffffc0203c10:	e406                	sd	ra,8(sp)
ffffffffc0203c12:	b7cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203c16:	842a                	mv	s0,a0
ffffffffc0203c18:	c115                	beqz	a0,ffffffffc0203c3c <mm_create+0x34>
ffffffffc0203c1a:	e408                	sd	a0,8(s0)
ffffffffc0203c1c:	e008                	sd	a0,0(s0)
ffffffffc0203c1e:	00053823          	sd	zero,16(a0)
ffffffffc0203c22:	00053c23          	sd	zero,24(a0)
ffffffffc0203c26:	02052023          	sw	zero,32(a0)
ffffffffc0203c2a:	02053423          	sd	zero,40(a0)
ffffffffc0203c2e:	02052823          	sw	zero,48(a0)
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	03850513          	addi	a0,a0,56
ffffffffc0203c38:	123000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203c3c:	60a2                	ld	ra,8(sp)
ffffffffc0203c3e:	8522                	mv	a0,s0
ffffffffc0203c40:	6402                	ld	s0,0(sp)
ffffffffc0203c42:	0141                	addi	sp,sp,16
ffffffffc0203c44:	8082                	ret

ffffffffc0203c46 <find_vma>:
ffffffffc0203c46:	86aa                	mv	a3,a0
ffffffffc0203c48:	c505                	beqz	a0,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c4a:	6908                	ld	a0,16(a0)
ffffffffc0203c4c:	c501                	beqz	a0,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c4e:	651c                	ld	a5,8(a0)
ffffffffc0203c50:	02f5f263          	bgeu	a1,a5,ffffffffc0203c74 <find_vma+0x2e>
ffffffffc0203c54:	669c                	ld	a5,8(a3)
ffffffffc0203c56:	00f68d63          	beq	a3,a5,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c5a:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203c5e:	00e5e663          	bltu	a1,a4,ffffffffc0203c6a <find_vma+0x24>
ffffffffc0203c62:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c66:	00e5ec63          	bltu	a1,a4,ffffffffc0203c7e <find_vma+0x38>
ffffffffc0203c6a:	679c                	ld	a5,8(a5)
ffffffffc0203c6c:	fef697e3          	bne	a3,a5,ffffffffc0203c5a <find_vma+0x14>
ffffffffc0203c70:	4501                	li	a0,0
ffffffffc0203c72:	8082                	ret
ffffffffc0203c74:	691c                	ld	a5,16(a0)
ffffffffc0203c76:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c7a:	ea88                	sd	a0,16(a3)
ffffffffc0203c7c:	8082                	ret
ffffffffc0203c7e:	fe078513          	addi	a0,a5,-32
ffffffffc0203c82:	ea88                	sd	a0,16(a3)
ffffffffc0203c84:	8082                	ret

ffffffffc0203c86 <insert_vma_struct>:
ffffffffc0203c86:	6590                	ld	a2,8(a1)
ffffffffc0203c88:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203c8c:	1141                	addi	sp,sp,-16
ffffffffc0203c8e:	e406                	sd	ra,8(sp)
ffffffffc0203c90:	87aa                	mv	a5,a0
ffffffffc0203c92:	01066763          	bltu	a2,a6,ffffffffc0203ca0 <insert_vma_struct+0x1a>
ffffffffc0203c96:	a085                	j	ffffffffc0203cf6 <insert_vma_struct+0x70>
ffffffffc0203c98:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c9c:	04e66863          	bltu	a2,a4,ffffffffc0203cec <insert_vma_struct+0x66>
ffffffffc0203ca0:	86be                	mv	a3,a5
ffffffffc0203ca2:	679c                	ld	a5,8(a5)
ffffffffc0203ca4:	fef51ae3          	bne	a0,a5,ffffffffc0203c98 <insert_vma_struct+0x12>
ffffffffc0203ca8:	02a68463          	beq	a3,a0,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cac:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cb0:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cb4:	08e8f163          	bgeu	a7,a4,ffffffffc0203d36 <insert_vma_struct+0xb0>
ffffffffc0203cb8:	04e66f63          	bltu	a2,a4,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cbc:	00f50a63          	beq	a0,a5,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cc0:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cc4:	05076963          	bltu	a4,a6,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cc8:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203ccc:	02c77363          	bgeu	a4,a2,ffffffffc0203cf2 <insert_vma_struct+0x6c>
ffffffffc0203cd0:	5118                	lw	a4,32(a0)
ffffffffc0203cd2:	e188                	sd	a0,0(a1)
ffffffffc0203cd4:	02058613          	addi	a2,a1,32
ffffffffc0203cd8:	e390                	sd	a2,0(a5)
ffffffffc0203cda:	e690                	sd	a2,8(a3)
ffffffffc0203cdc:	60a2                	ld	ra,8(sp)
ffffffffc0203cde:	f59c                	sd	a5,40(a1)
ffffffffc0203ce0:	f194                	sd	a3,32(a1)
ffffffffc0203ce2:	0017079b          	addiw	a5,a4,1
ffffffffc0203ce6:	d11c                	sw	a5,32(a0)
ffffffffc0203ce8:	0141                	addi	sp,sp,16
ffffffffc0203cea:	8082                	ret
ffffffffc0203cec:	fca690e3          	bne	a3,a0,ffffffffc0203cac <insert_vma_struct+0x26>
ffffffffc0203cf0:	bfd1                	j	ffffffffc0203cc4 <insert_vma_struct+0x3e>
ffffffffc0203cf2:	ef3ff0ef          	jal	ra,ffffffffc0203be4 <check_vma_overlap.part.0>
ffffffffc0203cf6:	00009697          	auipc	a3,0x9
ffffffffc0203cfa:	f6268693          	addi	a3,a3,-158 # ffffffffc020cc58 <default_pmm_manager+0x850>
ffffffffc0203cfe:	00008617          	auipc	a2,0x8
ffffffffc0203d02:	c2260613          	addi	a2,a2,-990 # ffffffffc020b920 <commands+0x210>
ffffffffc0203d06:	07a00593          	li	a1,122
ffffffffc0203d0a:	00009517          	auipc	a0,0x9
ffffffffc0203d0e:	f3e50513          	addi	a0,a0,-194 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203d12:	f8cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d16:	00009697          	auipc	a3,0x9
ffffffffc0203d1a:	f8268693          	addi	a3,a3,-126 # ffffffffc020cc98 <default_pmm_manager+0x890>
ffffffffc0203d1e:	00008617          	auipc	a2,0x8
ffffffffc0203d22:	c0260613          	addi	a2,a2,-1022 # ffffffffc020b920 <commands+0x210>
ffffffffc0203d26:	07300593          	li	a1,115
ffffffffc0203d2a:	00009517          	auipc	a0,0x9
ffffffffc0203d2e:	f1e50513          	addi	a0,a0,-226 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203d32:	f6cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d36:	00009697          	auipc	a3,0x9
ffffffffc0203d3a:	f4268693          	addi	a3,a3,-190 # ffffffffc020cc78 <default_pmm_manager+0x870>
ffffffffc0203d3e:	00008617          	auipc	a2,0x8
ffffffffc0203d42:	be260613          	addi	a2,a2,-1054 # ffffffffc020b920 <commands+0x210>
ffffffffc0203d46:	07200593          	li	a1,114
ffffffffc0203d4a:	00009517          	auipc	a0,0x9
ffffffffc0203d4e:	efe50513          	addi	a0,a0,-258 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203d52:	f4cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d56 <mm_destroy>:
ffffffffc0203d56:	591c                	lw	a5,48(a0)
ffffffffc0203d58:	1141                	addi	sp,sp,-16
ffffffffc0203d5a:	e406                	sd	ra,8(sp)
ffffffffc0203d5c:	e022                	sd	s0,0(sp)
ffffffffc0203d5e:	e78d                	bnez	a5,ffffffffc0203d88 <mm_destroy+0x32>
ffffffffc0203d60:	842a                	mv	s0,a0
ffffffffc0203d62:	6508                	ld	a0,8(a0)
ffffffffc0203d64:	00a40c63          	beq	s0,a0,ffffffffc0203d7c <mm_destroy+0x26>
ffffffffc0203d68:	6118                	ld	a4,0(a0)
ffffffffc0203d6a:	651c                	ld	a5,8(a0)
ffffffffc0203d6c:	1501                	addi	a0,a0,-32
ffffffffc0203d6e:	e71c                	sd	a5,8(a4)
ffffffffc0203d70:	e398                	sd	a4,0(a5)
ffffffffc0203d72:	accfe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203d76:	6408                	ld	a0,8(s0)
ffffffffc0203d78:	fea418e3          	bne	s0,a0,ffffffffc0203d68 <mm_destroy+0x12>
ffffffffc0203d7c:	8522                	mv	a0,s0
ffffffffc0203d7e:	6402                	ld	s0,0(sp)
ffffffffc0203d80:	60a2                	ld	ra,8(sp)
ffffffffc0203d82:	0141                	addi	sp,sp,16
ffffffffc0203d84:	abafe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203d88:	00009697          	auipc	a3,0x9
ffffffffc0203d8c:	f3068693          	addi	a3,a3,-208 # ffffffffc020ccb8 <default_pmm_manager+0x8b0>
ffffffffc0203d90:	00008617          	auipc	a2,0x8
ffffffffc0203d94:	b9060613          	addi	a2,a2,-1136 # ffffffffc020b920 <commands+0x210>
ffffffffc0203d98:	09e00593          	li	a1,158
ffffffffc0203d9c:	00009517          	auipc	a0,0x9
ffffffffc0203da0:	eac50513          	addi	a0,a0,-340 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203da4:	efafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203da8 <mm_map>:
ffffffffc0203da8:	7139                	addi	sp,sp,-64
ffffffffc0203daa:	f822                	sd	s0,48(sp)
ffffffffc0203dac:	6405                	lui	s0,0x1
ffffffffc0203dae:	147d                	addi	s0,s0,-1
ffffffffc0203db0:	77fd                	lui	a5,0xfffff
ffffffffc0203db2:	9622                	add	a2,a2,s0
ffffffffc0203db4:	962e                	add	a2,a2,a1
ffffffffc0203db6:	f426                	sd	s1,40(sp)
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	002005b7          	lui	a1,0x200
ffffffffc0203dca:	00f67433          	and	s0,a2,a5
ffffffffc0203dce:	06b4e363          	bltu	s1,a1,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd2:	0684f163          	bgeu	s1,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd6:	4785                	li	a5,1
ffffffffc0203dd8:	07fe                	slli	a5,a5,0x1f
ffffffffc0203dda:	0487ed63          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dde:	89aa                	mv	s3,a0
ffffffffc0203de0:	cd21                	beqz	a0,ffffffffc0203e38 <mm_map+0x90>
ffffffffc0203de2:	85a6                	mv	a1,s1
ffffffffc0203de4:	8ab6                	mv	s5,a3
ffffffffc0203de6:	8a3a                	mv	s4,a4
ffffffffc0203de8:	e5fff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0203dec:	c501                	beqz	a0,ffffffffc0203df4 <mm_map+0x4c>
ffffffffc0203dee:	651c                	ld	a5,8(a0)
ffffffffc0203df0:	0487e263          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203df4:	03000513          	li	a0,48
ffffffffc0203df8:	996fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203dfc:	892a                	mv	s2,a0
ffffffffc0203dfe:	5571                	li	a0,-4
ffffffffc0203e00:	02090163          	beqz	s2,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e04:	854e                	mv	a0,s3
ffffffffc0203e06:	00993423          	sd	s1,8(s2)
ffffffffc0203e0a:	00893823          	sd	s0,16(s2)
ffffffffc0203e0e:	01592c23          	sw	s5,24(s2)
ffffffffc0203e12:	85ca                	mv	a1,s2
ffffffffc0203e14:	e73ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e18:	4501                	li	a0,0
ffffffffc0203e1a:	000a0463          	beqz	s4,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e1e:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203e22:	70e2                	ld	ra,56(sp)
ffffffffc0203e24:	7442                	ld	s0,48(sp)
ffffffffc0203e26:	74a2                	ld	s1,40(sp)
ffffffffc0203e28:	7902                	ld	s2,32(sp)
ffffffffc0203e2a:	69e2                	ld	s3,24(sp)
ffffffffc0203e2c:	6a42                	ld	s4,16(sp)
ffffffffc0203e2e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e30:	6121                	addi	sp,sp,64
ffffffffc0203e32:	8082                	ret
ffffffffc0203e34:	5575                	li	a0,-3
ffffffffc0203e36:	b7f5                	j	ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e38:	00009697          	auipc	a3,0x9
ffffffffc0203e3c:	e9868693          	addi	a3,a3,-360 # ffffffffc020ccd0 <default_pmm_manager+0x8c8>
ffffffffc0203e40:	00008617          	auipc	a2,0x8
ffffffffc0203e44:	ae060613          	addi	a2,a2,-1312 # ffffffffc020b920 <commands+0x210>
ffffffffc0203e48:	0b300593          	li	a1,179
ffffffffc0203e4c:	00009517          	auipc	a0,0x9
ffffffffc0203e50:	dfc50513          	addi	a0,a0,-516 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203e54:	e4afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e58 <dup_mmap>:
ffffffffc0203e58:	7139                	addi	sp,sp,-64
ffffffffc0203e5a:	fc06                	sd	ra,56(sp)
ffffffffc0203e5c:	f822                	sd	s0,48(sp)
ffffffffc0203e5e:	f426                	sd	s1,40(sp)
ffffffffc0203e60:	f04a                	sd	s2,32(sp)
ffffffffc0203e62:	ec4e                	sd	s3,24(sp)
ffffffffc0203e64:	e852                	sd	s4,16(sp)
ffffffffc0203e66:	e456                	sd	s5,8(sp)
ffffffffc0203e68:	c52d                	beqz	a0,ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e6a:	892a                	mv	s2,a0
ffffffffc0203e6c:	84ae                	mv	s1,a1
ffffffffc0203e6e:	842e                	mv	s0,a1
ffffffffc0203e70:	e595                	bnez	a1,ffffffffc0203e9c <dup_mmap+0x44>
ffffffffc0203e72:	a085                	j	ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203e7a:	0145b823          	sd	s4,16(a1)
ffffffffc0203e7e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203e82:	e05ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e86:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203e8a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203e8e:	6c8c                	ld	a1,24(s1)
ffffffffc0203e90:	01893503          	ld	a0,24(s2)
ffffffffc0203e94:	4701                	li	a4,0
ffffffffc0203e96:	a2dff0ef          	jal	ra,ffffffffc02038c2 <copy_range>
ffffffffc0203e9a:	e105                	bnez	a0,ffffffffc0203eba <dup_mmap+0x62>
ffffffffc0203e9c:	6000                	ld	s0,0(s0)
ffffffffc0203e9e:	02848863          	beq	s1,s0,ffffffffc0203ece <dup_mmap+0x76>
ffffffffc0203ea2:	03000513          	li	a0,48
ffffffffc0203ea6:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203eaa:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203eae:	ff842983          	lw	s3,-8(s0)
ffffffffc0203eb2:	8dcfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203eb6:	85aa                	mv	a1,a0
ffffffffc0203eb8:	fd55                	bnez	a0,ffffffffc0203e74 <dup_mmap+0x1c>
ffffffffc0203eba:	5571                	li	a0,-4
ffffffffc0203ebc:	70e2                	ld	ra,56(sp)
ffffffffc0203ebe:	7442                	ld	s0,48(sp)
ffffffffc0203ec0:	74a2                	ld	s1,40(sp)
ffffffffc0203ec2:	7902                	ld	s2,32(sp)
ffffffffc0203ec4:	69e2                	ld	s3,24(sp)
ffffffffc0203ec6:	6a42                	ld	s4,16(sp)
ffffffffc0203ec8:	6aa2                	ld	s5,8(sp)
ffffffffc0203eca:	6121                	addi	sp,sp,64
ffffffffc0203ecc:	8082                	ret
ffffffffc0203ece:	4501                	li	a0,0
ffffffffc0203ed0:	b7f5                	j	ffffffffc0203ebc <dup_mmap+0x64>
ffffffffc0203ed2:	00009697          	auipc	a3,0x9
ffffffffc0203ed6:	e0e68693          	addi	a3,a3,-498 # ffffffffc020cce0 <default_pmm_manager+0x8d8>
ffffffffc0203eda:	00008617          	auipc	a2,0x8
ffffffffc0203ede:	a4660613          	addi	a2,a2,-1466 # ffffffffc020b920 <commands+0x210>
ffffffffc0203ee2:	0cf00593          	li	a1,207
ffffffffc0203ee6:	00009517          	auipc	a0,0x9
ffffffffc0203eea:	d6250513          	addi	a0,a0,-670 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203eee:	db0fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ef2 <exit_mmap>:
ffffffffc0203ef2:	1101                	addi	sp,sp,-32
ffffffffc0203ef4:	ec06                	sd	ra,24(sp)
ffffffffc0203ef6:	e822                	sd	s0,16(sp)
ffffffffc0203ef8:	e426                	sd	s1,8(sp)
ffffffffc0203efa:	e04a                	sd	s2,0(sp)
ffffffffc0203efc:	c531                	beqz	a0,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203efe:	591c                	lw	a5,48(a0)
ffffffffc0203f00:	84aa                	mv	s1,a0
ffffffffc0203f02:	e3b9                	bnez	a5,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203f04:	6500                	ld	s0,8(a0)
ffffffffc0203f06:	01853903          	ld	s2,24(a0)
ffffffffc0203f0a:	02850663          	beq	a0,s0,ffffffffc0203f36 <exit_mmap+0x44>
ffffffffc0203f0e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f12:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f16:	854a                	mv	a0,s2
ffffffffc0203f18:	e4efe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203f1c:	6400                	ld	s0,8(s0)
ffffffffc0203f1e:	fe8498e3          	bne	s1,s0,ffffffffc0203f0e <exit_mmap+0x1c>
ffffffffc0203f22:	6400                	ld	s0,8(s0)
ffffffffc0203f24:	00848c63          	beq	s1,s0,ffffffffc0203f3c <exit_mmap+0x4a>
ffffffffc0203f28:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f2c:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f30:	854a                	mv	a0,s2
ffffffffc0203f32:	f7afe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203f36:	6400                	ld	s0,8(s0)
ffffffffc0203f38:	fe8498e3          	bne	s1,s0,ffffffffc0203f28 <exit_mmap+0x36>
ffffffffc0203f3c:	60e2                	ld	ra,24(sp)
ffffffffc0203f3e:	6442                	ld	s0,16(sp)
ffffffffc0203f40:	64a2                	ld	s1,8(sp)
ffffffffc0203f42:	6902                	ld	s2,0(sp)
ffffffffc0203f44:	6105                	addi	sp,sp,32
ffffffffc0203f46:	8082                	ret
ffffffffc0203f48:	00009697          	auipc	a3,0x9
ffffffffc0203f4c:	db868693          	addi	a3,a3,-584 # ffffffffc020cd00 <default_pmm_manager+0x8f8>
ffffffffc0203f50:	00008617          	auipc	a2,0x8
ffffffffc0203f54:	9d060613          	addi	a2,a2,-1584 # ffffffffc020b920 <commands+0x210>
ffffffffc0203f58:	0e800593          	li	a1,232
ffffffffc0203f5c:	00009517          	auipc	a0,0x9
ffffffffc0203f60:	cec50513          	addi	a0,a0,-788 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203f64:	d3afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f68 <vmm_init>:
ffffffffc0203f68:	7139                	addi	sp,sp,-64
ffffffffc0203f6a:	05800513          	li	a0,88
ffffffffc0203f6e:	fc06                	sd	ra,56(sp)
ffffffffc0203f70:	f822                	sd	s0,48(sp)
ffffffffc0203f72:	f426                	sd	s1,40(sp)
ffffffffc0203f74:	f04a                	sd	s2,32(sp)
ffffffffc0203f76:	ec4e                	sd	s3,24(sp)
ffffffffc0203f78:	e852                	sd	s4,16(sp)
ffffffffc0203f7a:	e456                	sd	s5,8(sp)
ffffffffc0203f7c:	812fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f80:	2e050963          	beqz	a0,ffffffffc0204272 <vmm_init+0x30a>
ffffffffc0203f84:	e508                	sd	a0,8(a0)
ffffffffc0203f86:	e108                	sd	a0,0(a0)
ffffffffc0203f88:	00053823          	sd	zero,16(a0)
ffffffffc0203f8c:	00053c23          	sd	zero,24(a0)
ffffffffc0203f90:	02052023          	sw	zero,32(a0)
ffffffffc0203f94:	02053423          	sd	zero,40(a0)
ffffffffc0203f98:	02052823          	sw	zero,48(a0)
ffffffffc0203f9c:	84aa                	mv	s1,a0
ffffffffc0203f9e:	4585                	li	a1,1
ffffffffc0203fa0:	03850513          	addi	a0,a0,56
ffffffffc0203fa4:	5b6000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203fa8:	03200413          	li	s0,50
ffffffffc0203fac:	a811                	j	ffffffffc0203fc0 <vmm_init+0x58>
ffffffffc0203fae:	e500                	sd	s0,8(a0)
ffffffffc0203fb0:	e91c                	sd	a5,16(a0)
ffffffffc0203fb2:	00052c23          	sw	zero,24(a0)
ffffffffc0203fb6:	146d                	addi	s0,s0,-5
ffffffffc0203fb8:	8526                	mv	a0,s1
ffffffffc0203fba:	ccdff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203fbe:	c80d                	beqz	s0,ffffffffc0203ff0 <vmm_init+0x88>
ffffffffc0203fc0:	03000513          	li	a0,48
ffffffffc0203fc4:	fcbfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203fc8:	85aa                	mv	a1,a0
ffffffffc0203fca:	00240793          	addi	a5,s0,2
ffffffffc0203fce:	f165                	bnez	a0,ffffffffc0203fae <vmm_init+0x46>
ffffffffc0203fd0:	00009697          	auipc	a3,0x9
ffffffffc0203fd4:	ec868693          	addi	a3,a3,-312 # ffffffffc020ce98 <default_pmm_manager+0xa90>
ffffffffc0203fd8:	00008617          	auipc	a2,0x8
ffffffffc0203fdc:	94860613          	addi	a2,a2,-1720 # ffffffffc020b920 <commands+0x210>
ffffffffc0203fe0:	12c00593          	li	a1,300
ffffffffc0203fe4:	00009517          	auipc	a0,0x9
ffffffffc0203fe8:	c6450513          	addi	a0,a0,-924 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc0203fec:	cb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ff0:	03700413          	li	s0,55
ffffffffc0203ff4:	1f900913          	li	s2,505
ffffffffc0203ff8:	a819                	j	ffffffffc020400e <vmm_init+0xa6>
ffffffffc0203ffa:	e500                	sd	s0,8(a0)
ffffffffc0203ffc:	e91c                	sd	a5,16(a0)
ffffffffc0203ffe:	00052c23          	sw	zero,24(a0)
ffffffffc0204002:	0415                	addi	s0,s0,5
ffffffffc0204004:	8526                	mv	a0,s1
ffffffffc0204006:	c81ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc020400a:	03240a63          	beq	s0,s2,ffffffffc020403e <vmm_init+0xd6>
ffffffffc020400e:	03000513          	li	a0,48
ffffffffc0204012:	f7dfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0204016:	85aa                	mv	a1,a0
ffffffffc0204018:	00240793          	addi	a5,s0,2
ffffffffc020401c:	fd79                	bnez	a0,ffffffffc0203ffa <vmm_init+0x92>
ffffffffc020401e:	00009697          	auipc	a3,0x9
ffffffffc0204022:	e7a68693          	addi	a3,a3,-390 # ffffffffc020ce98 <default_pmm_manager+0xa90>
ffffffffc0204026:	00008617          	auipc	a2,0x8
ffffffffc020402a:	8fa60613          	addi	a2,a2,-1798 # ffffffffc020b920 <commands+0x210>
ffffffffc020402e:	13300593          	li	a1,307
ffffffffc0204032:	00009517          	auipc	a0,0x9
ffffffffc0204036:	c1650513          	addi	a0,a0,-1002 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020403a:	c64fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020403e:	649c                	ld	a5,8(s1)
ffffffffc0204040:	471d                	li	a4,7
ffffffffc0204042:	1fb00593          	li	a1,507
ffffffffc0204046:	16f48663          	beq	s1,a5,ffffffffc02041b2 <vmm_init+0x24a>
ffffffffc020404a:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc020404e:	ffe70693          	addi	a3,a4,-2
ffffffffc0204052:	10d61063          	bne	a2,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc0204056:	ff07b683          	ld	a3,-16(a5)
ffffffffc020405a:	0ed71c63          	bne	a4,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc020405e:	0715                	addi	a4,a4,5
ffffffffc0204060:	679c                	ld	a5,8(a5)
ffffffffc0204062:	feb712e3          	bne	a4,a1,ffffffffc0204046 <vmm_init+0xde>
ffffffffc0204066:	4a1d                	li	s4,7
ffffffffc0204068:	4415                	li	s0,5
ffffffffc020406a:	1f900a93          	li	s5,505
ffffffffc020406e:	85a2                	mv	a1,s0
ffffffffc0204070:	8526                	mv	a0,s1
ffffffffc0204072:	bd5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204076:	892a                	mv	s2,a0
ffffffffc0204078:	16050d63          	beqz	a0,ffffffffc02041f2 <vmm_init+0x28a>
ffffffffc020407c:	00140593          	addi	a1,s0,1
ffffffffc0204080:	8526                	mv	a0,s1
ffffffffc0204082:	bc5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204086:	89aa                	mv	s3,a0
ffffffffc0204088:	14050563          	beqz	a0,ffffffffc02041d2 <vmm_init+0x26a>
ffffffffc020408c:	85d2                	mv	a1,s4
ffffffffc020408e:	8526                	mv	a0,s1
ffffffffc0204090:	bb7ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204094:	16051f63          	bnez	a0,ffffffffc0204212 <vmm_init+0x2aa>
ffffffffc0204098:	00340593          	addi	a1,s0,3
ffffffffc020409c:	8526                	mv	a0,s1
ffffffffc020409e:	ba9ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040a2:	1a051863          	bnez	a0,ffffffffc0204252 <vmm_init+0x2ea>
ffffffffc02040a6:	00440593          	addi	a1,s0,4
ffffffffc02040aa:	8526                	mv	a0,s1
ffffffffc02040ac:	b9bff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040b0:	18051163          	bnez	a0,ffffffffc0204232 <vmm_init+0x2ca>
ffffffffc02040b4:	00893783          	ld	a5,8(s2)
ffffffffc02040b8:	0a879d63          	bne	a5,s0,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040bc:	01093783          	ld	a5,16(s2)
ffffffffc02040c0:	0b479963          	bne	a5,s4,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040c4:	0089b783          	ld	a5,8(s3)
ffffffffc02040c8:	0c879563          	bne	a5,s0,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040cc:	0109b783          	ld	a5,16(s3)
ffffffffc02040d0:	0d479163          	bne	a5,s4,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040d4:	0415                	addi	s0,s0,5
ffffffffc02040d6:	0a15                	addi	s4,s4,5
ffffffffc02040d8:	f9541be3          	bne	s0,s5,ffffffffc020406e <vmm_init+0x106>
ffffffffc02040dc:	4411                	li	s0,4
ffffffffc02040de:	597d                	li	s2,-1
ffffffffc02040e0:	85a2                	mv	a1,s0
ffffffffc02040e2:	8526                	mv	a0,s1
ffffffffc02040e4:	b63ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040e8:	0004059b          	sext.w	a1,s0
ffffffffc02040ec:	c90d                	beqz	a0,ffffffffc020411e <vmm_init+0x1b6>
ffffffffc02040ee:	6914                	ld	a3,16(a0)
ffffffffc02040f0:	6510                	ld	a2,8(a0)
ffffffffc02040f2:	00009517          	auipc	a0,0x9
ffffffffc02040f6:	d2e50513          	addi	a0,a0,-722 # ffffffffc020ce20 <default_pmm_manager+0xa18>
ffffffffc02040fa:	8acfc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02040fe:	00009697          	auipc	a3,0x9
ffffffffc0204102:	d4a68693          	addi	a3,a3,-694 # ffffffffc020ce48 <default_pmm_manager+0xa40>
ffffffffc0204106:	00008617          	auipc	a2,0x8
ffffffffc020410a:	81a60613          	addi	a2,a2,-2022 # ffffffffc020b920 <commands+0x210>
ffffffffc020410e:	15900593          	li	a1,345
ffffffffc0204112:	00009517          	auipc	a0,0x9
ffffffffc0204116:	b3650513          	addi	a0,a0,-1226 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020411a:	b84fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020411e:	147d                	addi	s0,s0,-1
ffffffffc0204120:	fd2410e3          	bne	s0,s2,ffffffffc02040e0 <vmm_init+0x178>
ffffffffc0204124:	8526                	mv	a0,s1
ffffffffc0204126:	c31ff0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020412a:	00009517          	auipc	a0,0x9
ffffffffc020412e:	d3650513          	addi	a0,a0,-714 # ffffffffc020ce60 <default_pmm_manager+0xa58>
ffffffffc0204132:	874fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204136:	7442                	ld	s0,48(sp)
ffffffffc0204138:	70e2                	ld	ra,56(sp)
ffffffffc020413a:	74a2                	ld	s1,40(sp)
ffffffffc020413c:	7902                	ld	s2,32(sp)
ffffffffc020413e:	69e2                	ld	s3,24(sp)
ffffffffc0204140:	6a42                	ld	s4,16(sp)
ffffffffc0204142:	6aa2                	ld	s5,8(sp)
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	d3c50513          	addi	a0,a0,-708 # ffffffffc020ce80 <default_pmm_manager+0xa78>
ffffffffc020414c:	6121                	addi	sp,sp,64
ffffffffc020414e:	858fc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0204152:	00009697          	auipc	a3,0x9
ffffffffc0204156:	be668693          	addi	a3,a3,-1050 # ffffffffc020cd38 <default_pmm_manager+0x930>
ffffffffc020415a:	00007617          	auipc	a2,0x7
ffffffffc020415e:	7c660613          	addi	a2,a2,1990 # ffffffffc020b920 <commands+0x210>
ffffffffc0204162:	13d00593          	li	a1,317
ffffffffc0204166:	00009517          	auipc	a0,0x9
ffffffffc020416a:	ae250513          	addi	a0,a0,-1310 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020416e:	b30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204172:	00009697          	auipc	a3,0x9
ffffffffc0204176:	c4e68693          	addi	a3,a3,-946 # ffffffffc020cdc0 <default_pmm_manager+0x9b8>
ffffffffc020417a:	00007617          	auipc	a2,0x7
ffffffffc020417e:	7a660613          	addi	a2,a2,1958 # ffffffffc020b920 <commands+0x210>
ffffffffc0204182:	14e00593          	li	a1,334
ffffffffc0204186:	00009517          	auipc	a0,0x9
ffffffffc020418a:	ac250513          	addi	a0,a0,-1342 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020418e:	b10fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204192:	00009697          	auipc	a3,0x9
ffffffffc0204196:	c5e68693          	addi	a3,a3,-930 # ffffffffc020cdf0 <default_pmm_manager+0x9e8>
ffffffffc020419a:	00007617          	auipc	a2,0x7
ffffffffc020419e:	78660613          	addi	a2,a2,1926 # ffffffffc020b920 <commands+0x210>
ffffffffc02041a2:	14f00593          	li	a1,335
ffffffffc02041a6:	00009517          	auipc	a0,0x9
ffffffffc02041aa:	aa250513          	addi	a0,a0,-1374 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc02041ae:	af0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b2:	00009697          	auipc	a3,0x9
ffffffffc02041b6:	b6e68693          	addi	a3,a3,-1170 # ffffffffc020cd20 <default_pmm_manager+0x918>
ffffffffc02041ba:	00007617          	auipc	a2,0x7
ffffffffc02041be:	76660613          	addi	a2,a2,1894 # ffffffffc020b920 <commands+0x210>
ffffffffc02041c2:	13b00593          	li	a1,315
ffffffffc02041c6:	00009517          	auipc	a0,0x9
ffffffffc02041ca:	a8250513          	addi	a0,a0,-1406 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc02041ce:	ad0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d2:	00009697          	auipc	a3,0x9
ffffffffc02041d6:	bae68693          	addi	a3,a3,-1106 # ffffffffc020cd80 <default_pmm_manager+0x978>
ffffffffc02041da:	00007617          	auipc	a2,0x7
ffffffffc02041de:	74660613          	addi	a2,a2,1862 # ffffffffc020b920 <commands+0x210>
ffffffffc02041e2:	14600593          	li	a1,326
ffffffffc02041e6:	00009517          	auipc	a0,0x9
ffffffffc02041ea:	a6250513          	addi	a0,a0,-1438 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc02041ee:	ab0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041f2:	00009697          	auipc	a3,0x9
ffffffffc02041f6:	b7e68693          	addi	a3,a3,-1154 # ffffffffc020cd70 <default_pmm_manager+0x968>
ffffffffc02041fa:	00007617          	auipc	a2,0x7
ffffffffc02041fe:	72660613          	addi	a2,a2,1830 # ffffffffc020b920 <commands+0x210>
ffffffffc0204202:	14400593          	li	a1,324
ffffffffc0204206:	00009517          	auipc	a0,0x9
ffffffffc020420a:	a4250513          	addi	a0,a0,-1470 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020420e:	a90fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204212:	00009697          	auipc	a3,0x9
ffffffffc0204216:	b7e68693          	addi	a3,a3,-1154 # ffffffffc020cd90 <default_pmm_manager+0x988>
ffffffffc020421a:	00007617          	auipc	a2,0x7
ffffffffc020421e:	70660613          	addi	a2,a2,1798 # ffffffffc020b920 <commands+0x210>
ffffffffc0204222:	14800593          	li	a1,328
ffffffffc0204226:	00009517          	auipc	a0,0x9
ffffffffc020422a:	a2250513          	addi	a0,a0,-1502 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020422e:	a70fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204232:	00009697          	auipc	a3,0x9
ffffffffc0204236:	b7e68693          	addi	a3,a3,-1154 # ffffffffc020cdb0 <default_pmm_manager+0x9a8>
ffffffffc020423a:	00007617          	auipc	a2,0x7
ffffffffc020423e:	6e660613          	addi	a2,a2,1766 # ffffffffc020b920 <commands+0x210>
ffffffffc0204242:	14c00593          	li	a1,332
ffffffffc0204246:	00009517          	auipc	a0,0x9
ffffffffc020424a:	a0250513          	addi	a0,a0,-1534 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020424e:	a50fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204252:	00009697          	auipc	a3,0x9
ffffffffc0204256:	b4e68693          	addi	a3,a3,-1202 # ffffffffc020cda0 <default_pmm_manager+0x998>
ffffffffc020425a:	00007617          	auipc	a2,0x7
ffffffffc020425e:	6c660613          	addi	a2,a2,1734 # ffffffffc020b920 <commands+0x210>
ffffffffc0204262:	14a00593          	li	a1,330
ffffffffc0204266:	00009517          	auipc	a0,0x9
ffffffffc020426a:	9e250513          	addi	a0,a0,-1566 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020426e:	a30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204272:	00009697          	auipc	a3,0x9
ffffffffc0204276:	a5e68693          	addi	a3,a3,-1442 # ffffffffc020ccd0 <default_pmm_manager+0x8c8>
ffffffffc020427a:	00007617          	auipc	a2,0x7
ffffffffc020427e:	6a660613          	addi	a2,a2,1702 # ffffffffc020b920 <commands+0x210>
ffffffffc0204282:	12400593          	li	a1,292
ffffffffc0204286:	00009517          	auipc	a0,0x9
ffffffffc020428a:	9c250513          	addi	a0,a0,-1598 # ffffffffc020cc48 <default_pmm_manager+0x840>
ffffffffc020428e:	a10fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204292 <user_mem_check>:
ffffffffc0204292:	7179                	addi	sp,sp,-48
ffffffffc0204294:	f022                	sd	s0,32(sp)
ffffffffc0204296:	f406                	sd	ra,40(sp)
ffffffffc0204298:	ec26                	sd	s1,24(sp)
ffffffffc020429a:	e84a                	sd	s2,16(sp)
ffffffffc020429c:	e44e                	sd	s3,8(sp)
ffffffffc020429e:	e052                	sd	s4,0(sp)
ffffffffc02042a0:	842e                	mv	s0,a1
ffffffffc02042a2:	c135                	beqz	a0,ffffffffc0204306 <user_mem_check+0x74>
ffffffffc02042a4:	002007b7          	lui	a5,0x200
ffffffffc02042a8:	04f5e663          	bltu	a1,a5,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ac:	00c584b3          	add	s1,a1,a2
ffffffffc02042b0:	0495f263          	bgeu	a1,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042b4:	4785                	li	a5,1
ffffffffc02042b6:	07fe                	slli	a5,a5,0x1f
ffffffffc02042b8:	0297ee63          	bltu	a5,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042bc:	892a                	mv	s2,a0
ffffffffc02042be:	89b6                	mv	s3,a3
ffffffffc02042c0:	6a05                	lui	s4,0x1
ffffffffc02042c2:	a821                	j	ffffffffc02042da <user_mem_check+0x48>
ffffffffc02042c4:	0027f693          	andi	a3,a5,2
ffffffffc02042c8:	9752                	add	a4,a4,s4
ffffffffc02042ca:	8ba1                	andi	a5,a5,8
ffffffffc02042cc:	c685                	beqz	a3,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ce:	c399                	beqz	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042d0:	02e46263          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042d4:	6900                	ld	s0,16(a0)
ffffffffc02042d6:	04947663          	bgeu	s0,s1,ffffffffc0204322 <user_mem_check+0x90>
ffffffffc02042da:	85a2                	mv	a1,s0
ffffffffc02042dc:	854a                	mv	a0,s2
ffffffffc02042de:	969ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02042e2:	c909                	beqz	a0,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042e4:	6518                	ld	a4,8(a0)
ffffffffc02042e6:	00e46763          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ea:	4d1c                	lw	a5,24(a0)
ffffffffc02042ec:	fc099ce3          	bnez	s3,ffffffffc02042c4 <user_mem_check+0x32>
ffffffffc02042f0:	8b85                	andi	a5,a5,1
ffffffffc02042f2:	f3ed                	bnez	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042f4:	4501                	li	a0,0
ffffffffc02042f6:	70a2                	ld	ra,40(sp)
ffffffffc02042f8:	7402                	ld	s0,32(sp)
ffffffffc02042fa:	64e2                	ld	s1,24(sp)
ffffffffc02042fc:	6942                	ld	s2,16(sp)
ffffffffc02042fe:	69a2                	ld	s3,8(sp)
ffffffffc0204300:	6a02                	ld	s4,0(sp)
ffffffffc0204302:	6145                	addi	sp,sp,48
ffffffffc0204304:	8082                	ret
ffffffffc0204306:	c02007b7          	lui	a5,0xc0200
ffffffffc020430a:	4501                	li	a0,0
ffffffffc020430c:	fef5e5e3          	bltu	a1,a5,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204310:	962e                	add	a2,a2,a1
ffffffffc0204312:	fec5f2e3          	bgeu	a1,a2,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204316:	c8000537          	lui	a0,0xc8000
ffffffffc020431a:	0505                	addi	a0,a0,1
ffffffffc020431c:	00a63533          	sltu	a0,a2,a0
ffffffffc0204320:	bfd9                	j	ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204322:	4505                	li	a0,1
ffffffffc0204324:	bfc9                	j	ffffffffc02042f6 <user_mem_check+0x64>

ffffffffc0204326 <copy_from_user>:
ffffffffc0204326:	1101                	addi	sp,sp,-32
ffffffffc0204328:	e822                	sd	s0,16(sp)
ffffffffc020432a:	e426                	sd	s1,8(sp)
ffffffffc020432c:	8432                	mv	s0,a2
ffffffffc020432e:	84b6                	mv	s1,a3
ffffffffc0204330:	e04a                	sd	s2,0(sp)
ffffffffc0204332:	86ba                	mv	a3,a4
ffffffffc0204334:	892e                	mv	s2,a1
ffffffffc0204336:	8626                	mv	a2,s1
ffffffffc0204338:	85a2                	mv	a1,s0
ffffffffc020433a:	ec06                	sd	ra,24(sp)
ffffffffc020433c:	f57ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204340:	c519                	beqz	a0,ffffffffc020434e <copy_from_user+0x28>
ffffffffc0204342:	8626                	mv	a2,s1
ffffffffc0204344:	85a2                	mv	a1,s0
ffffffffc0204346:	854a                	mv	a0,s2
ffffffffc0204348:	146070ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020434c:	4505                	li	a0,1
ffffffffc020434e:	60e2                	ld	ra,24(sp)
ffffffffc0204350:	6442                	ld	s0,16(sp)
ffffffffc0204352:	64a2                	ld	s1,8(sp)
ffffffffc0204354:	6902                	ld	s2,0(sp)
ffffffffc0204356:	6105                	addi	sp,sp,32
ffffffffc0204358:	8082                	ret

ffffffffc020435a <copy_to_user>:
ffffffffc020435a:	1101                	addi	sp,sp,-32
ffffffffc020435c:	e822                	sd	s0,16(sp)
ffffffffc020435e:	8436                	mv	s0,a3
ffffffffc0204360:	e04a                	sd	s2,0(sp)
ffffffffc0204362:	4685                	li	a3,1
ffffffffc0204364:	8932                	mv	s2,a2
ffffffffc0204366:	8622                	mv	a2,s0
ffffffffc0204368:	e426                	sd	s1,8(sp)
ffffffffc020436a:	ec06                	sd	ra,24(sp)
ffffffffc020436c:	84ae                	mv	s1,a1
ffffffffc020436e:	f25ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204372:	c519                	beqz	a0,ffffffffc0204380 <copy_to_user+0x26>
ffffffffc0204374:	8622                	mv	a2,s0
ffffffffc0204376:	85ca                	mv	a1,s2
ffffffffc0204378:	8526                	mv	a0,s1
ffffffffc020437a:	114070ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020437e:	4505                	li	a0,1
ffffffffc0204380:	60e2                	ld	ra,24(sp)
ffffffffc0204382:	6442                	ld	s0,16(sp)
ffffffffc0204384:	64a2                	ld	s1,8(sp)
ffffffffc0204386:	6902                	ld	s2,0(sp)
ffffffffc0204388:	6105                	addi	sp,sp,32
ffffffffc020438a:	8082                	ret

ffffffffc020438c <copy_string>:
ffffffffc020438c:	7139                	addi	sp,sp,-64
ffffffffc020438e:	ec4e                	sd	s3,24(sp)
ffffffffc0204390:	6985                	lui	s3,0x1
ffffffffc0204392:	99b2                	add	s3,s3,a2
ffffffffc0204394:	77fd                	lui	a5,0xfffff
ffffffffc0204396:	00f9f9b3          	and	s3,s3,a5
ffffffffc020439a:	f426                	sd	s1,40(sp)
ffffffffc020439c:	f04a                	sd	s2,32(sp)
ffffffffc020439e:	e852                	sd	s4,16(sp)
ffffffffc02043a0:	e456                	sd	s5,8(sp)
ffffffffc02043a2:	fc06                	sd	ra,56(sp)
ffffffffc02043a4:	f822                	sd	s0,48(sp)
ffffffffc02043a6:	84b2                	mv	s1,a2
ffffffffc02043a8:	8aaa                	mv	s5,a0
ffffffffc02043aa:	8a2e                	mv	s4,a1
ffffffffc02043ac:	8936                	mv	s2,a3
ffffffffc02043ae:	40c989b3          	sub	s3,s3,a2
ffffffffc02043b2:	a015                	j	ffffffffc02043d6 <copy_string+0x4a>
ffffffffc02043b4:	000070ef          	jal	ra,ffffffffc020b3b4 <strnlen>
ffffffffc02043b8:	87aa                	mv	a5,a0
ffffffffc02043ba:	85a6                	mv	a1,s1
ffffffffc02043bc:	8552                	mv	a0,s4
ffffffffc02043be:	8622                	mv	a2,s0
ffffffffc02043c0:	0487e363          	bltu	a5,s0,ffffffffc0204406 <copy_string+0x7a>
ffffffffc02043c4:	0329f763          	bgeu	s3,s2,ffffffffc02043f2 <copy_string+0x66>
ffffffffc02043c8:	0c6070ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc02043cc:	9a22                	add	s4,s4,s0
ffffffffc02043ce:	94a2                	add	s1,s1,s0
ffffffffc02043d0:	40890933          	sub	s2,s2,s0
ffffffffc02043d4:	6985                	lui	s3,0x1
ffffffffc02043d6:	4681                	li	a3,0
ffffffffc02043d8:	85a6                	mv	a1,s1
ffffffffc02043da:	8556                	mv	a0,s5
ffffffffc02043dc:	844a                	mv	s0,s2
ffffffffc02043de:	0129f363          	bgeu	s3,s2,ffffffffc02043e4 <copy_string+0x58>
ffffffffc02043e2:	844e                	mv	s0,s3
ffffffffc02043e4:	8622                	mv	a2,s0
ffffffffc02043e6:	eadff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02043ea:	87aa                	mv	a5,a0
ffffffffc02043ec:	85a2                	mv	a1,s0
ffffffffc02043ee:	8526                	mv	a0,s1
ffffffffc02043f0:	f3f1                	bnez	a5,ffffffffc02043b4 <copy_string+0x28>
ffffffffc02043f2:	4501                	li	a0,0
ffffffffc02043f4:	70e2                	ld	ra,56(sp)
ffffffffc02043f6:	7442                	ld	s0,48(sp)
ffffffffc02043f8:	74a2                	ld	s1,40(sp)
ffffffffc02043fa:	7902                	ld	s2,32(sp)
ffffffffc02043fc:	69e2                	ld	s3,24(sp)
ffffffffc02043fe:	6a42                	ld	s4,16(sp)
ffffffffc0204400:	6aa2                	ld	s5,8(sp)
ffffffffc0204402:	6121                	addi	sp,sp,64
ffffffffc0204404:	8082                	ret
ffffffffc0204406:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc020440a:	084070ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020440e:	4505                	li	a0,1
ffffffffc0204410:	b7d5                	j	ffffffffc02043f4 <copy_string+0x68>

ffffffffc0204412 <__down.constprop.0>:
ffffffffc0204412:	715d                	addi	sp,sp,-80
ffffffffc0204414:	e0a2                	sd	s0,64(sp)
ffffffffc0204416:	e486                	sd	ra,72(sp)
ffffffffc0204418:	fc26                	sd	s1,56(sp)
ffffffffc020441a:	842a                	mv	s0,a0
ffffffffc020441c:	100027f3          	csrr	a5,sstatus
ffffffffc0204420:	8b89                	andi	a5,a5,2
ffffffffc0204422:	ebb1                	bnez	a5,ffffffffc0204476 <__down.constprop.0+0x64>
ffffffffc0204424:	411c                	lw	a5,0(a0)
ffffffffc0204426:	00f05a63          	blez	a5,ffffffffc020443a <__down.constprop.0+0x28>
ffffffffc020442a:	37fd                	addiw	a5,a5,-1
ffffffffc020442c:	c11c                	sw	a5,0(a0)
ffffffffc020442e:	4501                	li	a0,0
ffffffffc0204430:	60a6                	ld	ra,72(sp)
ffffffffc0204432:	6406                	ld	s0,64(sp)
ffffffffc0204434:	74e2                	ld	s1,56(sp)
ffffffffc0204436:	6161                	addi	sp,sp,80
ffffffffc0204438:	8082                	ret
ffffffffc020443a:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020443e:	0024                	addi	s1,sp,8
ffffffffc0204440:	10000613          	li	a2,256
ffffffffc0204444:	85a6                	mv	a1,s1
ffffffffc0204446:	8522                	mv	a0,s0
ffffffffc0204448:	2d8000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc020444c:	685020ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0204450:	100027f3          	csrr	a5,sstatus
ffffffffc0204454:	8b89                	andi	a5,a5,2
ffffffffc0204456:	efb9                	bnez	a5,ffffffffc02044b4 <__down.constprop.0+0xa2>
ffffffffc0204458:	8526                	mv	a0,s1
ffffffffc020445a:	19c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc020445e:	e531                	bnez	a0,ffffffffc02044aa <__down.constprop.0+0x98>
ffffffffc0204460:	4542                	lw	a0,16(sp)
ffffffffc0204462:	10000793          	li	a5,256
ffffffffc0204466:	fcf515e3          	bne	a0,a5,ffffffffc0204430 <__down.constprop.0+0x1e>
ffffffffc020446a:	60a6                	ld	ra,72(sp)
ffffffffc020446c:	6406                	ld	s0,64(sp)
ffffffffc020446e:	74e2                	ld	s1,56(sp)
ffffffffc0204470:	4501                	li	a0,0
ffffffffc0204472:	6161                	addi	sp,sp,80
ffffffffc0204474:	8082                	ret
ffffffffc0204476:	ffcfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020447a:	401c                	lw	a5,0(s0)
ffffffffc020447c:	00f05c63          	blez	a5,ffffffffc0204494 <__down.constprop.0+0x82>
ffffffffc0204480:	37fd                	addiw	a5,a5,-1
ffffffffc0204482:	c01c                	sw	a5,0(s0)
ffffffffc0204484:	fe8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204488:	60a6                	ld	ra,72(sp)
ffffffffc020448a:	6406                	ld	s0,64(sp)
ffffffffc020448c:	74e2                	ld	s1,56(sp)
ffffffffc020448e:	4501                	li	a0,0
ffffffffc0204490:	6161                	addi	sp,sp,80
ffffffffc0204492:	8082                	ret
ffffffffc0204494:	0421                	addi	s0,s0,8
ffffffffc0204496:	0024                	addi	s1,sp,8
ffffffffc0204498:	10000613          	li	a2,256
ffffffffc020449c:	85a6                	mv	a1,s1
ffffffffc020449e:	8522                	mv	a0,s0
ffffffffc02044a0:	280000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc02044a4:	fc8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044a8:	b755                	j	ffffffffc020444c <__down.constprop.0+0x3a>
ffffffffc02044aa:	85a6                	mv	a1,s1
ffffffffc02044ac:	8522                	mv	a0,s0
ffffffffc02044ae:	0ee000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044b2:	b77d                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044b4:	fbefc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02044b8:	8526                	mv	a0,s1
ffffffffc02044ba:	13c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc02044be:	e501                	bnez	a0,ffffffffc02044c6 <__down.constprop.0+0xb4>
ffffffffc02044c0:	facfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044c4:	bf71                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044c6:	85a6                	mv	a1,s1
ffffffffc02044c8:	8522                	mv	a0,s0
ffffffffc02044ca:	0d2000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044ce:	bfcd                	j	ffffffffc02044c0 <__down.constprop.0+0xae>

ffffffffc02044d0 <__up.constprop.0>:
ffffffffc02044d0:	1101                	addi	sp,sp,-32
ffffffffc02044d2:	e822                	sd	s0,16(sp)
ffffffffc02044d4:	ec06                	sd	ra,24(sp)
ffffffffc02044d6:	e426                	sd	s1,8(sp)
ffffffffc02044d8:	e04a                	sd	s2,0(sp)
ffffffffc02044da:	842a                	mv	s0,a0
ffffffffc02044dc:	100027f3          	csrr	a5,sstatus
ffffffffc02044e0:	8b89                	andi	a5,a5,2
ffffffffc02044e2:	4901                	li	s2,0
ffffffffc02044e4:	eba1                	bnez	a5,ffffffffc0204534 <__up.constprop.0+0x64>
ffffffffc02044e6:	00840493          	addi	s1,s0,8
ffffffffc02044ea:	8526                	mv	a0,s1
ffffffffc02044ec:	0ee000ef          	jal	ra,ffffffffc02045da <wait_queue_first>
ffffffffc02044f0:	85aa                	mv	a1,a0
ffffffffc02044f2:	cd0d                	beqz	a0,ffffffffc020452c <__up.constprop.0+0x5c>
ffffffffc02044f4:	6118                	ld	a4,0(a0)
ffffffffc02044f6:	10000793          	li	a5,256
ffffffffc02044fa:	0ec72703          	lw	a4,236(a4)
ffffffffc02044fe:	02f71f63          	bne	a4,a5,ffffffffc020453c <__up.constprop.0+0x6c>
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	10000613          	li	a2,256
ffffffffc0204508:	8526                	mv	a0,s1
ffffffffc020450a:	0fa000ef          	jal	ra,ffffffffc0204604 <wakeup_wait>
ffffffffc020450e:	00091863          	bnez	s2,ffffffffc020451e <__up.constprop.0+0x4e>
ffffffffc0204512:	60e2                	ld	ra,24(sp)
ffffffffc0204514:	6442                	ld	s0,16(sp)
ffffffffc0204516:	64a2                	ld	s1,8(sp)
ffffffffc0204518:	6902                	ld	s2,0(sp)
ffffffffc020451a:	6105                	addi	sp,sp,32
ffffffffc020451c:	8082                	ret
ffffffffc020451e:	6442                	ld	s0,16(sp)
ffffffffc0204520:	60e2                	ld	ra,24(sp)
ffffffffc0204522:	64a2                	ld	s1,8(sp)
ffffffffc0204524:	6902                	ld	s2,0(sp)
ffffffffc0204526:	6105                	addi	sp,sp,32
ffffffffc0204528:	f44fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020452c:	401c                	lw	a5,0(s0)
ffffffffc020452e:	2785                	addiw	a5,a5,1
ffffffffc0204530:	c01c                	sw	a5,0(s0)
ffffffffc0204532:	bff1                	j	ffffffffc020450e <__up.constprop.0+0x3e>
ffffffffc0204534:	f3efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204538:	4905                	li	s2,1
ffffffffc020453a:	b775                	j	ffffffffc02044e6 <__up.constprop.0+0x16>
ffffffffc020453c:	00009697          	auipc	a3,0x9
ffffffffc0204540:	96c68693          	addi	a3,a3,-1684 # ffffffffc020cea8 <default_pmm_manager+0xaa0>
ffffffffc0204544:	00007617          	auipc	a2,0x7
ffffffffc0204548:	3dc60613          	addi	a2,a2,988 # ffffffffc020b920 <commands+0x210>
ffffffffc020454c:	45e5                	li	a1,25
ffffffffc020454e:	00009517          	auipc	a0,0x9
ffffffffc0204552:	98250513          	addi	a0,a0,-1662 # ffffffffc020ced0 <default_pmm_manager+0xac8>
ffffffffc0204556:	f49fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020455a <sem_init>:
ffffffffc020455a:	c10c                	sw	a1,0(a0)
ffffffffc020455c:	0521                	addi	a0,a0,8
ffffffffc020455e:	a825                	j	ffffffffc0204596 <wait_queue_init>

ffffffffc0204560 <up>:
ffffffffc0204560:	f71ff06f          	j	ffffffffc02044d0 <__up.constprop.0>

ffffffffc0204564 <down>:
ffffffffc0204564:	1141                	addi	sp,sp,-16
ffffffffc0204566:	e406                	sd	ra,8(sp)
ffffffffc0204568:	eabff0ef          	jal	ra,ffffffffc0204412 <__down.constprop.0>
ffffffffc020456c:	2501                	sext.w	a0,a0
ffffffffc020456e:	e501                	bnez	a0,ffffffffc0204576 <down+0x12>
ffffffffc0204570:	60a2                	ld	ra,8(sp)
ffffffffc0204572:	0141                	addi	sp,sp,16
ffffffffc0204574:	8082                	ret
ffffffffc0204576:	00009697          	auipc	a3,0x9
ffffffffc020457a:	96a68693          	addi	a3,a3,-1686 # ffffffffc020cee0 <default_pmm_manager+0xad8>
ffffffffc020457e:	00007617          	auipc	a2,0x7
ffffffffc0204582:	3a260613          	addi	a2,a2,930 # ffffffffc020b920 <commands+0x210>
ffffffffc0204586:	04000593          	li	a1,64
ffffffffc020458a:	00009517          	auipc	a0,0x9
ffffffffc020458e:	94650513          	addi	a0,a0,-1722 # ffffffffc020ced0 <default_pmm_manager+0xac8>
ffffffffc0204592:	f0dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204596 <wait_queue_init>:
ffffffffc0204596:	e508                	sd	a0,8(a0)
ffffffffc0204598:	e108                	sd	a0,0(a0)
ffffffffc020459a:	8082                	ret

ffffffffc020459c <wait_queue_del>:
ffffffffc020459c:	7198                	ld	a4,32(a1)
ffffffffc020459e:	01858793          	addi	a5,a1,24
ffffffffc02045a2:	00e78b63          	beq	a5,a4,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045a6:	6994                	ld	a3,16(a1)
ffffffffc02045a8:	00a69863          	bne	a3,a0,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045ac:	6d94                	ld	a3,24(a1)
ffffffffc02045ae:	e698                	sd	a4,8(a3)
ffffffffc02045b0:	e314                	sd	a3,0(a4)
ffffffffc02045b2:	f19c                	sd	a5,32(a1)
ffffffffc02045b4:	ed9c                	sd	a5,24(a1)
ffffffffc02045b6:	8082                	ret
ffffffffc02045b8:	1141                	addi	sp,sp,-16
ffffffffc02045ba:	00009697          	auipc	a3,0x9
ffffffffc02045be:	98668693          	addi	a3,a3,-1658 # ffffffffc020cf40 <default_pmm_manager+0xb38>
ffffffffc02045c2:	00007617          	auipc	a2,0x7
ffffffffc02045c6:	35e60613          	addi	a2,a2,862 # ffffffffc020b920 <commands+0x210>
ffffffffc02045ca:	45f1                	li	a1,28
ffffffffc02045cc:	00009517          	auipc	a0,0x9
ffffffffc02045d0:	95c50513          	addi	a0,a0,-1700 # ffffffffc020cf28 <default_pmm_manager+0xb20>
ffffffffc02045d4:	e406                	sd	ra,8(sp)
ffffffffc02045d6:	ec9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045da <wait_queue_first>:
ffffffffc02045da:	651c                	ld	a5,8(a0)
ffffffffc02045dc:	00f50563          	beq	a0,a5,ffffffffc02045e6 <wait_queue_first+0xc>
ffffffffc02045e0:	fe878513          	addi	a0,a5,-24
ffffffffc02045e4:	8082                	ret
ffffffffc02045e6:	4501                	li	a0,0
ffffffffc02045e8:	8082                	ret

ffffffffc02045ea <wait_queue_empty>:
ffffffffc02045ea:	651c                	ld	a5,8(a0)
ffffffffc02045ec:	40a78533          	sub	a0,a5,a0
ffffffffc02045f0:	00153513          	seqz	a0,a0
ffffffffc02045f4:	8082                	ret

ffffffffc02045f6 <wait_in_queue>:
ffffffffc02045f6:	711c                	ld	a5,32(a0)
ffffffffc02045f8:	0561                	addi	a0,a0,24
ffffffffc02045fa:	40a78533          	sub	a0,a5,a0
ffffffffc02045fe:	00a03533          	snez	a0,a0
ffffffffc0204602:	8082                	ret

ffffffffc0204604 <wakeup_wait>:
ffffffffc0204604:	e689                	bnez	a3,ffffffffc020460e <wakeup_wait+0xa>
ffffffffc0204606:	6188                	ld	a0,0(a1)
ffffffffc0204608:	c590                	sw	a2,8(a1)
ffffffffc020460a:	4150206f          	j	ffffffffc020721e <wakeup_proc>
ffffffffc020460e:	7198                	ld	a4,32(a1)
ffffffffc0204610:	01858793          	addi	a5,a1,24
ffffffffc0204614:	00e78e63          	beq	a5,a4,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc0204618:	6994                	ld	a3,16(a1)
ffffffffc020461a:	00d51b63          	bne	a0,a3,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc020461e:	6d94                	ld	a3,24(a1)
ffffffffc0204620:	6188                	ld	a0,0(a1)
ffffffffc0204622:	e698                	sd	a4,8(a3)
ffffffffc0204624:	e314                	sd	a3,0(a4)
ffffffffc0204626:	f19c                	sd	a5,32(a1)
ffffffffc0204628:	ed9c                	sd	a5,24(a1)
ffffffffc020462a:	c590                	sw	a2,8(a1)
ffffffffc020462c:	3f30206f          	j	ffffffffc020721e <wakeup_proc>
ffffffffc0204630:	1141                	addi	sp,sp,-16
ffffffffc0204632:	00009697          	auipc	a3,0x9
ffffffffc0204636:	90e68693          	addi	a3,a3,-1778 # ffffffffc020cf40 <default_pmm_manager+0xb38>
ffffffffc020463a:	00007617          	auipc	a2,0x7
ffffffffc020463e:	2e660613          	addi	a2,a2,742 # ffffffffc020b920 <commands+0x210>
ffffffffc0204642:	45f1                	li	a1,28
ffffffffc0204644:	00009517          	auipc	a0,0x9
ffffffffc0204648:	8e450513          	addi	a0,a0,-1820 # ffffffffc020cf28 <default_pmm_manager+0xb20>
ffffffffc020464c:	e406                	sd	ra,8(sp)
ffffffffc020464e:	e51fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204652 <wakeup_queue>:
ffffffffc0204652:	651c                	ld	a5,8(a0)
ffffffffc0204654:	0ca78563          	beq	a5,a0,ffffffffc020471e <wakeup_queue+0xcc>
ffffffffc0204658:	1101                	addi	sp,sp,-32
ffffffffc020465a:	e822                	sd	s0,16(sp)
ffffffffc020465c:	e426                	sd	s1,8(sp)
ffffffffc020465e:	e04a                	sd	s2,0(sp)
ffffffffc0204660:	ec06                	sd	ra,24(sp)
ffffffffc0204662:	84aa                	mv	s1,a0
ffffffffc0204664:	892e                	mv	s2,a1
ffffffffc0204666:	fe878413          	addi	s0,a5,-24
ffffffffc020466a:	e23d                	bnez	a2,ffffffffc02046d0 <wakeup_queue+0x7e>
ffffffffc020466c:	6008                	ld	a0,0(s0)
ffffffffc020466e:	01242423          	sw	s2,8(s0)
ffffffffc0204672:	3ad020ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc0204676:	701c                	ld	a5,32(s0)
ffffffffc0204678:	01840713          	addi	a4,s0,24
ffffffffc020467c:	02e78463          	beq	a5,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204680:	6818                	ld	a4,16(s0)
ffffffffc0204682:	02e49163          	bne	s1,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204686:	02f48f63          	beq	s1,a5,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc020468a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020468e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204692:	fe878413          	addi	s0,a5,-24
ffffffffc0204696:	389020ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc020469a:	701c                	ld	a5,32(s0)
ffffffffc020469c:	01840713          	addi	a4,s0,24
ffffffffc02046a0:	fee790e3          	bne	a5,a4,ffffffffc0204680 <wakeup_queue+0x2e>
ffffffffc02046a4:	00009697          	auipc	a3,0x9
ffffffffc02046a8:	89c68693          	addi	a3,a3,-1892 # ffffffffc020cf40 <default_pmm_manager+0xb38>
ffffffffc02046ac:	00007617          	auipc	a2,0x7
ffffffffc02046b0:	27460613          	addi	a2,a2,628 # ffffffffc020b920 <commands+0x210>
ffffffffc02046b4:	02200593          	li	a1,34
ffffffffc02046b8:	00009517          	auipc	a0,0x9
ffffffffc02046bc:	87050513          	addi	a0,a0,-1936 # ffffffffc020cf28 <default_pmm_manager+0xb20>
ffffffffc02046c0:	ddffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02046c4:	60e2                	ld	ra,24(sp)
ffffffffc02046c6:	6442                	ld	s0,16(sp)
ffffffffc02046c8:	64a2                	ld	s1,8(sp)
ffffffffc02046ca:	6902                	ld	s2,0(sp)
ffffffffc02046cc:	6105                	addi	sp,sp,32
ffffffffc02046ce:	8082                	ret
ffffffffc02046d0:	6798                	ld	a4,8(a5)
ffffffffc02046d2:	02f70763          	beq	a4,a5,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046d6:	6814                	ld	a3,16(s0)
ffffffffc02046d8:	02d49463          	bne	s1,a3,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046dc:	6c14                	ld	a3,24(s0)
ffffffffc02046de:	6008                	ld	a0,0(s0)
ffffffffc02046e0:	e698                	sd	a4,8(a3)
ffffffffc02046e2:	e314                	sd	a3,0(a4)
ffffffffc02046e4:	f01c                	sd	a5,32(s0)
ffffffffc02046e6:	ec1c                	sd	a5,24(s0)
ffffffffc02046e8:	01242423          	sw	s2,8(s0)
ffffffffc02046ec:	333020ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc02046f0:	6480                	ld	s0,8(s1)
ffffffffc02046f2:	fc8489e3          	beq	s1,s0,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc02046f6:	6418                	ld	a4,8(s0)
ffffffffc02046f8:	87a2                	mv	a5,s0
ffffffffc02046fa:	1421                	addi	s0,s0,-24
ffffffffc02046fc:	fce79de3          	bne	a5,a4,ffffffffc02046d6 <wakeup_queue+0x84>
ffffffffc0204700:	00009697          	auipc	a3,0x9
ffffffffc0204704:	84068693          	addi	a3,a3,-1984 # ffffffffc020cf40 <default_pmm_manager+0xb38>
ffffffffc0204708:	00007617          	auipc	a2,0x7
ffffffffc020470c:	21860613          	addi	a2,a2,536 # ffffffffc020b920 <commands+0x210>
ffffffffc0204710:	45f1                	li	a1,28
ffffffffc0204712:	00009517          	auipc	a0,0x9
ffffffffc0204716:	81650513          	addi	a0,a0,-2026 # ffffffffc020cf28 <default_pmm_manager+0xb20>
ffffffffc020471a:	d85fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020471e:	8082                	ret

ffffffffc0204720 <wait_current_set>:
ffffffffc0204720:	00092797          	auipc	a5,0x92
ffffffffc0204724:	1a07b783          	ld	a5,416(a5) # ffffffffc02968c0 <current>
ffffffffc0204728:	c39d                	beqz	a5,ffffffffc020474e <wait_current_set+0x2e>
ffffffffc020472a:	01858713          	addi	a4,a1,24
ffffffffc020472e:	800006b7          	lui	a3,0x80000
ffffffffc0204732:	ed98                	sd	a4,24(a1)
ffffffffc0204734:	e19c                	sd	a5,0(a1)
ffffffffc0204736:	c594                	sw	a3,8(a1)
ffffffffc0204738:	4685                	li	a3,1
ffffffffc020473a:	c394                	sw	a3,0(a5)
ffffffffc020473c:	0ec7a623          	sw	a2,236(a5)
ffffffffc0204740:	611c                	ld	a5,0(a0)
ffffffffc0204742:	e988                	sd	a0,16(a1)
ffffffffc0204744:	e118                	sd	a4,0(a0)
ffffffffc0204746:	e798                	sd	a4,8(a5)
ffffffffc0204748:	f188                	sd	a0,32(a1)
ffffffffc020474a:	ed9c                	sd	a5,24(a1)
ffffffffc020474c:	8082                	ret
ffffffffc020474e:	1141                	addi	sp,sp,-16
ffffffffc0204750:	00009697          	auipc	a3,0x9
ffffffffc0204754:	83068693          	addi	a3,a3,-2000 # ffffffffc020cf80 <default_pmm_manager+0xb78>
ffffffffc0204758:	00007617          	auipc	a2,0x7
ffffffffc020475c:	1c860613          	addi	a2,a2,456 # ffffffffc020b920 <commands+0x210>
ffffffffc0204760:	07400593          	li	a1,116
ffffffffc0204764:	00008517          	auipc	a0,0x8
ffffffffc0204768:	7c450513          	addi	a0,a0,1988 # ffffffffc020cf28 <default_pmm_manager+0xb20>
ffffffffc020476c:	e406                	sd	ra,8(sp)
ffffffffc020476e:	d31fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204772 <get_fd_array.part.0>:
ffffffffc0204772:	1141                	addi	sp,sp,-16
ffffffffc0204774:	00009697          	auipc	a3,0x9
ffffffffc0204778:	81c68693          	addi	a3,a3,-2020 # ffffffffc020cf90 <default_pmm_manager+0xb88>
ffffffffc020477c:	00007617          	auipc	a2,0x7
ffffffffc0204780:	1a460613          	addi	a2,a2,420 # ffffffffc020b920 <commands+0x210>
ffffffffc0204784:	45d1                	li	a1,20
ffffffffc0204786:	00009517          	auipc	a0,0x9
ffffffffc020478a:	83a50513          	addi	a0,a0,-1990 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc020478e:	e406                	sd	ra,8(sp)
ffffffffc0204790:	d0ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204794 <fd_array_alloc>:
ffffffffc0204794:	00092797          	auipc	a5,0x92
ffffffffc0204798:	12c7b783          	ld	a5,300(a5) # ffffffffc02968c0 <current>
ffffffffc020479c:	1487b783          	ld	a5,328(a5)
ffffffffc02047a0:	1141                	addi	sp,sp,-16
ffffffffc02047a2:	e406                	sd	ra,8(sp)
ffffffffc02047a4:	c3a5                	beqz	a5,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047a6:	4b98                	lw	a4,16(a5)
ffffffffc02047a8:	04e05e63          	blez	a4,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047ac:	775d                	lui	a4,0xffff7
ffffffffc02047ae:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02047b2:	679c                	ld	a5,8(a5)
ffffffffc02047b4:	02e50863          	beq	a0,a4,ffffffffc02047e4 <fd_array_alloc+0x50>
ffffffffc02047b8:	04700713          	li	a4,71
ffffffffc02047bc:	04a76263          	bltu	a4,a0,ffffffffc0204800 <fd_array_alloc+0x6c>
ffffffffc02047c0:	00351713          	slli	a4,a0,0x3
ffffffffc02047c4:	40a70533          	sub	a0,a4,a0
ffffffffc02047c8:	050e                	slli	a0,a0,0x3
ffffffffc02047ca:	97aa                	add	a5,a5,a0
ffffffffc02047cc:	4398                	lw	a4,0(a5)
ffffffffc02047ce:	e71d                	bnez	a4,ffffffffc02047fc <fd_array_alloc+0x68>
ffffffffc02047d0:	5b88                	lw	a0,48(a5)
ffffffffc02047d2:	e91d                	bnez	a0,ffffffffc0204808 <fd_array_alloc+0x74>
ffffffffc02047d4:	4705                	li	a4,1
ffffffffc02047d6:	c398                	sw	a4,0(a5)
ffffffffc02047d8:	0207b423          	sd	zero,40(a5)
ffffffffc02047dc:	e19c                	sd	a5,0(a1)
ffffffffc02047de:	60a2                	ld	ra,8(sp)
ffffffffc02047e0:	0141                	addi	sp,sp,16
ffffffffc02047e2:	8082                	ret
ffffffffc02047e4:	6685                	lui	a3,0x1
ffffffffc02047e6:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02047ea:	96be                	add	a3,a3,a5
ffffffffc02047ec:	4398                	lw	a4,0(a5)
ffffffffc02047ee:	d36d                	beqz	a4,ffffffffc02047d0 <fd_array_alloc+0x3c>
ffffffffc02047f0:	03878793          	addi	a5,a5,56
ffffffffc02047f4:	fef69ce3          	bne	a3,a5,ffffffffc02047ec <fd_array_alloc+0x58>
ffffffffc02047f8:	5529                	li	a0,-22
ffffffffc02047fa:	b7d5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc02047fc:	5545                	li	a0,-15
ffffffffc02047fe:	b7c5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204800:	5575                	li	a0,-3
ffffffffc0204802:	bff1                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204804:	f6fff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204808:	00008697          	auipc	a3,0x8
ffffffffc020480c:	7c868693          	addi	a3,a3,1992 # ffffffffc020cfd0 <default_pmm_manager+0xbc8>
ffffffffc0204810:	00007617          	auipc	a2,0x7
ffffffffc0204814:	11060613          	addi	a2,a2,272 # ffffffffc020b920 <commands+0x210>
ffffffffc0204818:	03b00593          	li	a1,59
ffffffffc020481c:	00008517          	auipc	a0,0x8
ffffffffc0204820:	7a450513          	addi	a0,a0,1956 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204824:	c7bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204828 <fd_array_free>:
ffffffffc0204828:	411c                	lw	a5,0(a0)
ffffffffc020482a:	1141                	addi	sp,sp,-16
ffffffffc020482c:	e022                	sd	s0,0(sp)
ffffffffc020482e:	e406                	sd	ra,8(sp)
ffffffffc0204830:	4705                	li	a4,1
ffffffffc0204832:	842a                	mv	s0,a0
ffffffffc0204834:	04e78063          	beq	a5,a4,ffffffffc0204874 <fd_array_free+0x4c>
ffffffffc0204838:	470d                	li	a4,3
ffffffffc020483a:	04e79563          	bne	a5,a4,ffffffffc0204884 <fd_array_free+0x5c>
ffffffffc020483e:	591c                	lw	a5,48(a0)
ffffffffc0204840:	c38d                	beqz	a5,ffffffffc0204862 <fd_array_free+0x3a>
ffffffffc0204842:	00008697          	auipc	a3,0x8
ffffffffc0204846:	78e68693          	addi	a3,a3,1934 # ffffffffc020cfd0 <default_pmm_manager+0xbc8>
ffffffffc020484a:	00007617          	auipc	a2,0x7
ffffffffc020484e:	0d660613          	addi	a2,a2,214 # ffffffffc020b920 <commands+0x210>
ffffffffc0204852:	04500593          	li	a1,69
ffffffffc0204856:	00008517          	auipc	a0,0x8
ffffffffc020485a:	76a50513          	addi	a0,a0,1898 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc020485e:	c41fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204862:	7408                	ld	a0,40(s0)
ffffffffc0204864:	031030ef          	jal	ra,ffffffffc0208094 <vfs_close>
ffffffffc0204868:	60a2                	ld	ra,8(sp)
ffffffffc020486a:	00042023          	sw	zero,0(s0)
ffffffffc020486e:	6402                	ld	s0,0(sp)
ffffffffc0204870:	0141                	addi	sp,sp,16
ffffffffc0204872:	8082                	ret
ffffffffc0204874:	591c                	lw	a5,48(a0)
ffffffffc0204876:	f7f1                	bnez	a5,ffffffffc0204842 <fd_array_free+0x1a>
ffffffffc0204878:	60a2                	ld	ra,8(sp)
ffffffffc020487a:	00042023          	sw	zero,0(s0)
ffffffffc020487e:	6402                	ld	s0,0(sp)
ffffffffc0204880:	0141                	addi	sp,sp,16
ffffffffc0204882:	8082                	ret
ffffffffc0204884:	00008697          	auipc	a3,0x8
ffffffffc0204888:	78468693          	addi	a3,a3,1924 # ffffffffc020d008 <default_pmm_manager+0xc00>
ffffffffc020488c:	00007617          	auipc	a2,0x7
ffffffffc0204890:	09460613          	addi	a2,a2,148 # ffffffffc020b920 <commands+0x210>
ffffffffc0204894:	04400593          	li	a1,68
ffffffffc0204898:	00008517          	auipc	a0,0x8
ffffffffc020489c:	72850513          	addi	a0,a0,1832 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc02048a0:	bfffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048a4 <fd_array_release>:
ffffffffc02048a4:	4118                	lw	a4,0(a0)
ffffffffc02048a6:	1141                	addi	sp,sp,-16
ffffffffc02048a8:	e406                	sd	ra,8(sp)
ffffffffc02048aa:	4685                	li	a3,1
ffffffffc02048ac:	3779                	addiw	a4,a4,-2
ffffffffc02048ae:	04e6e063          	bltu	a3,a4,ffffffffc02048ee <fd_array_release+0x4a>
ffffffffc02048b2:	5918                	lw	a4,48(a0)
ffffffffc02048b4:	00e05d63          	blez	a4,ffffffffc02048ce <fd_array_release+0x2a>
ffffffffc02048b8:	fff7069b          	addiw	a3,a4,-1
ffffffffc02048bc:	d914                	sw	a3,48(a0)
ffffffffc02048be:	c681                	beqz	a3,ffffffffc02048c6 <fd_array_release+0x22>
ffffffffc02048c0:	60a2                	ld	ra,8(sp)
ffffffffc02048c2:	0141                	addi	sp,sp,16
ffffffffc02048c4:	8082                	ret
ffffffffc02048c6:	60a2                	ld	ra,8(sp)
ffffffffc02048c8:	0141                	addi	sp,sp,16
ffffffffc02048ca:	f5fff06f          	j	ffffffffc0204828 <fd_array_free>
ffffffffc02048ce:	00008697          	auipc	a3,0x8
ffffffffc02048d2:	7aa68693          	addi	a3,a3,1962 # ffffffffc020d078 <default_pmm_manager+0xc70>
ffffffffc02048d6:	00007617          	auipc	a2,0x7
ffffffffc02048da:	04a60613          	addi	a2,a2,74 # ffffffffc020b920 <commands+0x210>
ffffffffc02048de:	05600593          	li	a1,86
ffffffffc02048e2:	00008517          	auipc	a0,0x8
ffffffffc02048e6:	6de50513          	addi	a0,a0,1758 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc02048ea:	bb5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048ee:	00008697          	auipc	a3,0x8
ffffffffc02048f2:	75268693          	addi	a3,a3,1874 # ffffffffc020d040 <default_pmm_manager+0xc38>
ffffffffc02048f6:	00007617          	auipc	a2,0x7
ffffffffc02048fa:	02a60613          	addi	a2,a2,42 # ffffffffc020b920 <commands+0x210>
ffffffffc02048fe:	05500593          	li	a1,85
ffffffffc0204902:	00008517          	auipc	a0,0x8
ffffffffc0204906:	6be50513          	addi	a0,a0,1726 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc020490a:	b95fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020490e <fd_array_open.part.0>:
ffffffffc020490e:	1141                	addi	sp,sp,-16
ffffffffc0204910:	00008697          	auipc	a3,0x8
ffffffffc0204914:	78068693          	addi	a3,a3,1920 # ffffffffc020d090 <default_pmm_manager+0xc88>
ffffffffc0204918:	00007617          	auipc	a2,0x7
ffffffffc020491c:	00860613          	addi	a2,a2,8 # ffffffffc020b920 <commands+0x210>
ffffffffc0204920:	05f00593          	li	a1,95
ffffffffc0204924:	00008517          	auipc	a0,0x8
ffffffffc0204928:	69c50513          	addi	a0,a0,1692 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc020492c:	e406                	sd	ra,8(sp)
ffffffffc020492e:	b71fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204932 <fd_array_init>:
ffffffffc0204932:	4781                	li	a5,0
ffffffffc0204934:	04800713          	li	a4,72
ffffffffc0204938:	cd1c                	sw	a5,24(a0)
ffffffffc020493a:	02052823          	sw	zero,48(a0)
ffffffffc020493e:	00052023          	sw	zero,0(a0)
ffffffffc0204942:	2785                	addiw	a5,a5,1
ffffffffc0204944:	03850513          	addi	a0,a0,56
ffffffffc0204948:	fee798e3          	bne	a5,a4,ffffffffc0204938 <fd_array_init+0x6>
ffffffffc020494c:	8082                	ret

ffffffffc020494e <fd_array_close>:
ffffffffc020494e:	4118                	lw	a4,0(a0)
ffffffffc0204950:	1141                	addi	sp,sp,-16
ffffffffc0204952:	e406                	sd	ra,8(sp)
ffffffffc0204954:	e022                	sd	s0,0(sp)
ffffffffc0204956:	4789                	li	a5,2
ffffffffc0204958:	04f71a63          	bne	a4,a5,ffffffffc02049ac <fd_array_close+0x5e>
ffffffffc020495c:	591c                	lw	a5,48(a0)
ffffffffc020495e:	842a                	mv	s0,a0
ffffffffc0204960:	02f05663          	blez	a5,ffffffffc020498c <fd_array_close+0x3e>
ffffffffc0204964:	37fd                	addiw	a5,a5,-1
ffffffffc0204966:	470d                	li	a4,3
ffffffffc0204968:	c118                	sw	a4,0(a0)
ffffffffc020496a:	d91c                	sw	a5,48(a0)
ffffffffc020496c:	0007871b          	sext.w	a4,a5
ffffffffc0204970:	c709                	beqz	a4,ffffffffc020497a <fd_array_close+0x2c>
ffffffffc0204972:	60a2                	ld	ra,8(sp)
ffffffffc0204974:	6402                	ld	s0,0(sp)
ffffffffc0204976:	0141                	addi	sp,sp,16
ffffffffc0204978:	8082                	ret
ffffffffc020497a:	7508                	ld	a0,40(a0)
ffffffffc020497c:	718030ef          	jal	ra,ffffffffc0208094 <vfs_close>
ffffffffc0204980:	60a2                	ld	ra,8(sp)
ffffffffc0204982:	00042023          	sw	zero,0(s0)
ffffffffc0204986:	6402                	ld	s0,0(sp)
ffffffffc0204988:	0141                	addi	sp,sp,16
ffffffffc020498a:	8082                	ret
ffffffffc020498c:	00008697          	auipc	a3,0x8
ffffffffc0204990:	6ec68693          	addi	a3,a3,1772 # ffffffffc020d078 <default_pmm_manager+0xc70>
ffffffffc0204994:	00007617          	auipc	a2,0x7
ffffffffc0204998:	f8c60613          	addi	a2,a2,-116 # ffffffffc020b920 <commands+0x210>
ffffffffc020499c:	06800593          	li	a1,104
ffffffffc02049a0:	00008517          	auipc	a0,0x8
ffffffffc02049a4:	62050513          	addi	a0,a0,1568 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc02049a8:	af7fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049ac:	00008697          	auipc	a3,0x8
ffffffffc02049b0:	63c68693          	addi	a3,a3,1596 # ffffffffc020cfe8 <default_pmm_manager+0xbe0>
ffffffffc02049b4:	00007617          	auipc	a2,0x7
ffffffffc02049b8:	f6c60613          	addi	a2,a2,-148 # ffffffffc020b920 <commands+0x210>
ffffffffc02049bc:	06700593          	li	a1,103
ffffffffc02049c0:	00008517          	auipc	a0,0x8
ffffffffc02049c4:	60050513          	addi	a0,a0,1536 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc02049c8:	ad7fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049cc <fd_array_dup>:
ffffffffc02049cc:	7179                	addi	sp,sp,-48
ffffffffc02049ce:	e84a                	sd	s2,16(sp)
ffffffffc02049d0:	00052903          	lw	s2,0(a0)
ffffffffc02049d4:	f406                	sd	ra,40(sp)
ffffffffc02049d6:	f022                	sd	s0,32(sp)
ffffffffc02049d8:	ec26                	sd	s1,24(sp)
ffffffffc02049da:	e44e                	sd	s3,8(sp)
ffffffffc02049dc:	4785                	li	a5,1
ffffffffc02049de:	04f91663          	bne	s2,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049e2:	0005a983          	lw	s3,0(a1)
ffffffffc02049e6:	4789                	li	a5,2
ffffffffc02049e8:	04f99163          	bne	s3,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049ec:	7584                	ld	s1,40(a1)
ffffffffc02049ee:	699c                	ld	a5,16(a1)
ffffffffc02049f0:	7194                	ld	a3,32(a1)
ffffffffc02049f2:	6598                	ld	a4,8(a1)
ffffffffc02049f4:	842a                	mv	s0,a0
ffffffffc02049f6:	e91c                	sd	a5,16(a0)
ffffffffc02049f8:	f114                	sd	a3,32(a0)
ffffffffc02049fa:	e518                	sd	a4,8(a0)
ffffffffc02049fc:	8526                	mv	a0,s1
ffffffffc02049fe:	5f5020ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc0204a02:	8526                	mv	a0,s1
ffffffffc0204a04:	5fb020ef          	jal	ra,ffffffffc02077fe <inode_open_inc>
ffffffffc0204a08:	401c                	lw	a5,0(s0)
ffffffffc0204a0a:	f404                	sd	s1,40(s0)
ffffffffc0204a0c:	03279f63          	bne	a5,s2,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a10:	cc8d                	beqz	s1,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a12:	581c                	lw	a5,48(s0)
ffffffffc0204a14:	01342023          	sw	s3,0(s0)
ffffffffc0204a18:	70a2                	ld	ra,40(sp)
ffffffffc0204a1a:	2785                	addiw	a5,a5,1
ffffffffc0204a1c:	d81c                	sw	a5,48(s0)
ffffffffc0204a1e:	7402                	ld	s0,32(sp)
ffffffffc0204a20:	64e2                	ld	s1,24(sp)
ffffffffc0204a22:	6942                	ld	s2,16(sp)
ffffffffc0204a24:	69a2                	ld	s3,8(sp)
ffffffffc0204a26:	6145                	addi	sp,sp,48
ffffffffc0204a28:	8082                	ret
ffffffffc0204a2a:	00008697          	auipc	a3,0x8
ffffffffc0204a2e:	69668693          	addi	a3,a3,1686 # ffffffffc020d0c0 <default_pmm_manager+0xcb8>
ffffffffc0204a32:	00007617          	auipc	a2,0x7
ffffffffc0204a36:	eee60613          	addi	a2,a2,-274 # ffffffffc020b920 <commands+0x210>
ffffffffc0204a3a:	07300593          	li	a1,115
ffffffffc0204a3e:	00008517          	auipc	a0,0x8
ffffffffc0204a42:	58250513          	addi	a0,a0,1410 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204a46:	a59fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a4a:	ec5ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>

ffffffffc0204a4e <file_testfd>:
ffffffffc0204a4e:	04700793          	li	a5,71
ffffffffc0204a52:	04a7e263          	bltu	a5,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a56:	00092797          	auipc	a5,0x92
ffffffffc0204a5a:	e6a7b783          	ld	a5,-406(a5) # ffffffffc02968c0 <current>
ffffffffc0204a5e:	1487b783          	ld	a5,328(a5)
ffffffffc0204a62:	cf85                	beqz	a5,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a64:	4b98                	lw	a4,16(a5)
ffffffffc0204a66:	02e05a63          	blez	a4,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a6a:	6798                	ld	a4,8(a5)
ffffffffc0204a6c:	00351793          	slli	a5,a0,0x3
ffffffffc0204a70:	8f89                	sub	a5,a5,a0
ffffffffc0204a72:	078e                	slli	a5,a5,0x3
ffffffffc0204a74:	97ba                	add	a5,a5,a4
ffffffffc0204a76:	4394                	lw	a3,0(a5)
ffffffffc0204a78:	4709                	li	a4,2
ffffffffc0204a7a:	00e69e63          	bne	a3,a4,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a7e:	4f98                	lw	a4,24(a5)
ffffffffc0204a80:	00a71b63          	bne	a4,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a84:	c199                	beqz	a1,ffffffffc0204a8a <file_testfd+0x3c>
ffffffffc0204a86:	6788                	ld	a0,8(a5)
ffffffffc0204a88:	c901                	beqz	a0,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8a:	4505                	li	a0,1
ffffffffc0204a8c:	c611                	beqz	a2,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8e:	6b88                	ld	a0,16(a5)
ffffffffc0204a90:	00a03533          	snez	a0,a0
ffffffffc0204a94:	8082                	ret
ffffffffc0204a96:	4501                	li	a0,0
ffffffffc0204a98:	8082                	ret
ffffffffc0204a9a:	1141                	addi	sp,sp,-16
ffffffffc0204a9c:	e406                	sd	ra,8(sp)
ffffffffc0204a9e:	cd5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204aa2 <file_open>:
ffffffffc0204aa2:	711d                	addi	sp,sp,-96
ffffffffc0204aa4:	ec86                	sd	ra,88(sp)
ffffffffc0204aa6:	e8a2                	sd	s0,80(sp)
ffffffffc0204aa8:	e4a6                	sd	s1,72(sp)
ffffffffc0204aaa:	e0ca                	sd	s2,64(sp)
ffffffffc0204aac:	fc4e                	sd	s3,56(sp)
ffffffffc0204aae:	f852                	sd	s4,48(sp)
ffffffffc0204ab0:	0035f793          	andi	a5,a1,3
ffffffffc0204ab4:	470d                	li	a4,3
ffffffffc0204ab6:	0ce78163          	beq	a5,a4,ffffffffc0204b78 <file_open+0xd6>
ffffffffc0204aba:	078e                	slli	a5,a5,0x3
ffffffffc0204abc:	00009717          	auipc	a4,0x9
ffffffffc0204ac0:	87470713          	addi	a4,a4,-1932 # ffffffffc020d330 <CSWTCH.79>
ffffffffc0204ac4:	892a                	mv	s2,a0
ffffffffc0204ac6:	00009697          	auipc	a3,0x9
ffffffffc0204aca:	85268693          	addi	a3,a3,-1966 # ffffffffc020d318 <CSWTCH.78>
ffffffffc0204ace:	755d                	lui	a0,0xffff7
ffffffffc0204ad0:	96be                	add	a3,a3,a5
ffffffffc0204ad2:	84ae                	mv	s1,a1
ffffffffc0204ad4:	97ba                	add	a5,a5,a4
ffffffffc0204ad6:	858a                	mv	a1,sp
ffffffffc0204ad8:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204adc:	0006ba03          	ld	s4,0(a3)
ffffffffc0204ae0:	0007b983          	ld	s3,0(a5)
ffffffffc0204ae4:	cb1ff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc0204ae8:	842a                	mv	s0,a0
ffffffffc0204aea:	c911                	beqz	a0,ffffffffc0204afe <file_open+0x5c>
ffffffffc0204aec:	60e6                	ld	ra,88(sp)
ffffffffc0204aee:	8522                	mv	a0,s0
ffffffffc0204af0:	6446                	ld	s0,80(sp)
ffffffffc0204af2:	64a6                	ld	s1,72(sp)
ffffffffc0204af4:	6906                	ld	s2,64(sp)
ffffffffc0204af6:	79e2                	ld	s3,56(sp)
ffffffffc0204af8:	7a42                	ld	s4,48(sp)
ffffffffc0204afa:	6125                	addi	sp,sp,96
ffffffffc0204afc:	8082                	ret
ffffffffc0204afe:	0030                	addi	a2,sp,8
ffffffffc0204b00:	85a6                	mv	a1,s1
ffffffffc0204b02:	854a                	mv	a0,s2
ffffffffc0204b04:	3ea030ef          	jal	ra,ffffffffc0207eee <vfs_open>
ffffffffc0204b08:	842a                	mv	s0,a0
ffffffffc0204b0a:	e13d                	bnez	a0,ffffffffc0204b70 <file_open+0xce>
ffffffffc0204b0c:	6782                	ld	a5,0(sp)
ffffffffc0204b0e:	0204f493          	andi	s1,s1,32
ffffffffc0204b12:	6422                	ld	s0,8(sp)
ffffffffc0204b14:	0207b023          	sd	zero,32(a5)
ffffffffc0204b18:	c885                	beqz	s1,ffffffffc0204b48 <file_open+0xa6>
ffffffffc0204b1a:	c03d                	beqz	s0,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b1c:	783c                	ld	a5,112(s0)
ffffffffc0204b1e:	c3ad                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b20:	779c                	ld	a5,40(a5)
ffffffffc0204b22:	cfb9                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b24:	8522                	mv	a0,s0
ffffffffc0204b26:	00008597          	auipc	a1,0x8
ffffffffc0204b2a:	62258593          	addi	a1,a1,1570 # ffffffffc020d148 <default_pmm_manager+0xd40>
ffffffffc0204b2e:	4dd020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204b32:	783c                	ld	a5,112(s0)
ffffffffc0204b34:	6522                	ld	a0,8(sp)
ffffffffc0204b36:	080c                	addi	a1,sp,16
ffffffffc0204b38:	779c                	ld	a5,40(a5)
ffffffffc0204b3a:	9782                	jalr	a5
ffffffffc0204b3c:	842a                	mv	s0,a0
ffffffffc0204b3e:	e515                	bnez	a0,ffffffffc0204b6a <file_open+0xc8>
ffffffffc0204b40:	6782                	ld	a5,0(sp)
ffffffffc0204b42:	7722                	ld	a4,40(sp)
ffffffffc0204b44:	6422                	ld	s0,8(sp)
ffffffffc0204b46:	f398                	sd	a4,32(a5)
ffffffffc0204b48:	4394                	lw	a3,0(a5)
ffffffffc0204b4a:	f780                	sd	s0,40(a5)
ffffffffc0204b4c:	0147b423          	sd	s4,8(a5)
ffffffffc0204b50:	0137b823          	sd	s3,16(a5)
ffffffffc0204b54:	4705                	li	a4,1
ffffffffc0204b56:	02e69363          	bne	a3,a4,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5a:	c00d                	beqz	s0,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5c:	5b98                	lw	a4,48(a5)
ffffffffc0204b5e:	4689                	li	a3,2
ffffffffc0204b60:	4f80                	lw	s0,24(a5)
ffffffffc0204b62:	2705                	addiw	a4,a4,1
ffffffffc0204b64:	c394                	sw	a3,0(a5)
ffffffffc0204b66:	db98                	sw	a4,48(a5)
ffffffffc0204b68:	b751                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b6a:	6522                	ld	a0,8(sp)
ffffffffc0204b6c:	528030ef          	jal	ra,ffffffffc0208094 <vfs_close>
ffffffffc0204b70:	6502                	ld	a0,0(sp)
ffffffffc0204b72:	cb7ff0ef          	jal	ra,ffffffffc0204828 <fd_array_free>
ffffffffc0204b76:	bf9d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b78:	5475                	li	s0,-3
ffffffffc0204b7a:	bf8d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b7c:	d93ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>
ffffffffc0204b80:	00008697          	auipc	a3,0x8
ffffffffc0204b84:	57868693          	addi	a3,a3,1400 # ffffffffc020d0f8 <default_pmm_manager+0xcf0>
ffffffffc0204b88:	00007617          	auipc	a2,0x7
ffffffffc0204b8c:	d9860613          	addi	a2,a2,-616 # ffffffffc020b920 <commands+0x210>
ffffffffc0204b90:	0b500593          	li	a1,181
ffffffffc0204b94:	00008517          	auipc	a0,0x8
ffffffffc0204b98:	42c50513          	addi	a0,a0,1068 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204b9c:	903fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ba0 <file_close>:
ffffffffc0204ba0:	04700713          	li	a4,71
ffffffffc0204ba4:	04a76563          	bltu	a4,a0,ffffffffc0204bee <file_close+0x4e>
ffffffffc0204ba8:	00092717          	auipc	a4,0x92
ffffffffc0204bac:	d1873703          	ld	a4,-744(a4) # ffffffffc02968c0 <current>
ffffffffc0204bb0:	14873703          	ld	a4,328(a4)
ffffffffc0204bb4:	1141                	addi	sp,sp,-16
ffffffffc0204bb6:	e406                	sd	ra,8(sp)
ffffffffc0204bb8:	cf0d                	beqz	a4,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bba:	4b14                	lw	a3,16(a4)
ffffffffc0204bbc:	02d05b63          	blez	a3,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bc0:	6718                	ld	a4,8(a4)
ffffffffc0204bc2:	87aa                	mv	a5,a0
ffffffffc0204bc4:	050e                	slli	a0,a0,0x3
ffffffffc0204bc6:	8d1d                	sub	a0,a0,a5
ffffffffc0204bc8:	050e                	slli	a0,a0,0x3
ffffffffc0204bca:	953a                	add	a0,a0,a4
ffffffffc0204bcc:	4114                	lw	a3,0(a0)
ffffffffc0204bce:	4709                	li	a4,2
ffffffffc0204bd0:	00e69b63          	bne	a3,a4,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bd4:	4d18                	lw	a4,24(a0)
ffffffffc0204bd6:	00f71863          	bne	a4,a5,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bda:	d75ff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0204bde:	60a2                	ld	ra,8(sp)
ffffffffc0204be0:	4501                	li	a0,0
ffffffffc0204be2:	0141                	addi	sp,sp,16
ffffffffc0204be4:	8082                	ret
ffffffffc0204be6:	60a2                	ld	ra,8(sp)
ffffffffc0204be8:	5575                	li	a0,-3
ffffffffc0204bea:	0141                	addi	sp,sp,16
ffffffffc0204bec:	8082                	ret
ffffffffc0204bee:	5575                	li	a0,-3
ffffffffc0204bf0:	8082                	ret
ffffffffc0204bf2:	b81ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204bf6 <file_read>:
ffffffffc0204bf6:	715d                	addi	sp,sp,-80
ffffffffc0204bf8:	e486                	sd	ra,72(sp)
ffffffffc0204bfa:	e0a2                	sd	s0,64(sp)
ffffffffc0204bfc:	fc26                	sd	s1,56(sp)
ffffffffc0204bfe:	f84a                	sd	s2,48(sp)
ffffffffc0204c00:	f44e                	sd	s3,40(sp)
ffffffffc0204c02:	f052                	sd	s4,32(sp)
ffffffffc0204c04:	0006b023          	sd	zero,0(a3)
ffffffffc0204c08:	04700793          	li	a5,71
ffffffffc0204c0c:	0aa7e463          	bltu	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c10:	00092797          	auipc	a5,0x92
ffffffffc0204c14:	cb07b783          	ld	a5,-848(a5) # ffffffffc02968c0 <current>
ffffffffc0204c18:	1487b783          	ld	a5,328(a5)
ffffffffc0204c1c:	cfd1                	beqz	a5,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c1e:	4b98                	lw	a4,16(a5)
ffffffffc0204c20:	08e05c63          	blez	a4,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c24:	6780                	ld	s0,8(a5)
ffffffffc0204c26:	00351793          	slli	a5,a0,0x3
ffffffffc0204c2a:	8f89                	sub	a5,a5,a0
ffffffffc0204c2c:	078e                	slli	a5,a5,0x3
ffffffffc0204c2e:	943e                	add	s0,s0,a5
ffffffffc0204c30:	00042983          	lw	s3,0(s0)
ffffffffc0204c34:	4789                	li	a5,2
ffffffffc0204c36:	06f99f63          	bne	s3,a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c3a:	4c1c                	lw	a5,24(s0)
ffffffffc0204c3c:	06a79c63          	bne	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c40:	641c                	ld	a5,8(s0)
ffffffffc0204c42:	cbad                	beqz	a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c44:	581c                	lw	a5,48(s0)
ffffffffc0204c46:	8a36                	mv	s4,a3
ffffffffc0204c48:	7014                	ld	a3,32(s0)
ffffffffc0204c4a:	2785                	addiw	a5,a5,1
ffffffffc0204c4c:	850a                	mv	a0,sp
ffffffffc0204c4e:	d81c                	sw	a5,48(s0)
ffffffffc0204c50:	792000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204c54:	02843903          	ld	s2,40(s0)
ffffffffc0204c58:	84aa                	mv	s1,a0
ffffffffc0204c5a:	06090163          	beqz	s2,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c5e:	07093783          	ld	a5,112(s2)
ffffffffc0204c62:	cfa9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c64:	6f9c                	ld	a5,24(a5)
ffffffffc0204c66:	cbb9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c68:	00008597          	auipc	a1,0x8
ffffffffc0204c6c:	53858593          	addi	a1,a1,1336 # ffffffffc020d1a0 <default_pmm_manager+0xd98>
ffffffffc0204c70:	854a                	mv	a0,s2
ffffffffc0204c72:	399020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204c76:	07093783          	ld	a5,112(s2)
ffffffffc0204c7a:	7408                	ld	a0,40(s0)
ffffffffc0204c7c:	85a6                	mv	a1,s1
ffffffffc0204c7e:	6f9c                	ld	a5,24(a5)
ffffffffc0204c80:	9782                	jalr	a5
ffffffffc0204c82:	689c                	ld	a5,16(s1)
ffffffffc0204c84:	6c94                	ld	a3,24(s1)
ffffffffc0204c86:	4018                	lw	a4,0(s0)
ffffffffc0204c88:	84aa                	mv	s1,a0
ffffffffc0204c8a:	8f95                	sub	a5,a5,a3
ffffffffc0204c8c:	03370063          	beq	a4,s3,ffffffffc0204cac <file_read+0xb6>
ffffffffc0204c90:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204c94:	8522                	mv	a0,s0
ffffffffc0204c96:	c0fff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204c9a:	60a6                	ld	ra,72(sp)
ffffffffc0204c9c:	6406                	ld	s0,64(sp)
ffffffffc0204c9e:	7942                	ld	s2,48(sp)
ffffffffc0204ca0:	79a2                	ld	s3,40(sp)
ffffffffc0204ca2:	7a02                	ld	s4,32(sp)
ffffffffc0204ca4:	8526                	mv	a0,s1
ffffffffc0204ca6:	74e2                	ld	s1,56(sp)
ffffffffc0204ca8:	6161                	addi	sp,sp,80
ffffffffc0204caa:	8082                	ret
ffffffffc0204cac:	7018                	ld	a4,32(s0)
ffffffffc0204cae:	973e                	add	a4,a4,a5
ffffffffc0204cb0:	f018                	sd	a4,32(s0)
ffffffffc0204cb2:	bff9                	j	ffffffffc0204c90 <file_read+0x9a>
ffffffffc0204cb4:	54f5                	li	s1,-3
ffffffffc0204cb6:	b7d5                	j	ffffffffc0204c9a <file_read+0xa4>
ffffffffc0204cb8:	abbff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204cbc:	00008697          	auipc	a3,0x8
ffffffffc0204cc0:	49468693          	addi	a3,a3,1172 # ffffffffc020d150 <default_pmm_manager+0xd48>
ffffffffc0204cc4:	00007617          	auipc	a2,0x7
ffffffffc0204cc8:	c5c60613          	addi	a2,a2,-932 # ffffffffc020b920 <commands+0x210>
ffffffffc0204ccc:	0de00593          	li	a1,222
ffffffffc0204cd0:	00008517          	auipc	a0,0x8
ffffffffc0204cd4:	2f050513          	addi	a0,a0,752 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204cd8:	fc6fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204cdc <file_write>:
ffffffffc0204cdc:	715d                	addi	sp,sp,-80
ffffffffc0204cde:	e486                	sd	ra,72(sp)
ffffffffc0204ce0:	e0a2                	sd	s0,64(sp)
ffffffffc0204ce2:	fc26                	sd	s1,56(sp)
ffffffffc0204ce4:	f84a                	sd	s2,48(sp)
ffffffffc0204ce6:	f44e                	sd	s3,40(sp)
ffffffffc0204ce8:	f052                	sd	s4,32(sp)
ffffffffc0204cea:	0006b023          	sd	zero,0(a3)
ffffffffc0204cee:	04700793          	li	a5,71
ffffffffc0204cf2:	0aa7e463          	bltu	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204cf6:	00092797          	auipc	a5,0x92
ffffffffc0204cfa:	bca7b783          	ld	a5,-1078(a5) # ffffffffc02968c0 <current>
ffffffffc0204cfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204d02:	cfd1                	beqz	a5,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d04:	4b98                	lw	a4,16(a5)
ffffffffc0204d06:	08e05c63          	blez	a4,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d0a:	6780                	ld	s0,8(a5)
ffffffffc0204d0c:	00351793          	slli	a5,a0,0x3
ffffffffc0204d10:	8f89                	sub	a5,a5,a0
ffffffffc0204d12:	078e                	slli	a5,a5,0x3
ffffffffc0204d14:	943e                	add	s0,s0,a5
ffffffffc0204d16:	00042983          	lw	s3,0(s0)
ffffffffc0204d1a:	4789                	li	a5,2
ffffffffc0204d1c:	06f99f63          	bne	s3,a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d20:	4c1c                	lw	a5,24(s0)
ffffffffc0204d22:	06a79c63          	bne	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d26:	681c                	ld	a5,16(s0)
ffffffffc0204d28:	cbad                	beqz	a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d2a:	581c                	lw	a5,48(s0)
ffffffffc0204d2c:	8a36                	mv	s4,a3
ffffffffc0204d2e:	7014                	ld	a3,32(s0)
ffffffffc0204d30:	2785                	addiw	a5,a5,1
ffffffffc0204d32:	850a                	mv	a0,sp
ffffffffc0204d34:	d81c                	sw	a5,48(s0)
ffffffffc0204d36:	6ac000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204d3a:	02843903          	ld	s2,40(s0)
ffffffffc0204d3e:	84aa                	mv	s1,a0
ffffffffc0204d40:	06090163          	beqz	s2,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d44:	07093783          	ld	a5,112(s2)
ffffffffc0204d48:	cfa9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4a:	739c                	ld	a5,32(a5)
ffffffffc0204d4c:	cbb9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4e:	00008597          	auipc	a1,0x8
ffffffffc0204d52:	4aa58593          	addi	a1,a1,1194 # ffffffffc020d1f8 <default_pmm_manager+0xdf0>
ffffffffc0204d56:	854a                	mv	a0,s2
ffffffffc0204d58:	2b3020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204d5c:	07093783          	ld	a5,112(s2)
ffffffffc0204d60:	7408                	ld	a0,40(s0)
ffffffffc0204d62:	85a6                	mv	a1,s1
ffffffffc0204d64:	739c                	ld	a5,32(a5)
ffffffffc0204d66:	9782                	jalr	a5
ffffffffc0204d68:	689c                	ld	a5,16(s1)
ffffffffc0204d6a:	6c94                	ld	a3,24(s1)
ffffffffc0204d6c:	4018                	lw	a4,0(s0)
ffffffffc0204d6e:	84aa                	mv	s1,a0
ffffffffc0204d70:	8f95                	sub	a5,a5,a3
ffffffffc0204d72:	03370063          	beq	a4,s3,ffffffffc0204d92 <file_write+0xb6>
ffffffffc0204d76:	00fa3023          	sd	a5,0(s4)
ffffffffc0204d7a:	8522                	mv	a0,s0
ffffffffc0204d7c:	b29ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204d80:	60a6                	ld	ra,72(sp)
ffffffffc0204d82:	6406                	ld	s0,64(sp)
ffffffffc0204d84:	7942                	ld	s2,48(sp)
ffffffffc0204d86:	79a2                	ld	s3,40(sp)
ffffffffc0204d88:	7a02                	ld	s4,32(sp)
ffffffffc0204d8a:	8526                	mv	a0,s1
ffffffffc0204d8c:	74e2                	ld	s1,56(sp)
ffffffffc0204d8e:	6161                	addi	sp,sp,80
ffffffffc0204d90:	8082                	ret
ffffffffc0204d92:	7018                	ld	a4,32(s0)
ffffffffc0204d94:	973e                	add	a4,a4,a5
ffffffffc0204d96:	f018                	sd	a4,32(s0)
ffffffffc0204d98:	bff9                	j	ffffffffc0204d76 <file_write+0x9a>
ffffffffc0204d9a:	54f5                	li	s1,-3
ffffffffc0204d9c:	b7d5                	j	ffffffffc0204d80 <file_write+0xa4>
ffffffffc0204d9e:	9d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204da2:	00008697          	auipc	a3,0x8
ffffffffc0204da6:	40668693          	addi	a3,a3,1030 # ffffffffc020d1a8 <default_pmm_manager+0xda0>
ffffffffc0204daa:	00007617          	auipc	a2,0x7
ffffffffc0204dae:	b7660613          	addi	a2,a2,-1162 # ffffffffc020b920 <commands+0x210>
ffffffffc0204db2:	0f800593          	li	a1,248
ffffffffc0204db6:	00008517          	auipc	a0,0x8
ffffffffc0204dba:	20a50513          	addi	a0,a0,522 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204dbe:	ee0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204dc2 <file_seek>:
ffffffffc0204dc2:	7139                	addi	sp,sp,-64
ffffffffc0204dc4:	fc06                	sd	ra,56(sp)
ffffffffc0204dc6:	f822                	sd	s0,48(sp)
ffffffffc0204dc8:	f426                	sd	s1,40(sp)
ffffffffc0204dca:	f04a                	sd	s2,32(sp)
ffffffffc0204dcc:	04700793          	li	a5,71
ffffffffc0204dd0:	08a7e863          	bltu	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dd4:	00092797          	auipc	a5,0x92
ffffffffc0204dd8:	aec7b783          	ld	a5,-1300(a5) # ffffffffc02968c0 <current>
ffffffffc0204ddc:	1487b783          	ld	a5,328(a5)
ffffffffc0204de0:	cfdd                	beqz	a5,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de2:	4b98                	lw	a4,16(a5)
ffffffffc0204de4:	0ae05d63          	blez	a4,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de8:	6780                	ld	s0,8(a5)
ffffffffc0204dea:	00351793          	slli	a5,a0,0x3
ffffffffc0204dee:	8f89                	sub	a5,a5,a0
ffffffffc0204df0:	078e                	slli	a5,a5,0x3
ffffffffc0204df2:	943e                	add	s0,s0,a5
ffffffffc0204df4:	4018                	lw	a4,0(s0)
ffffffffc0204df6:	4789                	li	a5,2
ffffffffc0204df8:	06f71463          	bne	a4,a5,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dfc:	4c1c                	lw	a5,24(s0)
ffffffffc0204dfe:	06a79163          	bne	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204e02:	581c                	lw	a5,48(s0)
ffffffffc0204e04:	4685                	li	a3,1
ffffffffc0204e06:	892e                	mv	s2,a1
ffffffffc0204e08:	2785                	addiw	a5,a5,1
ffffffffc0204e0a:	d81c                	sw	a5,48(s0)
ffffffffc0204e0c:	02d60063          	beq	a2,a3,ffffffffc0204e2c <file_seek+0x6a>
ffffffffc0204e10:	06e60063          	beq	a2,a4,ffffffffc0204e70 <file_seek+0xae>
ffffffffc0204e14:	54f5                	li	s1,-3
ffffffffc0204e16:	ce11                	beqz	a2,ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e18:	8522                	mv	a0,s0
ffffffffc0204e1a:	a8bff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204e1e:	70e2                	ld	ra,56(sp)
ffffffffc0204e20:	7442                	ld	s0,48(sp)
ffffffffc0204e22:	7902                	ld	s2,32(sp)
ffffffffc0204e24:	8526                	mv	a0,s1
ffffffffc0204e26:	74a2                	ld	s1,40(sp)
ffffffffc0204e28:	6121                	addi	sp,sp,64
ffffffffc0204e2a:	8082                	ret
ffffffffc0204e2c:	701c                	ld	a5,32(s0)
ffffffffc0204e2e:	00f58933          	add	s2,a1,a5
ffffffffc0204e32:	7404                	ld	s1,40(s0)
ffffffffc0204e34:	c4bd                	beqz	s1,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e36:	78bc                	ld	a5,112(s1)
ffffffffc0204e38:	c7ad                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3a:	6fbc                	ld	a5,88(a5)
ffffffffc0204e3c:	c3bd                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3e:	8526                	mv	a0,s1
ffffffffc0204e40:	00008597          	auipc	a1,0x8
ffffffffc0204e44:	41058593          	addi	a1,a1,1040 # ffffffffc020d250 <default_pmm_manager+0xe48>
ffffffffc0204e48:	1c3020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204e4c:	78bc                	ld	a5,112(s1)
ffffffffc0204e4e:	7408                	ld	a0,40(s0)
ffffffffc0204e50:	85ca                	mv	a1,s2
ffffffffc0204e52:	6fbc                	ld	a5,88(a5)
ffffffffc0204e54:	9782                	jalr	a5
ffffffffc0204e56:	84aa                	mv	s1,a0
ffffffffc0204e58:	f161                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e5a:	03243023          	sd	s2,32(s0)
ffffffffc0204e5e:	bf6d                	j	ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e60:	70e2                	ld	ra,56(sp)
ffffffffc0204e62:	7442                	ld	s0,48(sp)
ffffffffc0204e64:	54f5                	li	s1,-3
ffffffffc0204e66:	7902                	ld	s2,32(sp)
ffffffffc0204e68:	8526                	mv	a0,s1
ffffffffc0204e6a:	74a2                	ld	s1,40(sp)
ffffffffc0204e6c:	6121                	addi	sp,sp,64
ffffffffc0204e6e:	8082                	ret
ffffffffc0204e70:	7404                	ld	s1,40(s0)
ffffffffc0204e72:	c8a1                	beqz	s1,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e74:	78bc                	ld	a5,112(s1)
ffffffffc0204e76:	c7b1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e78:	779c                	ld	a5,40(a5)
ffffffffc0204e7a:	c7a1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e7c:	8526                	mv	a0,s1
ffffffffc0204e7e:	00008597          	auipc	a1,0x8
ffffffffc0204e82:	2ca58593          	addi	a1,a1,714 # ffffffffc020d148 <default_pmm_manager+0xd40>
ffffffffc0204e86:	185020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204e8a:	78bc                	ld	a5,112(s1)
ffffffffc0204e8c:	7408                	ld	a0,40(s0)
ffffffffc0204e8e:	858a                	mv	a1,sp
ffffffffc0204e90:	779c                	ld	a5,40(a5)
ffffffffc0204e92:	9782                	jalr	a5
ffffffffc0204e94:	84aa                	mv	s1,a0
ffffffffc0204e96:	f149                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e98:	67e2                	ld	a5,24(sp)
ffffffffc0204e9a:	993e                	add	s2,s2,a5
ffffffffc0204e9c:	bf59                	j	ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e9e:	8d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204ea2:	00008697          	auipc	a3,0x8
ffffffffc0204ea6:	35e68693          	addi	a3,a3,862 # ffffffffc020d200 <default_pmm_manager+0xdf8>
ffffffffc0204eaa:	00007617          	auipc	a2,0x7
ffffffffc0204eae:	a7660613          	addi	a2,a2,-1418 # ffffffffc020b920 <commands+0x210>
ffffffffc0204eb2:	11a00593          	li	a1,282
ffffffffc0204eb6:	00008517          	auipc	a0,0x8
ffffffffc0204eba:	10a50513          	addi	a0,a0,266 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204ebe:	de0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ec2:	00008697          	auipc	a3,0x8
ffffffffc0204ec6:	23668693          	addi	a3,a3,566 # ffffffffc020d0f8 <default_pmm_manager+0xcf0>
ffffffffc0204eca:	00007617          	auipc	a2,0x7
ffffffffc0204ece:	a5660613          	addi	a2,a2,-1450 # ffffffffc020b920 <commands+0x210>
ffffffffc0204ed2:	11200593          	li	a1,274
ffffffffc0204ed6:	00008517          	auipc	a0,0x8
ffffffffc0204eda:	0ea50513          	addi	a0,a0,234 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204ede:	dc0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ee2 <file_fstat>:
ffffffffc0204ee2:	1101                	addi	sp,sp,-32
ffffffffc0204ee4:	ec06                	sd	ra,24(sp)
ffffffffc0204ee6:	e822                	sd	s0,16(sp)
ffffffffc0204ee8:	e426                	sd	s1,8(sp)
ffffffffc0204eea:	e04a                	sd	s2,0(sp)
ffffffffc0204eec:	04700793          	li	a5,71
ffffffffc0204ef0:	06a7ef63          	bltu	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204ef4:	00092797          	auipc	a5,0x92
ffffffffc0204ef8:	9cc7b783          	ld	a5,-1588(a5) # ffffffffc02968c0 <current>
ffffffffc0204efc:	1487b783          	ld	a5,328(a5)
ffffffffc0204f00:	cfd9                	beqz	a5,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f02:	4b98                	lw	a4,16(a5)
ffffffffc0204f04:	08e05d63          	blez	a4,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f08:	6780                	ld	s0,8(a5)
ffffffffc0204f0a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f0e:	8f89                	sub	a5,a5,a0
ffffffffc0204f10:	078e                	slli	a5,a5,0x3
ffffffffc0204f12:	943e                	add	s0,s0,a5
ffffffffc0204f14:	4018                	lw	a4,0(s0)
ffffffffc0204f16:	4789                	li	a5,2
ffffffffc0204f18:	04f71b63          	bne	a4,a5,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f1c:	4c1c                	lw	a5,24(s0)
ffffffffc0204f1e:	04a79863          	bne	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f22:	581c                	lw	a5,48(s0)
ffffffffc0204f24:	02843903          	ld	s2,40(s0)
ffffffffc0204f28:	2785                	addiw	a5,a5,1
ffffffffc0204f2a:	d81c                	sw	a5,48(s0)
ffffffffc0204f2c:	04090963          	beqz	s2,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f30:	07093783          	ld	a5,112(s2)
ffffffffc0204f34:	c7a9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f36:	779c                	ld	a5,40(a5)
ffffffffc0204f38:	c3b9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f3a:	84ae                	mv	s1,a1
ffffffffc0204f3c:	854a                	mv	a0,s2
ffffffffc0204f3e:	00008597          	auipc	a1,0x8
ffffffffc0204f42:	20a58593          	addi	a1,a1,522 # ffffffffc020d148 <default_pmm_manager+0xd40>
ffffffffc0204f46:	0c5020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0204f4a:	07093783          	ld	a5,112(s2)
ffffffffc0204f4e:	7408                	ld	a0,40(s0)
ffffffffc0204f50:	85a6                	mv	a1,s1
ffffffffc0204f52:	779c                	ld	a5,40(a5)
ffffffffc0204f54:	9782                	jalr	a5
ffffffffc0204f56:	87aa                	mv	a5,a0
ffffffffc0204f58:	8522                	mv	a0,s0
ffffffffc0204f5a:	843e                	mv	s0,a5
ffffffffc0204f5c:	949ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204f60:	60e2                	ld	ra,24(sp)
ffffffffc0204f62:	8522                	mv	a0,s0
ffffffffc0204f64:	6442                	ld	s0,16(sp)
ffffffffc0204f66:	64a2                	ld	s1,8(sp)
ffffffffc0204f68:	6902                	ld	s2,0(sp)
ffffffffc0204f6a:	6105                	addi	sp,sp,32
ffffffffc0204f6c:	8082                	ret
ffffffffc0204f6e:	5475                	li	s0,-3
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6902                	ld	s2,0(sp)
ffffffffc0204f7a:	6105                	addi	sp,sp,32
ffffffffc0204f7c:	8082                	ret
ffffffffc0204f7e:	00008697          	auipc	a3,0x8
ffffffffc0204f82:	17a68693          	addi	a3,a3,378 # ffffffffc020d0f8 <default_pmm_manager+0xcf0>
ffffffffc0204f86:	00007617          	auipc	a2,0x7
ffffffffc0204f8a:	99a60613          	addi	a2,a2,-1638 # ffffffffc020b920 <commands+0x210>
ffffffffc0204f8e:	12c00593          	li	a1,300
ffffffffc0204f92:	00008517          	auipc	a0,0x8
ffffffffc0204f96:	02e50513          	addi	a0,a0,46 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0204f9a:	d04fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204f9e:	fd4ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204fa2 <file_fsync>:
ffffffffc0204fa2:	1101                	addi	sp,sp,-32
ffffffffc0204fa4:	ec06                	sd	ra,24(sp)
ffffffffc0204fa6:	e822                	sd	s0,16(sp)
ffffffffc0204fa8:	e426                	sd	s1,8(sp)
ffffffffc0204faa:	04700793          	li	a5,71
ffffffffc0204fae:	06a7e863          	bltu	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fb2:	00092797          	auipc	a5,0x92
ffffffffc0204fb6:	90e7b783          	ld	a5,-1778(a5) # ffffffffc02968c0 <current>
ffffffffc0204fba:	1487b783          	ld	a5,328(a5)
ffffffffc0204fbe:	c7d9                	beqz	a5,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc0:	4b98                	lw	a4,16(a5)
ffffffffc0204fc2:	08e05563          	blez	a4,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc6:	6780                	ld	s0,8(a5)
ffffffffc0204fc8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fcc:	8f89                	sub	a5,a5,a0
ffffffffc0204fce:	078e                	slli	a5,a5,0x3
ffffffffc0204fd0:	943e                	add	s0,s0,a5
ffffffffc0204fd2:	4018                	lw	a4,0(s0)
ffffffffc0204fd4:	4789                	li	a5,2
ffffffffc0204fd6:	04f71463          	bne	a4,a5,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fda:	4c1c                	lw	a5,24(s0)
ffffffffc0204fdc:	04a79163          	bne	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fe0:	581c                	lw	a5,48(s0)
ffffffffc0204fe2:	7404                	ld	s1,40(s0)
ffffffffc0204fe4:	2785                	addiw	a5,a5,1
ffffffffc0204fe6:	d81c                	sw	a5,48(s0)
ffffffffc0204fe8:	c0b1                	beqz	s1,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fea:	78bc                	ld	a5,112(s1)
ffffffffc0204fec:	c3a1                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fee:	7b9c                	ld	a5,48(a5)
ffffffffc0204ff0:	cf95                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204ff2:	00008597          	auipc	a1,0x8
ffffffffc0204ff6:	2b658593          	addi	a1,a1,694 # ffffffffc020d2a8 <default_pmm_manager+0xea0>
ffffffffc0204ffa:	8526                	mv	a0,s1
ffffffffc0204ffc:	00f020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0205000:	78bc                	ld	a5,112(s1)
ffffffffc0205002:	7408                	ld	a0,40(s0)
ffffffffc0205004:	7b9c                	ld	a5,48(a5)
ffffffffc0205006:	9782                	jalr	a5
ffffffffc0205008:	87aa                	mv	a5,a0
ffffffffc020500a:	8522                	mv	a0,s0
ffffffffc020500c:	843e                	mv	s0,a5
ffffffffc020500e:	897ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0205012:	60e2                	ld	ra,24(sp)
ffffffffc0205014:	8522                	mv	a0,s0
ffffffffc0205016:	6442                	ld	s0,16(sp)
ffffffffc0205018:	64a2                	ld	s1,8(sp)
ffffffffc020501a:	6105                	addi	sp,sp,32
ffffffffc020501c:	8082                	ret
ffffffffc020501e:	5475                	li	s0,-3
ffffffffc0205020:	60e2                	ld	ra,24(sp)
ffffffffc0205022:	8522                	mv	a0,s0
ffffffffc0205024:	6442                	ld	s0,16(sp)
ffffffffc0205026:	64a2                	ld	s1,8(sp)
ffffffffc0205028:	6105                	addi	sp,sp,32
ffffffffc020502a:	8082                	ret
ffffffffc020502c:	00008697          	auipc	a3,0x8
ffffffffc0205030:	22c68693          	addi	a3,a3,556 # ffffffffc020d258 <default_pmm_manager+0xe50>
ffffffffc0205034:	00007617          	auipc	a2,0x7
ffffffffc0205038:	8ec60613          	addi	a2,a2,-1812 # ffffffffc020b920 <commands+0x210>
ffffffffc020503c:	13a00593          	li	a1,314
ffffffffc0205040:	00008517          	auipc	a0,0x8
ffffffffc0205044:	f8050513          	addi	a0,a0,-128 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc0205048:	c56fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020504c:	f26ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205050 <file_getdirentry>:
ffffffffc0205050:	715d                	addi	sp,sp,-80
ffffffffc0205052:	e486                	sd	ra,72(sp)
ffffffffc0205054:	e0a2                	sd	s0,64(sp)
ffffffffc0205056:	fc26                	sd	s1,56(sp)
ffffffffc0205058:	f84a                	sd	s2,48(sp)
ffffffffc020505a:	f44e                	sd	s3,40(sp)
ffffffffc020505c:	04700793          	li	a5,71
ffffffffc0205060:	0aa7e063          	bltu	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205064:	00092797          	auipc	a5,0x92
ffffffffc0205068:	85c7b783          	ld	a5,-1956(a5) # ffffffffc02968c0 <current>
ffffffffc020506c:	1487b783          	ld	a5,328(a5)
ffffffffc0205070:	c3e9                	beqz	a5,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205072:	4b98                	lw	a4,16(a5)
ffffffffc0205074:	0ae05f63          	blez	a4,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205078:	6780                	ld	s0,8(a5)
ffffffffc020507a:	00351793          	slli	a5,a0,0x3
ffffffffc020507e:	8f89                	sub	a5,a5,a0
ffffffffc0205080:	078e                	slli	a5,a5,0x3
ffffffffc0205082:	943e                	add	s0,s0,a5
ffffffffc0205084:	4018                	lw	a4,0(s0)
ffffffffc0205086:	4789                	li	a5,2
ffffffffc0205088:	06f71c63          	bne	a4,a5,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc020508c:	4c1c                	lw	a5,24(s0)
ffffffffc020508e:	06a79963          	bne	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205092:	581c                	lw	a5,48(s0)
ffffffffc0205094:	6194                	ld	a3,0(a1)
ffffffffc0205096:	84ae                	mv	s1,a1
ffffffffc0205098:	2785                	addiw	a5,a5,1
ffffffffc020509a:	10000613          	li	a2,256
ffffffffc020509e:	d81c                	sw	a5,48(s0)
ffffffffc02050a0:	05a1                	addi	a1,a1,8
ffffffffc02050a2:	850a                	mv	a0,sp
ffffffffc02050a4:	33e000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02050a8:	02843983          	ld	s3,40(s0)
ffffffffc02050ac:	892a                	mv	s2,a0
ffffffffc02050ae:	06098263          	beqz	s3,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b2:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc02050b6:	cfb1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b8:	63bc                	ld	a5,64(a5)
ffffffffc02050ba:	cfa1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050bc:	854e                	mv	a0,s3
ffffffffc02050be:	00008597          	auipc	a1,0x8
ffffffffc02050c2:	24a58593          	addi	a1,a1,586 # ffffffffc020d308 <default_pmm_manager+0xf00>
ffffffffc02050c6:	744020ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02050ca:	0709b783          	ld	a5,112(s3)
ffffffffc02050ce:	7408                	ld	a0,40(s0)
ffffffffc02050d0:	85ca                	mv	a1,s2
ffffffffc02050d2:	63bc                	ld	a5,64(a5)
ffffffffc02050d4:	9782                	jalr	a5
ffffffffc02050d6:	89aa                	mv	s3,a0
ffffffffc02050d8:	e909                	bnez	a0,ffffffffc02050ea <file_getdirentry+0x9a>
ffffffffc02050da:	609c                	ld	a5,0(s1)
ffffffffc02050dc:	01093683          	ld	a3,16(s2)
ffffffffc02050e0:	01893703          	ld	a4,24(s2)
ffffffffc02050e4:	97b6                	add	a5,a5,a3
ffffffffc02050e6:	8f99                	sub	a5,a5,a4
ffffffffc02050e8:	e09c                	sd	a5,0(s1)
ffffffffc02050ea:	8522                	mv	a0,s0
ffffffffc02050ec:	fb8ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc02050f0:	60a6                	ld	ra,72(sp)
ffffffffc02050f2:	6406                	ld	s0,64(sp)
ffffffffc02050f4:	74e2                	ld	s1,56(sp)
ffffffffc02050f6:	7942                	ld	s2,48(sp)
ffffffffc02050f8:	854e                	mv	a0,s3
ffffffffc02050fa:	79a2                	ld	s3,40(sp)
ffffffffc02050fc:	6161                	addi	sp,sp,80
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	60a6                	ld	ra,72(sp)
ffffffffc0205102:	6406                	ld	s0,64(sp)
ffffffffc0205104:	59f5                	li	s3,-3
ffffffffc0205106:	74e2                	ld	s1,56(sp)
ffffffffc0205108:	7942                	ld	s2,48(sp)
ffffffffc020510a:	854e                	mv	a0,s3
ffffffffc020510c:	79a2                	ld	s3,40(sp)
ffffffffc020510e:	6161                	addi	sp,sp,80
ffffffffc0205110:	8082                	ret
ffffffffc0205112:	00008697          	auipc	a3,0x8
ffffffffc0205116:	19e68693          	addi	a3,a3,414 # ffffffffc020d2b0 <default_pmm_manager+0xea8>
ffffffffc020511a:	00007617          	auipc	a2,0x7
ffffffffc020511e:	80660613          	addi	a2,a2,-2042 # ffffffffc020b920 <commands+0x210>
ffffffffc0205122:	14a00593          	li	a1,330
ffffffffc0205126:	00008517          	auipc	a0,0x8
ffffffffc020512a:	e9a50513          	addi	a0,a0,-358 # ffffffffc020cfc0 <default_pmm_manager+0xbb8>
ffffffffc020512e:	b70fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205132:	e40ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205136 <file_dup>:
ffffffffc0205136:	04700713          	li	a4,71
ffffffffc020513a:	06a76463          	bltu	a4,a0,ffffffffc02051a2 <file_dup+0x6c>
ffffffffc020513e:	00091717          	auipc	a4,0x91
ffffffffc0205142:	78273703          	ld	a4,1922(a4) # ffffffffc02968c0 <current>
ffffffffc0205146:	14873703          	ld	a4,328(a4)
ffffffffc020514a:	1101                	addi	sp,sp,-32
ffffffffc020514c:	ec06                	sd	ra,24(sp)
ffffffffc020514e:	e822                	sd	s0,16(sp)
ffffffffc0205150:	cb39                	beqz	a4,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205152:	4b14                	lw	a3,16(a4)
ffffffffc0205154:	04d05963          	blez	a3,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205158:	6700                	ld	s0,8(a4)
ffffffffc020515a:	00351713          	slli	a4,a0,0x3
ffffffffc020515e:	8f09                	sub	a4,a4,a0
ffffffffc0205160:	070e                	slli	a4,a4,0x3
ffffffffc0205162:	943a                	add	s0,s0,a4
ffffffffc0205164:	4014                	lw	a3,0(s0)
ffffffffc0205166:	4709                	li	a4,2
ffffffffc0205168:	02e69863          	bne	a3,a4,ffffffffc0205198 <file_dup+0x62>
ffffffffc020516c:	4c18                	lw	a4,24(s0)
ffffffffc020516e:	02a71563          	bne	a4,a0,ffffffffc0205198 <file_dup+0x62>
ffffffffc0205172:	852e                	mv	a0,a1
ffffffffc0205174:	002c                	addi	a1,sp,8
ffffffffc0205176:	e1eff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc020517a:	c509                	beqz	a0,ffffffffc0205184 <file_dup+0x4e>
ffffffffc020517c:	60e2                	ld	ra,24(sp)
ffffffffc020517e:	6442                	ld	s0,16(sp)
ffffffffc0205180:	6105                	addi	sp,sp,32
ffffffffc0205182:	8082                	ret
ffffffffc0205184:	6522                	ld	a0,8(sp)
ffffffffc0205186:	85a2                	mv	a1,s0
ffffffffc0205188:	845ff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc020518c:	67a2                	ld	a5,8(sp)
ffffffffc020518e:	60e2                	ld	ra,24(sp)
ffffffffc0205190:	6442                	ld	s0,16(sp)
ffffffffc0205192:	4f88                	lw	a0,24(a5)
ffffffffc0205194:	6105                	addi	sp,sp,32
ffffffffc0205196:	8082                	ret
ffffffffc0205198:	60e2                	ld	ra,24(sp)
ffffffffc020519a:	6442                	ld	s0,16(sp)
ffffffffc020519c:	5575                	li	a0,-3
ffffffffc020519e:	6105                	addi	sp,sp,32
ffffffffc02051a0:	8082                	ret
ffffffffc02051a2:	5575                	li	a0,-3
ffffffffc02051a4:	8082                	ret
ffffffffc02051a6:	dccff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc02051aa <fs_init>:
ffffffffc02051aa:	1141                	addi	sp,sp,-16
ffffffffc02051ac:	e406                	sd	ra,8(sp)
ffffffffc02051ae:	07b020ef          	jal	ra,ffffffffc0207a28 <vfs_init>
ffffffffc02051b2:	552030ef          	jal	ra,ffffffffc0208704 <dev_init>
ffffffffc02051b6:	60a2                	ld	ra,8(sp)
ffffffffc02051b8:	0141                	addi	sp,sp,16
ffffffffc02051ba:	6a30306f          	j	ffffffffc020905c <sfs_init>

ffffffffc02051be <fs_cleanup>:
ffffffffc02051be:	2bd0206f          	j	ffffffffc0207c7a <vfs_cleanup>

ffffffffc02051c2 <lock_files>:
ffffffffc02051c2:	0561                	addi	a0,a0,24
ffffffffc02051c4:	ba0ff06f          	j	ffffffffc0204564 <down>

ffffffffc02051c8 <unlock_files>:
ffffffffc02051c8:	0561                	addi	a0,a0,24
ffffffffc02051ca:	b96ff06f          	j	ffffffffc0204560 <up>

ffffffffc02051ce <files_create>:
ffffffffc02051ce:	1141                	addi	sp,sp,-16
ffffffffc02051d0:	6505                	lui	a0,0x1
ffffffffc02051d2:	e022                	sd	s0,0(sp)
ffffffffc02051d4:	e406                	sd	ra,8(sp)
ffffffffc02051d6:	db9fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02051da:	842a                	mv	s0,a0
ffffffffc02051dc:	cd19                	beqz	a0,ffffffffc02051fa <files_create+0x2c>
ffffffffc02051de:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02051e2:	00043023          	sd	zero,0(s0)
ffffffffc02051e6:	0561                	addi	a0,a0,24
ffffffffc02051e8:	e41c                	sd	a5,8(s0)
ffffffffc02051ea:	00042823          	sw	zero,16(s0)
ffffffffc02051ee:	4585                	li	a1,1
ffffffffc02051f0:	b6aff0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02051f4:	6408                	ld	a0,8(s0)
ffffffffc02051f6:	f3cff0ef          	jal	ra,ffffffffc0204932 <fd_array_init>
ffffffffc02051fa:	60a2                	ld	ra,8(sp)
ffffffffc02051fc:	8522                	mv	a0,s0
ffffffffc02051fe:	6402                	ld	s0,0(sp)
ffffffffc0205200:	0141                	addi	sp,sp,16
ffffffffc0205202:	8082                	ret

ffffffffc0205204 <files_destroy>:
ffffffffc0205204:	7179                	addi	sp,sp,-48
ffffffffc0205206:	f406                	sd	ra,40(sp)
ffffffffc0205208:	f022                	sd	s0,32(sp)
ffffffffc020520a:	ec26                	sd	s1,24(sp)
ffffffffc020520c:	e84a                	sd	s2,16(sp)
ffffffffc020520e:	e44e                	sd	s3,8(sp)
ffffffffc0205210:	c52d                	beqz	a0,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205212:	491c                	lw	a5,16(a0)
ffffffffc0205214:	89aa                	mv	s3,a0
ffffffffc0205216:	e3b5                	bnez	a5,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205218:	6108                	ld	a0,0(a0)
ffffffffc020521a:	c119                	beqz	a0,ffffffffc0205220 <files_destroy+0x1c>
ffffffffc020521c:	6a4020ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc0205220:	0089b403          	ld	s0,8(s3)
ffffffffc0205224:	6485                	lui	s1,0x1
ffffffffc0205226:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020522a:	94a2                	add	s1,s1,s0
ffffffffc020522c:	4909                	li	s2,2
ffffffffc020522e:	401c                	lw	a5,0(s0)
ffffffffc0205230:	03278063          	beq	a5,s2,ffffffffc0205250 <files_destroy+0x4c>
ffffffffc0205234:	e39d                	bnez	a5,ffffffffc020525a <files_destroy+0x56>
ffffffffc0205236:	03840413          	addi	s0,s0,56
ffffffffc020523a:	fe849ae3          	bne	s1,s0,ffffffffc020522e <files_destroy+0x2a>
ffffffffc020523e:	7402                	ld	s0,32(sp)
ffffffffc0205240:	70a2                	ld	ra,40(sp)
ffffffffc0205242:	64e2                	ld	s1,24(sp)
ffffffffc0205244:	6942                	ld	s2,16(sp)
ffffffffc0205246:	854e                	mv	a0,s3
ffffffffc0205248:	69a2                	ld	s3,8(sp)
ffffffffc020524a:	6145                	addi	sp,sp,48
ffffffffc020524c:	df3fc06f          	j	ffffffffc020203e <kfree>
ffffffffc0205250:	8522                	mv	a0,s0
ffffffffc0205252:	efcff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0205256:	401c                	lw	a5,0(s0)
ffffffffc0205258:	bff1                	j	ffffffffc0205234 <files_destroy+0x30>
ffffffffc020525a:	00008697          	auipc	a3,0x8
ffffffffc020525e:	12e68693          	addi	a3,a3,302 # ffffffffc020d388 <CSWTCH.79+0x58>
ffffffffc0205262:	00006617          	auipc	a2,0x6
ffffffffc0205266:	6be60613          	addi	a2,a2,1726 # ffffffffc020b920 <commands+0x210>
ffffffffc020526a:	03d00593          	li	a1,61
ffffffffc020526e:	00008517          	auipc	a0,0x8
ffffffffc0205272:	10a50513          	addi	a0,a0,266 # ffffffffc020d378 <CSWTCH.79+0x48>
ffffffffc0205276:	a28fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020527a:	00008697          	auipc	a3,0x8
ffffffffc020527e:	0ce68693          	addi	a3,a3,206 # ffffffffc020d348 <CSWTCH.79+0x18>
ffffffffc0205282:	00006617          	auipc	a2,0x6
ffffffffc0205286:	69e60613          	addi	a2,a2,1694 # ffffffffc020b920 <commands+0x210>
ffffffffc020528a:	03300593          	li	a1,51
ffffffffc020528e:	00008517          	auipc	a0,0x8
ffffffffc0205292:	0ea50513          	addi	a0,a0,234 # ffffffffc020d378 <CSWTCH.79+0x48>
ffffffffc0205296:	a08fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020529a <files_closeall>:
ffffffffc020529a:	1101                	addi	sp,sp,-32
ffffffffc020529c:	ec06                	sd	ra,24(sp)
ffffffffc020529e:	e822                	sd	s0,16(sp)
ffffffffc02052a0:	e426                	sd	s1,8(sp)
ffffffffc02052a2:	e04a                	sd	s2,0(sp)
ffffffffc02052a4:	c129                	beqz	a0,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052a6:	491c                	lw	a5,16(a0)
ffffffffc02052a8:	02f05f63          	blez	a5,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052ac:	6504                	ld	s1,8(a0)
ffffffffc02052ae:	6785                	lui	a5,0x1
ffffffffc02052b0:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052b4:	07048413          	addi	s0,s1,112
ffffffffc02052b8:	4909                	li	s2,2
ffffffffc02052ba:	94be                	add	s1,s1,a5
ffffffffc02052bc:	a029                	j	ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052be:	03840413          	addi	s0,s0,56
ffffffffc02052c2:	00848c63          	beq	s1,s0,ffffffffc02052da <files_closeall+0x40>
ffffffffc02052c6:	401c                	lw	a5,0(s0)
ffffffffc02052c8:	ff279be3          	bne	a5,s2,ffffffffc02052be <files_closeall+0x24>
ffffffffc02052cc:	8522                	mv	a0,s0
ffffffffc02052ce:	03840413          	addi	s0,s0,56
ffffffffc02052d2:	e7cff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc02052d6:	fe8498e3          	bne	s1,s0,ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052da:	60e2                	ld	ra,24(sp)
ffffffffc02052dc:	6442                	ld	s0,16(sp)
ffffffffc02052de:	64a2                	ld	s1,8(sp)
ffffffffc02052e0:	6902                	ld	s2,0(sp)
ffffffffc02052e2:	6105                	addi	sp,sp,32
ffffffffc02052e4:	8082                	ret
ffffffffc02052e6:	00008697          	auipc	a3,0x8
ffffffffc02052ea:	caa68693          	addi	a3,a3,-854 # ffffffffc020cf90 <default_pmm_manager+0xb88>
ffffffffc02052ee:	00006617          	auipc	a2,0x6
ffffffffc02052f2:	63260613          	addi	a2,a2,1586 # ffffffffc020b920 <commands+0x210>
ffffffffc02052f6:	04500593          	li	a1,69
ffffffffc02052fa:	00008517          	auipc	a0,0x8
ffffffffc02052fe:	07e50513          	addi	a0,a0,126 # ffffffffc020d378 <CSWTCH.79+0x48>
ffffffffc0205302:	99cfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205306 <dup_files>:
ffffffffc0205306:	7179                	addi	sp,sp,-48
ffffffffc0205308:	f406                	sd	ra,40(sp)
ffffffffc020530a:	f022                	sd	s0,32(sp)
ffffffffc020530c:	ec26                	sd	s1,24(sp)
ffffffffc020530e:	e84a                	sd	s2,16(sp)
ffffffffc0205310:	e44e                	sd	s3,8(sp)
ffffffffc0205312:	e052                	sd	s4,0(sp)
ffffffffc0205314:	c52d                	beqz	a0,ffffffffc020537e <dup_files+0x78>
ffffffffc0205316:	842e                	mv	s0,a1
ffffffffc0205318:	c1bd                	beqz	a1,ffffffffc020537e <dup_files+0x78>
ffffffffc020531a:	491c                	lw	a5,16(a0)
ffffffffc020531c:	84aa                	mv	s1,a0
ffffffffc020531e:	e3c1                	bnez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205320:	499c                	lw	a5,16(a1)
ffffffffc0205322:	06f05e63          	blez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205326:	6188                	ld	a0,0(a1)
ffffffffc0205328:	e088                	sd	a0,0(s1)
ffffffffc020532a:	c119                	beqz	a0,ffffffffc0205330 <dup_files+0x2a>
ffffffffc020532c:	4c6020ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc0205330:	6400                	ld	s0,8(s0)
ffffffffc0205332:	6905                	lui	s2,0x1
ffffffffc0205334:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205338:	6484                	ld	s1,8(s1)
ffffffffc020533a:	9922                	add	s2,s2,s0
ffffffffc020533c:	4989                	li	s3,2
ffffffffc020533e:	4a05                	li	s4,1
ffffffffc0205340:	a039                	j	ffffffffc020534e <dup_files+0x48>
ffffffffc0205342:	03840413          	addi	s0,s0,56
ffffffffc0205346:	03848493          	addi	s1,s1,56
ffffffffc020534a:	02890163          	beq	s2,s0,ffffffffc020536c <dup_files+0x66>
ffffffffc020534e:	401c                	lw	a5,0(s0)
ffffffffc0205350:	ff3799e3          	bne	a5,s3,ffffffffc0205342 <dup_files+0x3c>
ffffffffc0205354:	0144a023          	sw	s4,0(s1)
ffffffffc0205358:	85a2                	mv	a1,s0
ffffffffc020535a:	8526                	mv	a0,s1
ffffffffc020535c:	03840413          	addi	s0,s0,56
ffffffffc0205360:	e6cff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc0205364:	03848493          	addi	s1,s1,56
ffffffffc0205368:	fe8913e3          	bne	s2,s0,ffffffffc020534e <dup_files+0x48>
ffffffffc020536c:	70a2                	ld	ra,40(sp)
ffffffffc020536e:	7402                	ld	s0,32(sp)
ffffffffc0205370:	64e2                	ld	s1,24(sp)
ffffffffc0205372:	6942                	ld	s2,16(sp)
ffffffffc0205374:	69a2                	ld	s3,8(sp)
ffffffffc0205376:	6a02                	ld	s4,0(sp)
ffffffffc0205378:	4501                	li	a0,0
ffffffffc020537a:	6145                	addi	sp,sp,48
ffffffffc020537c:	8082                	ret
ffffffffc020537e:	00008697          	auipc	a3,0x8
ffffffffc0205382:	96268693          	addi	a3,a3,-1694 # ffffffffc020cce0 <default_pmm_manager+0x8d8>
ffffffffc0205386:	00006617          	auipc	a2,0x6
ffffffffc020538a:	59a60613          	addi	a2,a2,1434 # ffffffffc020b920 <commands+0x210>
ffffffffc020538e:	05300593          	li	a1,83
ffffffffc0205392:	00008517          	auipc	a0,0x8
ffffffffc0205396:	fe650513          	addi	a0,a0,-26 # ffffffffc020d378 <CSWTCH.79+0x48>
ffffffffc020539a:	904fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020539e:	00008697          	auipc	a3,0x8
ffffffffc02053a2:	00268693          	addi	a3,a3,2 # ffffffffc020d3a0 <CSWTCH.79+0x70>
ffffffffc02053a6:	00006617          	auipc	a2,0x6
ffffffffc02053aa:	57a60613          	addi	a2,a2,1402 # ffffffffc020b920 <commands+0x210>
ffffffffc02053ae:	05400593          	li	a1,84
ffffffffc02053b2:	00008517          	auipc	a0,0x8
ffffffffc02053b6:	fc650513          	addi	a0,a0,-58 # ffffffffc020d378 <CSWTCH.79+0x48>
ffffffffc02053ba:	8e4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053be <iobuf_skip.part.0>:
ffffffffc02053be:	1141                	addi	sp,sp,-16
ffffffffc02053c0:	00008697          	auipc	a3,0x8
ffffffffc02053c4:	01068693          	addi	a3,a3,16 # ffffffffc020d3d0 <CSWTCH.79+0xa0>
ffffffffc02053c8:	00006617          	auipc	a2,0x6
ffffffffc02053cc:	55860613          	addi	a2,a2,1368 # ffffffffc020b920 <commands+0x210>
ffffffffc02053d0:	04a00593          	li	a1,74
ffffffffc02053d4:	00008517          	auipc	a0,0x8
ffffffffc02053d8:	01450513          	addi	a0,a0,20 # ffffffffc020d3e8 <CSWTCH.79+0xb8>
ffffffffc02053dc:	e406                	sd	ra,8(sp)
ffffffffc02053de:	8c0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053e2 <iobuf_init>:
ffffffffc02053e2:	e10c                	sd	a1,0(a0)
ffffffffc02053e4:	e514                	sd	a3,8(a0)
ffffffffc02053e6:	ed10                	sd	a2,24(a0)
ffffffffc02053e8:	e910                	sd	a2,16(a0)
ffffffffc02053ea:	8082                	ret

ffffffffc02053ec <iobuf_move>:
ffffffffc02053ec:	7179                	addi	sp,sp,-48
ffffffffc02053ee:	ec26                	sd	s1,24(sp)
ffffffffc02053f0:	6d04                	ld	s1,24(a0)
ffffffffc02053f2:	f022                	sd	s0,32(sp)
ffffffffc02053f4:	e84a                	sd	s2,16(sp)
ffffffffc02053f6:	e44e                	sd	s3,8(sp)
ffffffffc02053f8:	f406                	sd	ra,40(sp)
ffffffffc02053fa:	842a                	mv	s0,a0
ffffffffc02053fc:	8932                	mv	s2,a2
ffffffffc02053fe:	852e                	mv	a0,a1
ffffffffc0205400:	89ba                	mv	s3,a4
ffffffffc0205402:	00967363          	bgeu	a2,s1,ffffffffc0205408 <iobuf_move+0x1c>
ffffffffc0205406:	84b2                	mv	s1,a2
ffffffffc0205408:	c495                	beqz	s1,ffffffffc0205434 <iobuf_move+0x48>
ffffffffc020540a:	600c                	ld	a1,0(s0)
ffffffffc020540c:	c681                	beqz	a3,ffffffffc0205414 <iobuf_move+0x28>
ffffffffc020540e:	87ae                	mv	a5,a1
ffffffffc0205410:	85aa                	mv	a1,a0
ffffffffc0205412:	853e                	mv	a0,a5
ffffffffc0205414:	8626                	mv	a2,s1
ffffffffc0205416:	038060ef          	jal	ra,ffffffffc020b44e <memmove>
ffffffffc020541a:	6c1c                	ld	a5,24(s0)
ffffffffc020541c:	0297ea63          	bltu	a5,s1,ffffffffc0205450 <iobuf_move+0x64>
ffffffffc0205420:	6014                	ld	a3,0(s0)
ffffffffc0205422:	6418                	ld	a4,8(s0)
ffffffffc0205424:	8f85                	sub	a5,a5,s1
ffffffffc0205426:	96a6                	add	a3,a3,s1
ffffffffc0205428:	9726                	add	a4,a4,s1
ffffffffc020542a:	e014                	sd	a3,0(s0)
ffffffffc020542c:	e418                	sd	a4,8(s0)
ffffffffc020542e:	ec1c                	sd	a5,24(s0)
ffffffffc0205430:	40990933          	sub	s2,s2,s1
ffffffffc0205434:	00098463          	beqz	s3,ffffffffc020543c <iobuf_move+0x50>
ffffffffc0205438:	0099b023          	sd	s1,0(s3)
ffffffffc020543c:	4501                	li	a0,0
ffffffffc020543e:	00091b63          	bnez	s2,ffffffffc0205454 <iobuf_move+0x68>
ffffffffc0205442:	70a2                	ld	ra,40(sp)
ffffffffc0205444:	7402                	ld	s0,32(sp)
ffffffffc0205446:	64e2                	ld	s1,24(sp)
ffffffffc0205448:	6942                	ld	s2,16(sp)
ffffffffc020544a:	69a2                	ld	s3,8(sp)
ffffffffc020544c:	6145                	addi	sp,sp,48
ffffffffc020544e:	8082                	ret
ffffffffc0205450:	f6fff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>
ffffffffc0205454:	5571                	li	a0,-4
ffffffffc0205456:	b7f5                	j	ffffffffc0205442 <iobuf_move+0x56>

ffffffffc0205458 <iobuf_skip>:
ffffffffc0205458:	6d1c                	ld	a5,24(a0)
ffffffffc020545a:	00b7eb63          	bltu	a5,a1,ffffffffc0205470 <iobuf_skip+0x18>
ffffffffc020545e:	6114                	ld	a3,0(a0)
ffffffffc0205460:	6518                	ld	a4,8(a0)
ffffffffc0205462:	8f8d                	sub	a5,a5,a1
ffffffffc0205464:	96ae                	add	a3,a3,a1
ffffffffc0205466:	95ba                	add	a1,a1,a4
ffffffffc0205468:	e114                	sd	a3,0(a0)
ffffffffc020546a:	e50c                	sd	a1,8(a0)
ffffffffc020546c:	ed1c                	sd	a5,24(a0)
ffffffffc020546e:	8082                	ret
ffffffffc0205470:	1141                	addi	sp,sp,-16
ffffffffc0205472:	e406                	sd	ra,8(sp)
ffffffffc0205474:	f4bff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>

ffffffffc0205478 <copy_path>:
ffffffffc0205478:	7139                	addi	sp,sp,-64
ffffffffc020547a:	f04a                	sd	s2,32(sp)
ffffffffc020547c:	00091917          	auipc	s2,0x91
ffffffffc0205480:	44490913          	addi	s2,s2,1092 # ffffffffc02968c0 <current>
ffffffffc0205484:	00093703          	ld	a4,0(s2)
ffffffffc0205488:	ec4e                	sd	s3,24(sp)
ffffffffc020548a:	89aa                	mv	s3,a0
ffffffffc020548c:	6505                	lui	a0,0x1
ffffffffc020548e:	f426                	sd	s1,40(sp)
ffffffffc0205490:	e852                	sd	s4,16(sp)
ffffffffc0205492:	fc06                	sd	ra,56(sp)
ffffffffc0205494:	f822                	sd	s0,48(sp)
ffffffffc0205496:	e456                	sd	s5,8(sp)
ffffffffc0205498:	02873a03          	ld	s4,40(a4)
ffffffffc020549c:	84ae                	mv	s1,a1
ffffffffc020549e:	af1fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02054a2:	c141                	beqz	a0,ffffffffc0205522 <copy_path+0xaa>
ffffffffc02054a4:	842a                	mv	s0,a0
ffffffffc02054a6:	040a0563          	beqz	s4,ffffffffc02054f0 <copy_path+0x78>
ffffffffc02054aa:	038a0a93          	addi	s5,s4,56
ffffffffc02054ae:	8556                	mv	a0,s5
ffffffffc02054b0:	8b4ff0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02054b4:	00093783          	ld	a5,0(s2)
ffffffffc02054b8:	cba1                	beqz	a5,ffffffffc0205508 <copy_path+0x90>
ffffffffc02054ba:	43dc                	lw	a5,4(a5)
ffffffffc02054bc:	6685                	lui	a3,0x1
ffffffffc02054be:	8626                	mv	a2,s1
ffffffffc02054c0:	04fa2823          	sw	a5,80(s4)
ffffffffc02054c4:	85a2                	mv	a1,s0
ffffffffc02054c6:	8552                	mv	a0,s4
ffffffffc02054c8:	ec5fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054cc:	c529                	beqz	a0,ffffffffc0205516 <copy_path+0x9e>
ffffffffc02054ce:	8556                	mv	a0,s5
ffffffffc02054d0:	890ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02054d4:	040a2823          	sw	zero,80(s4)
ffffffffc02054d8:	0089b023          	sd	s0,0(s3)
ffffffffc02054dc:	4501                	li	a0,0
ffffffffc02054de:	70e2                	ld	ra,56(sp)
ffffffffc02054e0:	7442                	ld	s0,48(sp)
ffffffffc02054e2:	74a2                	ld	s1,40(sp)
ffffffffc02054e4:	7902                	ld	s2,32(sp)
ffffffffc02054e6:	69e2                	ld	s3,24(sp)
ffffffffc02054e8:	6a42                	ld	s4,16(sp)
ffffffffc02054ea:	6aa2                	ld	s5,8(sp)
ffffffffc02054ec:	6121                	addi	sp,sp,64
ffffffffc02054ee:	8082                	ret
ffffffffc02054f0:	85aa                	mv	a1,a0
ffffffffc02054f2:	6685                	lui	a3,0x1
ffffffffc02054f4:	8626                	mv	a2,s1
ffffffffc02054f6:	4501                	li	a0,0
ffffffffc02054f8:	e95fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054fc:	fd71                	bnez	a0,ffffffffc02054d8 <copy_path+0x60>
ffffffffc02054fe:	8522                	mv	a0,s0
ffffffffc0205500:	b3ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205504:	5575                	li	a0,-3
ffffffffc0205506:	bfe1                	j	ffffffffc02054de <copy_path+0x66>
ffffffffc0205508:	6685                	lui	a3,0x1
ffffffffc020550a:	8626                	mv	a2,s1
ffffffffc020550c:	85a2                	mv	a1,s0
ffffffffc020550e:	8552                	mv	a0,s4
ffffffffc0205510:	e7dfe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0205514:	fd4d                	bnez	a0,ffffffffc02054ce <copy_path+0x56>
ffffffffc0205516:	8556                	mv	a0,s5
ffffffffc0205518:	848ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020551c:	040a2823          	sw	zero,80(s4)
ffffffffc0205520:	bff9                	j	ffffffffc02054fe <copy_path+0x86>
ffffffffc0205522:	5571                	li	a0,-4
ffffffffc0205524:	bf6d                	j	ffffffffc02054de <copy_path+0x66>

ffffffffc0205526 <sysfile_open>:
ffffffffc0205526:	7179                	addi	sp,sp,-48
ffffffffc0205528:	872a                	mv	a4,a0
ffffffffc020552a:	ec26                	sd	s1,24(sp)
ffffffffc020552c:	0028                	addi	a0,sp,8
ffffffffc020552e:	84ae                	mv	s1,a1
ffffffffc0205530:	85ba                	mv	a1,a4
ffffffffc0205532:	f022                	sd	s0,32(sp)
ffffffffc0205534:	f406                	sd	ra,40(sp)
ffffffffc0205536:	f43ff0ef          	jal	ra,ffffffffc0205478 <copy_path>
ffffffffc020553a:	842a                	mv	s0,a0
ffffffffc020553c:	e909                	bnez	a0,ffffffffc020554e <sysfile_open+0x28>
ffffffffc020553e:	6522                	ld	a0,8(sp)
ffffffffc0205540:	85a6                	mv	a1,s1
ffffffffc0205542:	d60ff0ef          	jal	ra,ffffffffc0204aa2 <file_open>
ffffffffc0205546:	842a                	mv	s0,a0
ffffffffc0205548:	6522                	ld	a0,8(sp)
ffffffffc020554a:	af5fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020554e:	70a2                	ld	ra,40(sp)
ffffffffc0205550:	8522                	mv	a0,s0
ffffffffc0205552:	7402                	ld	s0,32(sp)
ffffffffc0205554:	64e2                	ld	s1,24(sp)
ffffffffc0205556:	6145                	addi	sp,sp,48
ffffffffc0205558:	8082                	ret

ffffffffc020555a <sysfile_close>:
ffffffffc020555a:	e46ff06f          	j	ffffffffc0204ba0 <file_close>

ffffffffc020555e <sysfile_read>:
ffffffffc020555e:	7159                	addi	sp,sp,-112
ffffffffc0205560:	f0a2                	sd	s0,96(sp)
ffffffffc0205562:	f486                	sd	ra,104(sp)
ffffffffc0205564:	eca6                	sd	s1,88(sp)
ffffffffc0205566:	e8ca                	sd	s2,80(sp)
ffffffffc0205568:	e4ce                	sd	s3,72(sp)
ffffffffc020556a:	e0d2                	sd	s4,64(sp)
ffffffffc020556c:	fc56                	sd	s5,56(sp)
ffffffffc020556e:	f85a                	sd	s6,48(sp)
ffffffffc0205570:	f45e                	sd	s7,40(sp)
ffffffffc0205572:	f062                	sd	s8,32(sp)
ffffffffc0205574:	ec66                	sd	s9,24(sp)
ffffffffc0205576:	4401                	li	s0,0
ffffffffc0205578:	ee19                	bnez	a2,ffffffffc0205596 <sysfile_read+0x38>
ffffffffc020557a:	70a6                	ld	ra,104(sp)
ffffffffc020557c:	8522                	mv	a0,s0
ffffffffc020557e:	7406                	ld	s0,96(sp)
ffffffffc0205580:	64e6                	ld	s1,88(sp)
ffffffffc0205582:	6946                	ld	s2,80(sp)
ffffffffc0205584:	69a6                	ld	s3,72(sp)
ffffffffc0205586:	6a06                	ld	s4,64(sp)
ffffffffc0205588:	7ae2                	ld	s5,56(sp)
ffffffffc020558a:	7b42                	ld	s6,48(sp)
ffffffffc020558c:	7ba2                	ld	s7,40(sp)
ffffffffc020558e:	7c02                	ld	s8,32(sp)
ffffffffc0205590:	6ce2                	ld	s9,24(sp)
ffffffffc0205592:	6165                	addi	sp,sp,112
ffffffffc0205594:	8082                	ret
ffffffffc0205596:	00091c97          	auipc	s9,0x91
ffffffffc020559a:	32ac8c93          	addi	s9,s9,810 # ffffffffc02968c0 <current>
ffffffffc020559e:	000cb783          	ld	a5,0(s9)
ffffffffc02055a2:	84b2                	mv	s1,a2
ffffffffc02055a4:	8b2e                	mv	s6,a1
ffffffffc02055a6:	4601                	li	a2,0
ffffffffc02055a8:	4585                	li	a1,1
ffffffffc02055aa:	0287b903          	ld	s2,40(a5)
ffffffffc02055ae:	8aaa                	mv	s5,a0
ffffffffc02055b0:	c9eff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02055b4:	c959                	beqz	a0,ffffffffc020564a <sysfile_read+0xec>
ffffffffc02055b6:	6505                	lui	a0,0x1
ffffffffc02055b8:	9d7fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02055bc:	89aa                	mv	s3,a0
ffffffffc02055be:	c941                	beqz	a0,ffffffffc020564e <sysfile_read+0xf0>
ffffffffc02055c0:	4b81                	li	s7,0
ffffffffc02055c2:	6a05                	lui	s4,0x1
ffffffffc02055c4:	03890c13          	addi	s8,s2,56
ffffffffc02055c8:	0744ec63          	bltu	s1,s4,ffffffffc0205640 <sysfile_read+0xe2>
ffffffffc02055cc:	e452                	sd	s4,8(sp)
ffffffffc02055ce:	6605                	lui	a2,0x1
ffffffffc02055d0:	0034                	addi	a3,sp,8
ffffffffc02055d2:	85ce                	mv	a1,s3
ffffffffc02055d4:	8556                	mv	a0,s5
ffffffffc02055d6:	e20ff0ef          	jal	ra,ffffffffc0204bf6 <file_read>
ffffffffc02055da:	66a2                	ld	a3,8(sp)
ffffffffc02055dc:	842a                	mv	s0,a0
ffffffffc02055de:	ca9d                	beqz	a3,ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc02055e0:	00090c63          	beqz	s2,ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc02055e4:	8562                	mv	a0,s8
ffffffffc02055e6:	f7ffe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02055ea:	000cb783          	ld	a5,0(s9)
ffffffffc02055ee:	cfa1                	beqz	a5,ffffffffc0205646 <sysfile_read+0xe8>
ffffffffc02055f0:	43dc                	lw	a5,4(a5)
ffffffffc02055f2:	66a2                	ld	a3,8(sp)
ffffffffc02055f4:	04f92823          	sw	a5,80(s2)
ffffffffc02055f8:	864e                	mv	a2,s3
ffffffffc02055fa:	85da                	mv	a1,s6
ffffffffc02055fc:	854a                	mv	a0,s2
ffffffffc02055fe:	d5dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205602:	c50d                	beqz	a0,ffffffffc020562c <sysfile_read+0xce>
ffffffffc0205604:	67a2                	ld	a5,8(sp)
ffffffffc0205606:	04f4e663          	bltu	s1,a5,ffffffffc0205652 <sysfile_read+0xf4>
ffffffffc020560a:	9b3e                	add	s6,s6,a5
ffffffffc020560c:	8c9d                	sub	s1,s1,a5
ffffffffc020560e:	9bbe                	add	s7,s7,a5
ffffffffc0205610:	02091263          	bnez	s2,ffffffffc0205634 <sysfile_read+0xd6>
ffffffffc0205614:	e401                	bnez	s0,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205616:	67a2                	ld	a5,8(sp)
ffffffffc0205618:	c391                	beqz	a5,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc020561a:	f4dd                	bnez	s1,ffffffffc02055c8 <sysfile_read+0x6a>
ffffffffc020561c:	854e                	mv	a0,s3
ffffffffc020561e:	a21fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205622:	f40b8ce3          	beqz	s7,ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205626:	000b841b          	sext.w	s0,s7
ffffffffc020562a:	bf81                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020562c:	e011                	bnez	s0,ffffffffc0205630 <sysfile_read+0xd2>
ffffffffc020562e:	5475                	li	s0,-3
ffffffffc0205630:	fe0906e3          	beqz	s2,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205634:	8562                	mv	a0,s8
ffffffffc0205636:	f2bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020563a:	04092823          	sw	zero,80(s2)
ffffffffc020563e:	bfd9                	j	ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc0205640:	e426                	sd	s1,8(sp)
ffffffffc0205642:	8626                	mv	a2,s1
ffffffffc0205644:	b771                	j	ffffffffc02055d0 <sysfile_read+0x72>
ffffffffc0205646:	66a2                	ld	a3,8(sp)
ffffffffc0205648:	bf45                	j	ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc020564a:	5475                	li	s0,-3
ffffffffc020564c:	b73d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020564e:	5471                	li	s0,-4
ffffffffc0205650:	b72d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205652:	00008697          	auipc	a3,0x8
ffffffffc0205656:	da668693          	addi	a3,a3,-602 # ffffffffc020d3f8 <CSWTCH.79+0xc8>
ffffffffc020565a:	00006617          	auipc	a2,0x6
ffffffffc020565e:	2c660613          	addi	a2,a2,710 # ffffffffc020b920 <commands+0x210>
ffffffffc0205662:	05500593          	li	a1,85
ffffffffc0205666:	00008517          	auipc	a0,0x8
ffffffffc020566a:	da250513          	addi	a0,a0,-606 # ffffffffc020d408 <CSWTCH.79+0xd8>
ffffffffc020566e:	e31fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205672 <sysfile_write>:
ffffffffc0205672:	7159                	addi	sp,sp,-112
ffffffffc0205674:	e8ca                	sd	s2,80(sp)
ffffffffc0205676:	f486                	sd	ra,104(sp)
ffffffffc0205678:	f0a2                	sd	s0,96(sp)
ffffffffc020567a:	eca6                	sd	s1,88(sp)
ffffffffc020567c:	e4ce                	sd	s3,72(sp)
ffffffffc020567e:	e0d2                	sd	s4,64(sp)
ffffffffc0205680:	fc56                	sd	s5,56(sp)
ffffffffc0205682:	f85a                	sd	s6,48(sp)
ffffffffc0205684:	f45e                	sd	s7,40(sp)
ffffffffc0205686:	f062                	sd	s8,32(sp)
ffffffffc0205688:	ec66                	sd	s9,24(sp)
ffffffffc020568a:	4901                	li	s2,0
ffffffffc020568c:	ee19                	bnez	a2,ffffffffc02056aa <sysfile_write+0x38>
ffffffffc020568e:	70a6                	ld	ra,104(sp)
ffffffffc0205690:	7406                	ld	s0,96(sp)
ffffffffc0205692:	64e6                	ld	s1,88(sp)
ffffffffc0205694:	69a6                	ld	s3,72(sp)
ffffffffc0205696:	6a06                	ld	s4,64(sp)
ffffffffc0205698:	7ae2                	ld	s5,56(sp)
ffffffffc020569a:	7b42                	ld	s6,48(sp)
ffffffffc020569c:	7ba2                	ld	s7,40(sp)
ffffffffc020569e:	7c02                	ld	s8,32(sp)
ffffffffc02056a0:	6ce2                	ld	s9,24(sp)
ffffffffc02056a2:	854a                	mv	a0,s2
ffffffffc02056a4:	6946                	ld	s2,80(sp)
ffffffffc02056a6:	6165                	addi	sp,sp,112
ffffffffc02056a8:	8082                	ret
ffffffffc02056aa:	00091c17          	auipc	s8,0x91
ffffffffc02056ae:	216c0c13          	addi	s8,s8,534 # ffffffffc02968c0 <current>
ffffffffc02056b2:	000c3783          	ld	a5,0(s8)
ffffffffc02056b6:	8432                	mv	s0,a2
ffffffffc02056b8:	89ae                	mv	s3,a1
ffffffffc02056ba:	4605                	li	a2,1
ffffffffc02056bc:	4581                	li	a1,0
ffffffffc02056be:	7784                	ld	s1,40(a5)
ffffffffc02056c0:	8baa                	mv	s7,a0
ffffffffc02056c2:	b8cff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02056c6:	cd59                	beqz	a0,ffffffffc0205764 <sysfile_write+0xf2>
ffffffffc02056c8:	6505                	lui	a0,0x1
ffffffffc02056ca:	8c5fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02056ce:	8a2a                	mv	s4,a0
ffffffffc02056d0:	cd41                	beqz	a0,ffffffffc0205768 <sysfile_write+0xf6>
ffffffffc02056d2:	4c81                	li	s9,0
ffffffffc02056d4:	6a85                	lui	s5,0x1
ffffffffc02056d6:	03848b13          	addi	s6,s1,56
ffffffffc02056da:	05546a63          	bltu	s0,s5,ffffffffc020572e <sysfile_write+0xbc>
ffffffffc02056de:	e456                	sd	s5,8(sp)
ffffffffc02056e0:	c8a9                	beqz	s1,ffffffffc0205732 <sysfile_write+0xc0>
ffffffffc02056e2:	855a                	mv	a0,s6
ffffffffc02056e4:	e81fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02056e8:	000c3783          	ld	a5,0(s8)
ffffffffc02056ec:	c399                	beqz	a5,ffffffffc02056f2 <sysfile_write+0x80>
ffffffffc02056ee:	43dc                	lw	a5,4(a5)
ffffffffc02056f0:	c8bc                	sw	a5,80(s1)
ffffffffc02056f2:	66a2                	ld	a3,8(sp)
ffffffffc02056f4:	4701                	li	a4,0
ffffffffc02056f6:	864e                	mv	a2,s3
ffffffffc02056f8:	85d2                	mv	a1,s4
ffffffffc02056fa:	8526                	mv	a0,s1
ffffffffc02056fc:	c2bfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205700:	c139                	beqz	a0,ffffffffc0205746 <sysfile_write+0xd4>
ffffffffc0205702:	855a                	mv	a0,s6
ffffffffc0205704:	e5dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205708:	0404a823          	sw	zero,80(s1)
ffffffffc020570c:	6622                	ld	a2,8(sp)
ffffffffc020570e:	0034                	addi	a3,sp,8
ffffffffc0205710:	85d2                	mv	a1,s4
ffffffffc0205712:	855e                	mv	a0,s7
ffffffffc0205714:	dc8ff0ef          	jal	ra,ffffffffc0204cdc <file_write>
ffffffffc0205718:	67a2                	ld	a5,8(sp)
ffffffffc020571a:	892a                	mv	s2,a0
ffffffffc020571c:	ef85                	bnez	a5,ffffffffc0205754 <sysfile_write+0xe2>
ffffffffc020571e:	8552                	mv	a0,s4
ffffffffc0205720:	91ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205724:	f60c85e3          	beqz	s9,ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205728:	000c891b          	sext.w	s2,s9
ffffffffc020572c:	b78d                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020572e:	e422                	sd	s0,8(sp)
ffffffffc0205730:	f8cd                	bnez	s1,ffffffffc02056e2 <sysfile_write+0x70>
ffffffffc0205732:	66a2                	ld	a3,8(sp)
ffffffffc0205734:	4701                	li	a4,0
ffffffffc0205736:	864e                	mv	a2,s3
ffffffffc0205738:	85d2                	mv	a1,s4
ffffffffc020573a:	4501                	li	a0,0
ffffffffc020573c:	bebfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205740:	f571                	bnez	a0,ffffffffc020570c <sysfile_write+0x9a>
ffffffffc0205742:	5975                	li	s2,-3
ffffffffc0205744:	bfe9                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205746:	855a                	mv	a0,s6
ffffffffc0205748:	e19fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020574c:	5975                	li	s2,-3
ffffffffc020574e:	0404a823          	sw	zero,80(s1)
ffffffffc0205752:	b7f1                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205754:	00f46c63          	bltu	s0,a5,ffffffffc020576c <sysfile_write+0xfa>
ffffffffc0205758:	99be                	add	s3,s3,a5
ffffffffc020575a:	8c1d                	sub	s0,s0,a5
ffffffffc020575c:	9cbe                	add	s9,s9,a5
ffffffffc020575e:	f161                	bnez	a0,ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205760:	fc2d                	bnez	s0,ffffffffc02056da <sysfile_write+0x68>
ffffffffc0205762:	bf75                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205764:	5975                	li	s2,-3
ffffffffc0205766:	b725                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205768:	5971                	li	s2,-4
ffffffffc020576a:	b715                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020576c:	00008697          	auipc	a3,0x8
ffffffffc0205770:	c8c68693          	addi	a3,a3,-884 # ffffffffc020d3f8 <CSWTCH.79+0xc8>
ffffffffc0205774:	00006617          	auipc	a2,0x6
ffffffffc0205778:	1ac60613          	addi	a2,a2,428 # ffffffffc020b920 <commands+0x210>
ffffffffc020577c:	08a00593          	li	a1,138
ffffffffc0205780:	00008517          	auipc	a0,0x8
ffffffffc0205784:	c8850513          	addi	a0,a0,-888 # ffffffffc020d408 <CSWTCH.79+0xd8>
ffffffffc0205788:	d17fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020578c <sysfile_seek>:
ffffffffc020578c:	e36ff06f          	j	ffffffffc0204dc2 <file_seek>

ffffffffc0205790 <sysfile_fstat>:
ffffffffc0205790:	715d                	addi	sp,sp,-80
ffffffffc0205792:	f44e                	sd	s3,40(sp)
ffffffffc0205794:	00091997          	auipc	s3,0x91
ffffffffc0205798:	12c98993          	addi	s3,s3,300 # ffffffffc02968c0 <current>
ffffffffc020579c:	0009b703          	ld	a4,0(s3)
ffffffffc02057a0:	fc26                	sd	s1,56(sp)
ffffffffc02057a2:	84ae                	mv	s1,a1
ffffffffc02057a4:	858a                	mv	a1,sp
ffffffffc02057a6:	e0a2                	sd	s0,64(sp)
ffffffffc02057a8:	f84a                	sd	s2,48(sp)
ffffffffc02057aa:	e486                	sd	ra,72(sp)
ffffffffc02057ac:	02873903          	ld	s2,40(a4)
ffffffffc02057b0:	f052                	sd	s4,32(sp)
ffffffffc02057b2:	f30ff0ef          	jal	ra,ffffffffc0204ee2 <file_fstat>
ffffffffc02057b6:	842a                	mv	s0,a0
ffffffffc02057b8:	e91d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc02057ba:	04090363          	beqz	s2,ffffffffc0205800 <sysfile_fstat+0x70>
ffffffffc02057be:	03890a13          	addi	s4,s2,56
ffffffffc02057c2:	8552                	mv	a0,s4
ffffffffc02057c4:	da1fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02057c8:	0009b783          	ld	a5,0(s3)
ffffffffc02057cc:	c3b9                	beqz	a5,ffffffffc0205812 <sysfile_fstat+0x82>
ffffffffc02057ce:	43dc                	lw	a5,4(a5)
ffffffffc02057d0:	02000693          	li	a3,32
ffffffffc02057d4:	860a                	mv	a2,sp
ffffffffc02057d6:	04f92823          	sw	a5,80(s2)
ffffffffc02057da:	85a6                	mv	a1,s1
ffffffffc02057dc:	854a                	mv	a0,s2
ffffffffc02057de:	b7dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02057e2:	c121                	beqz	a0,ffffffffc0205822 <sysfile_fstat+0x92>
ffffffffc02057e4:	8552                	mv	a0,s4
ffffffffc02057e6:	d7bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02057ea:	04092823          	sw	zero,80(s2)
ffffffffc02057ee:	60a6                	ld	ra,72(sp)
ffffffffc02057f0:	8522                	mv	a0,s0
ffffffffc02057f2:	6406                	ld	s0,64(sp)
ffffffffc02057f4:	74e2                	ld	s1,56(sp)
ffffffffc02057f6:	7942                	ld	s2,48(sp)
ffffffffc02057f8:	79a2                	ld	s3,40(sp)
ffffffffc02057fa:	7a02                	ld	s4,32(sp)
ffffffffc02057fc:	6161                	addi	sp,sp,80
ffffffffc02057fe:	8082                	ret
ffffffffc0205800:	02000693          	li	a3,32
ffffffffc0205804:	860a                	mv	a2,sp
ffffffffc0205806:	85a6                	mv	a1,s1
ffffffffc0205808:	b53fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc020580c:	f16d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc020580e:	5475                	li	s0,-3
ffffffffc0205810:	bff9                	j	ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc0205812:	02000693          	li	a3,32
ffffffffc0205816:	860a                	mv	a2,sp
ffffffffc0205818:	85a6                	mv	a1,s1
ffffffffc020581a:	854a                	mv	a0,s2
ffffffffc020581c:	b3ffe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205820:	f171                	bnez	a0,ffffffffc02057e4 <sysfile_fstat+0x54>
ffffffffc0205822:	8552                	mv	a0,s4
ffffffffc0205824:	d3dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205828:	5475                	li	s0,-3
ffffffffc020582a:	04092823          	sw	zero,80(s2)
ffffffffc020582e:	b7c1                	j	ffffffffc02057ee <sysfile_fstat+0x5e>

ffffffffc0205830 <sysfile_fsync>:
ffffffffc0205830:	f72ff06f          	j	ffffffffc0204fa2 <file_fsync>

ffffffffc0205834 <sysfile_getcwd>:
ffffffffc0205834:	715d                	addi	sp,sp,-80
ffffffffc0205836:	f44e                	sd	s3,40(sp)
ffffffffc0205838:	00091997          	auipc	s3,0x91
ffffffffc020583c:	08898993          	addi	s3,s3,136 # ffffffffc02968c0 <current>
ffffffffc0205840:	0009b783          	ld	a5,0(s3)
ffffffffc0205844:	f84a                	sd	s2,48(sp)
ffffffffc0205846:	e486                	sd	ra,72(sp)
ffffffffc0205848:	e0a2                	sd	s0,64(sp)
ffffffffc020584a:	fc26                	sd	s1,56(sp)
ffffffffc020584c:	f052                	sd	s4,32(sp)
ffffffffc020584e:	0287b903          	ld	s2,40(a5)
ffffffffc0205852:	cda9                	beqz	a1,ffffffffc02058ac <sysfile_getcwd+0x78>
ffffffffc0205854:	842e                	mv	s0,a1
ffffffffc0205856:	84aa                	mv	s1,a0
ffffffffc0205858:	04090363          	beqz	s2,ffffffffc020589e <sysfile_getcwd+0x6a>
ffffffffc020585c:	03890a13          	addi	s4,s2,56
ffffffffc0205860:	8552                	mv	a0,s4
ffffffffc0205862:	d03fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205866:	0009b783          	ld	a5,0(s3)
ffffffffc020586a:	c781                	beqz	a5,ffffffffc0205872 <sysfile_getcwd+0x3e>
ffffffffc020586c:	43dc                	lw	a5,4(a5)
ffffffffc020586e:	04f92823          	sw	a5,80(s2)
ffffffffc0205872:	4685                	li	a3,1
ffffffffc0205874:	8622                	mv	a2,s0
ffffffffc0205876:	85a6                	mv	a1,s1
ffffffffc0205878:	854a                	mv	a0,s2
ffffffffc020587a:	a19fe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc020587e:	e90d                	bnez	a0,ffffffffc02058b0 <sysfile_getcwd+0x7c>
ffffffffc0205880:	5475                	li	s0,-3
ffffffffc0205882:	8552                	mv	a0,s4
ffffffffc0205884:	cddfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205888:	04092823          	sw	zero,80(s2)
ffffffffc020588c:	60a6                	ld	ra,72(sp)
ffffffffc020588e:	8522                	mv	a0,s0
ffffffffc0205890:	6406                	ld	s0,64(sp)
ffffffffc0205892:	74e2                	ld	s1,56(sp)
ffffffffc0205894:	7942                	ld	s2,48(sp)
ffffffffc0205896:	79a2                	ld	s3,40(sp)
ffffffffc0205898:	7a02                	ld	s4,32(sp)
ffffffffc020589a:	6161                	addi	sp,sp,80
ffffffffc020589c:	8082                	ret
ffffffffc020589e:	862e                	mv	a2,a1
ffffffffc02058a0:	4685                	li	a3,1
ffffffffc02058a2:	85aa                	mv	a1,a0
ffffffffc02058a4:	4501                	li	a0,0
ffffffffc02058a6:	9edfe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02058aa:	ed09                	bnez	a0,ffffffffc02058c4 <sysfile_getcwd+0x90>
ffffffffc02058ac:	5475                	li	s0,-3
ffffffffc02058ae:	bff9                	j	ffffffffc020588c <sysfile_getcwd+0x58>
ffffffffc02058b0:	8622                	mv	a2,s0
ffffffffc02058b2:	4681                	li	a3,0
ffffffffc02058b4:	85a6                	mv	a1,s1
ffffffffc02058b6:	850a                	mv	a0,sp
ffffffffc02058b8:	b2bff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058bc:	2f5020ef          	jal	ra,ffffffffc02083b0 <vfs_getcwd>
ffffffffc02058c0:	842a                	mv	s0,a0
ffffffffc02058c2:	b7c1                	j	ffffffffc0205882 <sysfile_getcwd+0x4e>
ffffffffc02058c4:	8622                	mv	a2,s0
ffffffffc02058c6:	4681                	li	a3,0
ffffffffc02058c8:	85a6                	mv	a1,s1
ffffffffc02058ca:	850a                	mv	a0,sp
ffffffffc02058cc:	b17ff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058d0:	2e1020ef          	jal	ra,ffffffffc02083b0 <vfs_getcwd>
ffffffffc02058d4:	842a                	mv	s0,a0
ffffffffc02058d6:	bf5d                	j	ffffffffc020588c <sysfile_getcwd+0x58>

ffffffffc02058d8 <sysfile_getdirentry>:
ffffffffc02058d8:	7139                	addi	sp,sp,-64
ffffffffc02058da:	e852                	sd	s4,16(sp)
ffffffffc02058dc:	00091a17          	auipc	s4,0x91
ffffffffc02058e0:	fe4a0a13          	addi	s4,s4,-28 # ffffffffc02968c0 <current>
ffffffffc02058e4:	000a3703          	ld	a4,0(s4)
ffffffffc02058e8:	ec4e                	sd	s3,24(sp)
ffffffffc02058ea:	89aa                	mv	s3,a0
ffffffffc02058ec:	10800513          	li	a0,264
ffffffffc02058f0:	f426                	sd	s1,40(sp)
ffffffffc02058f2:	f04a                	sd	s2,32(sp)
ffffffffc02058f4:	fc06                	sd	ra,56(sp)
ffffffffc02058f6:	f822                	sd	s0,48(sp)
ffffffffc02058f8:	e456                	sd	s5,8(sp)
ffffffffc02058fa:	7704                	ld	s1,40(a4)
ffffffffc02058fc:	892e                	mv	s2,a1
ffffffffc02058fe:	e90fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205902:	c169                	beqz	a0,ffffffffc02059c4 <sysfile_getdirentry+0xec>
ffffffffc0205904:	842a                	mv	s0,a0
ffffffffc0205906:	c8c1                	beqz	s1,ffffffffc0205996 <sysfile_getdirentry+0xbe>
ffffffffc0205908:	03848a93          	addi	s5,s1,56
ffffffffc020590c:	8556                	mv	a0,s5
ffffffffc020590e:	c57fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205912:	000a3783          	ld	a5,0(s4)
ffffffffc0205916:	c399                	beqz	a5,ffffffffc020591c <sysfile_getdirentry+0x44>
ffffffffc0205918:	43dc                	lw	a5,4(a5)
ffffffffc020591a:	c8bc                	sw	a5,80(s1)
ffffffffc020591c:	4705                	li	a4,1
ffffffffc020591e:	46a1                	li	a3,8
ffffffffc0205920:	864a                	mv	a2,s2
ffffffffc0205922:	85a2                	mv	a1,s0
ffffffffc0205924:	8526                	mv	a0,s1
ffffffffc0205926:	a01fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc020592a:	e505                	bnez	a0,ffffffffc0205952 <sysfile_getdirentry+0x7a>
ffffffffc020592c:	8556                	mv	a0,s5
ffffffffc020592e:	c33fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205932:	59f5                	li	s3,-3
ffffffffc0205934:	0404a823          	sw	zero,80(s1)
ffffffffc0205938:	8522                	mv	a0,s0
ffffffffc020593a:	f04fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020593e:	70e2                	ld	ra,56(sp)
ffffffffc0205940:	7442                	ld	s0,48(sp)
ffffffffc0205942:	74a2                	ld	s1,40(sp)
ffffffffc0205944:	7902                	ld	s2,32(sp)
ffffffffc0205946:	6a42                	ld	s4,16(sp)
ffffffffc0205948:	6aa2                	ld	s5,8(sp)
ffffffffc020594a:	854e                	mv	a0,s3
ffffffffc020594c:	69e2                	ld	s3,24(sp)
ffffffffc020594e:	6121                	addi	sp,sp,64
ffffffffc0205950:	8082                	ret
ffffffffc0205952:	8556                	mv	a0,s5
ffffffffc0205954:	c0dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205958:	854e                	mv	a0,s3
ffffffffc020595a:	85a2                	mv	a1,s0
ffffffffc020595c:	0404a823          	sw	zero,80(s1)
ffffffffc0205960:	ef0ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc0205964:	89aa                	mv	s3,a0
ffffffffc0205966:	f969                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205968:	8556                	mv	a0,s5
ffffffffc020596a:	bfbfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020596e:	000a3783          	ld	a5,0(s4)
ffffffffc0205972:	c399                	beqz	a5,ffffffffc0205978 <sysfile_getdirentry+0xa0>
ffffffffc0205974:	43dc                	lw	a5,4(a5)
ffffffffc0205976:	c8bc                	sw	a5,80(s1)
ffffffffc0205978:	10800693          	li	a3,264
ffffffffc020597c:	8622                	mv	a2,s0
ffffffffc020597e:	85ca                	mv	a1,s2
ffffffffc0205980:	8526                	mv	a0,s1
ffffffffc0205982:	9d9fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205986:	e111                	bnez	a0,ffffffffc020598a <sysfile_getdirentry+0xb2>
ffffffffc0205988:	59f5                	li	s3,-3
ffffffffc020598a:	8556                	mv	a0,s5
ffffffffc020598c:	bd5fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205990:	0404a823          	sw	zero,80(s1)
ffffffffc0205994:	b755                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205996:	85aa                	mv	a1,a0
ffffffffc0205998:	4705                	li	a4,1
ffffffffc020599a:	46a1                	li	a3,8
ffffffffc020599c:	864a                	mv	a2,s2
ffffffffc020599e:	4501                	li	a0,0
ffffffffc02059a0:	987fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc02059a4:	cd11                	beqz	a0,ffffffffc02059c0 <sysfile_getdirentry+0xe8>
ffffffffc02059a6:	854e                	mv	a0,s3
ffffffffc02059a8:	85a2                	mv	a1,s0
ffffffffc02059aa:	ea6ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc02059ae:	89aa                	mv	s3,a0
ffffffffc02059b0:	f541                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059b2:	10800693          	li	a3,264
ffffffffc02059b6:	8622                	mv	a2,s0
ffffffffc02059b8:	85ca                	mv	a1,s2
ffffffffc02059ba:	9a1fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02059be:	fd2d                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c0:	59f5                	li	s3,-3
ffffffffc02059c2:	bf9d                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c4:	59f1                	li	s3,-4
ffffffffc02059c6:	bfa5                	j	ffffffffc020593e <sysfile_getdirentry+0x66>

ffffffffc02059c8 <sysfile_dup>:
ffffffffc02059c8:	f6eff06f          	j	ffffffffc0205136 <file_dup>

ffffffffc02059cc <kernel_thread_entry>:
ffffffffc02059cc:	8526                	mv	a0,s1
ffffffffc02059ce:	9402                	jalr	s0
ffffffffc02059d0:	638000ef          	jal	ra,ffffffffc0206008 <do_exit>

ffffffffc02059d4 <alloc_proc>:
ffffffffc02059d4:	1141                	addi	sp,sp,-16
ffffffffc02059d6:	15000513          	li	a0,336
ffffffffc02059da:	e022                	sd	s0,0(sp)
ffffffffc02059dc:	e406                	sd	ra,8(sp)
ffffffffc02059de:	db0fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02059e2:	842a                	mv	s0,a0
ffffffffc02059e4:	c141                	beqz	a0,ffffffffc0205a64 <alloc_proc+0x90>
ffffffffc02059e6:	57fd                	li	a5,-1
ffffffffc02059e8:	1782                	slli	a5,a5,0x20
ffffffffc02059ea:	e11c                	sd	a5,0(a0)
ffffffffc02059ec:	07000613          	li	a2,112
ffffffffc02059f0:	4581                	li	a1,0
ffffffffc02059f2:	00052423          	sw	zero,8(a0)
ffffffffc02059f6:	00053823          	sd	zero,16(a0)
ffffffffc02059fa:	00053c23          	sd	zero,24(a0)
ffffffffc02059fe:	02053023          	sd	zero,32(a0)
ffffffffc0205a02:	02053423          	sd	zero,40(a0)
ffffffffc0205a06:	03050513          	addi	a0,a0,48
ffffffffc0205a0a:	233050ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0205a0e:	00091797          	auipc	a5,0x91
ffffffffc0205a12:	e827b783          	ld	a5,-382(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205a16:	f45c                	sd	a5,168(s0)
ffffffffc0205a18:	0a043023          	sd	zero,160(s0)
ffffffffc0205a1c:	0a042823          	sw	zero,176(s0)
ffffffffc0205a20:	463d                	li	a2,15
ffffffffc0205a22:	4581                	li	a1,0
ffffffffc0205a24:	0b440513          	addi	a0,s0,180
ffffffffc0205a28:	215050ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0205a2c:	11040793          	addi	a5,s0,272
ffffffffc0205a30:	0e042623          	sw	zero,236(s0)
ffffffffc0205a34:	0e043c23          	sd	zero,248(s0)
ffffffffc0205a38:	10043023          	sd	zero,256(s0)
ffffffffc0205a3c:	0e043823          	sd	zero,240(s0)
ffffffffc0205a40:	10043423          	sd	zero,264(s0)
ffffffffc0205a44:	10f43c23          	sd	a5,280(s0)
ffffffffc0205a48:	10f43823          	sd	a5,272(s0)
ffffffffc0205a4c:	12042023          	sw	zero,288(s0)
ffffffffc0205a50:	12043423          	sd	zero,296(s0)
ffffffffc0205a54:	12043823          	sd	zero,304(s0)
ffffffffc0205a58:	12043c23          	sd	zero,312(s0)
ffffffffc0205a5c:	14043023          	sd	zero,320(s0)
ffffffffc0205a60:	14043423          	sd	zero,328(s0)
ffffffffc0205a64:	60a2                	ld	ra,8(sp)
ffffffffc0205a66:	8522                	mv	a0,s0
ffffffffc0205a68:	6402                	ld	s0,0(sp)
ffffffffc0205a6a:	0141                	addi	sp,sp,16
ffffffffc0205a6c:	8082                	ret

ffffffffc0205a6e <forkret>:
ffffffffc0205a6e:	00091797          	auipc	a5,0x91
ffffffffc0205a72:	e527b783          	ld	a5,-430(a5) # ffffffffc02968c0 <current>
ffffffffc0205a76:	73c8                	ld	a0,160(a5)
ffffffffc0205a78:	833fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc0205a7c <put_pgdir.isra.0>:
ffffffffc0205a7c:	1141                	addi	sp,sp,-16
ffffffffc0205a7e:	e406                	sd	ra,8(sp)
ffffffffc0205a80:	c02007b7          	lui	a5,0xc0200
ffffffffc0205a84:	02f56e63          	bltu	a0,a5,ffffffffc0205ac0 <put_pgdir.isra.0+0x44>
ffffffffc0205a88:	00091697          	auipc	a3,0x91
ffffffffc0205a8c:	e306b683          	ld	a3,-464(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205a90:	8d15                	sub	a0,a0,a3
ffffffffc0205a92:	8131                	srli	a0,a0,0xc
ffffffffc0205a94:	00091797          	auipc	a5,0x91
ffffffffc0205a98:	e0c7b783          	ld	a5,-500(a5) # ffffffffc02968a0 <npage>
ffffffffc0205a9c:	02f57f63          	bgeu	a0,a5,ffffffffc0205ada <put_pgdir.isra.0+0x5e>
ffffffffc0205aa0:	0000a697          	auipc	a3,0xa
ffffffffc0205aa4:	cc86b683          	ld	a3,-824(a3) # ffffffffc020f768 <nbase>
ffffffffc0205aa8:	60a2                	ld	ra,8(sp)
ffffffffc0205aaa:	8d15                	sub	a0,a0,a3
ffffffffc0205aac:	00091797          	auipc	a5,0x91
ffffffffc0205ab0:	dfc7b783          	ld	a5,-516(a5) # ffffffffc02968a8 <pages>
ffffffffc0205ab4:	051a                	slli	a0,a0,0x6
ffffffffc0205ab6:	4585                	li	a1,1
ffffffffc0205ab8:	953e                	add	a0,a0,a5
ffffffffc0205aba:	0141                	addi	sp,sp,16
ffffffffc0205abc:	eeefc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205ac0:	86aa                	mv	a3,a0
ffffffffc0205ac2:	00007617          	auipc	a2,0x7
ffffffffc0205ac6:	a2660613          	addi	a2,a2,-1498 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0205aca:	07700593          	li	a1,119
ffffffffc0205ace:	00007517          	auipc	a0,0x7
ffffffffc0205ad2:	99a50513          	addi	a0,a0,-1638 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0205ad6:	9c9fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ada:	00007617          	auipc	a2,0x7
ffffffffc0205ade:	a3660613          	addi	a2,a2,-1482 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc0205ae2:	06900593          	li	a1,105
ffffffffc0205ae6:	00007517          	auipc	a0,0x7
ffffffffc0205aea:	98250513          	addi	a0,a0,-1662 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0205aee:	9b1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205af2 <proc_run>:
ffffffffc0205af2:	7179                	addi	sp,sp,-48
ffffffffc0205af4:	ec26                	sd	s1,24(sp)
ffffffffc0205af6:	00091497          	auipc	s1,0x91
ffffffffc0205afa:	dca48493          	addi	s1,s1,-566 # ffffffffc02968c0 <current>
ffffffffc0205afe:	f022                	sd	s0,32(sp)
ffffffffc0205b00:	e44e                	sd	s3,8(sp)
ffffffffc0205b02:	f406                	sd	ra,40(sp)
ffffffffc0205b04:	0004b983          	ld	s3,0(s1)
ffffffffc0205b08:	e84a                	sd	s2,16(sp)
ffffffffc0205b0a:	842a                	mv	s0,a0
ffffffffc0205b0c:	100027f3          	csrr	a5,sstatus
ffffffffc0205b10:	8b89                	andi	a5,a5,2
ffffffffc0205b12:	4901                	li	s2,0
ffffffffc0205b14:	e3a1                	bnez	a5,ffffffffc0205b54 <proc_run+0x62>
ffffffffc0205b16:	745c                	ld	a5,168(s0)
ffffffffc0205b18:	577d                	li	a4,-1
ffffffffc0205b1a:	177e                	slli	a4,a4,0x3f
ffffffffc0205b1c:	83b1                	srli	a5,a5,0xc
ffffffffc0205b1e:	e080                	sd	s0,0(s1)
ffffffffc0205b20:	8fd9                	or	a5,a5,a4
ffffffffc0205b22:	18079073          	csrw	satp,a5
ffffffffc0205b26:	03040593          	addi	a1,s0,48
ffffffffc0205b2a:	03098513          	addi	a0,s3,48
ffffffffc0205b2e:	54c010ef          	jal	ra,ffffffffc020707a <switch_to>
ffffffffc0205b32:	00091963          	bnez	s2,ffffffffc0205b44 <proc_run+0x52>
ffffffffc0205b36:	70a2                	ld	ra,40(sp)
ffffffffc0205b38:	7402                	ld	s0,32(sp)
ffffffffc0205b3a:	64e2                	ld	s1,24(sp)
ffffffffc0205b3c:	6942                	ld	s2,16(sp)
ffffffffc0205b3e:	69a2                	ld	s3,8(sp)
ffffffffc0205b40:	6145                	addi	sp,sp,48
ffffffffc0205b42:	8082                	ret
ffffffffc0205b44:	7402                	ld	s0,32(sp)
ffffffffc0205b46:	70a2                	ld	ra,40(sp)
ffffffffc0205b48:	64e2                	ld	s1,24(sp)
ffffffffc0205b4a:	6942                	ld	s2,16(sp)
ffffffffc0205b4c:	69a2                	ld	s3,8(sp)
ffffffffc0205b4e:	6145                	addi	sp,sp,48
ffffffffc0205b50:	91cfb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205b54:	91efb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205b58:	4905                	li	s2,1
ffffffffc0205b5a:	bf75                	j	ffffffffc0205b16 <proc_run+0x24>

ffffffffc0205b5c <do_fork>:
ffffffffc0205b5c:	7119                	addi	sp,sp,-128
ffffffffc0205b5e:	ecce                	sd	s3,88(sp)
ffffffffc0205b60:	00091997          	auipc	s3,0x91
ffffffffc0205b64:	d7898993          	addi	s3,s3,-648 # ffffffffc02968d8 <nr_process>
ffffffffc0205b68:	0009a703          	lw	a4,0(s3)
ffffffffc0205b6c:	fc86                	sd	ra,120(sp)
ffffffffc0205b6e:	f8a2                	sd	s0,112(sp)
ffffffffc0205b70:	f4a6                	sd	s1,104(sp)
ffffffffc0205b72:	f0ca                	sd	s2,96(sp)
ffffffffc0205b74:	e8d2                	sd	s4,80(sp)
ffffffffc0205b76:	e4d6                	sd	s5,72(sp)
ffffffffc0205b78:	e0da                	sd	s6,64(sp)
ffffffffc0205b7a:	fc5e                	sd	s7,56(sp)
ffffffffc0205b7c:	f862                	sd	s8,48(sp)
ffffffffc0205b7e:	f466                	sd	s9,40(sp)
ffffffffc0205b80:	f06a                	sd	s10,32(sp)
ffffffffc0205b82:	ec6e                	sd	s11,24(sp)
ffffffffc0205b84:	6785                	lui	a5,0x1
ffffffffc0205b86:	34f75e63          	bge	a4,a5,ffffffffc0205ee2 <do_fork+0x386>
ffffffffc0205b8a:	84aa                	mv	s1,a0
ffffffffc0205b8c:	892e                	mv	s2,a1
ffffffffc0205b8e:	8432                	mv	s0,a2
ffffffffc0205b90:	e45ff0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0205b94:	8aaa                	mv	s5,a0
ffffffffc0205b96:	36050963          	beqz	a0,ffffffffc0205f08 <do_fork+0x3ac>
ffffffffc0205b9a:	00091b97          	auipc	s7,0x91
ffffffffc0205b9e:	d26b8b93          	addi	s7,s7,-730 # ffffffffc02968c0 <current>
ffffffffc0205ba2:	000bb783          	ld	a5,0(s7)
ffffffffc0205ba6:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_bin_swap_img_size-0x6c14>
ffffffffc0205baa:	f11c                	sd	a5,32(a0)
ffffffffc0205bac:	38071163          	bnez	a4,ffffffffc0205f2e <do_fork+0x3d2>
ffffffffc0205bb0:	4509                	li	a0,2
ffffffffc0205bb2:	dbafc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205bb6:	32050063          	beqz	a0,ffffffffc0205ed6 <do_fork+0x37a>
ffffffffc0205bba:	00091c17          	auipc	s8,0x91
ffffffffc0205bbe:	ceec0c13          	addi	s8,s8,-786 # ffffffffc02968a8 <pages>
ffffffffc0205bc2:	000c3683          	ld	a3,0(s8)
ffffffffc0205bc6:	00091c97          	auipc	s9,0x91
ffffffffc0205bca:	cdac8c93          	addi	s9,s9,-806 # ffffffffc02968a0 <npage>
ffffffffc0205bce:	0000aa17          	auipc	s4,0xa
ffffffffc0205bd2:	b9aa3a03          	ld	s4,-1126(s4) # ffffffffc020f768 <nbase>
ffffffffc0205bd6:	40d506b3          	sub	a3,a0,a3
ffffffffc0205bda:	8699                	srai	a3,a3,0x6
ffffffffc0205bdc:	5b7d                	li	s6,-1
ffffffffc0205bde:	000cb783          	ld	a5,0(s9)
ffffffffc0205be2:	96d2                	add	a3,a3,s4
ffffffffc0205be4:	00cb5b13          	srli	s6,s6,0xc
ffffffffc0205be8:	0166f733          	and	a4,a3,s6
ffffffffc0205bec:	06b2                	slli	a3,a3,0xc
ffffffffc0205bee:	32f77463          	bgeu	a4,a5,ffffffffc0205f16 <do_fork+0x3ba>
ffffffffc0205bf2:	000bb703          	ld	a4,0(s7)
ffffffffc0205bf6:	00091d97          	auipc	s11,0x91
ffffffffc0205bfa:	cc2d8d93          	addi	s11,s11,-830 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205bfe:	000db783          	ld	a5,0(s11)
ffffffffc0205c02:	02873d03          	ld	s10,40(a4)
ffffffffc0205c06:	96be                	add	a3,a3,a5
ffffffffc0205c08:	00dab823          	sd	a3,16(s5) # 1010 <_binary_bin_swap_img_size-0x6cf0>
ffffffffc0205c0c:	020d0a63          	beqz	s10,ffffffffc0205c40 <do_fork+0xe4>
ffffffffc0205c10:	1004f793          	andi	a5,s1,256
ffffffffc0205c14:	1c078c63          	beqz	a5,ffffffffc0205dec <do_fork+0x290>
ffffffffc0205c18:	030d2683          	lw	a3,48(s10)
ffffffffc0205c1c:	018d3783          	ld	a5,24(s10)
ffffffffc0205c20:	c0200637          	lui	a2,0xc0200
ffffffffc0205c24:	2685                	addiw	a3,a3,1
ffffffffc0205c26:	02dd2823          	sw	a3,48(s10)
ffffffffc0205c2a:	03aab423          	sd	s10,40(s5)
ffffffffc0205c2e:	36c7e863          	bltu	a5,a2,ffffffffc0205f9e <do_fork+0x442>
ffffffffc0205c32:	000db703          	ld	a4,0(s11)
ffffffffc0205c36:	010ab683          	ld	a3,16(s5)
ffffffffc0205c3a:	8f99                	sub	a5,a5,a4
ffffffffc0205c3c:	0afab423          	sd	a5,168(s5)
ffffffffc0205c40:	6789                	lui	a5,0x2
ffffffffc0205c42:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205c46:	96be                	add	a3,a3,a5
ffffffffc0205c48:	0adab023          	sd	a3,160(s5)
ffffffffc0205c4c:	87b6                	mv	a5,a3
ffffffffc0205c4e:	12040813          	addi	a6,s0,288
ffffffffc0205c52:	6008                	ld	a0,0(s0)
ffffffffc0205c54:	640c                	ld	a1,8(s0)
ffffffffc0205c56:	6810                	ld	a2,16(s0)
ffffffffc0205c58:	6c18                	ld	a4,24(s0)
ffffffffc0205c5a:	e388                	sd	a0,0(a5)
ffffffffc0205c5c:	e78c                	sd	a1,8(a5)
ffffffffc0205c5e:	eb90                	sd	a2,16(a5)
ffffffffc0205c60:	ef98                	sd	a4,24(a5)
ffffffffc0205c62:	02040413          	addi	s0,s0,32
ffffffffc0205c66:	02078793          	addi	a5,a5,32
ffffffffc0205c6a:	ff0414e3          	bne	s0,a6,ffffffffc0205c52 <do_fork+0xf6>
ffffffffc0205c6e:	0406b823          	sd	zero,80(a3)
ffffffffc0205c72:	00091363          	bnez	s2,ffffffffc0205c78 <do_fork+0x11c>
ffffffffc0205c76:	8936                	mv	s2,a3
ffffffffc0205c78:	0126b823          	sd	s2,16(a3)
ffffffffc0205c7c:	00000797          	auipc	a5,0x0
ffffffffc0205c80:	df278793          	addi	a5,a5,-526 # ffffffffc0205a6e <forkret>
ffffffffc0205c84:	02fab823          	sd	a5,48(s5)
ffffffffc0205c88:	02dabc23          	sd	a3,56(s5)
ffffffffc0205c8c:	100027f3          	csrr	a5,sstatus
ffffffffc0205c90:	8b89                	andi	a5,a5,2
ffffffffc0205c92:	4901                	li	s2,0
ffffffffc0205c94:	22079d63          	bnez	a5,ffffffffc0205ece <do_fork+0x372>
ffffffffc0205c98:	0008b817          	auipc	a6,0x8b
ffffffffc0205c9c:	3c080813          	addi	a6,a6,960 # ffffffffc0291058 <last_pid.1>
ffffffffc0205ca0:	00082783          	lw	a5,0(a6)
ffffffffc0205ca4:	6709                	lui	a4,0x2
ffffffffc0205ca6:	0017851b          	addiw	a0,a5,1
ffffffffc0205caa:	00a82023          	sw	a0,0(a6)
ffffffffc0205cae:	1ce55063          	bge	a0,a4,ffffffffc0205e6e <do_fork+0x312>
ffffffffc0205cb2:	0008b317          	auipc	t1,0x8b
ffffffffc0205cb6:	3aa30313          	addi	t1,t1,938 # ffffffffc029105c <next_safe.0>
ffffffffc0205cba:	00032783          	lw	a5,0(t1)
ffffffffc0205cbe:	00090417          	auipc	s0,0x90
ffffffffc0205cc2:	b0240413          	addi	s0,s0,-1278 # ffffffffc02957c0 <proc_list>
ffffffffc0205cc6:	06f54063          	blt	a0,a5,ffffffffc0205d26 <do_fork+0x1ca>
ffffffffc0205cca:	00090417          	auipc	s0,0x90
ffffffffc0205cce:	af640413          	addi	s0,s0,-1290 # ffffffffc02957c0 <proc_list>
ffffffffc0205cd2:	00843e03          	ld	t3,8(s0)
ffffffffc0205cd6:	6789                	lui	a5,0x2
ffffffffc0205cd8:	00f32023          	sw	a5,0(t1)
ffffffffc0205cdc:	86aa                	mv	a3,a0
ffffffffc0205cde:	4581                	li	a1,0
ffffffffc0205ce0:	6e89                	lui	t4,0x2
ffffffffc0205ce2:	208e0e63          	beq	t3,s0,ffffffffc0205efe <do_fork+0x3a2>
ffffffffc0205ce6:	88ae                	mv	a7,a1
ffffffffc0205ce8:	87f2                	mv	a5,t3
ffffffffc0205cea:	6609                	lui	a2,0x2
ffffffffc0205cec:	a811                	j	ffffffffc0205d00 <do_fork+0x1a4>
ffffffffc0205cee:	00e6d663          	bge	a3,a4,ffffffffc0205cfa <do_fork+0x19e>
ffffffffc0205cf2:	00c75463          	bge	a4,a2,ffffffffc0205cfa <do_fork+0x19e>
ffffffffc0205cf6:	863a                	mv	a2,a4
ffffffffc0205cf8:	4885                	li	a7,1
ffffffffc0205cfa:	679c                	ld	a5,8(a5)
ffffffffc0205cfc:	00878d63          	beq	a5,s0,ffffffffc0205d16 <do_fork+0x1ba>
ffffffffc0205d00:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205d04:	fed715e3          	bne	a4,a3,ffffffffc0205cee <do_fork+0x192>
ffffffffc0205d08:	2685                	addiw	a3,a3,1
ffffffffc0205d0a:	1ac6dd63          	bge	a3,a2,ffffffffc0205ec4 <do_fork+0x368>
ffffffffc0205d0e:	679c                	ld	a5,8(a5)
ffffffffc0205d10:	4585                	li	a1,1
ffffffffc0205d12:	fe8797e3          	bne	a5,s0,ffffffffc0205d00 <do_fork+0x1a4>
ffffffffc0205d16:	c581                	beqz	a1,ffffffffc0205d1e <do_fork+0x1c2>
ffffffffc0205d18:	00d82023          	sw	a3,0(a6)
ffffffffc0205d1c:	8536                	mv	a0,a3
ffffffffc0205d1e:	00088463          	beqz	a7,ffffffffc0205d26 <do_fork+0x1ca>
ffffffffc0205d22:	00c32023          	sw	a2,0(t1)
ffffffffc0205d26:	00aaa223          	sw	a0,4(s5)
ffffffffc0205d2a:	45a9                	li	a1,10
ffffffffc0205d2c:	2501                	sext.w	a0,a0
ffffffffc0205d2e:	1da050ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc0205d32:	02051793          	slli	a5,a0,0x20
ffffffffc0205d36:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205d3a:	0008c797          	auipc	a5,0x8c
ffffffffc0205d3e:	a8678793          	addi	a5,a5,-1402 # ffffffffc02917c0 <hash_list>
ffffffffc0205d42:	953e                	add	a0,a0,a5
ffffffffc0205d44:	650c                	ld	a1,8(a0)
ffffffffc0205d46:	020ab683          	ld	a3,32(s5)
ffffffffc0205d4a:	0d8a8793          	addi	a5,s5,216
ffffffffc0205d4e:	e19c                	sd	a5,0(a1)
ffffffffc0205d50:	6410                	ld	a2,8(s0)
ffffffffc0205d52:	e51c                	sd	a5,8(a0)
ffffffffc0205d54:	7af8                	ld	a4,240(a3)
ffffffffc0205d56:	0c8a8793          	addi	a5,s5,200
ffffffffc0205d5a:	0ebab023          	sd	a1,224(s5)
ffffffffc0205d5e:	0caabc23          	sd	a0,216(s5)
ffffffffc0205d62:	e21c                	sd	a5,0(a2)
ffffffffc0205d64:	e41c                	sd	a5,8(s0)
ffffffffc0205d66:	0ccab823          	sd	a2,208(s5)
ffffffffc0205d6a:	0c8ab423          	sd	s0,200(s5)
ffffffffc0205d6e:	0e0abc23          	sd	zero,248(s5)
ffffffffc0205d72:	10eab023          	sd	a4,256(s5)
ffffffffc0205d76:	c319                	beqz	a4,ffffffffc0205d7c <do_fork+0x220>
ffffffffc0205d78:	0f573c23          	sd	s5,248(a4) # 20f8 <_binary_bin_swap_img_size-0x5c08>
ffffffffc0205d7c:	0009a783          	lw	a5,0(s3)
ffffffffc0205d80:	0f56b823          	sd	s5,240(a3)
ffffffffc0205d84:	2785                	addiw	a5,a5,1
ffffffffc0205d86:	00f9a023          	sw	a5,0(s3)
ffffffffc0205d8a:	12091a63          	bnez	s2,ffffffffc0205ebe <do_fork+0x362>
ffffffffc0205d8e:	8556                	mv	a0,s5
ffffffffc0205d90:	48e010ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc0205d94:	000bb783          	ld	a5,0(s7)
ffffffffc0205d98:	004aa403          	lw	s0,4(s5)
ffffffffc0205d9c:	1487b903          	ld	s2,328(a5)
ffffffffc0205da0:	1c090f63          	beqz	s2,ffffffffc0205f7e <do_fork+0x422>
ffffffffc0205da4:	80ad                	srli	s1,s1,0xb
ffffffffc0205da6:	8885                	andi	s1,s1,1
ffffffffc0205da8:	e899                	bnez	s1,ffffffffc0205dbe <do_fork+0x262>
ffffffffc0205daa:	c24ff0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0205dae:	84aa                	mv	s1,a0
ffffffffc0205db0:	cd61                	beqz	a0,ffffffffc0205e88 <do_fork+0x32c>
ffffffffc0205db2:	85ca                	mv	a1,s2
ffffffffc0205db4:	d52ff0ef          	jal	ra,ffffffffc0205306 <dup_files>
ffffffffc0205db8:	8926                	mv	s2,s1
ffffffffc0205dba:	12051063          	bnez	a0,ffffffffc0205eda <do_fork+0x37e>
ffffffffc0205dbe:	01092783          	lw	a5,16(s2)
ffffffffc0205dc2:	2785                	addiw	a5,a5,1
ffffffffc0205dc4:	00f92823          	sw	a5,16(s2)
ffffffffc0205dc8:	152ab423          	sd	s2,328(s5)
ffffffffc0205dcc:	70e6                	ld	ra,120(sp)
ffffffffc0205dce:	8522                	mv	a0,s0
ffffffffc0205dd0:	7446                	ld	s0,112(sp)
ffffffffc0205dd2:	74a6                	ld	s1,104(sp)
ffffffffc0205dd4:	7906                	ld	s2,96(sp)
ffffffffc0205dd6:	69e6                	ld	s3,88(sp)
ffffffffc0205dd8:	6a46                	ld	s4,80(sp)
ffffffffc0205dda:	6aa6                	ld	s5,72(sp)
ffffffffc0205ddc:	6b06                	ld	s6,64(sp)
ffffffffc0205dde:	7be2                	ld	s7,56(sp)
ffffffffc0205de0:	7c42                	ld	s8,48(sp)
ffffffffc0205de2:	7ca2                	ld	s9,40(sp)
ffffffffc0205de4:	7d02                	ld	s10,32(sp)
ffffffffc0205de6:	6de2                	ld	s11,24(sp)
ffffffffc0205de8:	6109                	addi	sp,sp,128
ffffffffc0205dea:	8082                	ret
ffffffffc0205dec:	e1dfd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc0205df0:	e02a                	sd	a0,0(sp)
ffffffffc0205df2:	12050063          	beqz	a0,ffffffffc0205f12 <do_fork+0x3b6>
ffffffffc0205df6:	4505                	li	a0,1
ffffffffc0205df8:	b74fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205dfc:	c151                	beqz	a0,ffffffffc0205e80 <do_fork+0x324>
ffffffffc0205dfe:	000c3683          	ld	a3,0(s8)
ffffffffc0205e02:	000cb783          	ld	a5,0(s9)
ffffffffc0205e06:	40d506b3          	sub	a3,a0,a3
ffffffffc0205e0a:	8699                	srai	a3,a3,0x6
ffffffffc0205e0c:	96d2                	add	a3,a3,s4
ffffffffc0205e0e:	0166fb33          	and	s6,a3,s6
ffffffffc0205e12:	06b2                	slli	a3,a3,0xc
ffffffffc0205e14:	10fb7163          	bgeu	s6,a5,ffffffffc0205f16 <do_fork+0x3ba>
ffffffffc0205e18:	000dbb03          	ld	s6,0(s11)
ffffffffc0205e1c:	6605                	lui	a2,0x1
ffffffffc0205e1e:	00091597          	auipc	a1,0x91
ffffffffc0205e22:	a7a5b583          	ld	a1,-1414(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205e26:	9b36                	add	s6,s6,a3
ffffffffc0205e28:	855a                	mv	a0,s6
ffffffffc0205e2a:	664050ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0205e2e:	6702                	ld	a4,0(sp)
ffffffffc0205e30:	038d0793          	addi	a5,s10,56
ffffffffc0205e34:	853e                	mv	a0,a5
ffffffffc0205e36:	01673c23          	sd	s6,24(a4)
ffffffffc0205e3a:	e43e                	sd	a5,8(sp)
ffffffffc0205e3c:	f28fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205e40:	000bb683          	ld	a3,0(s7)
ffffffffc0205e44:	67a2                	ld	a5,8(sp)
ffffffffc0205e46:	c681                	beqz	a3,ffffffffc0205e4e <do_fork+0x2f2>
ffffffffc0205e48:	42d4                	lw	a3,4(a3)
ffffffffc0205e4a:	04dd2823          	sw	a3,80(s10)
ffffffffc0205e4e:	6502                	ld	a0,0(sp)
ffffffffc0205e50:	85ea                	mv	a1,s10
ffffffffc0205e52:	e43e                	sd	a5,8(sp)
ffffffffc0205e54:	804fe0ef          	jal	ra,ffffffffc0203e58 <dup_mmap>
ffffffffc0205e58:	67a2                	ld	a5,8(sp)
ffffffffc0205e5a:	8b2a                	mv	s6,a0
ffffffffc0205e5c:	853e                	mv	a0,a5
ffffffffc0205e5e:	f02fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205e62:	040d2823          	sw	zero,80(s10)
ffffffffc0205e66:	080b1063          	bnez	s6,ffffffffc0205ee6 <do_fork+0x38a>
ffffffffc0205e6a:	6d02                	ld	s10,0(sp)
ffffffffc0205e6c:	b375                	j	ffffffffc0205c18 <do_fork+0xbc>
ffffffffc0205e6e:	4785                	li	a5,1
ffffffffc0205e70:	00f82023          	sw	a5,0(a6)
ffffffffc0205e74:	4505                	li	a0,1
ffffffffc0205e76:	0008b317          	auipc	t1,0x8b
ffffffffc0205e7a:	1e630313          	addi	t1,t1,486 # ffffffffc029105c <next_safe.0>
ffffffffc0205e7e:	b5b1                	j	ffffffffc0205cca <do_fork+0x16e>
ffffffffc0205e80:	6502                	ld	a0,0(sp)
ffffffffc0205e82:	5471                	li	s0,-4
ffffffffc0205e84:	ed3fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205e88:	010ab683          	ld	a3,16(s5)
ffffffffc0205e8c:	c02007b7          	lui	a5,0xc0200
ffffffffc0205e90:	0cf6eb63          	bltu	a3,a5,ffffffffc0205f66 <do_fork+0x40a>
ffffffffc0205e94:	000db703          	ld	a4,0(s11)
ffffffffc0205e98:	000cb783          	ld	a5,0(s9)
ffffffffc0205e9c:	8e99                	sub	a3,a3,a4
ffffffffc0205e9e:	82b1                	srli	a3,a3,0xc
ffffffffc0205ea0:	0af6f763          	bgeu	a3,a5,ffffffffc0205f4e <do_fork+0x3f2>
ffffffffc0205ea4:	000c3503          	ld	a0,0(s8)
ffffffffc0205ea8:	414686b3          	sub	a3,a3,s4
ffffffffc0205eac:	069a                	slli	a3,a3,0x6
ffffffffc0205eae:	4589                	li	a1,2
ffffffffc0205eb0:	9536                	add	a0,a0,a3
ffffffffc0205eb2:	af8fc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205eb6:	8556                	mv	a0,s5
ffffffffc0205eb8:	986fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205ebc:	bf01                	j	ffffffffc0205dcc <do_fork+0x270>
ffffffffc0205ebe:	daffa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205ec2:	b5f1                	j	ffffffffc0205d8e <do_fork+0x232>
ffffffffc0205ec4:	01d6c363          	blt	a3,t4,ffffffffc0205eca <do_fork+0x36e>
ffffffffc0205ec8:	4685                	li	a3,1
ffffffffc0205eca:	4585                	li	a1,1
ffffffffc0205ecc:	bd19                	j	ffffffffc0205ce2 <do_fork+0x186>
ffffffffc0205ece:	da5fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205ed2:	4905                	li	s2,1
ffffffffc0205ed4:	b3d1                	j	ffffffffc0205c98 <do_fork+0x13c>
ffffffffc0205ed6:	5471                	li	s0,-4
ffffffffc0205ed8:	bff9                	j	ffffffffc0205eb6 <do_fork+0x35a>
ffffffffc0205eda:	8526                	mv	a0,s1
ffffffffc0205edc:	b28ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205ee0:	b765                	j	ffffffffc0205e88 <do_fork+0x32c>
ffffffffc0205ee2:	546d                	li	s0,-5
ffffffffc0205ee4:	b5e5                	j	ffffffffc0205dcc <do_fork+0x270>
ffffffffc0205ee6:	6482                	ld	s1,0(sp)
ffffffffc0205ee8:	5471                	li	s0,-4
ffffffffc0205eea:	8526                	mv	a0,s1
ffffffffc0205eec:	806fe0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0205ef0:	6c88                	ld	a0,24(s1)
ffffffffc0205ef2:	b8bff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0205ef6:	8526                	mv	a0,s1
ffffffffc0205ef8:	e5ffd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205efc:	b771                	j	ffffffffc0205e88 <do_fork+0x32c>
ffffffffc0205efe:	c599                	beqz	a1,ffffffffc0205f0c <do_fork+0x3b0>
ffffffffc0205f00:	00d82023          	sw	a3,0(a6)
ffffffffc0205f04:	8536                	mv	a0,a3
ffffffffc0205f06:	b505                	j	ffffffffc0205d26 <do_fork+0x1ca>
ffffffffc0205f08:	5471                	li	s0,-4
ffffffffc0205f0a:	b5c9                	j	ffffffffc0205dcc <do_fork+0x270>
ffffffffc0205f0c:	00082503          	lw	a0,0(a6)
ffffffffc0205f10:	bd19                	j	ffffffffc0205d26 <do_fork+0x1ca>
ffffffffc0205f12:	5471                	li	s0,-4
ffffffffc0205f14:	bf95                	j	ffffffffc0205e88 <do_fork+0x32c>
ffffffffc0205f16:	00006617          	auipc	a2,0x6
ffffffffc0205f1a:	52a60613          	addi	a2,a2,1322 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0205f1e:	07100593          	li	a1,113
ffffffffc0205f22:	00006517          	auipc	a0,0x6
ffffffffc0205f26:	54650513          	addi	a0,a0,1350 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0205f2a:	d74fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f2e:	00007697          	auipc	a3,0x7
ffffffffc0205f32:	4f268693          	addi	a3,a3,1266 # ffffffffc020d420 <CSWTCH.79+0xf0>
ffffffffc0205f36:	00006617          	auipc	a2,0x6
ffffffffc0205f3a:	9ea60613          	addi	a2,a2,-1558 # ffffffffc020b920 <commands+0x210>
ffffffffc0205f3e:	22f00593          	li	a1,559
ffffffffc0205f42:	00007517          	auipc	a0,0x7
ffffffffc0205f46:	4fe50513          	addi	a0,a0,1278 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0205f4a:	d54fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f4e:	00006617          	auipc	a2,0x6
ffffffffc0205f52:	5c260613          	addi	a2,a2,1474 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc0205f56:	06900593          	li	a1,105
ffffffffc0205f5a:	00006517          	auipc	a0,0x6
ffffffffc0205f5e:	50e50513          	addi	a0,a0,1294 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0205f62:	d3cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f66:	00006617          	auipc	a2,0x6
ffffffffc0205f6a:	58260613          	addi	a2,a2,1410 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0205f6e:	07700593          	li	a1,119
ffffffffc0205f72:	00006517          	auipc	a0,0x6
ffffffffc0205f76:	4f650513          	addi	a0,a0,1270 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0205f7a:	d24fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f7e:	00007697          	auipc	a3,0x7
ffffffffc0205f82:	4da68693          	addi	a3,a3,1242 # ffffffffc020d458 <CSWTCH.79+0x128>
ffffffffc0205f86:	00006617          	auipc	a2,0x6
ffffffffc0205f8a:	99a60613          	addi	a2,a2,-1638 # ffffffffc020b920 <commands+0x210>
ffffffffc0205f8e:	1cd00593          	li	a1,461
ffffffffc0205f92:	00007517          	auipc	a0,0x7
ffffffffc0205f96:	4ae50513          	addi	a0,a0,1198 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0205f9a:	d04fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f9e:	86be                	mv	a3,a5
ffffffffc0205fa0:	00006617          	auipc	a2,0x6
ffffffffc0205fa4:	54860613          	addi	a2,a2,1352 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0205fa8:	1ad00593          	li	a1,429
ffffffffc0205fac:	00007517          	auipc	a0,0x7
ffffffffc0205fb0:	49450513          	addi	a0,a0,1172 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0205fb4:	ceafa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205fb8 <kernel_thread>:
ffffffffc0205fb8:	7129                	addi	sp,sp,-320
ffffffffc0205fba:	fa22                	sd	s0,304(sp)
ffffffffc0205fbc:	f626                	sd	s1,296(sp)
ffffffffc0205fbe:	f24a                	sd	s2,288(sp)
ffffffffc0205fc0:	84ae                	mv	s1,a1
ffffffffc0205fc2:	892a                	mv	s2,a0
ffffffffc0205fc4:	8432                	mv	s0,a2
ffffffffc0205fc6:	4581                	li	a1,0
ffffffffc0205fc8:	12000613          	li	a2,288
ffffffffc0205fcc:	850a                	mv	a0,sp
ffffffffc0205fce:	fe06                	sd	ra,312(sp)
ffffffffc0205fd0:	46c050ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0205fd4:	e0ca                	sd	s2,64(sp)
ffffffffc0205fd6:	e4a6                	sd	s1,72(sp)
ffffffffc0205fd8:	100027f3          	csrr	a5,sstatus
ffffffffc0205fdc:	edd7f793          	andi	a5,a5,-291
ffffffffc0205fe0:	1207e793          	ori	a5,a5,288
ffffffffc0205fe4:	e23e                	sd	a5,256(sp)
ffffffffc0205fe6:	860a                	mv	a2,sp
ffffffffc0205fe8:	10046513          	ori	a0,s0,256
ffffffffc0205fec:	00000797          	auipc	a5,0x0
ffffffffc0205ff0:	9e078793          	addi	a5,a5,-1568 # ffffffffc02059cc <kernel_thread_entry>
ffffffffc0205ff4:	4581                	li	a1,0
ffffffffc0205ff6:	e63e                	sd	a5,264(sp)
ffffffffc0205ff8:	b65ff0ef          	jal	ra,ffffffffc0205b5c <do_fork>
ffffffffc0205ffc:	70f2                	ld	ra,312(sp)
ffffffffc0205ffe:	7452                	ld	s0,304(sp)
ffffffffc0206000:	74b2                	ld	s1,296(sp)
ffffffffc0206002:	7912                	ld	s2,288(sp)
ffffffffc0206004:	6131                	addi	sp,sp,320
ffffffffc0206006:	8082                	ret

ffffffffc0206008 <do_exit>:
ffffffffc0206008:	7179                	addi	sp,sp,-48
ffffffffc020600a:	f022                	sd	s0,32(sp)
ffffffffc020600c:	00091417          	auipc	s0,0x91
ffffffffc0206010:	8b440413          	addi	s0,s0,-1868 # ffffffffc02968c0 <current>
ffffffffc0206014:	601c                	ld	a5,0(s0)
ffffffffc0206016:	f406                	sd	ra,40(sp)
ffffffffc0206018:	ec26                	sd	s1,24(sp)
ffffffffc020601a:	e84a                	sd	s2,16(sp)
ffffffffc020601c:	e44e                	sd	s3,8(sp)
ffffffffc020601e:	e052                	sd	s4,0(sp)
ffffffffc0206020:	00091717          	auipc	a4,0x91
ffffffffc0206024:	8a873703          	ld	a4,-1880(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0206028:	0ee78763          	beq	a5,a4,ffffffffc0206116 <do_exit+0x10e>
ffffffffc020602c:	00091497          	auipc	s1,0x91
ffffffffc0206030:	8a448493          	addi	s1,s1,-1884 # ffffffffc02968d0 <initproc>
ffffffffc0206034:	6098                	ld	a4,0(s1)
ffffffffc0206036:	10e78763          	beq	a5,a4,ffffffffc0206144 <do_exit+0x13c>
ffffffffc020603a:	0287b983          	ld	s3,40(a5)
ffffffffc020603e:	892a                	mv	s2,a0
ffffffffc0206040:	02098e63          	beqz	s3,ffffffffc020607c <do_exit+0x74>
ffffffffc0206044:	00091797          	auipc	a5,0x91
ffffffffc0206048:	84c7b783          	ld	a5,-1972(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020604c:	577d                	li	a4,-1
ffffffffc020604e:	177e                	slli	a4,a4,0x3f
ffffffffc0206050:	83b1                	srli	a5,a5,0xc
ffffffffc0206052:	8fd9                	or	a5,a5,a4
ffffffffc0206054:	18079073          	csrw	satp,a5
ffffffffc0206058:	0309a783          	lw	a5,48(s3)
ffffffffc020605c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206060:	02e9a823          	sw	a4,48(s3)
ffffffffc0206064:	c769                	beqz	a4,ffffffffc020612e <do_exit+0x126>
ffffffffc0206066:	601c                	ld	a5,0(s0)
ffffffffc0206068:	1487b503          	ld	a0,328(a5)
ffffffffc020606c:	0207b423          	sd	zero,40(a5)
ffffffffc0206070:	c511                	beqz	a0,ffffffffc020607c <do_exit+0x74>
ffffffffc0206072:	491c                	lw	a5,16(a0)
ffffffffc0206074:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206078:	c918                	sw	a4,16(a0)
ffffffffc020607a:	cb59                	beqz	a4,ffffffffc0206110 <do_exit+0x108>
ffffffffc020607c:	601c                	ld	a5,0(s0)
ffffffffc020607e:	470d                	li	a4,3
ffffffffc0206080:	c398                	sw	a4,0(a5)
ffffffffc0206082:	0f27a423          	sw	s2,232(a5)
ffffffffc0206086:	100027f3          	csrr	a5,sstatus
ffffffffc020608a:	8b89                	andi	a5,a5,2
ffffffffc020608c:	4a01                	li	s4,0
ffffffffc020608e:	e7f9                	bnez	a5,ffffffffc020615c <do_exit+0x154>
ffffffffc0206090:	6018                	ld	a4,0(s0)
ffffffffc0206092:	800007b7          	lui	a5,0x80000
ffffffffc0206096:	0785                	addi	a5,a5,1
ffffffffc0206098:	7308                	ld	a0,32(a4)
ffffffffc020609a:	0ec52703          	lw	a4,236(a0)
ffffffffc020609e:	0cf70363          	beq	a4,a5,ffffffffc0206164 <do_exit+0x15c>
ffffffffc02060a2:	6018                	ld	a4,0(s0)
ffffffffc02060a4:	7b7c                	ld	a5,240(a4)
ffffffffc02060a6:	c3a1                	beqz	a5,ffffffffc02060e6 <do_exit+0xde>
ffffffffc02060a8:	800009b7          	lui	s3,0x80000
ffffffffc02060ac:	490d                	li	s2,3
ffffffffc02060ae:	0985                	addi	s3,s3,1
ffffffffc02060b0:	a021                	j	ffffffffc02060b8 <do_exit+0xb0>
ffffffffc02060b2:	6018                	ld	a4,0(s0)
ffffffffc02060b4:	7b7c                	ld	a5,240(a4)
ffffffffc02060b6:	cb85                	beqz	a5,ffffffffc02060e6 <do_exit+0xde>
ffffffffc02060b8:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc02060bc:	6088                	ld	a0,0(s1)
ffffffffc02060be:	fb74                	sd	a3,240(a4)
ffffffffc02060c0:	7978                	ld	a4,240(a0)
ffffffffc02060c2:	0e07bc23          	sd	zero,248(a5)
ffffffffc02060c6:	10e7b023          	sd	a4,256(a5)
ffffffffc02060ca:	c311                	beqz	a4,ffffffffc02060ce <do_exit+0xc6>
ffffffffc02060cc:	ff7c                	sd	a5,248(a4)
ffffffffc02060ce:	4398                	lw	a4,0(a5)
ffffffffc02060d0:	f388                	sd	a0,32(a5)
ffffffffc02060d2:	f97c                	sd	a5,240(a0)
ffffffffc02060d4:	fd271fe3          	bne	a4,s2,ffffffffc02060b2 <do_exit+0xaa>
ffffffffc02060d8:	0ec52783          	lw	a5,236(a0)
ffffffffc02060dc:	fd379be3          	bne	a5,s3,ffffffffc02060b2 <do_exit+0xaa>
ffffffffc02060e0:	13e010ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc02060e4:	b7f9                	j	ffffffffc02060b2 <do_exit+0xaa>
ffffffffc02060e6:	020a1263          	bnez	s4,ffffffffc020610a <do_exit+0x102>
ffffffffc02060ea:	1e6010ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc02060ee:	601c                	ld	a5,0(s0)
ffffffffc02060f0:	00007617          	auipc	a2,0x7
ffffffffc02060f4:	3a060613          	addi	a2,a2,928 # ffffffffc020d490 <CSWTCH.79+0x160>
ffffffffc02060f8:	29d00593          	li	a1,669
ffffffffc02060fc:	43d4                	lw	a3,4(a5)
ffffffffc02060fe:	00007517          	auipc	a0,0x7
ffffffffc0206102:	34250513          	addi	a0,a0,834 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206106:	b98fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020610a:	b63fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020610e:	bff1                	j	ffffffffc02060ea <do_exit+0xe2>
ffffffffc0206110:	8f4ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0206114:	b7a5                	j	ffffffffc020607c <do_exit+0x74>
ffffffffc0206116:	00007617          	auipc	a2,0x7
ffffffffc020611a:	35a60613          	addi	a2,a2,858 # ffffffffc020d470 <CSWTCH.79+0x140>
ffffffffc020611e:	26800593          	li	a1,616
ffffffffc0206122:	00007517          	auipc	a0,0x7
ffffffffc0206126:	31e50513          	addi	a0,a0,798 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc020612a:	b74fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020612e:	854e                	mv	a0,s3
ffffffffc0206130:	dc3fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206134:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc0206138:	945ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc020613c:	854e                	mv	a0,s3
ffffffffc020613e:	c19fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206142:	b715                	j	ffffffffc0206066 <do_exit+0x5e>
ffffffffc0206144:	00007617          	auipc	a2,0x7
ffffffffc0206148:	33c60613          	addi	a2,a2,828 # ffffffffc020d480 <CSWTCH.79+0x150>
ffffffffc020614c:	26c00593          	li	a1,620
ffffffffc0206150:	00007517          	auipc	a0,0x7
ffffffffc0206154:	2f050513          	addi	a0,a0,752 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206158:	b46fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020615c:	b17fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206160:	4a05                	li	s4,1
ffffffffc0206162:	b73d                	j	ffffffffc0206090 <do_exit+0x88>
ffffffffc0206164:	0ba010ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc0206168:	bf2d                	j	ffffffffc02060a2 <do_exit+0x9a>

ffffffffc020616a <do_wait.part.0>:
ffffffffc020616a:	715d                	addi	sp,sp,-80
ffffffffc020616c:	f84a                	sd	s2,48(sp)
ffffffffc020616e:	f44e                	sd	s3,40(sp)
ffffffffc0206170:	80000937          	lui	s2,0x80000
ffffffffc0206174:	6989                	lui	s3,0x2
ffffffffc0206176:	fc26                	sd	s1,56(sp)
ffffffffc0206178:	f052                	sd	s4,32(sp)
ffffffffc020617a:	ec56                	sd	s5,24(sp)
ffffffffc020617c:	e85a                	sd	s6,16(sp)
ffffffffc020617e:	e45e                	sd	s7,8(sp)
ffffffffc0206180:	e486                	sd	ra,72(sp)
ffffffffc0206182:	e0a2                	sd	s0,64(sp)
ffffffffc0206184:	84aa                	mv	s1,a0
ffffffffc0206186:	8a2e                	mv	s4,a1
ffffffffc0206188:	00090b97          	auipc	s7,0x90
ffffffffc020618c:	738b8b93          	addi	s7,s7,1848 # ffffffffc02968c0 <current>
ffffffffc0206190:	00050b1b          	sext.w	s6,a0
ffffffffc0206194:	fff50a9b          	addiw	s5,a0,-1
ffffffffc0206198:	19f9                	addi	s3,s3,-2
ffffffffc020619a:	0905                	addi	s2,s2,1
ffffffffc020619c:	ccbd                	beqz	s1,ffffffffc020621a <do_wait.part.0+0xb0>
ffffffffc020619e:	0359e863          	bltu	s3,s5,ffffffffc02061ce <do_wait.part.0+0x64>
ffffffffc02061a2:	45a9                	li	a1,10
ffffffffc02061a4:	855a                	mv	a0,s6
ffffffffc02061a6:	563040ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc02061aa:	02051793          	slli	a5,a0,0x20
ffffffffc02061ae:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02061b2:	0008b797          	auipc	a5,0x8b
ffffffffc02061b6:	60e78793          	addi	a5,a5,1550 # ffffffffc02917c0 <hash_list>
ffffffffc02061ba:	953e                	add	a0,a0,a5
ffffffffc02061bc:	842a                	mv	s0,a0
ffffffffc02061be:	a029                	j	ffffffffc02061c8 <do_wait.part.0+0x5e>
ffffffffc02061c0:	f2c42783          	lw	a5,-212(s0)
ffffffffc02061c4:	02978163          	beq	a5,s1,ffffffffc02061e6 <do_wait.part.0+0x7c>
ffffffffc02061c8:	6400                	ld	s0,8(s0)
ffffffffc02061ca:	fe851be3          	bne	a0,s0,ffffffffc02061c0 <do_wait.part.0+0x56>
ffffffffc02061ce:	5579                	li	a0,-2
ffffffffc02061d0:	60a6                	ld	ra,72(sp)
ffffffffc02061d2:	6406                	ld	s0,64(sp)
ffffffffc02061d4:	74e2                	ld	s1,56(sp)
ffffffffc02061d6:	7942                	ld	s2,48(sp)
ffffffffc02061d8:	79a2                	ld	s3,40(sp)
ffffffffc02061da:	7a02                	ld	s4,32(sp)
ffffffffc02061dc:	6ae2                	ld	s5,24(sp)
ffffffffc02061de:	6b42                	ld	s6,16(sp)
ffffffffc02061e0:	6ba2                	ld	s7,8(sp)
ffffffffc02061e2:	6161                	addi	sp,sp,80
ffffffffc02061e4:	8082                	ret
ffffffffc02061e6:	000bb683          	ld	a3,0(s7)
ffffffffc02061ea:	f4843783          	ld	a5,-184(s0)
ffffffffc02061ee:	fed790e3          	bne	a5,a3,ffffffffc02061ce <do_wait.part.0+0x64>
ffffffffc02061f2:	f2842703          	lw	a4,-216(s0)
ffffffffc02061f6:	478d                	li	a5,3
ffffffffc02061f8:	0ef70b63          	beq	a4,a5,ffffffffc02062ee <do_wait.part.0+0x184>
ffffffffc02061fc:	4785                	li	a5,1
ffffffffc02061fe:	c29c                	sw	a5,0(a3)
ffffffffc0206200:	0f26a623          	sw	s2,236(a3)
ffffffffc0206204:	0cc010ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0206208:	000bb783          	ld	a5,0(s7)
ffffffffc020620c:	0b07a783          	lw	a5,176(a5)
ffffffffc0206210:	8b85                	andi	a5,a5,1
ffffffffc0206212:	d7c9                	beqz	a5,ffffffffc020619c <do_wait.part.0+0x32>
ffffffffc0206214:	555d                	li	a0,-9
ffffffffc0206216:	df3ff0ef          	jal	ra,ffffffffc0206008 <do_exit>
ffffffffc020621a:	000bb683          	ld	a3,0(s7)
ffffffffc020621e:	7ae0                	ld	s0,240(a3)
ffffffffc0206220:	d45d                	beqz	s0,ffffffffc02061ce <do_wait.part.0+0x64>
ffffffffc0206222:	470d                	li	a4,3
ffffffffc0206224:	a021                	j	ffffffffc020622c <do_wait.part.0+0xc2>
ffffffffc0206226:	10043403          	ld	s0,256(s0)
ffffffffc020622a:	d869                	beqz	s0,ffffffffc02061fc <do_wait.part.0+0x92>
ffffffffc020622c:	401c                	lw	a5,0(s0)
ffffffffc020622e:	fee79ce3          	bne	a5,a4,ffffffffc0206226 <do_wait.part.0+0xbc>
ffffffffc0206232:	00090797          	auipc	a5,0x90
ffffffffc0206236:	6967b783          	ld	a5,1686(a5) # ffffffffc02968c8 <idleproc>
ffffffffc020623a:	0c878963          	beq	a5,s0,ffffffffc020630c <do_wait.part.0+0x1a2>
ffffffffc020623e:	00090797          	auipc	a5,0x90
ffffffffc0206242:	6927b783          	ld	a5,1682(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206246:	0cf40363          	beq	s0,a5,ffffffffc020630c <do_wait.part.0+0x1a2>
ffffffffc020624a:	000a0663          	beqz	s4,ffffffffc0206256 <do_wait.part.0+0xec>
ffffffffc020624e:	0e842783          	lw	a5,232(s0)
ffffffffc0206252:	00fa2023          	sw	a5,0(s4)
ffffffffc0206256:	100027f3          	csrr	a5,sstatus
ffffffffc020625a:	8b89                	andi	a5,a5,2
ffffffffc020625c:	4581                	li	a1,0
ffffffffc020625e:	e7c1                	bnez	a5,ffffffffc02062e6 <do_wait.part.0+0x17c>
ffffffffc0206260:	6c70                	ld	a2,216(s0)
ffffffffc0206262:	7074                	ld	a3,224(s0)
ffffffffc0206264:	10043703          	ld	a4,256(s0)
ffffffffc0206268:	7c7c                	ld	a5,248(s0)
ffffffffc020626a:	e614                	sd	a3,8(a2)
ffffffffc020626c:	e290                	sd	a2,0(a3)
ffffffffc020626e:	6470                	ld	a2,200(s0)
ffffffffc0206270:	6874                	ld	a3,208(s0)
ffffffffc0206272:	e614                	sd	a3,8(a2)
ffffffffc0206274:	e290                	sd	a2,0(a3)
ffffffffc0206276:	c319                	beqz	a4,ffffffffc020627c <do_wait.part.0+0x112>
ffffffffc0206278:	ff7c                	sd	a5,248(a4)
ffffffffc020627a:	7c7c                	ld	a5,248(s0)
ffffffffc020627c:	c3b5                	beqz	a5,ffffffffc02062e0 <do_wait.part.0+0x176>
ffffffffc020627e:	10e7b023          	sd	a4,256(a5)
ffffffffc0206282:	00090717          	auipc	a4,0x90
ffffffffc0206286:	65670713          	addi	a4,a4,1622 # ffffffffc02968d8 <nr_process>
ffffffffc020628a:	431c                	lw	a5,0(a4)
ffffffffc020628c:	37fd                	addiw	a5,a5,-1
ffffffffc020628e:	c31c                	sw	a5,0(a4)
ffffffffc0206290:	e5a9                	bnez	a1,ffffffffc02062da <do_wait.part.0+0x170>
ffffffffc0206292:	6814                	ld	a3,16(s0)
ffffffffc0206294:	c02007b7          	lui	a5,0xc0200
ffffffffc0206298:	04f6ee63          	bltu	a3,a5,ffffffffc02062f4 <do_wait.part.0+0x18a>
ffffffffc020629c:	00090797          	auipc	a5,0x90
ffffffffc02062a0:	61c7b783          	ld	a5,1564(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02062a4:	8e9d                	sub	a3,a3,a5
ffffffffc02062a6:	82b1                	srli	a3,a3,0xc
ffffffffc02062a8:	00090797          	auipc	a5,0x90
ffffffffc02062ac:	5f87b783          	ld	a5,1528(a5) # ffffffffc02968a0 <npage>
ffffffffc02062b0:	06f6fa63          	bgeu	a3,a5,ffffffffc0206324 <do_wait.part.0+0x1ba>
ffffffffc02062b4:	00009517          	auipc	a0,0x9
ffffffffc02062b8:	4b453503          	ld	a0,1204(a0) # ffffffffc020f768 <nbase>
ffffffffc02062bc:	8e89                	sub	a3,a3,a0
ffffffffc02062be:	069a                	slli	a3,a3,0x6
ffffffffc02062c0:	00090517          	auipc	a0,0x90
ffffffffc02062c4:	5e853503          	ld	a0,1512(a0) # ffffffffc02968a8 <pages>
ffffffffc02062c8:	9536                	add	a0,a0,a3
ffffffffc02062ca:	4589                	li	a1,2
ffffffffc02062cc:	edffb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02062d0:	8522                	mv	a0,s0
ffffffffc02062d2:	d6dfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02062d6:	4501                	li	a0,0
ffffffffc02062d8:	bde5                	j	ffffffffc02061d0 <do_wait.part.0+0x66>
ffffffffc02062da:	993fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02062de:	bf55                	j	ffffffffc0206292 <do_wait.part.0+0x128>
ffffffffc02062e0:	701c                	ld	a5,32(s0)
ffffffffc02062e2:	fbf8                	sd	a4,240(a5)
ffffffffc02062e4:	bf79                	j	ffffffffc0206282 <do_wait.part.0+0x118>
ffffffffc02062e6:	98dfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02062ea:	4585                	li	a1,1
ffffffffc02062ec:	bf95                	j	ffffffffc0206260 <do_wait.part.0+0xf6>
ffffffffc02062ee:	f2840413          	addi	s0,s0,-216
ffffffffc02062f2:	b781                	j	ffffffffc0206232 <do_wait.part.0+0xc8>
ffffffffc02062f4:	00006617          	auipc	a2,0x6
ffffffffc02062f8:	1f460613          	addi	a2,a2,500 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc02062fc:	07700593          	li	a1,119
ffffffffc0206300:	00006517          	auipc	a0,0x6
ffffffffc0206304:	16850513          	addi	a0,a0,360 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0206308:	996fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020630c:	00007617          	auipc	a2,0x7
ffffffffc0206310:	1a460613          	addi	a2,a2,420 # ffffffffc020d4b0 <CSWTCH.79+0x180>
ffffffffc0206314:	43500593          	li	a1,1077
ffffffffc0206318:	00007517          	auipc	a0,0x7
ffffffffc020631c:	12850513          	addi	a0,a0,296 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206320:	97efa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206324:	00006617          	auipc	a2,0x6
ffffffffc0206328:	1ec60613          	addi	a2,a2,492 # ffffffffc020c510 <default_pmm_manager+0x108>
ffffffffc020632c:	06900593          	li	a1,105
ffffffffc0206330:	00006517          	auipc	a0,0x6
ffffffffc0206334:	13850513          	addi	a0,a0,312 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0206338:	966fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020633c <init_main>:
ffffffffc020633c:	1141                	addi	sp,sp,-16
ffffffffc020633e:	00007517          	auipc	a0,0x7
ffffffffc0206342:	19250513          	addi	a0,a0,402 # ffffffffc020d4d0 <CSWTCH.79+0x1a0>
ffffffffc0206346:	e406                	sd	ra,8(sp)
ffffffffc0206348:	6f8010ef          	jal	ra,ffffffffc0207a40 <vfs_set_bootfs>
ffffffffc020634c:	e179                	bnez	a0,ffffffffc0206412 <init_main+0xd6>
ffffffffc020634e:	e9dfb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0206352:	c39fb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206356:	4601                	li	a2,0
ffffffffc0206358:	4581                	li	a1,0
ffffffffc020635a:	00001517          	auipc	a0,0x1
ffffffffc020635e:	91e50513          	addi	a0,a0,-1762 # ffffffffc0206c78 <user_main>
ffffffffc0206362:	c57ff0ef          	jal	ra,ffffffffc0205fb8 <kernel_thread>
ffffffffc0206366:	00a04563          	bgtz	a0,ffffffffc0206370 <init_main+0x34>
ffffffffc020636a:	a841                	j	ffffffffc02063fa <init_main+0xbe>
ffffffffc020636c:	765000ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0206370:	4581                	li	a1,0
ffffffffc0206372:	4501                	li	a0,0
ffffffffc0206374:	df7ff0ef          	jal	ra,ffffffffc020616a <do_wait.part.0>
ffffffffc0206378:	d975                	beqz	a0,ffffffffc020636c <init_main+0x30>
ffffffffc020637a:	e45fe0ef          	jal	ra,ffffffffc02051be <fs_cleanup>
ffffffffc020637e:	00007517          	auipc	a0,0x7
ffffffffc0206382:	19a50513          	addi	a0,a0,410 # ffffffffc020d518 <CSWTCH.79+0x1e8>
ffffffffc0206386:	e21f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020638a:	00090797          	auipc	a5,0x90
ffffffffc020638e:	5467b783          	ld	a5,1350(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206392:	7bf8                	ld	a4,240(a5)
ffffffffc0206394:	e339                	bnez	a4,ffffffffc02063da <init_main+0x9e>
ffffffffc0206396:	7ff8                	ld	a4,248(a5)
ffffffffc0206398:	e329                	bnez	a4,ffffffffc02063da <init_main+0x9e>
ffffffffc020639a:	1007b703          	ld	a4,256(a5)
ffffffffc020639e:	ef15                	bnez	a4,ffffffffc02063da <init_main+0x9e>
ffffffffc02063a0:	00090697          	auipc	a3,0x90
ffffffffc02063a4:	5386a683          	lw	a3,1336(a3) # ffffffffc02968d8 <nr_process>
ffffffffc02063a8:	4709                	li	a4,2
ffffffffc02063aa:	0ce69163          	bne	a3,a4,ffffffffc020646c <init_main+0x130>
ffffffffc02063ae:	0008f717          	auipc	a4,0x8f
ffffffffc02063b2:	41270713          	addi	a4,a4,1042 # ffffffffc02957c0 <proc_list>
ffffffffc02063b6:	6714                	ld	a3,8(a4)
ffffffffc02063b8:	0c878793          	addi	a5,a5,200
ffffffffc02063bc:	08d79863          	bne	a5,a3,ffffffffc020644c <init_main+0x110>
ffffffffc02063c0:	6318                	ld	a4,0(a4)
ffffffffc02063c2:	06e79563          	bne	a5,a4,ffffffffc020642c <init_main+0xf0>
ffffffffc02063c6:	00007517          	auipc	a0,0x7
ffffffffc02063ca:	23a50513          	addi	a0,a0,570 # ffffffffc020d600 <CSWTCH.79+0x2d0>
ffffffffc02063ce:	dd9f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063d2:	60a2                	ld	ra,8(sp)
ffffffffc02063d4:	4501                	li	a0,0
ffffffffc02063d6:	0141                	addi	sp,sp,16
ffffffffc02063d8:	8082                	ret
ffffffffc02063da:	00007697          	auipc	a3,0x7
ffffffffc02063de:	16668693          	addi	a3,a3,358 # ffffffffc020d540 <CSWTCH.79+0x210>
ffffffffc02063e2:	00005617          	auipc	a2,0x5
ffffffffc02063e6:	53e60613          	addi	a2,a2,1342 # ffffffffc020b920 <commands+0x210>
ffffffffc02063ea:	4ab00593          	li	a1,1195
ffffffffc02063ee:	00007517          	auipc	a0,0x7
ffffffffc02063f2:	05250513          	addi	a0,a0,82 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc02063f6:	8a8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063fa:	00007617          	auipc	a2,0x7
ffffffffc02063fe:	0fe60613          	addi	a2,a2,254 # ffffffffc020d4f8 <CSWTCH.79+0x1c8>
ffffffffc0206402:	49e00593          	li	a1,1182
ffffffffc0206406:	00007517          	auipc	a0,0x7
ffffffffc020640a:	03a50513          	addi	a0,a0,58 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc020640e:	890fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206412:	86aa                	mv	a3,a0
ffffffffc0206414:	00007617          	auipc	a2,0x7
ffffffffc0206418:	0c460613          	addi	a2,a2,196 # ffffffffc020d4d8 <CSWTCH.79+0x1a8>
ffffffffc020641c:	49600593          	li	a1,1174
ffffffffc0206420:	00007517          	auipc	a0,0x7
ffffffffc0206424:	02050513          	addi	a0,a0,32 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206428:	876fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020642c:	00007697          	auipc	a3,0x7
ffffffffc0206430:	1a468693          	addi	a3,a3,420 # ffffffffc020d5d0 <CSWTCH.79+0x2a0>
ffffffffc0206434:	00005617          	auipc	a2,0x5
ffffffffc0206438:	4ec60613          	addi	a2,a2,1260 # ffffffffc020b920 <commands+0x210>
ffffffffc020643c:	4ae00593          	li	a1,1198
ffffffffc0206440:	00007517          	auipc	a0,0x7
ffffffffc0206444:	00050513          	mv	a0,a0
ffffffffc0206448:	856fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020644c:	00007697          	auipc	a3,0x7
ffffffffc0206450:	15468693          	addi	a3,a3,340 # ffffffffc020d5a0 <CSWTCH.79+0x270>
ffffffffc0206454:	00005617          	auipc	a2,0x5
ffffffffc0206458:	4cc60613          	addi	a2,a2,1228 # ffffffffc020b920 <commands+0x210>
ffffffffc020645c:	4ad00593          	li	a1,1197
ffffffffc0206460:	00007517          	auipc	a0,0x7
ffffffffc0206464:	fe050513          	addi	a0,a0,-32 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206468:	836fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020646c:	00007697          	auipc	a3,0x7
ffffffffc0206470:	12468693          	addi	a3,a3,292 # ffffffffc020d590 <CSWTCH.79+0x260>
ffffffffc0206474:	00005617          	auipc	a2,0x5
ffffffffc0206478:	4ac60613          	addi	a2,a2,1196 # ffffffffc020b920 <commands+0x210>
ffffffffc020647c:	4ac00593          	li	a1,1196
ffffffffc0206480:	00007517          	auipc	a0,0x7
ffffffffc0206484:	fc050513          	addi	a0,a0,-64 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206488:	816fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020648c <do_execve>:
ffffffffc020648c:	db010113          	addi	sp,sp,-592
ffffffffc0206490:	22913c23          	sd	s1,568(sp)
ffffffffc0206494:	00090497          	auipc	s1,0x90
ffffffffc0206498:	42c48493          	addi	s1,s1,1068 # ffffffffc02968c0 <current>
ffffffffc020649c:	6094                	ld	a3,0(s1)
ffffffffc020649e:	fff5871b          	addiw	a4,a1,-1
ffffffffc02064a2:	21513c23          	sd	s5,536(sp)
ffffffffc02064a6:	24113423          	sd	ra,584(sp)
ffffffffc02064aa:	24813023          	sd	s0,576(sp)
ffffffffc02064ae:	23213823          	sd	s2,560(sp)
ffffffffc02064b2:	23313423          	sd	s3,552(sp)
ffffffffc02064b6:	23413023          	sd	s4,544(sp)
ffffffffc02064ba:	21613823          	sd	s6,528(sp)
ffffffffc02064be:	21713423          	sd	s7,520(sp)
ffffffffc02064c2:	21813023          	sd	s8,512(sp)
ffffffffc02064c6:	ffe6                	sd	s9,504(sp)
ffffffffc02064c8:	fbea                	sd	s10,496(sp)
ffffffffc02064ca:	f7ee                	sd	s11,488(sp)
ffffffffc02064cc:	f42e                	sd	a1,40(sp)
ffffffffc02064ce:	dc3a                	sw	a4,56(sp)
ffffffffc02064d0:	47fd                	li	a5,31
ffffffffc02064d2:	0286ba83          	ld	s5,40(a3)
ffffffffc02064d6:	6ae7e663          	bltu	a5,a4,ffffffffc0206b82 <do_execve+0x6f6>
ffffffffc02064da:	842a                	mv	s0,a0
ffffffffc02064dc:	8b32                	mv	s6,a2
ffffffffc02064de:	4581                	li	a1,0
ffffffffc02064e0:	4641                	li	a2,16
ffffffffc02064e2:	08a8                	addi	a0,sp,88
ffffffffc02064e4:	759040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc02064e8:	000a8b63          	beqz	s5,ffffffffc02064fe <do_execve+0x72>
ffffffffc02064ec:	038a8513          	addi	a0,s5,56
ffffffffc02064f0:	874fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02064f4:	609c                	ld	a5,0(s1)
ffffffffc02064f6:	c781                	beqz	a5,ffffffffc02064fe <do_execve+0x72>
ffffffffc02064f8:	43dc                	lw	a5,4(a5)
ffffffffc02064fa:	04faa823          	sw	a5,80(s5)
ffffffffc02064fe:	54040363          	beqz	s0,ffffffffc0206a44 <do_execve+0x5b8>
ffffffffc0206502:	46c1                	li	a3,16
ffffffffc0206504:	8622                	mv	a2,s0
ffffffffc0206506:	08ac                	addi	a1,sp,88
ffffffffc0206508:	8556                	mv	a0,s5
ffffffffc020650a:	e83fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc020650e:	68050363          	beqz	a0,ffffffffc0206b94 <do_execve+0x708>
ffffffffc0206512:	7ba2                	ld	s7,40(sp)
ffffffffc0206514:	4681                	li	a3,0
ffffffffc0206516:	85da                	mv	a1,s6
ffffffffc0206518:	003b9793          	slli	a5,s7,0x3
ffffffffc020651c:	863e                	mv	a2,a5
ffffffffc020651e:	8556                	mv	a0,s5
ffffffffc0206520:	f83e                	sd	a5,48(sp)
ffffffffc0206522:	d71fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206526:	845a                	mv	s0,s6
ffffffffc0206528:	66050263          	beqz	a0,ffffffffc0206b8c <do_execve+0x700>
ffffffffc020652c:	1184                	addi	s1,sp,224
ffffffffc020652e:	4a01                	li	s4,0
ffffffffc0206530:	a011                	j	ffffffffc0206534 <do_execve+0xa8>
ffffffffc0206532:	8a4e                	mv	s4,s3
ffffffffc0206534:	6505                	lui	a0,0x1
ffffffffc0206536:	a59fb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020653a:	89aa                	mv	s3,a0
ffffffffc020653c:	4a050c63          	beqz	a0,ffffffffc02069f4 <do_execve+0x568>
ffffffffc0206540:	6010                	ld	a2,0(s0)
ffffffffc0206542:	85aa                	mv	a1,a0
ffffffffc0206544:	6685                	lui	a3,0x1
ffffffffc0206546:	8556                	mv	a0,s5
ffffffffc0206548:	e45fd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc020654c:	4e050763          	beqz	a0,ffffffffc0206a3a <do_execve+0x5ae>
ffffffffc0206550:	0134b023          	sd	s3,0(s1)
ffffffffc0206554:	001a099b          	addiw	s3,s4,1
ffffffffc0206558:	04a1                	addi	s1,s1,8
ffffffffc020655a:	0421                	addi	s0,s0,8
ffffffffc020655c:	fd3b9be3          	bne	s7,s3,ffffffffc0206532 <do_execve+0xa6>
ffffffffc0206560:	000b3403          	ld	s0,0(s6)
ffffffffc0206564:	320a8663          	beqz	s5,ffffffffc0206890 <do_execve+0x404>
ffffffffc0206568:	038a8513          	addi	a0,s5,56
ffffffffc020656c:	ff5fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206570:	00090797          	auipc	a5,0x90
ffffffffc0206574:	35078793          	addi	a5,a5,848 # ffffffffc02968c0 <current>
ffffffffc0206578:	639c                	ld	a5,0(a5)
ffffffffc020657a:	040aa823          	sw	zero,80(s5)
ffffffffc020657e:	1487b503          	ld	a0,328(a5)
ffffffffc0206582:	d19fe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc0206586:	4581                	li	a1,0
ffffffffc0206588:	8522                	mv	a0,s0
ffffffffc020658a:	f9dfe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc020658e:	8c2a                	mv	s8,a0
ffffffffc0206590:	3e054f63          	bltz	a0,ffffffffc020698e <do_execve+0x502>
ffffffffc0206594:	00090797          	auipc	a5,0x90
ffffffffc0206598:	2fc7b783          	ld	a5,764(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020659c:	577d                	li	a4,-1
ffffffffc020659e:	177e                	slli	a4,a4,0x3f
ffffffffc02065a0:	83b1                	srli	a5,a5,0xc
ffffffffc02065a2:	8fd9                	or	a5,a5,a4
ffffffffc02065a4:	18079073          	csrw	satp,a5
ffffffffc02065a8:	030aa783          	lw	a5,48(s5)
ffffffffc02065ac:	fff7871b          	addiw	a4,a5,-1
ffffffffc02065b0:	02eaa823          	sw	a4,48(s5)
ffffffffc02065b4:	5a070c63          	beqz	a4,ffffffffc0206b6c <do_execve+0x6e0>
ffffffffc02065b8:	00090797          	auipc	a5,0x90
ffffffffc02065bc:	30878793          	addi	a5,a5,776 # ffffffffc02968c0 <current>
ffffffffc02065c0:	639c                	ld	a5,0(a5)
ffffffffc02065c2:	0207b423          	sd	zero,40(a5)
ffffffffc02065c6:	e42fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc02065ca:	8aaa                	mv	s5,a0
ffffffffc02065cc:	5c050e63          	beqz	a0,ffffffffc0206ba8 <do_execve+0x71c>
ffffffffc02065d0:	4505                	li	a0,1
ffffffffc02065d2:	b9bfb0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02065d6:	3a050863          	beqz	a0,ffffffffc0206986 <do_execve+0x4fa>
ffffffffc02065da:	00090797          	auipc	a5,0x90
ffffffffc02065de:	2ce78793          	addi	a5,a5,718 # ffffffffc02968a8 <pages>
ffffffffc02065e2:	6394                	ld	a3,0(a5)
ffffffffc02065e4:	00009717          	auipc	a4,0x9
ffffffffc02065e8:	18473703          	ld	a4,388(a4) # ffffffffc020f768 <nbase>
ffffffffc02065ec:	00090d97          	auipc	s11,0x90
ffffffffc02065f0:	2b4d8d93          	addi	s11,s11,692 # ffffffffc02968a0 <npage>
ffffffffc02065f4:	40d506b3          	sub	a3,a0,a3
ffffffffc02065f8:	8699                	srai	a3,a3,0x6
ffffffffc02065fa:	96ba                	add	a3,a3,a4
ffffffffc02065fc:	ec3a                	sd	a4,24(sp)
ffffffffc02065fe:	000db783          	ld	a5,0(s11)
ffffffffc0206602:	577d                	li	a4,-1
ffffffffc0206604:	8331                	srli	a4,a4,0xc
ffffffffc0206606:	e43a                	sd	a4,8(sp)
ffffffffc0206608:	8f75                	and	a4,a4,a3
ffffffffc020660a:	06b2                	slli	a3,a3,0xc
ffffffffc020660c:	5af77163          	bgeu	a4,a5,ffffffffc0206bae <do_execve+0x722>
ffffffffc0206610:	00090797          	auipc	a5,0x90
ffffffffc0206614:	2a878793          	addi	a5,a5,680 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206618:	6380                	ld	s0,0(a5)
ffffffffc020661a:	6605                	lui	a2,0x1
ffffffffc020661c:	00090597          	auipc	a1,0x90
ffffffffc0206620:	27c5b583          	ld	a1,636(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0206624:	9436                	add	s0,s0,a3
ffffffffc0206626:	8522                	mv	a0,s0
ffffffffc0206628:	667040ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020662c:	4601                	li	a2,0
ffffffffc020662e:	008abc23          	sd	s0,24(s5)
ffffffffc0206632:	4581                	li	a1,0
ffffffffc0206634:	8562                	mv	a0,s8
ffffffffc0206636:	956ff0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc020663a:	34051263          	bnez	a0,ffffffffc020697e <do_execve+0x4f2>
ffffffffc020663e:	04000613          	li	a2,64
ffffffffc0206642:	110c                	addi	a1,sp,160
ffffffffc0206644:	8562                	mv	a0,s8
ffffffffc0206646:	f19fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc020664a:	04000793          	li	a5,64
ffffffffc020664e:	32f51863          	bne	a0,a5,ffffffffc020697e <do_execve+0x4f2>
ffffffffc0206652:	570a                	lw	a4,160(sp)
ffffffffc0206654:	464c47b7          	lui	a5,0x464c4
ffffffffc0206658:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc020665c:	32f71163          	bne	a4,a5,ffffffffc020697e <do_execve+0x4f2>
ffffffffc0206660:	0d815783          	lhu	a5,216(sp)
ffffffffc0206664:	e802                	sd	zero,16(sp)
ffffffffc0206666:	f002                	sd	zero,32(sp)
ffffffffc0206668:	c7b9                	beqz	a5,ffffffffc02066b6 <do_execve+0x22a>
ffffffffc020666a:	e0ce                	sd	s3,64(sp)
ffffffffc020666c:	e4d2                	sd	s4,72(sp)
ffffffffc020666e:	658e                	ld	a1,192(sp)
ffffffffc0206670:	67c2                	ld	a5,16(sp)
ffffffffc0206672:	4601                	li	a2,0
ffffffffc0206674:	8562                	mv	a0,s8
ffffffffc0206676:	95be                	add	a1,a1,a5
ffffffffc0206678:	914ff0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc020667c:	2e051e63          	bnez	a0,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc0206680:	03800613          	li	a2,56
ffffffffc0206684:	10ac                	addi	a1,sp,104
ffffffffc0206686:	8562                	mv	a0,s8
ffffffffc0206688:	ed7fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc020668c:	03800793          	li	a5,56
ffffffffc0206690:	2ef51463          	bne	a0,a5,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc0206694:	57a6                	lw	a5,104(sp)
ffffffffc0206696:	4705                	li	a4,1
ffffffffc0206698:	32e78363          	beq	a5,a4,ffffffffc02069be <do_execve+0x532>
ffffffffc020669c:	7702                	ld	a4,32(sp)
ffffffffc020669e:	66c2                	ld	a3,16(sp)
ffffffffc02066a0:	0d815783          	lhu	a5,216(sp)
ffffffffc02066a4:	2705                	addiw	a4,a4,1
ffffffffc02066a6:	03868693          	addi	a3,a3,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc02066aa:	f03a                	sd	a4,32(sp)
ffffffffc02066ac:	e836                	sd	a3,16(sp)
ffffffffc02066ae:	fcf760e3          	bltu	a4,a5,ffffffffc020666e <do_execve+0x1e2>
ffffffffc02066b2:	6986                	ld	s3,64(sp)
ffffffffc02066b4:	6a26                	ld	s4,72(sp)
ffffffffc02066b6:	8562                	mv	a0,s8
ffffffffc02066b8:	ea3fe0ef          	jal	ra,ffffffffc020555a <sysfile_close>
ffffffffc02066bc:	4701                	li	a4,0
ffffffffc02066be:	46ad                	li	a3,11
ffffffffc02066c0:	00100637          	lui	a2,0x100
ffffffffc02066c4:	7ff005b7          	lui	a1,0x7ff00
ffffffffc02066c8:	8556                	mv	a0,s5
ffffffffc02066ca:	edefd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc02066ce:	84aa                	mv	s1,a0
ffffffffc02066d0:	2a051463          	bnez	a0,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc02066d4:	018ab503          	ld	a0,24(s5)
ffffffffc02066d8:	467d                	li	a2,31
ffffffffc02066da:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc02066de:	c44fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc02066e2:	4e050f63          	beqz	a0,ffffffffc0206be0 <do_execve+0x754>
ffffffffc02066e6:	018ab503          	ld	a0,24(s5)
ffffffffc02066ea:	467d                	li	a2,31
ffffffffc02066ec:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc02066f0:	c32fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc02066f4:	56050263          	beqz	a0,ffffffffc0206c58 <do_execve+0x7cc>
ffffffffc02066f8:	018ab503          	ld	a0,24(s5)
ffffffffc02066fc:	467d                	li	a2,31
ffffffffc02066fe:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206702:	c20fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206706:	52050963          	beqz	a0,ffffffffc0206c38 <do_execve+0x7ac>
ffffffffc020670a:	018ab503          	ld	a0,24(s5)
ffffffffc020670e:	467d                	li	a2,31
ffffffffc0206710:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206714:	c0efd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206718:	50050063          	beqz	a0,ffffffffc0206c18 <do_execve+0x78c>
ffffffffc020671c:	030aa783          	lw	a5,48(s5)
ffffffffc0206720:	00090717          	auipc	a4,0x90
ffffffffc0206724:	1a070713          	addi	a4,a4,416 # ffffffffc02968c0 <current>
ffffffffc0206728:	6318                	ld	a4,0(a4)
ffffffffc020672a:	2785                	addiw	a5,a5,1
ffffffffc020672c:	018ab683          	ld	a3,24(s5)
ffffffffc0206730:	02faa823          	sw	a5,48(s5)
ffffffffc0206734:	03573423          	sd	s5,40(a4)
ffffffffc0206738:	c02007b7          	lui	a5,0xc0200
ffffffffc020673c:	4cf6e263          	bltu	a3,a5,ffffffffc0206c00 <do_execve+0x774>
ffffffffc0206740:	00090797          	auipc	a5,0x90
ffffffffc0206744:	17878793          	addi	a5,a5,376 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206748:	639c                	ld	a5,0(a5)
ffffffffc020674a:	8e9d                	sub	a3,a3,a5
ffffffffc020674c:	f754                	sd	a3,168(a4)
ffffffffc020674e:	577d                	li	a4,-1
ffffffffc0206750:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206754:	177e                	slli	a4,a4,0x3f
ffffffffc0206756:	8fd9                	or	a5,a5,a4
ffffffffc0206758:	18079073          	csrw	satp,a5
ffffffffc020675c:	4901                	li	s2,0
ffffffffc020675e:	1180                	addi	s0,sp,224
ffffffffc0206760:	4a81                	li	s5,0
ffffffffc0206762:	6008                	ld	a0,0(s0)
ffffffffc0206764:	6585                	lui	a1,0x1
ffffffffc0206766:	0421                	addi	s0,s0,8
ffffffffc0206768:	44d040ef          	jal	ra,ffffffffc020b3b4 <strnlen>
ffffffffc020676c:	0505                	addi	a0,a0,1
ffffffffc020676e:	87ca                	mv	a5,s2
ffffffffc0206770:	01550abb          	addw	s5,a0,s5
ffffffffc0206774:	2905                	addiw	s2,s2,1
ffffffffc0206776:	ff47c6e3          	blt	a5,s4,ffffffffc0206762 <do_execve+0x2d6>
ffffffffc020677a:	10000937          	lui	s2,0x10000
ffffffffc020677e:	197d                	addi	s2,s2,-1
ffffffffc0206780:	77c2                	ld	a5,48(sp)
ffffffffc0206782:	003ada9b          	srliw	s5,s5,0x3
ffffffffc0206786:	41590ab3          	sub	s5,s2,s5
ffffffffc020678a:	003a9913          	slli	s2,s5,0x3
ffffffffc020678e:	40f90b33          	sub	s6,s2,a5
ffffffffc0206792:	1180                	addi	s0,sp,224
ffffffffc0206794:	4c01                	li	s8,0
ffffffffc0206796:	4b81                	li	s7,0
ffffffffc0206798:	408b0ab3          	sub	s5,s6,s0
ffffffffc020679c:	00043c83          	ld	s9,0(s0)
ffffffffc02067a0:	020b9513          	slli	a0,s7,0x20
ffffffffc02067a4:	9101                	srli	a0,a0,0x20
ffffffffc02067a6:	85e6                	mv	a1,s9
ffffffffc02067a8:	954a                	add	a0,a0,s2
ffffffffc02067aa:	427040ef          	jal	ra,ffffffffc020b3d0 <strcpy>
ffffffffc02067ae:	008a87b3          	add	a5,s5,s0
ffffffffc02067b2:	872a                	mv	a4,a0
ffffffffc02067b4:	e398                	sd	a4,0(a5)
ffffffffc02067b6:	6585                	lui	a1,0x1
ffffffffc02067b8:	8566                	mv	a0,s9
ffffffffc02067ba:	3fb040ef          	jal	ra,ffffffffc020b3b4 <strnlen>
ffffffffc02067be:	0505                	addi	a0,a0,1
ffffffffc02067c0:	87e2                	mv	a5,s8
ffffffffc02067c2:	01750bbb          	addw	s7,a0,s7
ffffffffc02067c6:	2c05                	addiw	s8,s8,1
ffffffffc02067c8:	0421                	addi	s0,s0,8
ffffffffc02067ca:	fd47c9e3          	blt	a5,s4,ffffffffc020679c <do_execve+0x310>
ffffffffc02067ce:	00090797          	auipc	a5,0x90
ffffffffc02067d2:	0f278793          	addi	a5,a5,242 # ffffffffc02968c0 <current>
ffffffffc02067d6:	639c                	ld	a5,0(a5)
ffffffffc02067d8:	ffcb0a13          	addi	s4,s6,-4
ffffffffc02067dc:	ff3b2e23          	sw	s3,-4(s6)
ffffffffc02067e0:	0a07b983          	ld	s3,160(a5)
ffffffffc02067e4:	10002473          	csrr	s0,sstatus
ffffffffc02067e8:	12000613          	li	a2,288
ffffffffc02067ec:	4581                	li	a1,0
ffffffffc02067ee:	854e                	mv	a0,s3
ffffffffc02067f0:	44d040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc02067f4:	7722                	ld	a4,40(sp)
ffffffffc02067f6:	efd47793          	andi	a5,s0,-259
ffffffffc02067fa:	0d010913          	addi	s2,sp,208
ffffffffc02067fe:	fff70413          	addi	s0,a4,-1
ffffffffc0206802:	7742                	ld	a4,48(sp)
ffffffffc0206804:	76ea                	ld	a3,184(sp)
ffffffffc0206806:	0207e793          	ori	a5,a5,32
ffffffffc020680a:	993a                	add	s2,s2,a4
ffffffffc020680c:	7762                	ld	a4,56(sp)
ffffffffc020680e:	040e                	slli	s0,s0,0x3
ffffffffc0206810:	10f9b023          	sd	a5,256(s3) # 2100 <_binary_bin_swap_img_size-0x5c00>
ffffffffc0206814:	02071613          	slli	a2,a4,0x20
ffffffffc0206818:	01d65713          	srli	a4,a2,0x1d
ffffffffc020681c:	119c                	addi	a5,sp,224
ffffffffc020681e:	0149b823          	sd	s4,16(s3)
ffffffffc0206822:	10d9b423          	sd	a3,264(s3)
ffffffffc0206826:	943e                	add	s0,s0,a5
ffffffffc0206828:	40e90933          	sub	s2,s2,a4
ffffffffc020682c:	6008                	ld	a0,0(s0)
ffffffffc020682e:	1461                	addi	s0,s0,-8
ffffffffc0206830:	80ffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206834:	fe891ce3          	bne	s2,s0,ffffffffc020682c <do_execve+0x3a0>
ffffffffc0206838:	00090797          	auipc	a5,0x90
ffffffffc020683c:	08878793          	addi	a5,a5,136 # ffffffffc02968c0 <current>
ffffffffc0206840:	6380                	ld	s0,0(a5)
ffffffffc0206842:	4641                	li	a2,16
ffffffffc0206844:	4581                	li	a1,0
ffffffffc0206846:	0b440413          	addi	s0,s0,180
ffffffffc020684a:	8522                	mv	a0,s0
ffffffffc020684c:	3f1040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0206850:	463d                	li	a2,15
ffffffffc0206852:	08ac                	addi	a1,sp,88
ffffffffc0206854:	8522                	mv	a0,s0
ffffffffc0206856:	439040ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020685a:	24813083          	ld	ra,584(sp)
ffffffffc020685e:	24013403          	ld	s0,576(sp)
ffffffffc0206862:	23013903          	ld	s2,560(sp)
ffffffffc0206866:	22813983          	ld	s3,552(sp)
ffffffffc020686a:	22013a03          	ld	s4,544(sp)
ffffffffc020686e:	21813a83          	ld	s5,536(sp)
ffffffffc0206872:	21013b03          	ld	s6,528(sp)
ffffffffc0206876:	20813b83          	ld	s7,520(sp)
ffffffffc020687a:	20013c03          	ld	s8,512(sp)
ffffffffc020687e:	7cfe                	ld	s9,504(sp)
ffffffffc0206880:	7d5e                	ld	s10,496(sp)
ffffffffc0206882:	7dbe                	ld	s11,488(sp)
ffffffffc0206884:	8526                	mv	a0,s1
ffffffffc0206886:	23813483          	ld	s1,568(sp)
ffffffffc020688a:	25010113          	addi	sp,sp,592
ffffffffc020688e:	8082                	ret
ffffffffc0206890:	00090797          	auipc	a5,0x90
ffffffffc0206894:	03078793          	addi	a5,a5,48 # ffffffffc02968c0 <current>
ffffffffc0206898:	639c                	ld	a5,0(a5)
ffffffffc020689a:	1487b503          	ld	a0,328(a5)
ffffffffc020689e:	9fdfe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc02068a2:	4581                	li	a1,0
ffffffffc02068a4:	8522                	mv	a0,s0
ffffffffc02068a6:	c81fe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc02068aa:	8c2a                	mv	s8,a0
ffffffffc02068ac:	d0055de3          	bgez	a0,ffffffffc02065c6 <do_execve+0x13a>
ffffffffc02068b0:	a8f9                	j	ffffffffc020698e <do_execve+0x502>
ffffffffc02068b2:	1a078863          	beqz	a5,ffffffffc0206a62 <do_execve+0x5d6>
ffffffffc02068b6:	85ba                	mv	a1,a4
ffffffffc02068b8:	0015e693          	ori	a3,a1,1
ffffffffc02068bc:	0025f793          	andi	a5,a1,2
ffffffffc02068c0:	2681                	sext.w	a3,a3
ffffffffc02068c2:	0045f713          	andi	a4,a1,4
ffffffffc02068c6:	4b51                	li	s6,20
ffffffffc02068c8:	e391                	bnez	a5,ffffffffc02068cc <do_execve+0x440>
ffffffffc02068ca:	4b41                	li	s6,16
ffffffffc02068cc:	002b6b13          	ori	s6,s6,2
ffffffffc02068d0:	c319                	beqz	a4,ffffffffc02068d6 <do_execve+0x44a>
ffffffffc02068d2:	008b6b13          	ori	s6,s6,8
ffffffffc02068d6:	75e6                	ld	a1,120(sp)
ffffffffc02068d8:	4701                	li	a4,0
ffffffffc02068da:	8556                	mv	a0,s5
ffffffffc02068dc:	cccfd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc02068e0:	ed41                	bnez	a0,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc02068e2:	7ce6                	ld	s9,120(sp)
ffffffffc02068e4:	6a2a                	ld	s4,136(sp)
ffffffffc02068e6:	77fd                	lui	a5,0xfffff
ffffffffc02068e8:	79c6                	ld	s3,112(sp)
ffffffffc02068ea:	9a66                	add	s4,s4,s9
ffffffffc02068ec:	00fcfbb3          	and	s7,s9,a5
ffffffffc02068f0:	034ce463          	bltu	s9,s4,ffffffffc0206918 <do_execve+0x48c>
ffffffffc02068f4:	ac49                	j	ffffffffc0206b86 <do_execve+0x6fa>
ffffffffc02068f6:	6782                	ld	a5,0(sp)
ffffffffc02068f8:	417c8bb3          	sub	s7,s9,s7
ffffffffc02068fc:	866a                	mv	a2,s10
ffffffffc02068fe:	00f405b3          	add	a1,s0,a5
ffffffffc0206902:	95de                	add	a1,a1,s7
ffffffffc0206904:	8562                	mv	a0,s8
ffffffffc0206906:	c59fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc020690a:	06ad1763          	bne	s10,a0,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc020690e:	9cea                	add	s9,s9,s10
ffffffffc0206910:	99ea                	add	s3,s3,s10
ffffffffc0206912:	154cff63          	bgeu	s9,s4,ffffffffc0206a70 <do_execve+0x5e4>
ffffffffc0206916:	8ba6                	mv	s7,s1
ffffffffc0206918:	018ab503          	ld	a0,24(s5)
ffffffffc020691c:	865a                	mv	a2,s6
ffffffffc020691e:	85de                	mv	a1,s7
ffffffffc0206920:	a02fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206924:	892a                	mv	s2,a0
ffffffffc0206926:	c929                	beqz	a0,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc0206928:	6785                	lui	a5,0x1
ffffffffc020692a:	00fb84b3          	add	s1,s7,a5
ffffffffc020692e:	41948d33          	sub	s10,s1,s9
ffffffffc0206932:	009a7463          	bgeu	s4,s1,ffffffffc020693a <do_execve+0x4ae>
ffffffffc0206936:	419a0d33          	sub	s10,s4,s9
ffffffffc020693a:	00090797          	auipc	a5,0x90
ffffffffc020693e:	f6e78793          	addi	a5,a5,-146 # ffffffffc02968a8 <pages>
ffffffffc0206942:	638c                	ld	a1,0(a5)
ffffffffc0206944:	67e2                	ld	a5,24(sp)
ffffffffc0206946:	000db683          	ld	a3,0(s11)
ffffffffc020694a:	40b905b3          	sub	a1,s2,a1
ffffffffc020694e:	8599                	srai	a1,a1,0x6
ffffffffc0206950:	95be                	add	a1,a1,a5
ffffffffc0206952:	67a2                	ld	a5,8(sp)
ffffffffc0206954:	00c59413          	slli	s0,a1,0xc
ffffffffc0206958:	00f5f633          	and	a2,a1,a5
ffffffffc020695c:	24d67863          	bgeu	a2,a3,ffffffffc0206bac <do_execve+0x720>
ffffffffc0206960:	00090797          	auipc	a5,0x90
ffffffffc0206964:	f5878793          	addi	a5,a5,-168 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206968:	639c                	ld	a5,0(a5)
ffffffffc020696a:	4601                	li	a2,0
ffffffffc020696c:	85ce                	mv	a1,s3
ffffffffc020696e:	8562                	mv	a0,s8
ffffffffc0206970:	e03e                	sd	a5,0(sp)
ffffffffc0206972:	e1bfe0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc0206976:	d141                	beqz	a0,ffffffffc02068f6 <do_execve+0x46a>
ffffffffc0206978:	8556                	mv	a0,s5
ffffffffc020697a:	d78fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc020697e:	018ab503          	ld	a0,24(s5)
ffffffffc0206982:	8faff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206986:	8556                	mv	a0,s5
ffffffffc0206988:	bcefd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020698c:	5c71                	li	s8,-4
ffffffffc020698e:	77a2                	ld	a5,40(sp)
ffffffffc0206990:	0984                	addi	s1,sp,208
ffffffffc0206992:	fff78413          	addi	s0,a5,-1
ffffffffc0206996:	77c2                	ld	a5,48(sp)
ffffffffc0206998:	040e                	slli	s0,s0,0x3
ffffffffc020699a:	94be                	add	s1,s1,a5
ffffffffc020699c:	77e2                	ld	a5,56(sp)
ffffffffc020699e:	02079713          	slli	a4,a5,0x20
ffffffffc02069a2:	01d75793          	srli	a5,a4,0x1d
ffffffffc02069a6:	1198                	addi	a4,sp,224
ffffffffc02069a8:	943a                	add	s0,s0,a4
ffffffffc02069aa:	8c9d                	sub	s1,s1,a5
ffffffffc02069ac:	6008                	ld	a0,0(s0)
ffffffffc02069ae:	1461                	addi	s0,s0,-8
ffffffffc02069b0:	e8efb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02069b4:	fe941ce3          	bne	s0,s1,ffffffffc02069ac <do_execve+0x520>
ffffffffc02069b8:	8562                	mv	a0,s8
ffffffffc02069ba:	e4eff0ef          	jal	ra,ffffffffc0206008 <do_exit>
ffffffffc02069be:	664a                	ld	a2,144(sp)
ffffffffc02069c0:	67aa                	ld	a5,136(sp)
ffffffffc02069c2:	faf66be3          	bltu	a2,a5,ffffffffc0206978 <do_execve+0x4ec>
ffffffffc02069c6:	57b6                	lw	a5,108(sp)
ffffffffc02069c8:	0017f713          	andi	a4,a5,1
ffffffffc02069cc:	c311                	beqz	a4,ffffffffc02069d0 <do_execve+0x544>
ffffffffc02069ce:	4711                	li	a4,4
ffffffffc02069d0:	0027f693          	andi	a3,a5,2
ffffffffc02069d4:	8b91                	andi	a5,a5,4
ffffffffc02069d6:	ec068ee3          	beqz	a3,ffffffffc02068b2 <do_execve+0x426>
ffffffffc02069da:	00276593          	ori	a1,a4,2
ffffffffc02069de:	ec079de3          	bnez	a5,ffffffffc02068b8 <do_execve+0x42c>
ffffffffc02069e2:	00177793          	andi	a5,a4,1
ffffffffc02069e6:	86ae                	mv	a3,a1
ffffffffc02069e8:	4b51                	li	s6,20
ffffffffc02069ea:	ee0783e3          	beqz	a5,ffffffffc02068d0 <do_execve+0x444>
ffffffffc02069ee:	002b6b13          	ori	s6,s6,2
ffffffffc02069f2:	bdf9                	j	ffffffffc02068d0 <do_execve+0x444>
ffffffffc02069f4:	54f1                	li	s1,-4
ffffffffc02069f6:	020a0963          	beqz	s4,ffffffffc0206a28 <do_execve+0x59c>
ffffffffc02069fa:	003a1793          	slli	a5,s4,0x3
ffffffffc02069fe:	fffa0413          	addi	s0,s4,-1
ffffffffc0206a02:	0d010913          	addi	s2,sp,208
ffffffffc0206a06:	3a7d                	addiw	s4,s4,-1
ffffffffc0206a08:	993e                	add	s2,s2,a5
ffffffffc0206a0a:	020a1793          	slli	a5,s4,0x20
ffffffffc0206a0e:	01d7da13          	srli	s4,a5,0x1d
ffffffffc0206a12:	040e                	slli	s0,s0,0x3
ffffffffc0206a14:	119c                	addi	a5,sp,224
ffffffffc0206a16:	943e                	add	s0,s0,a5
ffffffffc0206a18:	41490933          	sub	s2,s2,s4
ffffffffc0206a1c:	6008                	ld	a0,0(s0)
ffffffffc0206a1e:	1461                	addi	s0,s0,-8
ffffffffc0206a20:	e1efb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206a24:	fe891ce3          	bne	s2,s0,ffffffffc0206a1c <do_execve+0x590>
ffffffffc0206a28:	e20a89e3          	beqz	s5,ffffffffc020685a <do_execve+0x3ce>
ffffffffc0206a2c:	038a8513          	addi	a0,s5,56
ffffffffc0206a30:	b31fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206a34:	040aa823          	sw	zero,80(s5)
ffffffffc0206a38:	b50d                	j	ffffffffc020685a <do_execve+0x3ce>
ffffffffc0206a3a:	854e                	mv	a0,s3
ffffffffc0206a3c:	e02fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206a40:	54f5                	li	s1,-3
ffffffffc0206a42:	bf55                	j	ffffffffc02069f6 <do_execve+0x56a>
ffffffffc0206a44:	00090797          	auipc	a5,0x90
ffffffffc0206a48:	e7c78793          	addi	a5,a5,-388 # ffffffffc02968c0 <current>
ffffffffc0206a4c:	639c                	ld	a5,0(a5)
ffffffffc0206a4e:	00007617          	auipc	a2,0x7
ffffffffc0206a52:	bd260613          	addi	a2,a2,-1070 # ffffffffc020d620 <CSWTCH.79+0x2f0>
ffffffffc0206a56:	45c1                	li	a1,16
ffffffffc0206a58:	43d4                	lw	a3,4(a5)
ffffffffc0206a5a:	08a8                	addi	a0,sp,88
ffffffffc0206a5c:	0f1040ef          	jal	ra,ffffffffc020b34c <snprintf>
ffffffffc0206a60:	bc4d                	j	ffffffffc0206512 <do_execve+0x86>
ffffffffc0206a62:	00177793          	andi	a5,a4,1
ffffffffc0206a66:	86ba                	mv	a3,a4
ffffffffc0206a68:	4b41                	li	s6,16
ffffffffc0206a6a:	e60783e3          	beqz	a5,ffffffffc02068d0 <do_execve+0x444>
ffffffffc0206a6e:	b741                	j	ffffffffc02069ee <do_execve+0x562>
ffffffffc0206a70:	7466                	ld	s0,120(sp)
ffffffffc0206a72:	8d26                	mv	s10,s1
ffffffffc0206a74:	66ca                	ld	a3,144(sp)
ffffffffc0206a76:	9436                	add	s0,s0,a3
ffffffffc0206a78:	09acf663          	bgeu	s9,s10,ffffffffc0206b04 <do_execve+0x678>
ffffffffc0206a7c:	c39400e3          	beq	s0,s9,ffffffffc020669c <do_execve+0x210>
ffffffffc0206a80:	6785                	lui	a5,0x1
ffffffffc0206a82:	00fc8533          	add	a0,s9,a5
ffffffffc0206a86:	41a50533          	sub	a0,a0,s10
ffffffffc0206a8a:	419404b3          	sub	s1,s0,s9
ffffffffc0206a8e:	01a46463          	bltu	s0,s10,ffffffffc0206a96 <do_execve+0x60a>
ffffffffc0206a92:	419d04b3          	sub	s1,s10,s9
ffffffffc0206a96:	00090797          	auipc	a5,0x90
ffffffffc0206a9a:	e1278793          	addi	a5,a5,-494 # ffffffffc02968a8 <pages>
ffffffffc0206a9e:	6394                	ld	a3,0(a5)
ffffffffc0206aa0:	67e2                	ld	a5,24(sp)
ffffffffc0206aa2:	000db603          	ld	a2,0(s11)
ffffffffc0206aa6:	40d906b3          	sub	a3,s2,a3
ffffffffc0206aaa:	8699                	srai	a3,a3,0x6
ffffffffc0206aac:	96be                	add	a3,a3,a5
ffffffffc0206aae:	67a2                	ld	a5,8(sp)
ffffffffc0206ab0:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206ab4:	06b2                	slli	a3,a3,0xc
ffffffffc0206ab6:	0ec5fc63          	bgeu	a1,a2,ffffffffc0206bae <do_execve+0x722>
ffffffffc0206aba:	00090797          	auipc	a5,0x90
ffffffffc0206abe:	dfe78793          	addi	a5,a5,-514 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206ac2:	0007b803          	ld	a6,0(a5)
ffffffffc0206ac6:	8626                	mv	a2,s1
ffffffffc0206ac8:	4581                	li	a1,0
ffffffffc0206aca:	96c2                	add	a3,a3,a6
ffffffffc0206acc:	9536                	add	a0,a0,a3
ffffffffc0206ace:	16f040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0206ad2:	019487b3          	add	a5,s1,s9
ffffffffc0206ad6:	03a47463          	bgeu	s0,s10,ffffffffc0206afe <do_execve+0x672>
ffffffffc0206ada:	bcf401e3          	beq	s0,a5,ffffffffc020669c <do_execve+0x210>
ffffffffc0206ade:	00007697          	auipc	a3,0x7
ffffffffc0206ae2:	b5268693          	addi	a3,a3,-1198 # ffffffffc020d630 <CSWTCH.79+0x300>
ffffffffc0206ae6:	00005617          	auipc	a2,0x5
ffffffffc0206aea:	e3a60613          	addi	a2,a2,-454 # ffffffffc020b920 <commands+0x210>
ffffffffc0206aee:	33100593          	li	a1,817
ffffffffc0206af2:	00007517          	auipc	a0,0x7
ffffffffc0206af6:	94e50513          	addi	a0,a0,-1714 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206afa:	9a5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206afe:	ffa790e3          	bne	a5,s10,ffffffffc0206ade <do_execve+0x652>
ffffffffc0206b02:	8cea                	mv	s9,s10
ffffffffc0206b04:	b88cfce3          	bgeu	s9,s0,ffffffffc020669c <do_execve+0x210>
ffffffffc0206b08:	64e2                	ld	s1,24(sp)
ffffffffc0206b0a:	a881                	j	ffffffffc0206b5a <do_execve+0x6ce>
ffffffffc0206b0c:	6785                	lui	a5,0x1
ffffffffc0206b0e:	41ac8533          	sub	a0,s9,s10
ffffffffc0206b12:	9d3e                	add	s10,s10,a5
ffffffffc0206b14:	419d0633          	sub	a2,s10,s9
ffffffffc0206b18:	01a47463          	bgeu	s0,s10,ffffffffc0206b20 <do_execve+0x694>
ffffffffc0206b1c:	41940633          	sub	a2,s0,s9
ffffffffc0206b20:	00090797          	auipc	a5,0x90
ffffffffc0206b24:	d8878793          	addi	a5,a5,-632 # ffffffffc02968a8 <pages>
ffffffffc0206b28:	639c                	ld	a5,0(a5)
ffffffffc0206b2a:	66a2                	ld	a3,8(sp)
ffffffffc0206b2c:	000db703          	ld	a4,0(s11)
ffffffffc0206b30:	40f907b3          	sub	a5,s2,a5
ffffffffc0206b34:	8799                	srai	a5,a5,0x6
ffffffffc0206b36:	97a6                	add	a5,a5,s1
ffffffffc0206b38:	8efd                	and	a3,a3,a5
ffffffffc0206b3a:	07b2                	slli	a5,a5,0xc
ffffffffc0206b3c:	08e6f563          	bgeu	a3,a4,ffffffffc0206bc6 <do_execve+0x73a>
ffffffffc0206b40:	00090717          	auipc	a4,0x90
ffffffffc0206b44:	d7870713          	addi	a4,a4,-648 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b48:	6318                	ld	a4,0(a4)
ffffffffc0206b4a:	9cb2                	add	s9,s9,a2
ffffffffc0206b4c:	4581                	li	a1,0
ffffffffc0206b4e:	97ba                	add	a5,a5,a4
ffffffffc0206b50:	953e                	add	a0,a0,a5
ffffffffc0206b52:	0eb040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0206b56:	b48cf3e3          	bgeu	s9,s0,ffffffffc020669c <do_execve+0x210>
ffffffffc0206b5a:	018ab503          	ld	a0,24(s5)
ffffffffc0206b5e:	865a                	mv	a2,s6
ffffffffc0206b60:	85ea                	mv	a1,s10
ffffffffc0206b62:	fc1fc0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206b66:	892a                	mv	s2,a0
ffffffffc0206b68:	f155                	bnez	a0,ffffffffc0206b0c <do_execve+0x680>
ffffffffc0206b6a:	b539                	j	ffffffffc0206978 <do_execve+0x4ec>
ffffffffc0206b6c:	8556                	mv	a0,s5
ffffffffc0206b6e:	b84fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206b72:	018ab503          	ld	a0,24(s5)
ffffffffc0206b76:	f07fe0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206b7a:	8556                	mv	a0,s5
ffffffffc0206b7c:	9dafd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206b80:	bc25                	j	ffffffffc02065b8 <do_execve+0x12c>
ffffffffc0206b82:	54f5                	li	s1,-3
ffffffffc0206b84:	b9d9                	j	ffffffffc020685a <do_execve+0x3ce>
ffffffffc0206b86:	8466                	mv	s0,s9
ffffffffc0206b88:	8d5e                	mv	s10,s7
ffffffffc0206b8a:	b5ed                	j	ffffffffc0206a74 <do_execve+0x5e8>
ffffffffc0206b8c:	54f5                	li	s1,-3
ffffffffc0206b8e:	e80a9fe3          	bnez	s5,ffffffffc0206a2c <do_execve+0x5a0>
ffffffffc0206b92:	b1e1                	j	ffffffffc020685a <do_execve+0x3ce>
ffffffffc0206b94:	fe0a87e3          	beqz	s5,ffffffffc0206b82 <do_execve+0x6f6>
ffffffffc0206b98:	038a8513          	addi	a0,s5,56
ffffffffc0206b9c:	9c5fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206ba0:	54f5                	li	s1,-3
ffffffffc0206ba2:	040aa823          	sw	zero,80(s5)
ffffffffc0206ba6:	b955                	j	ffffffffc020685a <do_execve+0x3ce>
ffffffffc0206ba8:	5c71                	li	s8,-4
ffffffffc0206baa:	b3d5                	j	ffffffffc020698e <do_execve+0x502>
ffffffffc0206bac:	86a2                	mv	a3,s0
ffffffffc0206bae:	00006617          	auipc	a2,0x6
ffffffffc0206bb2:	89260613          	addi	a2,a2,-1902 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0206bb6:	07100593          	li	a1,113
ffffffffc0206bba:	00006517          	auipc	a0,0x6
ffffffffc0206bbe:	8ae50513          	addi	a0,a0,-1874 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0206bc2:	8ddf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bc6:	86be                	mv	a3,a5
ffffffffc0206bc8:	00006617          	auipc	a2,0x6
ffffffffc0206bcc:	87860613          	addi	a2,a2,-1928 # ffffffffc020c440 <default_pmm_manager+0x38>
ffffffffc0206bd0:	07100593          	li	a1,113
ffffffffc0206bd4:	00006517          	auipc	a0,0x6
ffffffffc0206bd8:	89450513          	addi	a0,a0,-1900 # ffffffffc020c468 <default_pmm_manager+0x60>
ffffffffc0206bdc:	8c3f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206be0:	00007697          	auipc	a3,0x7
ffffffffc0206be4:	a9068693          	addi	a3,a3,-1392 # ffffffffc020d670 <CSWTCH.79+0x340>
ffffffffc0206be8:	00005617          	auipc	a2,0x5
ffffffffc0206bec:	d3860613          	addi	a2,a2,-712 # ffffffffc020b920 <commands+0x210>
ffffffffc0206bf0:	34a00593          	li	a1,842
ffffffffc0206bf4:	00007517          	auipc	a0,0x7
ffffffffc0206bf8:	84c50513          	addi	a0,a0,-1972 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206bfc:	8a3f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c00:	00006617          	auipc	a2,0x6
ffffffffc0206c04:	8e860613          	addi	a2,a2,-1816 # ffffffffc020c4e8 <default_pmm_manager+0xe0>
ffffffffc0206c08:	35200593          	li	a1,850
ffffffffc0206c0c:	00007517          	auipc	a0,0x7
ffffffffc0206c10:	83450513          	addi	a0,a0,-1996 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206c14:	88bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c18:	00007697          	auipc	a3,0x7
ffffffffc0206c1c:	b3068693          	addi	a3,a3,-1232 # ffffffffc020d748 <CSWTCH.79+0x418>
ffffffffc0206c20:	00005617          	auipc	a2,0x5
ffffffffc0206c24:	d0060613          	addi	a2,a2,-768 # ffffffffc020b920 <commands+0x210>
ffffffffc0206c28:	34d00593          	li	a1,845
ffffffffc0206c2c:	00007517          	auipc	a0,0x7
ffffffffc0206c30:	81450513          	addi	a0,a0,-2028 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206c34:	86bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c38:	00007697          	auipc	a3,0x7
ffffffffc0206c3c:	ac868693          	addi	a3,a3,-1336 # ffffffffc020d700 <CSWTCH.79+0x3d0>
ffffffffc0206c40:	00005617          	auipc	a2,0x5
ffffffffc0206c44:	ce060613          	addi	a2,a2,-800 # ffffffffc020b920 <commands+0x210>
ffffffffc0206c48:	34c00593          	li	a1,844
ffffffffc0206c4c:	00006517          	auipc	a0,0x6
ffffffffc0206c50:	7f450513          	addi	a0,a0,2036 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206c54:	84bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c58:	00007697          	auipc	a3,0x7
ffffffffc0206c5c:	a6068693          	addi	a3,a3,-1440 # ffffffffc020d6b8 <CSWTCH.79+0x388>
ffffffffc0206c60:	00005617          	auipc	a2,0x5
ffffffffc0206c64:	cc060613          	addi	a2,a2,-832 # ffffffffc020b920 <commands+0x210>
ffffffffc0206c68:	34b00593          	li	a1,843
ffffffffc0206c6c:	00006517          	auipc	a0,0x6
ffffffffc0206c70:	7d450513          	addi	a0,a0,2004 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206c74:	82bf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206c78 <user_main>:
ffffffffc0206c78:	7179                	addi	sp,sp,-48
ffffffffc0206c7a:	e84a                	sd	s2,16(sp)
ffffffffc0206c7c:	00090917          	auipc	s2,0x90
ffffffffc0206c80:	c4490913          	addi	s2,s2,-956 # ffffffffc02968c0 <current>
ffffffffc0206c84:	00093783          	ld	a5,0(s2)
ffffffffc0206c88:	00007617          	auipc	a2,0x7
ffffffffc0206c8c:	b0860613          	addi	a2,a2,-1272 # ffffffffc020d790 <CSWTCH.79+0x460>
ffffffffc0206c90:	00007517          	auipc	a0,0x7
ffffffffc0206c94:	b0850513          	addi	a0,a0,-1272 # ffffffffc020d798 <CSWTCH.79+0x468>
ffffffffc0206c98:	43cc                	lw	a1,4(a5)
ffffffffc0206c9a:	f406                	sd	ra,40(sp)
ffffffffc0206c9c:	f022                	sd	s0,32(sp)
ffffffffc0206c9e:	ec26                	sd	s1,24(sp)
ffffffffc0206ca0:	e032                	sd	a2,0(sp)
ffffffffc0206ca2:	e402                	sd	zero,8(sp)
ffffffffc0206ca4:	d02f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206ca8:	6782                	ld	a5,0(sp)
ffffffffc0206caa:	cfb9                	beqz	a5,ffffffffc0206d08 <user_main+0x90>
ffffffffc0206cac:	003c                	addi	a5,sp,8
ffffffffc0206cae:	4401                	li	s0,0
ffffffffc0206cb0:	6398                	ld	a4,0(a5)
ffffffffc0206cb2:	0405                	addi	s0,s0,1
ffffffffc0206cb4:	07a1                	addi	a5,a5,8
ffffffffc0206cb6:	ff6d                	bnez	a4,ffffffffc0206cb0 <user_main+0x38>
ffffffffc0206cb8:	00093783          	ld	a5,0(s2)
ffffffffc0206cbc:	12000613          	li	a2,288
ffffffffc0206cc0:	6b84                	ld	s1,16(a5)
ffffffffc0206cc2:	73cc                	ld	a1,160(a5)
ffffffffc0206cc4:	6789                	lui	a5,0x2
ffffffffc0206cc6:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206cca:	94be                	add	s1,s1,a5
ffffffffc0206ccc:	8526                	mv	a0,s1
ffffffffc0206cce:	7c0040ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0206cd2:	00093783          	ld	a5,0(s2)
ffffffffc0206cd6:	860a                	mv	a2,sp
ffffffffc0206cd8:	0004059b          	sext.w	a1,s0
ffffffffc0206cdc:	f3c4                	sd	s1,160(a5)
ffffffffc0206cde:	00007517          	auipc	a0,0x7
ffffffffc0206ce2:	ab250513          	addi	a0,a0,-1358 # ffffffffc020d790 <CSWTCH.79+0x460>
ffffffffc0206ce6:	fa6ff0ef          	jal	ra,ffffffffc020648c <do_execve>
ffffffffc0206cea:	8126                	mv	sp,s1
ffffffffc0206cec:	d64fa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206cf0:	00007617          	auipc	a2,0x7
ffffffffc0206cf4:	ad060613          	addi	a2,a2,-1328 # ffffffffc020d7c0 <CSWTCH.79+0x490>
ffffffffc0206cf8:	48c00593          	li	a1,1164
ffffffffc0206cfc:	00006517          	auipc	a0,0x6
ffffffffc0206d00:	74450513          	addi	a0,a0,1860 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206d04:	f9af90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206d08:	4401                	li	s0,0
ffffffffc0206d0a:	b77d                	j	ffffffffc0206cb8 <user_main+0x40>

ffffffffc0206d0c <do_yield>:
ffffffffc0206d0c:	00090797          	auipc	a5,0x90
ffffffffc0206d10:	bb47b783          	ld	a5,-1100(a5) # ffffffffc02968c0 <current>
ffffffffc0206d14:	4705                	li	a4,1
ffffffffc0206d16:	ef98                	sd	a4,24(a5)
ffffffffc0206d18:	4501                	li	a0,0
ffffffffc0206d1a:	8082                	ret

ffffffffc0206d1c <do_wait>:
ffffffffc0206d1c:	1101                	addi	sp,sp,-32
ffffffffc0206d1e:	e822                	sd	s0,16(sp)
ffffffffc0206d20:	e426                	sd	s1,8(sp)
ffffffffc0206d22:	ec06                	sd	ra,24(sp)
ffffffffc0206d24:	842e                	mv	s0,a1
ffffffffc0206d26:	84aa                	mv	s1,a0
ffffffffc0206d28:	c999                	beqz	a1,ffffffffc0206d3e <do_wait+0x22>
ffffffffc0206d2a:	00090797          	auipc	a5,0x90
ffffffffc0206d2e:	b967b783          	ld	a5,-1130(a5) # ffffffffc02968c0 <current>
ffffffffc0206d32:	7788                	ld	a0,40(a5)
ffffffffc0206d34:	4685                	li	a3,1
ffffffffc0206d36:	4611                	li	a2,4
ffffffffc0206d38:	d5afd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206d3c:	c909                	beqz	a0,ffffffffc0206d4e <do_wait+0x32>
ffffffffc0206d3e:	85a2                	mv	a1,s0
ffffffffc0206d40:	6442                	ld	s0,16(sp)
ffffffffc0206d42:	60e2                	ld	ra,24(sp)
ffffffffc0206d44:	8526                	mv	a0,s1
ffffffffc0206d46:	64a2                	ld	s1,8(sp)
ffffffffc0206d48:	6105                	addi	sp,sp,32
ffffffffc0206d4a:	c20ff06f          	j	ffffffffc020616a <do_wait.part.0>
ffffffffc0206d4e:	60e2                	ld	ra,24(sp)
ffffffffc0206d50:	6442                	ld	s0,16(sp)
ffffffffc0206d52:	64a2                	ld	s1,8(sp)
ffffffffc0206d54:	5575                	li	a0,-3
ffffffffc0206d56:	6105                	addi	sp,sp,32
ffffffffc0206d58:	8082                	ret

ffffffffc0206d5a <do_kill>:
ffffffffc0206d5a:	1141                	addi	sp,sp,-16
ffffffffc0206d5c:	6789                	lui	a5,0x2
ffffffffc0206d5e:	e406                	sd	ra,8(sp)
ffffffffc0206d60:	e022                	sd	s0,0(sp)
ffffffffc0206d62:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206d66:	17f9                	addi	a5,a5,-2
ffffffffc0206d68:	02e7e963          	bltu	a5,a4,ffffffffc0206d9a <do_kill+0x40>
ffffffffc0206d6c:	842a                	mv	s0,a0
ffffffffc0206d6e:	45a9                	li	a1,10
ffffffffc0206d70:	2501                	sext.w	a0,a0
ffffffffc0206d72:	196040ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc0206d76:	02051793          	slli	a5,a0,0x20
ffffffffc0206d7a:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206d7e:	0008b797          	auipc	a5,0x8b
ffffffffc0206d82:	a4278793          	addi	a5,a5,-1470 # ffffffffc02917c0 <hash_list>
ffffffffc0206d86:	953e                	add	a0,a0,a5
ffffffffc0206d88:	87aa                	mv	a5,a0
ffffffffc0206d8a:	a029                	j	ffffffffc0206d94 <do_kill+0x3a>
ffffffffc0206d8c:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206d90:	00870b63          	beq	a4,s0,ffffffffc0206da6 <do_kill+0x4c>
ffffffffc0206d94:	679c                	ld	a5,8(a5)
ffffffffc0206d96:	fef51be3          	bne	a0,a5,ffffffffc0206d8c <do_kill+0x32>
ffffffffc0206d9a:	5475                	li	s0,-3
ffffffffc0206d9c:	60a2                	ld	ra,8(sp)
ffffffffc0206d9e:	8522                	mv	a0,s0
ffffffffc0206da0:	6402                	ld	s0,0(sp)
ffffffffc0206da2:	0141                	addi	sp,sp,16
ffffffffc0206da4:	8082                	ret
ffffffffc0206da6:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206daa:	00177693          	andi	a3,a4,1
ffffffffc0206dae:	e295                	bnez	a3,ffffffffc0206dd2 <do_kill+0x78>
ffffffffc0206db0:	4bd4                	lw	a3,20(a5)
ffffffffc0206db2:	00176713          	ori	a4,a4,1
ffffffffc0206db6:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206dba:	4401                	li	s0,0
ffffffffc0206dbc:	fe06d0e3          	bgez	a3,ffffffffc0206d9c <do_kill+0x42>
ffffffffc0206dc0:	f2878513          	addi	a0,a5,-216
ffffffffc0206dc4:	45a000ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc0206dc8:	60a2                	ld	ra,8(sp)
ffffffffc0206dca:	8522                	mv	a0,s0
ffffffffc0206dcc:	6402                	ld	s0,0(sp)
ffffffffc0206dce:	0141                	addi	sp,sp,16
ffffffffc0206dd0:	8082                	ret
ffffffffc0206dd2:	545d                	li	s0,-9
ffffffffc0206dd4:	b7e1                	j	ffffffffc0206d9c <do_kill+0x42>

ffffffffc0206dd6 <proc_init>:
ffffffffc0206dd6:	1101                	addi	sp,sp,-32
ffffffffc0206dd8:	e426                	sd	s1,8(sp)
ffffffffc0206dda:	0008f797          	auipc	a5,0x8f
ffffffffc0206dde:	9e678793          	addi	a5,a5,-1562 # ffffffffc02957c0 <proc_list>
ffffffffc0206de2:	ec06                	sd	ra,24(sp)
ffffffffc0206de4:	e822                	sd	s0,16(sp)
ffffffffc0206de6:	e04a                	sd	s2,0(sp)
ffffffffc0206de8:	0008b497          	auipc	s1,0x8b
ffffffffc0206dec:	9d848493          	addi	s1,s1,-1576 # ffffffffc02917c0 <hash_list>
ffffffffc0206df0:	e79c                	sd	a5,8(a5)
ffffffffc0206df2:	e39c                	sd	a5,0(a5)
ffffffffc0206df4:	0008f717          	auipc	a4,0x8f
ffffffffc0206df8:	9cc70713          	addi	a4,a4,-1588 # ffffffffc02957c0 <proc_list>
ffffffffc0206dfc:	87a6                	mv	a5,s1
ffffffffc0206dfe:	e79c                	sd	a5,8(a5)
ffffffffc0206e00:	e39c                	sd	a5,0(a5)
ffffffffc0206e02:	07c1                	addi	a5,a5,16
ffffffffc0206e04:	fef71de3          	bne	a4,a5,ffffffffc0206dfe <proc_init+0x28>
ffffffffc0206e08:	bcdfe0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0206e0c:	00090917          	auipc	s2,0x90
ffffffffc0206e10:	abc90913          	addi	s2,s2,-1348 # ffffffffc02968c8 <idleproc>
ffffffffc0206e14:	00a93023          	sd	a0,0(s2)
ffffffffc0206e18:	842a                	mv	s0,a0
ffffffffc0206e1a:	12050863          	beqz	a0,ffffffffc0206f4a <proc_init+0x174>
ffffffffc0206e1e:	4789                	li	a5,2
ffffffffc0206e20:	e11c                	sd	a5,0(a0)
ffffffffc0206e22:	0000a797          	auipc	a5,0xa
ffffffffc0206e26:	1de78793          	addi	a5,a5,478 # ffffffffc0211000 <bootstack>
ffffffffc0206e2a:	e91c                	sd	a5,16(a0)
ffffffffc0206e2c:	4785                	li	a5,1
ffffffffc0206e2e:	ed1c                	sd	a5,24(a0)
ffffffffc0206e30:	b9efe0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0206e34:	14a43423          	sd	a0,328(s0)
ffffffffc0206e38:	0e050d63          	beqz	a0,ffffffffc0206f32 <proc_init+0x15c>
ffffffffc0206e3c:	00093403          	ld	s0,0(s2)
ffffffffc0206e40:	4641                	li	a2,16
ffffffffc0206e42:	4581                	li	a1,0
ffffffffc0206e44:	14843703          	ld	a4,328(s0)
ffffffffc0206e48:	0b440413          	addi	s0,s0,180
ffffffffc0206e4c:	8522                	mv	a0,s0
ffffffffc0206e4e:	4b1c                	lw	a5,16(a4)
ffffffffc0206e50:	2785                	addiw	a5,a5,1
ffffffffc0206e52:	cb1c                	sw	a5,16(a4)
ffffffffc0206e54:	5e8040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0206e58:	463d                	li	a2,15
ffffffffc0206e5a:	00007597          	auipc	a1,0x7
ffffffffc0206e5e:	9c658593          	addi	a1,a1,-1594 # ffffffffc020d820 <CSWTCH.79+0x4f0>
ffffffffc0206e62:	8522                	mv	a0,s0
ffffffffc0206e64:	62a040ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0206e68:	00090717          	auipc	a4,0x90
ffffffffc0206e6c:	a7070713          	addi	a4,a4,-1424 # ffffffffc02968d8 <nr_process>
ffffffffc0206e70:	431c                	lw	a5,0(a4)
ffffffffc0206e72:	00093683          	ld	a3,0(s2)
ffffffffc0206e76:	4601                	li	a2,0
ffffffffc0206e78:	2785                	addiw	a5,a5,1
ffffffffc0206e7a:	4581                	li	a1,0
ffffffffc0206e7c:	fffff517          	auipc	a0,0xfffff
ffffffffc0206e80:	4c050513          	addi	a0,a0,1216 # ffffffffc020633c <init_main>
ffffffffc0206e84:	c31c                	sw	a5,0(a4)
ffffffffc0206e86:	00090797          	auipc	a5,0x90
ffffffffc0206e8a:	a2d7bd23          	sd	a3,-1478(a5) # ffffffffc02968c0 <current>
ffffffffc0206e8e:	92aff0ef          	jal	ra,ffffffffc0205fb8 <kernel_thread>
ffffffffc0206e92:	842a                	mv	s0,a0
ffffffffc0206e94:	08a05363          	blez	a0,ffffffffc0206f1a <proc_init+0x144>
ffffffffc0206e98:	6789                	lui	a5,0x2
ffffffffc0206e9a:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206e9e:	17f9                	addi	a5,a5,-2
ffffffffc0206ea0:	2501                	sext.w	a0,a0
ffffffffc0206ea2:	02e7e363          	bltu	a5,a4,ffffffffc0206ec8 <proc_init+0xf2>
ffffffffc0206ea6:	45a9                	li	a1,10
ffffffffc0206ea8:	060040ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc0206eac:	02051793          	slli	a5,a0,0x20
ffffffffc0206eb0:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206eb4:	96a6                	add	a3,a3,s1
ffffffffc0206eb6:	87b6                	mv	a5,a3
ffffffffc0206eb8:	a029                	j	ffffffffc0206ec2 <proc_init+0xec>
ffffffffc0206eba:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206ebe:	04870b63          	beq	a4,s0,ffffffffc0206f14 <proc_init+0x13e>
ffffffffc0206ec2:	679c                	ld	a5,8(a5)
ffffffffc0206ec4:	fef69be3          	bne	a3,a5,ffffffffc0206eba <proc_init+0xe4>
ffffffffc0206ec8:	4781                	li	a5,0
ffffffffc0206eca:	0b478493          	addi	s1,a5,180
ffffffffc0206ece:	4641                	li	a2,16
ffffffffc0206ed0:	4581                	li	a1,0
ffffffffc0206ed2:	00090417          	auipc	s0,0x90
ffffffffc0206ed6:	9fe40413          	addi	s0,s0,-1538 # ffffffffc02968d0 <initproc>
ffffffffc0206eda:	8526                	mv	a0,s1
ffffffffc0206edc:	e01c                	sd	a5,0(s0)
ffffffffc0206ede:	55e040ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0206ee2:	463d                	li	a2,15
ffffffffc0206ee4:	00007597          	auipc	a1,0x7
ffffffffc0206ee8:	96458593          	addi	a1,a1,-1692 # ffffffffc020d848 <CSWTCH.79+0x518>
ffffffffc0206eec:	8526                	mv	a0,s1
ffffffffc0206eee:	5a0040ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc0206ef2:	00093783          	ld	a5,0(s2)
ffffffffc0206ef6:	c7d1                	beqz	a5,ffffffffc0206f82 <proc_init+0x1ac>
ffffffffc0206ef8:	43dc                	lw	a5,4(a5)
ffffffffc0206efa:	e7c1                	bnez	a5,ffffffffc0206f82 <proc_init+0x1ac>
ffffffffc0206efc:	601c                	ld	a5,0(s0)
ffffffffc0206efe:	c3b5                	beqz	a5,ffffffffc0206f62 <proc_init+0x18c>
ffffffffc0206f00:	43d8                	lw	a4,4(a5)
ffffffffc0206f02:	4785                	li	a5,1
ffffffffc0206f04:	04f71f63          	bne	a4,a5,ffffffffc0206f62 <proc_init+0x18c>
ffffffffc0206f08:	60e2                	ld	ra,24(sp)
ffffffffc0206f0a:	6442                	ld	s0,16(sp)
ffffffffc0206f0c:	64a2                	ld	s1,8(sp)
ffffffffc0206f0e:	6902                	ld	s2,0(sp)
ffffffffc0206f10:	6105                	addi	sp,sp,32
ffffffffc0206f12:	8082                	ret
ffffffffc0206f14:	f2878793          	addi	a5,a5,-216
ffffffffc0206f18:	bf4d                	j	ffffffffc0206eca <proc_init+0xf4>
ffffffffc0206f1a:	00007617          	auipc	a2,0x7
ffffffffc0206f1e:	90e60613          	addi	a2,a2,-1778 # ffffffffc020d828 <CSWTCH.79+0x4f8>
ffffffffc0206f22:	4d800593          	li	a1,1240
ffffffffc0206f26:	00006517          	auipc	a0,0x6
ffffffffc0206f2a:	51a50513          	addi	a0,a0,1306 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206f2e:	d70f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f32:	00007617          	auipc	a2,0x7
ffffffffc0206f36:	8c660613          	addi	a2,a2,-1850 # ffffffffc020d7f8 <CSWTCH.79+0x4c8>
ffffffffc0206f3a:	4cc00593          	li	a1,1228
ffffffffc0206f3e:	00006517          	auipc	a0,0x6
ffffffffc0206f42:	50250513          	addi	a0,a0,1282 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206f46:	d58f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f4a:	00007617          	auipc	a2,0x7
ffffffffc0206f4e:	89660613          	addi	a2,a2,-1898 # ffffffffc020d7e0 <CSWTCH.79+0x4b0>
ffffffffc0206f52:	4c200593          	li	a1,1218
ffffffffc0206f56:	00006517          	auipc	a0,0x6
ffffffffc0206f5a:	4ea50513          	addi	a0,a0,1258 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206f5e:	d40f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f62:	00007697          	auipc	a3,0x7
ffffffffc0206f66:	91668693          	addi	a3,a3,-1770 # ffffffffc020d878 <CSWTCH.79+0x548>
ffffffffc0206f6a:	00005617          	auipc	a2,0x5
ffffffffc0206f6e:	9b660613          	addi	a2,a2,-1610 # ffffffffc020b920 <commands+0x210>
ffffffffc0206f72:	4df00593          	li	a1,1247
ffffffffc0206f76:	00006517          	auipc	a0,0x6
ffffffffc0206f7a:	4ca50513          	addi	a0,a0,1226 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206f7e:	d20f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f82:	00007697          	auipc	a3,0x7
ffffffffc0206f86:	8ce68693          	addi	a3,a3,-1842 # ffffffffc020d850 <CSWTCH.79+0x520>
ffffffffc0206f8a:	00005617          	auipc	a2,0x5
ffffffffc0206f8e:	99660613          	addi	a2,a2,-1642 # ffffffffc020b920 <commands+0x210>
ffffffffc0206f92:	4de00593          	li	a1,1246
ffffffffc0206f96:	00006517          	auipc	a0,0x6
ffffffffc0206f9a:	4aa50513          	addi	a0,a0,1194 # ffffffffc020d440 <CSWTCH.79+0x110>
ffffffffc0206f9e:	d00f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206fa2 <cpu_idle>:
ffffffffc0206fa2:	1141                	addi	sp,sp,-16
ffffffffc0206fa4:	e022                	sd	s0,0(sp)
ffffffffc0206fa6:	e406                	sd	ra,8(sp)
ffffffffc0206fa8:	00090417          	auipc	s0,0x90
ffffffffc0206fac:	91840413          	addi	s0,s0,-1768 # ffffffffc02968c0 <current>
ffffffffc0206fb0:	6018                	ld	a4,0(s0)
ffffffffc0206fb2:	6f1c                	ld	a5,24(a4)
ffffffffc0206fb4:	dffd                	beqz	a5,ffffffffc0206fb2 <cpu_idle+0x10>
ffffffffc0206fb6:	31a000ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0206fba:	bfdd                	j	ffffffffc0206fb0 <cpu_idle+0xe>

ffffffffc0206fbc <lab6_set_priority>:
ffffffffc0206fbc:	1141                	addi	sp,sp,-16
ffffffffc0206fbe:	e022                	sd	s0,0(sp)
ffffffffc0206fc0:	85aa                	mv	a1,a0
ffffffffc0206fc2:	842a                	mv	s0,a0
ffffffffc0206fc4:	00007517          	auipc	a0,0x7
ffffffffc0206fc8:	8dc50513          	addi	a0,a0,-1828 # ffffffffc020d8a0 <CSWTCH.79+0x570>
ffffffffc0206fcc:	e406                	sd	ra,8(sp)
ffffffffc0206fce:	9d8f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206fd2:	00090797          	auipc	a5,0x90
ffffffffc0206fd6:	8ee7b783          	ld	a5,-1810(a5) # ffffffffc02968c0 <current>
ffffffffc0206fda:	e801                	bnez	s0,ffffffffc0206fea <lab6_set_priority+0x2e>
ffffffffc0206fdc:	60a2                	ld	ra,8(sp)
ffffffffc0206fde:	6402                	ld	s0,0(sp)
ffffffffc0206fe0:	4705                	li	a4,1
ffffffffc0206fe2:	14e7a223          	sw	a4,324(a5)
ffffffffc0206fe6:	0141                	addi	sp,sp,16
ffffffffc0206fe8:	8082                	ret
ffffffffc0206fea:	60a2                	ld	ra,8(sp)
ffffffffc0206fec:	1487a223          	sw	s0,324(a5)
ffffffffc0206ff0:	6402                	ld	s0,0(sp)
ffffffffc0206ff2:	0141                	addi	sp,sp,16
ffffffffc0206ff4:	8082                	ret

ffffffffc0206ff6 <do_sleep>:
ffffffffc0206ff6:	c539                	beqz	a0,ffffffffc0207044 <do_sleep+0x4e>
ffffffffc0206ff8:	7179                	addi	sp,sp,-48
ffffffffc0206ffa:	f022                	sd	s0,32(sp)
ffffffffc0206ffc:	f406                	sd	ra,40(sp)
ffffffffc0206ffe:	842a                	mv	s0,a0
ffffffffc0207000:	100027f3          	csrr	a5,sstatus
ffffffffc0207004:	8b89                	andi	a5,a5,2
ffffffffc0207006:	e3a9                	bnez	a5,ffffffffc0207048 <do_sleep+0x52>
ffffffffc0207008:	00090797          	auipc	a5,0x90
ffffffffc020700c:	8b87b783          	ld	a5,-1864(a5) # ffffffffc02968c0 <current>
ffffffffc0207010:	0818                	addi	a4,sp,16
ffffffffc0207012:	c02a                	sw	a0,0(sp)
ffffffffc0207014:	ec3a                	sd	a4,24(sp)
ffffffffc0207016:	e83a                	sd	a4,16(sp)
ffffffffc0207018:	e43e                	sd	a5,8(sp)
ffffffffc020701a:	4705                	li	a4,1
ffffffffc020701c:	c398                	sw	a4,0(a5)
ffffffffc020701e:	80000737          	lui	a4,0x80000
ffffffffc0207022:	840a                	mv	s0,sp
ffffffffc0207024:	0709                	addi	a4,a4,2
ffffffffc0207026:	0ee7a623          	sw	a4,236(a5)
ffffffffc020702a:	8522                	mv	a0,s0
ffffffffc020702c:	364000ef          	jal	ra,ffffffffc0207390 <add_timer>
ffffffffc0207030:	2a0000ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0207034:	8522                	mv	a0,s0
ffffffffc0207036:	422000ef          	jal	ra,ffffffffc0207458 <del_timer>
ffffffffc020703a:	70a2                	ld	ra,40(sp)
ffffffffc020703c:	7402                	ld	s0,32(sp)
ffffffffc020703e:	4501                	li	a0,0
ffffffffc0207040:	6145                	addi	sp,sp,48
ffffffffc0207042:	8082                	ret
ffffffffc0207044:	4501                	li	a0,0
ffffffffc0207046:	8082                	ret
ffffffffc0207048:	c2bf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020704c:	00090797          	auipc	a5,0x90
ffffffffc0207050:	8747b783          	ld	a5,-1932(a5) # ffffffffc02968c0 <current>
ffffffffc0207054:	0818                	addi	a4,sp,16
ffffffffc0207056:	c022                	sw	s0,0(sp)
ffffffffc0207058:	e43e                	sd	a5,8(sp)
ffffffffc020705a:	ec3a                	sd	a4,24(sp)
ffffffffc020705c:	e83a                	sd	a4,16(sp)
ffffffffc020705e:	4705                	li	a4,1
ffffffffc0207060:	c398                	sw	a4,0(a5)
ffffffffc0207062:	80000737          	lui	a4,0x80000
ffffffffc0207066:	0709                	addi	a4,a4,2
ffffffffc0207068:	840a                	mv	s0,sp
ffffffffc020706a:	8522                	mv	a0,s0
ffffffffc020706c:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207070:	320000ef          	jal	ra,ffffffffc0207390 <add_timer>
ffffffffc0207074:	bf9f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0207078:	bf65                	j	ffffffffc0207030 <do_sleep+0x3a>

ffffffffc020707a <switch_to>:
ffffffffc020707a:	00153023          	sd	ra,0(a0)
ffffffffc020707e:	00253423          	sd	sp,8(a0)
ffffffffc0207082:	e900                	sd	s0,16(a0)
ffffffffc0207084:	ed04                	sd	s1,24(a0)
ffffffffc0207086:	03253023          	sd	s2,32(a0)
ffffffffc020708a:	03353423          	sd	s3,40(a0)
ffffffffc020708e:	03453823          	sd	s4,48(a0)
ffffffffc0207092:	03553c23          	sd	s5,56(a0)
ffffffffc0207096:	05653023          	sd	s6,64(a0)
ffffffffc020709a:	05753423          	sd	s7,72(a0)
ffffffffc020709e:	05853823          	sd	s8,80(a0)
ffffffffc02070a2:	05953c23          	sd	s9,88(a0)
ffffffffc02070a6:	07a53023          	sd	s10,96(a0)
ffffffffc02070aa:	07b53423          	sd	s11,104(a0)
ffffffffc02070ae:	0005b083          	ld	ra,0(a1)
ffffffffc02070b2:	0085b103          	ld	sp,8(a1)
ffffffffc02070b6:	6980                	ld	s0,16(a1)
ffffffffc02070b8:	6d84                	ld	s1,24(a1)
ffffffffc02070ba:	0205b903          	ld	s2,32(a1)
ffffffffc02070be:	0285b983          	ld	s3,40(a1)
ffffffffc02070c2:	0305ba03          	ld	s4,48(a1)
ffffffffc02070c6:	0385ba83          	ld	s5,56(a1)
ffffffffc02070ca:	0405bb03          	ld	s6,64(a1)
ffffffffc02070ce:	0485bb83          	ld	s7,72(a1)
ffffffffc02070d2:	0505bc03          	ld	s8,80(a1)
ffffffffc02070d6:	0585bc83          	ld	s9,88(a1)
ffffffffc02070da:	0605bd03          	ld	s10,96(a1)
ffffffffc02070de:	0685bd83          	ld	s11,104(a1)
ffffffffc02070e2:	8082                	ret

ffffffffc02070e4 <RR_init>:
ffffffffc02070e4:	e508                	sd	a0,8(a0)
ffffffffc02070e6:	e108                	sd	a0,0(a0)
ffffffffc02070e8:	00052823          	sw	zero,16(a0)
ffffffffc02070ec:	8082                	ret

ffffffffc02070ee <RR_pick_next>:
ffffffffc02070ee:	651c                	ld	a5,8(a0)
ffffffffc02070f0:	00f50563          	beq	a0,a5,ffffffffc02070fa <RR_pick_next+0xc>
ffffffffc02070f4:	ef078513          	addi	a0,a5,-272
ffffffffc02070f8:	8082                	ret
ffffffffc02070fa:	4501                	li	a0,0
ffffffffc02070fc:	8082                	ret

ffffffffc02070fe <RR_proc_tick>:
ffffffffc02070fe:	1205a783          	lw	a5,288(a1)
ffffffffc0207102:	00f05563          	blez	a5,ffffffffc020710c <RR_proc_tick+0xe>
ffffffffc0207106:	37fd                	addiw	a5,a5,-1
ffffffffc0207108:	12f5a023          	sw	a5,288(a1)
ffffffffc020710c:	e399                	bnez	a5,ffffffffc0207112 <RR_proc_tick+0x14>
ffffffffc020710e:	4785                	li	a5,1
ffffffffc0207110:	ed9c                	sd	a5,24(a1)
ffffffffc0207112:	8082                	ret

ffffffffc0207114 <RR_dequeue>:
ffffffffc0207114:	1185b703          	ld	a4,280(a1)
ffffffffc0207118:	11058793          	addi	a5,a1,272
ffffffffc020711c:	02e78363          	beq	a5,a4,ffffffffc0207142 <RR_dequeue+0x2e>
ffffffffc0207120:	1085b683          	ld	a3,264(a1)
ffffffffc0207124:	00a69f63          	bne	a3,a0,ffffffffc0207142 <RR_dequeue+0x2e>
ffffffffc0207128:	1105b503          	ld	a0,272(a1)
ffffffffc020712c:	4a90                	lw	a2,16(a3)
ffffffffc020712e:	e518                	sd	a4,8(a0)
ffffffffc0207130:	e308                	sd	a0,0(a4)
ffffffffc0207132:	10f5bc23          	sd	a5,280(a1)
ffffffffc0207136:	10f5b823          	sd	a5,272(a1)
ffffffffc020713a:	fff6079b          	addiw	a5,a2,-1
ffffffffc020713e:	ca9c                	sw	a5,16(a3)
ffffffffc0207140:	8082                	ret
ffffffffc0207142:	1141                	addi	sp,sp,-16
ffffffffc0207144:	00006697          	auipc	a3,0x6
ffffffffc0207148:	77468693          	addi	a3,a3,1908 # ffffffffc020d8b8 <CSWTCH.79+0x588>
ffffffffc020714c:	00004617          	auipc	a2,0x4
ffffffffc0207150:	7d460613          	addi	a2,a2,2004 # ffffffffc020b920 <commands+0x210>
ffffffffc0207154:	03c00593          	li	a1,60
ffffffffc0207158:	00006517          	auipc	a0,0x6
ffffffffc020715c:	79850513          	addi	a0,a0,1944 # ffffffffc020d8f0 <CSWTCH.79+0x5c0>
ffffffffc0207160:	e406                	sd	ra,8(sp)
ffffffffc0207162:	b3cf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207166 <RR_enqueue>:
ffffffffc0207166:	1185b703          	ld	a4,280(a1)
ffffffffc020716a:	11058793          	addi	a5,a1,272
ffffffffc020716e:	02e79d63          	bne	a5,a4,ffffffffc02071a8 <RR_enqueue+0x42>
ffffffffc0207172:	6118                	ld	a4,0(a0)
ffffffffc0207174:	1205a683          	lw	a3,288(a1)
ffffffffc0207178:	e11c                	sd	a5,0(a0)
ffffffffc020717a:	e71c                	sd	a5,8(a4)
ffffffffc020717c:	10a5bc23          	sd	a0,280(a1)
ffffffffc0207180:	10e5b823          	sd	a4,272(a1)
ffffffffc0207184:	495c                	lw	a5,20(a0)
ffffffffc0207186:	ea89                	bnez	a3,ffffffffc0207198 <RR_enqueue+0x32>
ffffffffc0207188:	12f5a023          	sw	a5,288(a1)
ffffffffc020718c:	491c                	lw	a5,16(a0)
ffffffffc020718e:	10a5b423          	sd	a0,264(a1)
ffffffffc0207192:	2785                	addiw	a5,a5,1
ffffffffc0207194:	c91c                	sw	a5,16(a0)
ffffffffc0207196:	8082                	ret
ffffffffc0207198:	fed7c8e3          	blt	a5,a3,ffffffffc0207188 <RR_enqueue+0x22>
ffffffffc020719c:	491c                	lw	a5,16(a0)
ffffffffc020719e:	10a5b423          	sd	a0,264(a1)
ffffffffc02071a2:	2785                	addiw	a5,a5,1
ffffffffc02071a4:	c91c                	sw	a5,16(a0)
ffffffffc02071a6:	8082                	ret
ffffffffc02071a8:	1141                	addi	sp,sp,-16
ffffffffc02071aa:	00006697          	auipc	a3,0x6
ffffffffc02071ae:	76668693          	addi	a3,a3,1894 # ffffffffc020d910 <CSWTCH.79+0x5e0>
ffffffffc02071b2:	00004617          	auipc	a2,0x4
ffffffffc02071b6:	76e60613          	addi	a2,a2,1902 # ffffffffc020b920 <commands+0x210>
ffffffffc02071ba:	02800593          	li	a1,40
ffffffffc02071be:	00006517          	auipc	a0,0x6
ffffffffc02071c2:	73250513          	addi	a0,a0,1842 # ffffffffc020d8f0 <CSWTCH.79+0x5c0>
ffffffffc02071c6:	e406                	sd	ra,8(sp)
ffffffffc02071c8:	ad6f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071cc <sched_init>:
ffffffffc02071cc:	1141                	addi	sp,sp,-16
ffffffffc02071ce:	0008a717          	auipc	a4,0x8a
ffffffffc02071d2:	e5270713          	addi	a4,a4,-430 # ffffffffc0291020 <default_sched_class>
ffffffffc02071d6:	e022                	sd	s0,0(sp)
ffffffffc02071d8:	e406                	sd	ra,8(sp)
ffffffffc02071da:	0008e797          	auipc	a5,0x8e
ffffffffc02071de:	61678793          	addi	a5,a5,1558 # ffffffffc02957f0 <timer_list>
ffffffffc02071e2:	6714                	ld	a3,8(a4)
ffffffffc02071e4:	0008e517          	auipc	a0,0x8e
ffffffffc02071e8:	5ec50513          	addi	a0,a0,1516 # ffffffffc02957d0 <__rq>
ffffffffc02071ec:	e79c                	sd	a5,8(a5)
ffffffffc02071ee:	e39c                	sd	a5,0(a5)
ffffffffc02071f0:	4795                	li	a5,5
ffffffffc02071f2:	c95c                	sw	a5,20(a0)
ffffffffc02071f4:	0008f417          	auipc	s0,0x8f
ffffffffc02071f8:	6f440413          	addi	s0,s0,1780 # ffffffffc02968e8 <sched_class>
ffffffffc02071fc:	0008f797          	auipc	a5,0x8f
ffffffffc0207200:	6ea7b223          	sd	a0,1764(a5) # ffffffffc02968e0 <rq>
ffffffffc0207204:	e018                	sd	a4,0(s0)
ffffffffc0207206:	9682                	jalr	a3
ffffffffc0207208:	601c                	ld	a5,0(s0)
ffffffffc020720a:	6402                	ld	s0,0(sp)
ffffffffc020720c:	60a2                	ld	ra,8(sp)
ffffffffc020720e:	638c                	ld	a1,0(a5)
ffffffffc0207210:	00006517          	auipc	a0,0x6
ffffffffc0207214:	73050513          	addi	a0,a0,1840 # ffffffffc020d940 <CSWTCH.79+0x610>
ffffffffc0207218:	0141                	addi	sp,sp,16
ffffffffc020721a:	f8df806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc020721e <wakeup_proc>:
ffffffffc020721e:	4118                	lw	a4,0(a0)
ffffffffc0207220:	1101                	addi	sp,sp,-32
ffffffffc0207222:	ec06                	sd	ra,24(sp)
ffffffffc0207224:	e822                	sd	s0,16(sp)
ffffffffc0207226:	e426                	sd	s1,8(sp)
ffffffffc0207228:	478d                	li	a5,3
ffffffffc020722a:	08f70363          	beq	a4,a5,ffffffffc02072b0 <wakeup_proc+0x92>
ffffffffc020722e:	842a                	mv	s0,a0
ffffffffc0207230:	100027f3          	csrr	a5,sstatus
ffffffffc0207234:	8b89                	andi	a5,a5,2
ffffffffc0207236:	4481                	li	s1,0
ffffffffc0207238:	e7bd                	bnez	a5,ffffffffc02072a6 <wakeup_proc+0x88>
ffffffffc020723a:	4789                	li	a5,2
ffffffffc020723c:	04f70863          	beq	a4,a5,ffffffffc020728c <wakeup_proc+0x6e>
ffffffffc0207240:	c01c                	sw	a5,0(s0)
ffffffffc0207242:	0e042623          	sw	zero,236(s0)
ffffffffc0207246:	0008f797          	auipc	a5,0x8f
ffffffffc020724a:	67a7b783          	ld	a5,1658(a5) # ffffffffc02968c0 <current>
ffffffffc020724e:	02878363          	beq	a5,s0,ffffffffc0207274 <wakeup_proc+0x56>
ffffffffc0207252:	0008f797          	auipc	a5,0x8f
ffffffffc0207256:	6767b783          	ld	a5,1654(a5) # ffffffffc02968c8 <idleproc>
ffffffffc020725a:	00f40d63          	beq	s0,a5,ffffffffc0207274 <wakeup_proc+0x56>
ffffffffc020725e:	0008f797          	auipc	a5,0x8f
ffffffffc0207262:	68a7b783          	ld	a5,1674(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207266:	6b9c                	ld	a5,16(a5)
ffffffffc0207268:	85a2                	mv	a1,s0
ffffffffc020726a:	0008f517          	auipc	a0,0x8f
ffffffffc020726e:	67653503          	ld	a0,1654(a0) # ffffffffc02968e0 <rq>
ffffffffc0207272:	9782                	jalr	a5
ffffffffc0207274:	e491                	bnez	s1,ffffffffc0207280 <wakeup_proc+0x62>
ffffffffc0207276:	60e2                	ld	ra,24(sp)
ffffffffc0207278:	6442                	ld	s0,16(sp)
ffffffffc020727a:	64a2                	ld	s1,8(sp)
ffffffffc020727c:	6105                	addi	sp,sp,32
ffffffffc020727e:	8082                	ret
ffffffffc0207280:	6442                	ld	s0,16(sp)
ffffffffc0207282:	60e2                	ld	ra,24(sp)
ffffffffc0207284:	64a2                	ld	s1,8(sp)
ffffffffc0207286:	6105                	addi	sp,sp,32
ffffffffc0207288:	9e5f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020728c:	00006617          	auipc	a2,0x6
ffffffffc0207290:	70460613          	addi	a2,a2,1796 # ffffffffc020d990 <CSWTCH.79+0x660>
ffffffffc0207294:	05200593          	li	a1,82
ffffffffc0207298:	00006517          	auipc	a0,0x6
ffffffffc020729c:	6e050513          	addi	a0,a0,1760 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc02072a0:	a66f90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02072a4:	bfc1                	j	ffffffffc0207274 <wakeup_proc+0x56>
ffffffffc02072a6:	9cdf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02072aa:	4018                	lw	a4,0(s0)
ffffffffc02072ac:	4485                	li	s1,1
ffffffffc02072ae:	b771                	j	ffffffffc020723a <wakeup_proc+0x1c>
ffffffffc02072b0:	00006697          	auipc	a3,0x6
ffffffffc02072b4:	6a868693          	addi	a3,a3,1704 # ffffffffc020d958 <CSWTCH.79+0x628>
ffffffffc02072b8:	00004617          	auipc	a2,0x4
ffffffffc02072bc:	66860613          	addi	a2,a2,1640 # ffffffffc020b920 <commands+0x210>
ffffffffc02072c0:	04300593          	li	a1,67
ffffffffc02072c4:	00006517          	auipc	a0,0x6
ffffffffc02072c8:	6b450513          	addi	a0,a0,1716 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc02072cc:	9d2f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02072d0 <schedule>:
ffffffffc02072d0:	7179                	addi	sp,sp,-48
ffffffffc02072d2:	f406                	sd	ra,40(sp)
ffffffffc02072d4:	f022                	sd	s0,32(sp)
ffffffffc02072d6:	ec26                	sd	s1,24(sp)
ffffffffc02072d8:	e84a                	sd	s2,16(sp)
ffffffffc02072da:	e44e                	sd	s3,8(sp)
ffffffffc02072dc:	e052                	sd	s4,0(sp)
ffffffffc02072de:	100027f3          	csrr	a5,sstatus
ffffffffc02072e2:	8b89                	andi	a5,a5,2
ffffffffc02072e4:	4a01                	li	s4,0
ffffffffc02072e6:	e3cd                	bnez	a5,ffffffffc0207388 <schedule+0xb8>
ffffffffc02072e8:	0008f497          	auipc	s1,0x8f
ffffffffc02072ec:	5d848493          	addi	s1,s1,1496 # ffffffffc02968c0 <current>
ffffffffc02072f0:	608c                	ld	a1,0(s1)
ffffffffc02072f2:	0008f997          	auipc	s3,0x8f
ffffffffc02072f6:	5f698993          	addi	s3,s3,1526 # ffffffffc02968e8 <sched_class>
ffffffffc02072fa:	0008f917          	auipc	s2,0x8f
ffffffffc02072fe:	5e690913          	addi	s2,s2,1510 # ffffffffc02968e0 <rq>
ffffffffc0207302:	4194                	lw	a3,0(a1)
ffffffffc0207304:	0005bc23          	sd	zero,24(a1)
ffffffffc0207308:	4709                	li	a4,2
ffffffffc020730a:	0009b783          	ld	a5,0(s3)
ffffffffc020730e:	00093503          	ld	a0,0(s2)
ffffffffc0207312:	04e68e63          	beq	a3,a4,ffffffffc020736e <schedule+0x9e>
ffffffffc0207316:	739c                	ld	a5,32(a5)
ffffffffc0207318:	9782                	jalr	a5
ffffffffc020731a:	842a                	mv	s0,a0
ffffffffc020731c:	c521                	beqz	a0,ffffffffc0207364 <schedule+0x94>
ffffffffc020731e:	0009b783          	ld	a5,0(s3)
ffffffffc0207322:	00093503          	ld	a0,0(s2)
ffffffffc0207326:	85a2                	mv	a1,s0
ffffffffc0207328:	6f9c                	ld	a5,24(a5)
ffffffffc020732a:	9782                	jalr	a5
ffffffffc020732c:	441c                	lw	a5,8(s0)
ffffffffc020732e:	6098                	ld	a4,0(s1)
ffffffffc0207330:	2785                	addiw	a5,a5,1
ffffffffc0207332:	c41c                	sw	a5,8(s0)
ffffffffc0207334:	00870563          	beq	a4,s0,ffffffffc020733e <schedule+0x6e>
ffffffffc0207338:	8522                	mv	a0,s0
ffffffffc020733a:	fb8fe0ef          	jal	ra,ffffffffc0205af2 <proc_run>
ffffffffc020733e:	000a1a63          	bnez	s4,ffffffffc0207352 <schedule+0x82>
ffffffffc0207342:	70a2                	ld	ra,40(sp)
ffffffffc0207344:	7402                	ld	s0,32(sp)
ffffffffc0207346:	64e2                	ld	s1,24(sp)
ffffffffc0207348:	6942                	ld	s2,16(sp)
ffffffffc020734a:	69a2                	ld	s3,8(sp)
ffffffffc020734c:	6a02                	ld	s4,0(sp)
ffffffffc020734e:	6145                	addi	sp,sp,48
ffffffffc0207350:	8082                	ret
ffffffffc0207352:	7402                	ld	s0,32(sp)
ffffffffc0207354:	70a2                	ld	ra,40(sp)
ffffffffc0207356:	64e2                	ld	s1,24(sp)
ffffffffc0207358:	6942                	ld	s2,16(sp)
ffffffffc020735a:	69a2                	ld	s3,8(sp)
ffffffffc020735c:	6a02                	ld	s4,0(sp)
ffffffffc020735e:	6145                	addi	sp,sp,48
ffffffffc0207360:	90df906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207364:	0008f417          	auipc	s0,0x8f
ffffffffc0207368:	56443403          	ld	s0,1380(s0) # ffffffffc02968c8 <idleproc>
ffffffffc020736c:	b7c1                	j	ffffffffc020732c <schedule+0x5c>
ffffffffc020736e:	0008f717          	auipc	a4,0x8f
ffffffffc0207372:	55a73703          	ld	a4,1370(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0207376:	fae580e3          	beq	a1,a4,ffffffffc0207316 <schedule+0x46>
ffffffffc020737a:	6b9c                	ld	a5,16(a5)
ffffffffc020737c:	9782                	jalr	a5
ffffffffc020737e:	0009b783          	ld	a5,0(s3)
ffffffffc0207382:	00093503          	ld	a0,0(s2)
ffffffffc0207386:	bf41                	j	ffffffffc0207316 <schedule+0x46>
ffffffffc0207388:	8ebf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020738c:	4a05                	li	s4,1
ffffffffc020738e:	bfa9                	j	ffffffffc02072e8 <schedule+0x18>

ffffffffc0207390 <add_timer>:
ffffffffc0207390:	1141                	addi	sp,sp,-16
ffffffffc0207392:	e022                	sd	s0,0(sp)
ffffffffc0207394:	e406                	sd	ra,8(sp)
ffffffffc0207396:	842a                	mv	s0,a0
ffffffffc0207398:	100027f3          	csrr	a5,sstatus
ffffffffc020739c:	8b89                	andi	a5,a5,2
ffffffffc020739e:	4501                	li	a0,0
ffffffffc02073a0:	eba5                	bnez	a5,ffffffffc0207410 <add_timer+0x80>
ffffffffc02073a2:	401c                	lw	a5,0(s0)
ffffffffc02073a4:	cbb5                	beqz	a5,ffffffffc0207418 <add_timer+0x88>
ffffffffc02073a6:	6418                	ld	a4,8(s0)
ffffffffc02073a8:	cb25                	beqz	a4,ffffffffc0207418 <add_timer+0x88>
ffffffffc02073aa:	6c18                	ld	a4,24(s0)
ffffffffc02073ac:	01040593          	addi	a1,s0,16
ffffffffc02073b0:	08e59463          	bne	a1,a4,ffffffffc0207438 <add_timer+0xa8>
ffffffffc02073b4:	0008e617          	auipc	a2,0x8e
ffffffffc02073b8:	43c60613          	addi	a2,a2,1084 # ffffffffc02957f0 <timer_list>
ffffffffc02073bc:	6618                	ld	a4,8(a2)
ffffffffc02073be:	00c71863          	bne	a4,a2,ffffffffc02073ce <add_timer+0x3e>
ffffffffc02073c2:	a80d                	j	ffffffffc02073f4 <add_timer+0x64>
ffffffffc02073c4:	6718                	ld	a4,8(a4)
ffffffffc02073c6:	9f95                	subw	a5,a5,a3
ffffffffc02073c8:	c01c                	sw	a5,0(s0)
ffffffffc02073ca:	02c70563          	beq	a4,a2,ffffffffc02073f4 <add_timer+0x64>
ffffffffc02073ce:	ff072683          	lw	a3,-16(a4)
ffffffffc02073d2:	fed7f9e3          	bgeu	a5,a3,ffffffffc02073c4 <add_timer+0x34>
ffffffffc02073d6:	40f687bb          	subw	a5,a3,a5
ffffffffc02073da:	fef72823          	sw	a5,-16(a4)
ffffffffc02073de:	631c                	ld	a5,0(a4)
ffffffffc02073e0:	e30c                	sd	a1,0(a4)
ffffffffc02073e2:	e78c                	sd	a1,8(a5)
ffffffffc02073e4:	ec18                	sd	a4,24(s0)
ffffffffc02073e6:	e81c                	sd	a5,16(s0)
ffffffffc02073e8:	c105                	beqz	a0,ffffffffc0207408 <add_timer+0x78>
ffffffffc02073ea:	6402                	ld	s0,0(sp)
ffffffffc02073ec:	60a2                	ld	ra,8(sp)
ffffffffc02073ee:	0141                	addi	sp,sp,16
ffffffffc02073f0:	87df906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02073f4:	0008e717          	auipc	a4,0x8e
ffffffffc02073f8:	3fc70713          	addi	a4,a4,1020 # ffffffffc02957f0 <timer_list>
ffffffffc02073fc:	631c                	ld	a5,0(a4)
ffffffffc02073fe:	e30c                	sd	a1,0(a4)
ffffffffc0207400:	e78c                	sd	a1,8(a5)
ffffffffc0207402:	ec18                	sd	a4,24(s0)
ffffffffc0207404:	e81c                	sd	a5,16(s0)
ffffffffc0207406:	f175                	bnez	a0,ffffffffc02073ea <add_timer+0x5a>
ffffffffc0207408:	60a2                	ld	ra,8(sp)
ffffffffc020740a:	6402                	ld	s0,0(sp)
ffffffffc020740c:	0141                	addi	sp,sp,16
ffffffffc020740e:	8082                	ret
ffffffffc0207410:	863f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207414:	4505                	li	a0,1
ffffffffc0207416:	b771                	j	ffffffffc02073a2 <add_timer+0x12>
ffffffffc0207418:	00006697          	auipc	a3,0x6
ffffffffc020741c:	59868693          	addi	a3,a3,1432 # ffffffffc020d9b0 <CSWTCH.79+0x680>
ffffffffc0207420:	00004617          	auipc	a2,0x4
ffffffffc0207424:	50060613          	addi	a2,a2,1280 # ffffffffc020b920 <commands+0x210>
ffffffffc0207428:	07a00593          	li	a1,122
ffffffffc020742c:	00006517          	auipc	a0,0x6
ffffffffc0207430:	54c50513          	addi	a0,a0,1356 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc0207434:	86af90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207438:	00006697          	auipc	a3,0x6
ffffffffc020743c:	5a868693          	addi	a3,a3,1448 # ffffffffc020d9e0 <CSWTCH.79+0x6b0>
ffffffffc0207440:	00004617          	auipc	a2,0x4
ffffffffc0207444:	4e060613          	addi	a2,a2,1248 # ffffffffc020b920 <commands+0x210>
ffffffffc0207448:	07b00593          	li	a1,123
ffffffffc020744c:	00006517          	auipc	a0,0x6
ffffffffc0207450:	52c50513          	addi	a0,a0,1324 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc0207454:	84af90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207458 <del_timer>:
ffffffffc0207458:	1101                	addi	sp,sp,-32
ffffffffc020745a:	e822                	sd	s0,16(sp)
ffffffffc020745c:	ec06                	sd	ra,24(sp)
ffffffffc020745e:	e426                	sd	s1,8(sp)
ffffffffc0207460:	842a                	mv	s0,a0
ffffffffc0207462:	100027f3          	csrr	a5,sstatus
ffffffffc0207466:	8b89                	andi	a5,a5,2
ffffffffc0207468:	01050493          	addi	s1,a0,16
ffffffffc020746c:	eb9d                	bnez	a5,ffffffffc02074a2 <del_timer+0x4a>
ffffffffc020746e:	6d1c                	ld	a5,24(a0)
ffffffffc0207470:	02978463          	beq	a5,s1,ffffffffc0207498 <del_timer+0x40>
ffffffffc0207474:	4114                	lw	a3,0(a0)
ffffffffc0207476:	6918                	ld	a4,16(a0)
ffffffffc0207478:	ce81                	beqz	a3,ffffffffc0207490 <del_timer+0x38>
ffffffffc020747a:	0008e617          	auipc	a2,0x8e
ffffffffc020747e:	37660613          	addi	a2,a2,886 # ffffffffc02957f0 <timer_list>
ffffffffc0207482:	00c78763          	beq	a5,a2,ffffffffc0207490 <del_timer+0x38>
ffffffffc0207486:	ff07a603          	lw	a2,-16(a5)
ffffffffc020748a:	9eb1                	addw	a3,a3,a2
ffffffffc020748c:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207490:	e71c                	sd	a5,8(a4)
ffffffffc0207492:	e398                	sd	a4,0(a5)
ffffffffc0207494:	ec04                	sd	s1,24(s0)
ffffffffc0207496:	e804                	sd	s1,16(s0)
ffffffffc0207498:	60e2                	ld	ra,24(sp)
ffffffffc020749a:	6442                	ld	s0,16(sp)
ffffffffc020749c:	64a2                	ld	s1,8(sp)
ffffffffc020749e:	6105                	addi	sp,sp,32
ffffffffc02074a0:	8082                	ret
ffffffffc02074a2:	fd0f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02074a6:	6c1c                	ld	a5,24(s0)
ffffffffc02074a8:	02978463          	beq	a5,s1,ffffffffc02074d0 <del_timer+0x78>
ffffffffc02074ac:	4014                	lw	a3,0(s0)
ffffffffc02074ae:	6818                	ld	a4,16(s0)
ffffffffc02074b0:	ce81                	beqz	a3,ffffffffc02074c8 <del_timer+0x70>
ffffffffc02074b2:	0008e617          	auipc	a2,0x8e
ffffffffc02074b6:	33e60613          	addi	a2,a2,830 # ffffffffc02957f0 <timer_list>
ffffffffc02074ba:	00c78763          	beq	a5,a2,ffffffffc02074c8 <del_timer+0x70>
ffffffffc02074be:	ff07a603          	lw	a2,-16(a5)
ffffffffc02074c2:	9eb1                	addw	a3,a3,a2
ffffffffc02074c4:	fed7a823          	sw	a3,-16(a5)
ffffffffc02074c8:	e71c                	sd	a5,8(a4)
ffffffffc02074ca:	e398                	sd	a4,0(a5)
ffffffffc02074cc:	ec04                	sd	s1,24(s0)
ffffffffc02074ce:	e804                	sd	s1,16(s0)
ffffffffc02074d0:	6442                	ld	s0,16(sp)
ffffffffc02074d2:	60e2                	ld	ra,24(sp)
ffffffffc02074d4:	64a2                	ld	s1,8(sp)
ffffffffc02074d6:	6105                	addi	sp,sp,32
ffffffffc02074d8:	f94f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02074dc <run_timer_list>:
ffffffffc02074dc:	7139                	addi	sp,sp,-64
ffffffffc02074de:	fc06                	sd	ra,56(sp)
ffffffffc02074e0:	f822                	sd	s0,48(sp)
ffffffffc02074e2:	f426                	sd	s1,40(sp)
ffffffffc02074e4:	f04a                	sd	s2,32(sp)
ffffffffc02074e6:	ec4e                	sd	s3,24(sp)
ffffffffc02074e8:	e852                	sd	s4,16(sp)
ffffffffc02074ea:	e456                	sd	s5,8(sp)
ffffffffc02074ec:	e05a                	sd	s6,0(sp)
ffffffffc02074ee:	100027f3          	csrr	a5,sstatus
ffffffffc02074f2:	8b89                	andi	a5,a5,2
ffffffffc02074f4:	4b01                	li	s6,0
ffffffffc02074f6:	efe9                	bnez	a5,ffffffffc02075d0 <run_timer_list+0xf4>
ffffffffc02074f8:	0008e997          	auipc	s3,0x8e
ffffffffc02074fc:	2f898993          	addi	s3,s3,760 # ffffffffc02957f0 <timer_list>
ffffffffc0207500:	0089b403          	ld	s0,8(s3)
ffffffffc0207504:	07340a63          	beq	s0,s3,ffffffffc0207578 <run_timer_list+0x9c>
ffffffffc0207508:	ff042783          	lw	a5,-16(s0)
ffffffffc020750c:	ff040913          	addi	s2,s0,-16
ffffffffc0207510:	0e078763          	beqz	a5,ffffffffc02075fe <run_timer_list+0x122>
ffffffffc0207514:	fff7871b          	addiw	a4,a5,-1
ffffffffc0207518:	fee42823          	sw	a4,-16(s0)
ffffffffc020751c:	ef31                	bnez	a4,ffffffffc0207578 <run_timer_list+0x9c>
ffffffffc020751e:	00006a97          	auipc	s5,0x6
ffffffffc0207522:	52aa8a93          	addi	s5,s5,1322 # ffffffffc020da48 <CSWTCH.79+0x718>
ffffffffc0207526:	00006a17          	auipc	s4,0x6
ffffffffc020752a:	452a0a13          	addi	s4,s4,1106 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc020752e:	a005                	j	ffffffffc020754e <run_timer_list+0x72>
ffffffffc0207530:	0a07d763          	bgez	a5,ffffffffc02075de <run_timer_list+0x102>
ffffffffc0207534:	8526                	mv	a0,s1
ffffffffc0207536:	ce9ff0ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc020753a:	854a                	mv	a0,s2
ffffffffc020753c:	f1dff0ef          	jal	ra,ffffffffc0207458 <del_timer>
ffffffffc0207540:	03340c63          	beq	s0,s3,ffffffffc0207578 <run_timer_list+0x9c>
ffffffffc0207544:	ff042783          	lw	a5,-16(s0)
ffffffffc0207548:	ff040913          	addi	s2,s0,-16
ffffffffc020754c:	e795                	bnez	a5,ffffffffc0207578 <run_timer_list+0x9c>
ffffffffc020754e:	00893483          	ld	s1,8(s2)
ffffffffc0207552:	6400                	ld	s0,8(s0)
ffffffffc0207554:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207558:	ffe1                	bnez	a5,ffffffffc0207530 <run_timer_list+0x54>
ffffffffc020755a:	40d4                	lw	a3,4(s1)
ffffffffc020755c:	8656                	mv	a2,s5
ffffffffc020755e:	0ba00593          	li	a1,186
ffffffffc0207562:	8552                	mv	a0,s4
ffffffffc0207564:	fa3f80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207568:	8526                	mv	a0,s1
ffffffffc020756a:	cb5ff0ef          	jal	ra,ffffffffc020721e <wakeup_proc>
ffffffffc020756e:	854a                	mv	a0,s2
ffffffffc0207570:	ee9ff0ef          	jal	ra,ffffffffc0207458 <del_timer>
ffffffffc0207574:	fd3418e3          	bne	s0,s3,ffffffffc0207544 <run_timer_list+0x68>
ffffffffc0207578:	0008f597          	auipc	a1,0x8f
ffffffffc020757c:	3485b583          	ld	a1,840(a1) # ffffffffc02968c0 <current>
ffffffffc0207580:	c18d                	beqz	a1,ffffffffc02075a2 <run_timer_list+0xc6>
ffffffffc0207582:	0008f797          	auipc	a5,0x8f
ffffffffc0207586:	3467b783          	ld	a5,838(a5) # ffffffffc02968c8 <idleproc>
ffffffffc020758a:	04f58763          	beq	a1,a5,ffffffffc02075d8 <run_timer_list+0xfc>
ffffffffc020758e:	0008f797          	auipc	a5,0x8f
ffffffffc0207592:	35a7b783          	ld	a5,858(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207596:	779c                	ld	a5,40(a5)
ffffffffc0207598:	0008f517          	auipc	a0,0x8f
ffffffffc020759c:	34853503          	ld	a0,840(a0) # ffffffffc02968e0 <rq>
ffffffffc02075a0:	9782                	jalr	a5
ffffffffc02075a2:	000b1c63          	bnez	s6,ffffffffc02075ba <run_timer_list+0xde>
ffffffffc02075a6:	70e2                	ld	ra,56(sp)
ffffffffc02075a8:	7442                	ld	s0,48(sp)
ffffffffc02075aa:	74a2                	ld	s1,40(sp)
ffffffffc02075ac:	7902                	ld	s2,32(sp)
ffffffffc02075ae:	69e2                	ld	s3,24(sp)
ffffffffc02075b0:	6a42                	ld	s4,16(sp)
ffffffffc02075b2:	6aa2                	ld	s5,8(sp)
ffffffffc02075b4:	6b02                	ld	s6,0(sp)
ffffffffc02075b6:	6121                	addi	sp,sp,64
ffffffffc02075b8:	8082                	ret
ffffffffc02075ba:	7442                	ld	s0,48(sp)
ffffffffc02075bc:	70e2                	ld	ra,56(sp)
ffffffffc02075be:	74a2                	ld	s1,40(sp)
ffffffffc02075c0:	7902                	ld	s2,32(sp)
ffffffffc02075c2:	69e2                	ld	s3,24(sp)
ffffffffc02075c4:	6a42                	ld	s4,16(sp)
ffffffffc02075c6:	6aa2                	ld	s5,8(sp)
ffffffffc02075c8:	6b02                	ld	s6,0(sp)
ffffffffc02075ca:	6121                	addi	sp,sp,64
ffffffffc02075cc:	ea0f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02075d0:	ea2f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02075d4:	4b05                	li	s6,1
ffffffffc02075d6:	b70d                	j	ffffffffc02074f8 <run_timer_list+0x1c>
ffffffffc02075d8:	4785                	li	a5,1
ffffffffc02075da:	ed9c                	sd	a5,24(a1)
ffffffffc02075dc:	b7d9                	j	ffffffffc02075a2 <run_timer_list+0xc6>
ffffffffc02075de:	00006697          	auipc	a3,0x6
ffffffffc02075e2:	44268693          	addi	a3,a3,1090 # ffffffffc020da20 <CSWTCH.79+0x6f0>
ffffffffc02075e6:	00004617          	auipc	a2,0x4
ffffffffc02075ea:	33a60613          	addi	a2,a2,826 # ffffffffc020b920 <commands+0x210>
ffffffffc02075ee:	0b600593          	li	a1,182
ffffffffc02075f2:	00006517          	auipc	a0,0x6
ffffffffc02075f6:	38650513          	addi	a0,a0,902 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc02075fa:	ea5f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02075fe:	00006697          	auipc	a3,0x6
ffffffffc0207602:	40a68693          	addi	a3,a3,1034 # ffffffffc020da08 <CSWTCH.79+0x6d8>
ffffffffc0207606:	00004617          	auipc	a2,0x4
ffffffffc020760a:	31a60613          	addi	a2,a2,794 # ffffffffc020b920 <commands+0x210>
ffffffffc020760e:	0ae00593          	li	a1,174
ffffffffc0207612:	00006517          	auipc	a0,0x6
ffffffffc0207616:	36650513          	addi	a0,a0,870 # ffffffffc020d978 <CSWTCH.79+0x648>
ffffffffc020761a:	e85f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020761e <sys_getpid>:
ffffffffc020761e:	0008f797          	auipc	a5,0x8f
ffffffffc0207622:	2a27b783          	ld	a5,674(a5) # ffffffffc02968c0 <current>
ffffffffc0207626:	43c8                	lw	a0,4(a5)
ffffffffc0207628:	8082                	ret

ffffffffc020762a <sys_pgdir>:
ffffffffc020762a:	4501                	li	a0,0
ffffffffc020762c:	8082                	ret

ffffffffc020762e <sys_gettime>:
ffffffffc020762e:	0008f797          	auipc	a5,0x8f
ffffffffc0207632:	2427b783          	ld	a5,578(a5) # ffffffffc0296870 <ticks>
ffffffffc0207636:	0027951b          	slliw	a0,a5,0x2
ffffffffc020763a:	9d3d                	addw	a0,a0,a5
ffffffffc020763c:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207640:	8082                	ret

ffffffffc0207642 <sys_lab6_set_priority>:
ffffffffc0207642:	4108                	lw	a0,0(a0)
ffffffffc0207644:	1141                	addi	sp,sp,-16
ffffffffc0207646:	e406                	sd	ra,8(sp)
ffffffffc0207648:	975ff0ef          	jal	ra,ffffffffc0206fbc <lab6_set_priority>
ffffffffc020764c:	60a2                	ld	ra,8(sp)
ffffffffc020764e:	4501                	li	a0,0
ffffffffc0207650:	0141                	addi	sp,sp,16
ffffffffc0207652:	8082                	ret

ffffffffc0207654 <sys_dup>:
ffffffffc0207654:	450c                	lw	a1,8(a0)
ffffffffc0207656:	4108                	lw	a0,0(a0)
ffffffffc0207658:	b70fe06f          	j	ffffffffc02059c8 <sysfile_dup>

ffffffffc020765c <sys_getdirentry>:
ffffffffc020765c:	650c                	ld	a1,8(a0)
ffffffffc020765e:	4108                	lw	a0,0(a0)
ffffffffc0207660:	a78fe06f          	j	ffffffffc02058d8 <sysfile_getdirentry>

ffffffffc0207664 <sys_getcwd>:
ffffffffc0207664:	650c                	ld	a1,8(a0)
ffffffffc0207666:	6108                	ld	a0,0(a0)
ffffffffc0207668:	9ccfe06f          	j	ffffffffc0205834 <sysfile_getcwd>

ffffffffc020766c <sys_fsync>:
ffffffffc020766c:	4108                	lw	a0,0(a0)
ffffffffc020766e:	9c2fe06f          	j	ffffffffc0205830 <sysfile_fsync>

ffffffffc0207672 <sys_fstat>:
ffffffffc0207672:	650c                	ld	a1,8(a0)
ffffffffc0207674:	4108                	lw	a0,0(a0)
ffffffffc0207676:	91afe06f          	j	ffffffffc0205790 <sysfile_fstat>

ffffffffc020767a <sys_seek>:
ffffffffc020767a:	4910                	lw	a2,16(a0)
ffffffffc020767c:	650c                	ld	a1,8(a0)
ffffffffc020767e:	4108                	lw	a0,0(a0)
ffffffffc0207680:	90cfe06f          	j	ffffffffc020578c <sysfile_seek>

ffffffffc0207684 <sys_write>:
ffffffffc0207684:	6910                	ld	a2,16(a0)
ffffffffc0207686:	650c                	ld	a1,8(a0)
ffffffffc0207688:	4108                	lw	a0,0(a0)
ffffffffc020768a:	fe9fd06f          	j	ffffffffc0205672 <sysfile_write>

ffffffffc020768e <sys_read>:
ffffffffc020768e:	6910                	ld	a2,16(a0)
ffffffffc0207690:	650c                	ld	a1,8(a0)
ffffffffc0207692:	4108                	lw	a0,0(a0)
ffffffffc0207694:	ecbfd06f          	j	ffffffffc020555e <sysfile_read>

ffffffffc0207698 <sys_close>:
ffffffffc0207698:	4108                	lw	a0,0(a0)
ffffffffc020769a:	ec1fd06f          	j	ffffffffc020555a <sysfile_close>

ffffffffc020769e <sys_open>:
ffffffffc020769e:	450c                	lw	a1,8(a0)
ffffffffc02076a0:	6108                	ld	a0,0(a0)
ffffffffc02076a2:	e85fd06f          	j	ffffffffc0205526 <sysfile_open>

ffffffffc02076a6 <sys_putc>:
ffffffffc02076a6:	4108                	lw	a0,0(a0)
ffffffffc02076a8:	1141                	addi	sp,sp,-16
ffffffffc02076aa:	e406                	sd	ra,8(sp)
ffffffffc02076ac:	b37f80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc02076b0:	60a2                	ld	ra,8(sp)
ffffffffc02076b2:	4501                	li	a0,0
ffffffffc02076b4:	0141                	addi	sp,sp,16
ffffffffc02076b6:	8082                	ret

ffffffffc02076b8 <sys_kill>:
ffffffffc02076b8:	4108                	lw	a0,0(a0)
ffffffffc02076ba:	ea0ff06f          	j	ffffffffc0206d5a <do_kill>

ffffffffc02076be <sys_sleep>:
ffffffffc02076be:	4108                	lw	a0,0(a0)
ffffffffc02076c0:	937ff06f          	j	ffffffffc0206ff6 <do_sleep>

ffffffffc02076c4 <sys_yield>:
ffffffffc02076c4:	e48ff06f          	j	ffffffffc0206d0c <do_yield>

ffffffffc02076c8 <sys_exec>:
ffffffffc02076c8:	6910                	ld	a2,16(a0)
ffffffffc02076ca:	450c                	lw	a1,8(a0)
ffffffffc02076cc:	6108                	ld	a0,0(a0)
ffffffffc02076ce:	dbffe06f          	j	ffffffffc020648c <do_execve>

ffffffffc02076d2 <sys_wait>:
ffffffffc02076d2:	650c                	ld	a1,8(a0)
ffffffffc02076d4:	4108                	lw	a0,0(a0)
ffffffffc02076d6:	e46ff06f          	j	ffffffffc0206d1c <do_wait>

ffffffffc02076da <sys_fork>:
ffffffffc02076da:	0008f797          	auipc	a5,0x8f
ffffffffc02076de:	1e67b783          	ld	a5,486(a5) # ffffffffc02968c0 <current>
ffffffffc02076e2:	73d0                	ld	a2,160(a5)
ffffffffc02076e4:	4501                	li	a0,0
ffffffffc02076e6:	6a0c                	ld	a1,16(a2)
ffffffffc02076e8:	c74fe06f          	j	ffffffffc0205b5c <do_fork>

ffffffffc02076ec <sys_exit>:
ffffffffc02076ec:	4108                	lw	a0,0(a0)
ffffffffc02076ee:	91bfe06f          	j	ffffffffc0206008 <do_exit>

ffffffffc02076f2 <syscall>:
ffffffffc02076f2:	715d                	addi	sp,sp,-80
ffffffffc02076f4:	fc26                	sd	s1,56(sp)
ffffffffc02076f6:	0008f497          	auipc	s1,0x8f
ffffffffc02076fa:	1ca48493          	addi	s1,s1,458 # ffffffffc02968c0 <current>
ffffffffc02076fe:	6098                	ld	a4,0(s1)
ffffffffc0207700:	e0a2                	sd	s0,64(sp)
ffffffffc0207702:	f84a                	sd	s2,48(sp)
ffffffffc0207704:	7340                	ld	s0,160(a4)
ffffffffc0207706:	e486                	sd	ra,72(sp)
ffffffffc0207708:	0ff00793          	li	a5,255
ffffffffc020770c:	05042903          	lw	s2,80(s0)
ffffffffc0207710:	0327ee63          	bltu	a5,s2,ffffffffc020774c <syscall+0x5a>
ffffffffc0207714:	00391713          	slli	a4,s2,0x3
ffffffffc0207718:	00006797          	auipc	a5,0x6
ffffffffc020771c:	39878793          	addi	a5,a5,920 # ffffffffc020dab0 <syscalls>
ffffffffc0207720:	97ba                	add	a5,a5,a4
ffffffffc0207722:	639c                	ld	a5,0(a5)
ffffffffc0207724:	c785                	beqz	a5,ffffffffc020774c <syscall+0x5a>
ffffffffc0207726:	6c28                	ld	a0,88(s0)
ffffffffc0207728:	702c                	ld	a1,96(s0)
ffffffffc020772a:	7430                	ld	a2,104(s0)
ffffffffc020772c:	7834                	ld	a3,112(s0)
ffffffffc020772e:	7c38                	ld	a4,120(s0)
ffffffffc0207730:	e42a                	sd	a0,8(sp)
ffffffffc0207732:	e82e                	sd	a1,16(sp)
ffffffffc0207734:	ec32                	sd	a2,24(sp)
ffffffffc0207736:	f036                	sd	a3,32(sp)
ffffffffc0207738:	f43a                	sd	a4,40(sp)
ffffffffc020773a:	0028                	addi	a0,sp,8
ffffffffc020773c:	9782                	jalr	a5
ffffffffc020773e:	60a6                	ld	ra,72(sp)
ffffffffc0207740:	e828                	sd	a0,80(s0)
ffffffffc0207742:	6406                	ld	s0,64(sp)
ffffffffc0207744:	74e2                	ld	s1,56(sp)
ffffffffc0207746:	7942                	ld	s2,48(sp)
ffffffffc0207748:	6161                	addi	sp,sp,80
ffffffffc020774a:	8082                	ret
ffffffffc020774c:	8522                	mv	a0,s0
ffffffffc020774e:	83df90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0207752:	609c                	ld	a5,0(s1)
ffffffffc0207754:	86ca                	mv	a3,s2
ffffffffc0207756:	00006617          	auipc	a2,0x6
ffffffffc020775a:	31260613          	addi	a2,a2,786 # ffffffffc020da68 <CSWTCH.79+0x738>
ffffffffc020775e:	43d8                	lw	a4,4(a5)
ffffffffc0207760:	0d800593          	li	a1,216
ffffffffc0207764:	0b478793          	addi	a5,a5,180
ffffffffc0207768:	00006517          	auipc	a0,0x6
ffffffffc020776c:	33050513          	addi	a0,a0,816 # ffffffffc020da98 <CSWTCH.79+0x768>
ffffffffc0207770:	d2ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207774 <__alloc_inode>:
ffffffffc0207774:	1141                	addi	sp,sp,-16
ffffffffc0207776:	e022                	sd	s0,0(sp)
ffffffffc0207778:	842a                	mv	s0,a0
ffffffffc020777a:	07800513          	li	a0,120
ffffffffc020777e:	e406                	sd	ra,8(sp)
ffffffffc0207780:	80ffa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207784:	c111                	beqz	a0,ffffffffc0207788 <__alloc_inode+0x14>
ffffffffc0207786:	cd20                	sw	s0,88(a0)
ffffffffc0207788:	60a2                	ld	ra,8(sp)
ffffffffc020778a:	6402                	ld	s0,0(sp)
ffffffffc020778c:	0141                	addi	sp,sp,16
ffffffffc020778e:	8082                	ret

ffffffffc0207790 <inode_init>:
ffffffffc0207790:	4785                	li	a5,1
ffffffffc0207792:	06052023          	sw	zero,96(a0)
ffffffffc0207796:	f92c                	sd	a1,112(a0)
ffffffffc0207798:	f530                	sd	a2,104(a0)
ffffffffc020779a:	cd7c                	sw	a5,92(a0)
ffffffffc020779c:	8082                	ret

ffffffffc020779e <inode_kill>:
ffffffffc020779e:	4d78                	lw	a4,92(a0)
ffffffffc02077a0:	1141                	addi	sp,sp,-16
ffffffffc02077a2:	e406                	sd	ra,8(sp)
ffffffffc02077a4:	e719                	bnez	a4,ffffffffc02077b2 <inode_kill+0x14>
ffffffffc02077a6:	513c                	lw	a5,96(a0)
ffffffffc02077a8:	e78d                	bnez	a5,ffffffffc02077d2 <inode_kill+0x34>
ffffffffc02077aa:	60a2                	ld	ra,8(sp)
ffffffffc02077ac:	0141                	addi	sp,sp,16
ffffffffc02077ae:	891fa06f          	j	ffffffffc020203e <kfree>
ffffffffc02077b2:	00007697          	auipc	a3,0x7
ffffffffc02077b6:	afe68693          	addi	a3,a3,-1282 # ffffffffc020e2b0 <syscalls+0x800>
ffffffffc02077ba:	00004617          	auipc	a2,0x4
ffffffffc02077be:	16660613          	addi	a2,a2,358 # ffffffffc020b920 <commands+0x210>
ffffffffc02077c2:	02900593          	li	a1,41
ffffffffc02077c6:	00007517          	auipc	a0,0x7
ffffffffc02077ca:	b0a50513          	addi	a0,a0,-1270 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc02077ce:	cd1f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02077d2:	00007697          	auipc	a3,0x7
ffffffffc02077d6:	b1668693          	addi	a3,a3,-1258 # ffffffffc020e2e8 <syscalls+0x838>
ffffffffc02077da:	00004617          	auipc	a2,0x4
ffffffffc02077de:	14660613          	addi	a2,a2,326 # ffffffffc020b920 <commands+0x210>
ffffffffc02077e2:	02a00593          	li	a1,42
ffffffffc02077e6:	00007517          	auipc	a0,0x7
ffffffffc02077ea:	aea50513          	addi	a0,a0,-1302 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc02077ee:	cb1f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077f2 <inode_ref_inc>:
ffffffffc02077f2:	4d7c                	lw	a5,92(a0)
ffffffffc02077f4:	2785                	addiw	a5,a5,1
ffffffffc02077f6:	cd7c                	sw	a5,92(a0)
ffffffffc02077f8:	0007851b          	sext.w	a0,a5
ffffffffc02077fc:	8082                	ret

ffffffffc02077fe <inode_open_inc>:
ffffffffc02077fe:	513c                	lw	a5,96(a0)
ffffffffc0207800:	2785                	addiw	a5,a5,1
ffffffffc0207802:	d13c                	sw	a5,96(a0)
ffffffffc0207804:	0007851b          	sext.w	a0,a5
ffffffffc0207808:	8082                	ret

ffffffffc020780a <inode_check>:
ffffffffc020780a:	1141                	addi	sp,sp,-16
ffffffffc020780c:	e406                	sd	ra,8(sp)
ffffffffc020780e:	c90d                	beqz	a0,ffffffffc0207840 <inode_check+0x36>
ffffffffc0207810:	793c                	ld	a5,112(a0)
ffffffffc0207812:	c79d                	beqz	a5,ffffffffc0207840 <inode_check+0x36>
ffffffffc0207814:	6398                	ld	a4,0(a5)
ffffffffc0207816:	4625d7b7          	lui	a5,0x4625d
ffffffffc020781a:	0786                	slli	a5,a5,0x1
ffffffffc020781c:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207820:	08f71063          	bne	a4,a5,ffffffffc02078a0 <inode_check+0x96>
ffffffffc0207824:	4d78                	lw	a4,92(a0)
ffffffffc0207826:	513c                	lw	a5,96(a0)
ffffffffc0207828:	04f74c63          	blt	a4,a5,ffffffffc0207880 <inode_check+0x76>
ffffffffc020782c:	0407ca63          	bltz	a5,ffffffffc0207880 <inode_check+0x76>
ffffffffc0207830:	66c1                	lui	a3,0x10
ffffffffc0207832:	02d75763          	bge	a4,a3,ffffffffc0207860 <inode_check+0x56>
ffffffffc0207836:	02d7d563          	bge	a5,a3,ffffffffc0207860 <inode_check+0x56>
ffffffffc020783a:	60a2                	ld	ra,8(sp)
ffffffffc020783c:	0141                	addi	sp,sp,16
ffffffffc020783e:	8082                	ret
ffffffffc0207840:	00007697          	auipc	a3,0x7
ffffffffc0207844:	ac868693          	addi	a3,a3,-1336 # ffffffffc020e308 <syscalls+0x858>
ffffffffc0207848:	00004617          	auipc	a2,0x4
ffffffffc020784c:	0d860613          	addi	a2,a2,216 # ffffffffc020b920 <commands+0x210>
ffffffffc0207850:	06e00593          	li	a1,110
ffffffffc0207854:	00007517          	auipc	a0,0x7
ffffffffc0207858:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc020785c:	c43f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207860:	00007697          	auipc	a3,0x7
ffffffffc0207864:	b2868693          	addi	a3,a3,-1240 # ffffffffc020e388 <syscalls+0x8d8>
ffffffffc0207868:	00004617          	auipc	a2,0x4
ffffffffc020786c:	0b860613          	addi	a2,a2,184 # ffffffffc020b920 <commands+0x210>
ffffffffc0207870:	07200593          	li	a1,114
ffffffffc0207874:	00007517          	auipc	a0,0x7
ffffffffc0207878:	a5c50513          	addi	a0,a0,-1444 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc020787c:	c23f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207880:	00007697          	auipc	a3,0x7
ffffffffc0207884:	ad868693          	addi	a3,a3,-1320 # ffffffffc020e358 <syscalls+0x8a8>
ffffffffc0207888:	00004617          	auipc	a2,0x4
ffffffffc020788c:	09860613          	addi	a2,a2,152 # ffffffffc020b920 <commands+0x210>
ffffffffc0207890:	07100593          	li	a1,113
ffffffffc0207894:	00007517          	auipc	a0,0x7
ffffffffc0207898:	a3c50513          	addi	a0,a0,-1476 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc020789c:	c03f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078a0:	00007697          	auipc	a3,0x7
ffffffffc02078a4:	a9068693          	addi	a3,a3,-1392 # ffffffffc020e330 <syscalls+0x880>
ffffffffc02078a8:	00004617          	auipc	a2,0x4
ffffffffc02078ac:	07860613          	addi	a2,a2,120 # ffffffffc020b920 <commands+0x210>
ffffffffc02078b0:	06f00593          	li	a1,111
ffffffffc02078b4:	00007517          	auipc	a0,0x7
ffffffffc02078b8:	a1c50513          	addi	a0,a0,-1508 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc02078bc:	be3f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02078c0 <inode_ref_dec>:
ffffffffc02078c0:	4d7c                	lw	a5,92(a0)
ffffffffc02078c2:	1101                	addi	sp,sp,-32
ffffffffc02078c4:	ec06                	sd	ra,24(sp)
ffffffffc02078c6:	e822                	sd	s0,16(sp)
ffffffffc02078c8:	e426                	sd	s1,8(sp)
ffffffffc02078ca:	e04a                	sd	s2,0(sp)
ffffffffc02078cc:	06f05e63          	blez	a5,ffffffffc0207948 <inode_ref_dec+0x88>
ffffffffc02078d0:	fff7849b          	addiw	s1,a5,-1
ffffffffc02078d4:	cd64                	sw	s1,92(a0)
ffffffffc02078d6:	842a                	mv	s0,a0
ffffffffc02078d8:	e09d                	bnez	s1,ffffffffc02078fe <inode_ref_dec+0x3e>
ffffffffc02078da:	793c                	ld	a5,112(a0)
ffffffffc02078dc:	c7b1                	beqz	a5,ffffffffc0207928 <inode_ref_dec+0x68>
ffffffffc02078de:	0487b903          	ld	s2,72(a5)
ffffffffc02078e2:	04090363          	beqz	s2,ffffffffc0207928 <inode_ref_dec+0x68>
ffffffffc02078e6:	00007597          	auipc	a1,0x7
ffffffffc02078ea:	b5258593          	addi	a1,a1,-1198 # ffffffffc020e438 <syscalls+0x988>
ffffffffc02078ee:	f1dff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02078f2:	8522                	mv	a0,s0
ffffffffc02078f4:	9902                	jalr	s2
ffffffffc02078f6:	c501                	beqz	a0,ffffffffc02078fe <inode_ref_dec+0x3e>
ffffffffc02078f8:	57c5                	li	a5,-15
ffffffffc02078fa:	00f51963          	bne	a0,a5,ffffffffc020790c <inode_ref_dec+0x4c>
ffffffffc02078fe:	60e2                	ld	ra,24(sp)
ffffffffc0207900:	6442                	ld	s0,16(sp)
ffffffffc0207902:	6902                	ld	s2,0(sp)
ffffffffc0207904:	8526                	mv	a0,s1
ffffffffc0207906:	64a2                	ld	s1,8(sp)
ffffffffc0207908:	6105                	addi	sp,sp,32
ffffffffc020790a:	8082                	ret
ffffffffc020790c:	85aa                	mv	a1,a0
ffffffffc020790e:	00007517          	auipc	a0,0x7
ffffffffc0207912:	b3250513          	addi	a0,a0,-1230 # ffffffffc020e440 <syscalls+0x990>
ffffffffc0207916:	891f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020791a:	60e2                	ld	ra,24(sp)
ffffffffc020791c:	6442                	ld	s0,16(sp)
ffffffffc020791e:	6902                	ld	s2,0(sp)
ffffffffc0207920:	8526                	mv	a0,s1
ffffffffc0207922:	64a2                	ld	s1,8(sp)
ffffffffc0207924:	6105                	addi	sp,sp,32
ffffffffc0207926:	8082                	ret
ffffffffc0207928:	00007697          	auipc	a3,0x7
ffffffffc020792c:	ac068693          	addi	a3,a3,-1344 # ffffffffc020e3e8 <syscalls+0x938>
ffffffffc0207930:	00004617          	auipc	a2,0x4
ffffffffc0207934:	ff060613          	addi	a2,a2,-16 # ffffffffc020b920 <commands+0x210>
ffffffffc0207938:	04400593          	li	a1,68
ffffffffc020793c:	00007517          	auipc	a0,0x7
ffffffffc0207940:	99450513          	addi	a0,a0,-1644 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc0207944:	b5bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207948:	00007697          	auipc	a3,0x7
ffffffffc020794c:	a8068693          	addi	a3,a3,-1408 # ffffffffc020e3c8 <syscalls+0x918>
ffffffffc0207950:	00004617          	auipc	a2,0x4
ffffffffc0207954:	fd060613          	addi	a2,a2,-48 # ffffffffc020b920 <commands+0x210>
ffffffffc0207958:	03f00593          	li	a1,63
ffffffffc020795c:	00007517          	auipc	a0,0x7
ffffffffc0207960:	97450513          	addi	a0,a0,-1676 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc0207964:	b3bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207968 <inode_open_dec>:
ffffffffc0207968:	513c                	lw	a5,96(a0)
ffffffffc020796a:	1101                	addi	sp,sp,-32
ffffffffc020796c:	ec06                	sd	ra,24(sp)
ffffffffc020796e:	e822                	sd	s0,16(sp)
ffffffffc0207970:	e426                	sd	s1,8(sp)
ffffffffc0207972:	e04a                	sd	s2,0(sp)
ffffffffc0207974:	06f05b63          	blez	a5,ffffffffc02079ea <inode_open_dec+0x82>
ffffffffc0207978:	fff7849b          	addiw	s1,a5,-1
ffffffffc020797c:	d124                	sw	s1,96(a0)
ffffffffc020797e:	842a                	mv	s0,a0
ffffffffc0207980:	e085                	bnez	s1,ffffffffc02079a0 <inode_open_dec+0x38>
ffffffffc0207982:	793c                	ld	a5,112(a0)
ffffffffc0207984:	c3b9                	beqz	a5,ffffffffc02079ca <inode_open_dec+0x62>
ffffffffc0207986:	0107b903          	ld	s2,16(a5)
ffffffffc020798a:	04090063          	beqz	s2,ffffffffc02079ca <inode_open_dec+0x62>
ffffffffc020798e:	00007597          	auipc	a1,0x7
ffffffffc0207992:	b4258593          	addi	a1,a1,-1214 # ffffffffc020e4d0 <syscalls+0xa20>
ffffffffc0207996:	e75ff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc020799a:	8522                	mv	a0,s0
ffffffffc020799c:	9902                	jalr	s2
ffffffffc020799e:	e901                	bnez	a0,ffffffffc02079ae <inode_open_dec+0x46>
ffffffffc02079a0:	60e2                	ld	ra,24(sp)
ffffffffc02079a2:	6442                	ld	s0,16(sp)
ffffffffc02079a4:	6902                	ld	s2,0(sp)
ffffffffc02079a6:	8526                	mv	a0,s1
ffffffffc02079a8:	64a2                	ld	s1,8(sp)
ffffffffc02079aa:	6105                	addi	sp,sp,32
ffffffffc02079ac:	8082                	ret
ffffffffc02079ae:	85aa                	mv	a1,a0
ffffffffc02079b0:	00007517          	auipc	a0,0x7
ffffffffc02079b4:	b2850513          	addi	a0,a0,-1240 # ffffffffc020e4d8 <syscalls+0xa28>
ffffffffc02079b8:	feef80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02079bc:	60e2                	ld	ra,24(sp)
ffffffffc02079be:	6442                	ld	s0,16(sp)
ffffffffc02079c0:	6902                	ld	s2,0(sp)
ffffffffc02079c2:	8526                	mv	a0,s1
ffffffffc02079c4:	64a2                	ld	s1,8(sp)
ffffffffc02079c6:	6105                	addi	sp,sp,32
ffffffffc02079c8:	8082                	ret
ffffffffc02079ca:	00007697          	auipc	a3,0x7
ffffffffc02079ce:	ab668693          	addi	a3,a3,-1354 # ffffffffc020e480 <syscalls+0x9d0>
ffffffffc02079d2:	00004617          	auipc	a2,0x4
ffffffffc02079d6:	f4e60613          	addi	a2,a2,-178 # ffffffffc020b920 <commands+0x210>
ffffffffc02079da:	06100593          	li	a1,97
ffffffffc02079de:	00007517          	auipc	a0,0x7
ffffffffc02079e2:	8f250513          	addi	a0,a0,-1806 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc02079e6:	ab9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02079ea:	00007697          	auipc	a3,0x7
ffffffffc02079ee:	a7668693          	addi	a3,a3,-1418 # ffffffffc020e460 <syscalls+0x9b0>
ffffffffc02079f2:	00004617          	auipc	a2,0x4
ffffffffc02079f6:	f2e60613          	addi	a2,a2,-210 # ffffffffc020b920 <commands+0x210>
ffffffffc02079fa:	05c00593          	li	a1,92
ffffffffc02079fe:	00007517          	auipc	a0,0x7
ffffffffc0207a02:	8d250513          	addi	a0,a0,-1838 # ffffffffc020e2d0 <syscalls+0x820>
ffffffffc0207a06:	a99f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207a0a <__alloc_fs>:
ffffffffc0207a0a:	1141                	addi	sp,sp,-16
ffffffffc0207a0c:	e022                	sd	s0,0(sp)
ffffffffc0207a0e:	842a                	mv	s0,a0
ffffffffc0207a10:	0d800513          	li	a0,216
ffffffffc0207a14:	e406                	sd	ra,8(sp)
ffffffffc0207a16:	d78fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207a1a:	c119                	beqz	a0,ffffffffc0207a20 <__alloc_fs+0x16>
ffffffffc0207a1c:	0a852823          	sw	s0,176(a0)
ffffffffc0207a20:	60a2                	ld	ra,8(sp)
ffffffffc0207a22:	6402                	ld	s0,0(sp)
ffffffffc0207a24:	0141                	addi	sp,sp,16
ffffffffc0207a26:	8082                	ret

ffffffffc0207a28 <vfs_init>:
ffffffffc0207a28:	1141                	addi	sp,sp,-16
ffffffffc0207a2a:	4585                	li	a1,1
ffffffffc0207a2c:	0008e517          	auipc	a0,0x8e
ffffffffc0207a30:	dd450513          	addi	a0,a0,-556 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a34:	e406                	sd	ra,8(sp)
ffffffffc0207a36:	b25fc0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0207a3a:	60a2                	ld	ra,8(sp)
ffffffffc0207a3c:	0141                	addi	sp,sp,16
ffffffffc0207a3e:	a40d                	j	ffffffffc0207c60 <vfs_devlist_init>

ffffffffc0207a40 <vfs_set_bootfs>:
ffffffffc0207a40:	7179                	addi	sp,sp,-48
ffffffffc0207a42:	f022                	sd	s0,32(sp)
ffffffffc0207a44:	f406                	sd	ra,40(sp)
ffffffffc0207a46:	ec26                	sd	s1,24(sp)
ffffffffc0207a48:	e402                	sd	zero,8(sp)
ffffffffc0207a4a:	842a                	mv	s0,a0
ffffffffc0207a4c:	c915                	beqz	a0,ffffffffc0207a80 <vfs_set_bootfs+0x40>
ffffffffc0207a4e:	03a00593          	li	a1,58
ffffffffc0207a52:	1d5030ef          	jal	ra,ffffffffc020b426 <strchr>
ffffffffc0207a56:	c135                	beqz	a0,ffffffffc0207aba <vfs_set_bootfs+0x7a>
ffffffffc0207a58:	00154783          	lbu	a5,1(a0)
ffffffffc0207a5c:	efb9                	bnez	a5,ffffffffc0207aba <vfs_set_bootfs+0x7a>
ffffffffc0207a5e:	8522                	mv	a0,s0
ffffffffc0207a60:	11f000ef          	jal	ra,ffffffffc020837e <vfs_chdir>
ffffffffc0207a64:	842a                	mv	s0,a0
ffffffffc0207a66:	c519                	beqz	a0,ffffffffc0207a74 <vfs_set_bootfs+0x34>
ffffffffc0207a68:	70a2                	ld	ra,40(sp)
ffffffffc0207a6a:	8522                	mv	a0,s0
ffffffffc0207a6c:	7402                	ld	s0,32(sp)
ffffffffc0207a6e:	64e2                	ld	s1,24(sp)
ffffffffc0207a70:	6145                	addi	sp,sp,48
ffffffffc0207a72:	8082                	ret
ffffffffc0207a74:	0028                	addi	a0,sp,8
ffffffffc0207a76:	013000ef          	jal	ra,ffffffffc0208288 <vfs_get_curdir>
ffffffffc0207a7a:	842a                	mv	s0,a0
ffffffffc0207a7c:	f575                	bnez	a0,ffffffffc0207a68 <vfs_set_bootfs+0x28>
ffffffffc0207a7e:	6422                	ld	s0,8(sp)
ffffffffc0207a80:	0008e517          	auipc	a0,0x8e
ffffffffc0207a84:	d8050513          	addi	a0,a0,-640 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a88:	addfc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207a8c:	0008f797          	auipc	a5,0x8f
ffffffffc0207a90:	e6478793          	addi	a5,a5,-412 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207a94:	6384                	ld	s1,0(a5)
ffffffffc0207a96:	0008e517          	auipc	a0,0x8e
ffffffffc0207a9a:	d6a50513          	addi	a0,a0,-662 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a9e:	e380                	sd	s0,0(a5)
ffffffffc0207aa0:	4401                	li	s0,0
ffffffffc0207aa2:	abffc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207aa6:	d0e9                	beqz	s1,ffffffffc0207a68 <vfs_set_bootfs+0x28>
ffffffffc0207aa8:	8526                	mv	a0,s1
ffffffffc0207aaa:	e17ff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc0207aae:	70a2                	ld	ra,40(sp)
ffffffffc0207ab0:	8522                	mv	a0,s0
ffffffffc0207ab2:	7402                	ld	s0,32(sp)
ffffffffc0207ab4:	64e2                	ld	s1,24(sp)
ffffffffc0207ab6:	6145                	addi	sp,sp,48
ffffffffc0207ab8:	8082                	ret
ffffffffc0207aba:	5475                	li	s0,-3
ffffffffc0207abc:	b775                	j	ffffffffc0207a68 <vfs_set_bootfs+0x28>

ffffffffc0207abe <vfs_get_bootfs>:
ffffffffc0207abe:	1101                	addi	sp,sp,-32
ffffffffc0207ac0:	e426                	sd	s1,8(sp)
ffffffffc0207ac2:	0008f497          	auipc	s1,0x8f
ffffffffc0207ac6:	e2e48493          	addi	s1,s1,-466 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207aca:	609c                	ld	a5,0(s1)
ffffffffc0207acc:	ec06                	sd	ra,24(sp)
ffffffffc0207ace:	e822                	sd	s0,16(sp)
ffffffffc0207ad0:	c3a1                	beqz	a5,ffffffffc0207b10 <vfs_get_bootfs+0x52>
ffffffffc0207ad2:	842a                	mv	s0,a0
ffffffffc0207ad4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ad8:	d2c50513          	addi	a0,a0,-724 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207adc:	a89fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207ae0:	6084                	ld	s1,0(s1)
ffffffffc0207ae2:	c08d                	beqz	s1,ffffffffc0207b04 <vfs_get_bootfs+0x46>
ffffffffc0207ae4:	8526                	mv	a0,s1
ffffffffc0207ae6:	d0dff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc0207aea:	0008e517          	auipc	a0,0x8e
ffffffffc0207aee:	d1650513          	addi	a0,a0,-746 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207af2:	a6ffc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207af6:	4501                	li	a0,0
ffffffffc0207af8:	e004                	sd	s1,0(s0)
ffffffffc0207afa:	60e2                	ld	ra,24(sp)
ffffffffc0207afc:	6442                	ld	s0,16(sp)
ffffffffc0207afe:	64a2                	ld	s1,8(sp)
ffffffffc0207b00:	6105                	addi	sp,sp,32
ffffffffc0207b02:	8082                	ret
ffffffffc0207b04:	0008e517          	auipc	a0,0x8e
ffffffffc0207b08:	cfc50513          	addi	a0,a0,-772 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b0c:	a55fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b10:	5541                	li	a0,-16
ffffffffc0207b12:	b7e5                	j	ffffffffc0207afa <vfs_get_bootfs+0x3c>

ffffffffc0207b14 <vfs_do_add>:
ffffffffc0207b14:	7139                	addi	sp,sp,-64
ffffffffc0207b16:	fc06                	sd	ra,56(sp)
ffffffffc0207b18:	f822                	sd	s0,48(sp)
ffffffffc0207b1a:	f426                	sd	s1,40(sp)
ffffffffc0207b1c:	f04a                	sd	s2,32(sp)
ffffffffc0207b1e:	ec4e                	sd	s3,24(sp)
ffffffffc0207b20:	e852                	sd	s4,16(sp)
ffffffffc0207b22:	e456                	sd	s5,8(sp)
ffffffffc0207b24:	e05a                	sd	s6,0(sp)
ffffffffc0207b26:	0e050b63          	beqz	a0,ffffffffc0207c1c <vfs_do_add+0x108>
ffffffffc0207b2a:	842a                	mv	s0,a0
ffffffffc0207b2c:	8a2e                	mv	s4,a1
ffffffffc0207b2e:	8b32                	mv	s6,a2
ffffffffc0207b30:	8ab6                	mv	s5,a3
ffffffffc0207b32:	c5cd                	beqz	a1,ffffffffc0207bdc <vfs_do_add+0xc8>
ffffffffc0207b34:	4db8                	lw	a4,88(a1)
ffffffffc0207b36:	6785                	lui	a5,0x1
ffffffffc0207b38:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207b3c:	0af71163          	bne	a4,a5,ffffffffc0207bde <vfs_do_add+0xca>
ffffffffc0207b40:	8522                	mv	a0,s0
ffffffffc0207b42:	059030ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc0207b46:	47fd                	li	a5,31
ffffffffc0207b48:	0ca7e663          	bltu	a5,a0,ffffffffc0207c14 <vfs_do_add+0x100>
ffffffffc0207b4c:	8522                	mv	a0,s0
ffffffffc0207b4e:	ea6f80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207b52:	84aa                	mv	s1,a0
ffffffffc0207b54:	c171                	beqz	a0,ffffffffc0207c18 <vfs_do_add+0x104>
ffffffffc0207b56:	03000513          	li	a0,48
ffffffffc0207b5a:	c34fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207b5e:	89aa                	mv	s3,a0
ffffffffc0207b60:	c92d                	beqz	a0,ffffffffc0207bd2 <vfs_do_add+0xbe>
ffffffffc0207b62:	0008e517          	auipc	a0,0x8e
ffffffffc0207b66:	cc650513          	addi	a0,a0,-826 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b6a:	0008e917          	auipc	s2,0x8e
ffffffffc0207b6e:	cae90913          	addi	s2,s2,-850 # ffffffffc0295818 <vdev_list>
ffffffffc0207b72:	9f3fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207b76:	844a                	mv	s0,s2
ffffffffc0207b78:	a039                	j	ffffffffc0207b86 <vfs_do_add+0x72>
ffffffffc0207b7a:	fe043503          	ld	a0,-32(s0)
ffffffffc0207b7e:	85a6                	mv	a1,s1
ffffffffc0207b80:	063030ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc0207b84:	cd2d                	beqz	a0,ffffffffc0207bfe <vfs_do_add+0xea>
ffffffffc0207b86:	6400                	ld	s0,8(s0)
ffffffffc0207b88:	ff2419e3          	bne	s0,s2,ffffffffc0207b7a <vfs_do_add+0x66>
ffffffffc0207b8c:	6418                	ld	a4,8(s0)
ffffffffc0207b8e:	02098793          	addi	a5,s3,32
ffffffffc0207b92:	0099b023          	sd	s1,0(s3)
ffffffffc0207b96:	0149b423          	sd	s4,8(s3)
ffffffffc0207b9a:	0159bc23          	sd	s5,24(s3)
ffffffffc0207b9e:	0169b823          	sd	s6,16(s3)
ffffffffc0207ba2:	e31c                	sd	a5,0(a4)
ffffffffc0207ba4:	0289b023          	sd	s0,32(s3)
ffffffffc0207ba8:	02e9b423          	sd	a4,40(s3)
ffffffffc0207bac:	0008e517          	auipc	a0,0x8e
ffffffffc0207bb0:	c7c50513          	addi	a0,a0,-900 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bb4:	e41c                	sd	a5,8(s0)
ffffffffc0207bb6:	4401                	li	s0,0
ffffffffc0207bb8:	9a9fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207bbc:	70e2                	ld	ra,56(sp)
ffffffffc0207bbe:	8522                	mv	a0,s0
ffffffffc0207bc0:	7442                	ld	s0,48(sp)
ffffffffc0207bc2:	74a2                	ld	s1,40(sp)
ffffffffc0207bc4:	7902                	ld	s2,32(sp)
ffffffffc0207bc6:	69e2                	ld	s3,24(sp)
ffffffffc0207bc8:	6a42                	ld	s4,16(sp)
ffffffffc0207bca:	6aa2                	ld	s5,8(sp)
ffffffffc0207bcc:	6b02                	ld	s6,0(sp)
ffffffffc0207bce:	6121                	addi	sp,sp,64
ffffffffc0207bd0:	8082                	ret
ffffffffc0207bd2:	5471                	li	s0,-4
ffffffffc0207bd4:	8526                	mv	a0,s1
ffffffffc0207bd6:	c68fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207bda:	b7cd                	j	ffffffffc0207bbc <vfs_do_add+0xa8>
ffffffffc0207bdc:	d2b5                	beqz	a3,ffffffffc0207b40 <vfs_do_add+0x2c>
ffffffffc0207bde:	00007697          	auipc	a3,0x7
ffffffffc0207be2:	94268693          	addi	a3,a3,-1726 # ffffffffc020e520 <syscalls+0xa70>
ffffffffc0207be6:	00004617          	auipc	a2,0x4
ffffffffc0207bea:	d3a60613          	addi	a2,a2,-710 # ffffffffc020b920 <commands+0x210>
ffffffffc0207bee:	08f00593          	li	a1,143
ffffffffc0207bf2:	00007517          	auipc	a0,0x7
ffffffffc0207bf6:	91650513          	addi	a0,a0,-1770 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207bfa:	8a5f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207bfe:	0008e517          	auipc	a0,0x8e
ffffffffc0207c02:	c2a50513          	addi	a0,a0,-982 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c06:	95bfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207c0a:	854e                	mv	a0,s3
ffffffffc0207c0c:	c32fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207c10:	5425                	li	s0,-23
ffffffffc0207c12:	b7c9                	j	ffffffffc0207bd4 <vfs_do_add+0xc0>
ffffffffc0207c14:	5451                	li	s0,-12
ffffffffc0207c16:	b75d                	j	ffffffffc0207bbc <vfs_do_add+0xa8>
ffffffffc0207c18:	5471                	li	s0,-4
ffffffffc0207c1a:	b74d                	j	ffffffffc0207bbc <vfs_do_add+0xa8>
ffffffffc0207c1c:	00007697          	auipc	a3,0x7
ffffffffc0207c20:	8dc68693          	addi	a3,a3,-1828 # ffffffffc020e4f8 <syscalls+0xa48>
ffffffffc0207c24:	00004617          	auipc	a2,0x4
ffffffffc0207c28:	cfc60613          	addi	a2,a2,-772 # ffffffffc020b920 <commands+0x210>
ffffffffc0207c2c:	08e00593          	li	a1,142
ffffffffc0207c30:	00007517          	auipc	a0,0x7
ffffffffc0207c34:	8d850513          	addi	a0,a0,-1832 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207c38:	867f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c3c <find_mount.part.0>:
ffffffffc0207c3c:	1141                	addi	sp,sp,-16
ffffffffc0207c3e:	00007697          	auipc	a3,0x7
ffffffffc0207c42:	8ba68693          	addi	a3,a3,-1862 # ffffffffc020e4f8 <syscalls+0xa48>
ffffffffc0207c46:	00004617          	auipc	a2,0x4
ffffffffc0207c4a:	cda60613          	addi	a2,a2,-806 # ffffffffc020b920 <commands+0x210>
ffffffffc0207c4e:	0cd00593          	li	a1,205
ffffffffc0207c52:	00007517          	auipc	a0,0x7
ffffffffc0207c56:	8b650513          	addi	a0,a0,-1866 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207c5a:	e406                	sd	ra,8(sp)
ffffffffc0207c5c:	843f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c60 <vfs_devlist_init>:
ffffffffc0207c60:	0008e797          	auipc	a5,0x8e
ffffffffc0207c64:	bb878793          	addi	a5,a5,-1096 # ffffffffc0295818 <vdev_list>
ffffffffc0207c68:	4585                	li	a1,1
ffffffffc0207c6a:	0008e517          	auipc	a0,0x8e
ffffffffc0207c6e:	bbe50513          	addi	a0,a0,-1090 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c72:	e79c                	sd	a5,8(a5)
ffffffffc0207c74:	e39c                	sd	a5,0(a5)
ffffffffc0207c76:	8e5fc06f          	j	ffffffffc020455a <sem_init>

ffffffffc0207c7a <vfs_cleanup>:
ffffffffc0207c7a:	1101                	addi	sp,sp,-32
ffffffffc0207c7c:	e426                	sd	s1,8(sp)
ffffffffc0207c7e:	0008e497          	auipc	s1,0x8e
ffffffffc0207c82:	b9a48493          	addi	s1,s1,-1126 # ffffffffc0295818 <vdev_list>
ffffffffc0207c86:	649c                	ld	a5,8(s1)
ffffffffc0207c88:	ec06                	sd	ra,24(sp)
ffffffffc0207c8a:	e822                	sd	s0,16(sp)
ffffffffc0207c8c:	02978e63          	beq	a5,s1,ffffffffc0207cc8 <vfs_cleanup+0x4e>
ffffffffc0207c90:	0008e517          	auipc	a0,0x8e
ffffffffc0207c94:	b9850513          	addi	a0,a0,-1128 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c98:	8cdfc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207c9c:	6480                	ld	s0,8(s1)
ffffffffc0207c9e:	00940b63          	beq	s0,s1,ffffffffc0207cb4 <vfs_cleanup+0x3a>
ffffffffc0207ca2:	ff043783          	ld	a5,-16(s0)
ffffffffc0207ca6:	853e                	mv	a0,a5
ffffffffc0207ca8:	c399                	beqz	a5,ffffffffc0207cae <vfs_cleanup+0x34>
ffffffffc0207caa:	6bfc                	ld	a5,208(a5)
ffffffffc0207cac:	9782                	jalr	a5
ffffffffc0207cae:	6400                	ld	s0,8(s0)
ffffffffc0207cb0:	fe9419e3          	bne	s0,s1,ffffffffc0207ca2 <vfs_cleanup+0x28>
ffffffffc0207cb4:	6442                	ld	s0,16(sp)
ffffffffc0207cb6:	60e2                	ld	ra,24(sp)
ffffffffc0207cb8:	64a2                	ld	s1,8(sp)
ffffffffc0207cba:	0008e517          	auipc	a0,0x8e
ffffffffc0207cbe:	b6e50513          	addi	a0,a0,-1170 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cc2:	6105                	addi	sp,sp,32
ffffffffc0207cc4:	89dfc06f          	j	ffffffffc0204560 <up>
ffffffffc0207cc8:	60e2                	ld	ra,24(sp)
ffffffffc0207cca:	6442                	ld	s0,16(sp)
ffffffffc0207ccc:	64a2                	ld	s1,8(sp)
ffffffffc0207cce:	6105                	addi	sp,sp,32
ffffffffc0207cd0:	8082                	ret

ffffffffc0207cd2 <vfs_get_root>:
ffffffffc0207cd2:	7179                	addi	sp,sp,-48
ffffffffc0207cd4:	f406                	sd	ra,40(sp)
ffffffffc0207cd6:	f022                	sd	s0,32(sp)
ffffffffc0207cd8:	ec26                	sd	s1,24(sp)
ffffffffc0207cda:	e84a                	sd	s2,16(sp)
ffffffffc0207cdc:	e44e                	sd	s3,8(sp)
ffffffffc0207cde:	e052                	sd	s4,0(sp)
ffffffffc0207ce0:	c541                	beqz	a0,ffffffffc0207d68 <vfs_get_root+0x96>
ffffffffc0207ce2:	0008e917          	auipc	s2,0x8e
ffffffffc0207ce6:	b3690913          	addi	s2,s2,-1226 # ffffffffc0295818 <vdev_list>
ffffffffc0207cea:	00893783          	ld	a5,8(s2)
ffffffffc0207cee:	07278b63          	beq	a5,s2,ffffffffc0207d64 <vfs_get_root+0x92>
ffffffffc0207cf2:	89aa                	mv	s3,a0
ffffffffc0207cf4:	0008e517          	auipc	a0,0x8e
ffffffffc0207cf8:	b3450513          	addi	a0,a0,-1228 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cfc:	8a2e                	mv	s4,a1
ffffffffc0207cfe:	844a                	mv	s0,s2
ffffffffc0207d00:	865fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207d04:	a801                	j	ffffffffc0207d14 <vfs_get_root+0x42>
ffffffffc0207d06:	fe043583          	ld	a1,-32(s0)
ffffffffc0207d0a:	854e                	mv	a0,s3
ffffffffc0207d0c:	6d6030ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc0207d10:	84aa                	mv	s1,a0
ffffffffc0207d12:	c505                	beqz	a0,ffffffffc0207d3a <vfs_get_root+0x68>
ffffffffc0207d14:	6400                	ld	s0,8(s0)
ffffffffc0207d16:	ff2418e3          	bne	s0,s2,ffffffffc0207d06 <vfs_get_root+0x34>
ffffffffc0207d1a:	54cd                	li	s1,-13
ffffffffc0207d1c:	0008e517          	auipc	a0,0x8e
ffffffffc0207d20:	b0c50513          	addi	a0,a0,-1268 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d24:	83dfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207d28:	70a2                	ld	ra,40(sp)
ffffffffc0207d2a:	7402                	ld	s0,32(sp)
ffffffffc0207d2c:	6942                	ld	s2,16(sp)
ffffffffc0207d2e:	69a2                	ld	s3,8(sp)
ffffffffc0207d30:	6a02                	ld	s4,0(sp)
ffffffffc0207d32:	8526                	mv	a0,s1
ffffffffc0207d34:	64e2                	ld	s1,24(sp)
ffffffffc0207d36:	6145                	addi	sp,sp,48
ffffffffc0207d38:	8082                	ret
ffffffffc0207d3a:	ff043503          	ld	a0,-16(s0)
ffffffffc0207d3e:	c519                	beqz	a0,ffffffffc0207d4c <vfs_get_root+0x7a>
ffffffffc0207d40:	617c                	ld	a5,192(a0)
ffffffffc0207d42:	9782                	jalr	a5
ffffffffc0207d44:	c519                	beqz	a0,ffffffffc0207d52 <vfs_get_root+0x80>
ffffffffc0207d46:	00aa3023          	sd	a0,0(s4)
ffffffffc0207d4a:	bfc9                	j	ffffffffc0207d1c <vfs_get_root+0x4a>
ffffffffc0207d4c:	ff843783          	ld	a5,-8(s0)
ffffffffc0207d50:	c399                	beqz	a5,ffffffffc0207d56 <vfs_get_root+0x84>
ffffffffc0207d52:	54c9                	li	s1,-14
ffffffffc0207d54:	b7e1                	j	ffffffffc0207d1c <vfs_get_root+0x4a>
ffffffffc0207d56:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d5a:	a99ff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc0207d5e:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d62:	b7cd                	j	ffffffffc0207d44 <vfs_get_root+0x72>
ffffffffc0207d64:	54cd                	li	s1,-13
ffffffffc0207d66:	b7c9                	j	ffffffffc0207d28 <vfs_get_root+0x56>
ffffffffc0207d68:	00006697          	auipc	a3,0x6
ffffffffc0207d6c:	79068693          	addi	a3,a3,1936 # ffffffffc020e4f8 <syscalls+0xa48>
ffffffffc0207d70:	00004617          	auipc	a2,0x4
ffffffffc0207d74:	bb060613          	addi	a2,a2,-1104 # ffffffffc020b920 <commands+0x210>
ffffffffc0207d78:	04500593          	li	a1,69
ffffffffc0207d7c:	00006517          	auipc	a0,0x6
ffffffffc0207d80:	78c50513          	addi	a0,a0,1932 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207d84:	f1af80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d88 <vfs_get_devname>:
ffffffffc0207d88:	0008e697          	auipc	a3,0x8e
ffffffffc0207d8c:	a9068693          	addi	a3,a3,-1392 # ffffffffc0295818 <vdev_list>
ffffffffc0207d90:	87b6                	mv	a5,a3
ffffffffc0207d92:	e511                	bnez	a0,ffffffffc0207d9e <vfs_get_devname+0x16>
ffffffffc0207d94:	a829                	j	ffffffffc0207dae <vfs_get_devname+0x26>
ffffffffc0207d96:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207d9a:	00a70763          	beq	a4,a0,ffffffffc0207da8 <vfs_get_devname+0x20>
ffffffffc0207d9e:	679c                	ld	a5,8(a5)
ffffffffc0207da0:	fed79be3          	bne	a5,a3,ffffffffc0207d96 <vfs_get_devname+0xe>
ffffffffc0207da4:	4501                	li	a0,0
ffffffffc0207da6:	8082                	ret
ffffffffc0207da8:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207dac:	8082                	ret
ffffffffc0207dae:	1141                	addi	sp,sp,-16
ffffffffc0207db0:	00006697          	auipc	a3,0x6
ffffffffc0207db4:	7d068693          	addi	a3,a3,2000 # ffffffffc020e580 <syscalls+0xad0>
ffffffffc0207db8:	00004617          	auipc	a2,0x4
ffffffffc0207dbc:	b6860613          	addi	a2,a2,-1176 # ffffffffc020b920 <commands+0x210>
ffffffffc0207dc0:	06a00593          	li	a1,106
ffffffffc0207dc4:	00006517          	auipc	a0,0x6
ffffffffc0207dc8:	74450513          	addi	a0,a0,1860 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207dcc:	e406                	sd	ra,8(sp)
ffffffffc0207dce:	ed0f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207dd2 <vfs_add_dev>:
ffffffffc0207dd2:	86b2                	mv	a3,a2
ffffffffc0207dd4:	4601                	li	a2,0
ffffffffc0207dd6:	d3fff06f          	j	ffffffffc0207b14 <vfs_do_add>

ffffffffc0207dda <vfs_mount>:
ffffffffc0207dda:	7179                	addi	sp,sp,-48
ffffffffc0207ddc:	e84a                	sd	s2,16(sp)
ffffffffc0207dde:	892a                	mv	s2,a0
ffffffffc0207de0:	0008e517          	auipc	a0,0x8e
ffffffffc0207de4:	a4850513          	addi	a0,a0,-1464 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207de8:	e44e                	sd	s3,8(sp)
ffffffffc0207dea:	f406                	sd	ra,40(sp)
ffffffffc0207dec:	f022                	sd	s0,32(sp)
ffffffffc0207dee:	ec26                	sd	s1,24(sp)
ffffffffc0207df0:	89ae                	mv	s3,a1
ffffffffc0207df2:	f72fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207df6:	08090a63          	beqz	s2,ffffffffc0207e8a <vfs_mount+0xb0>
ffffffffc0207dfa:	0008e497          	auipc	s1,0x8e
ffffffffc0207dfe:	a1e48493          	addi	s1,s1,-1506 # ffffffffc0295818 <vdev_list>
ffffffffc0207e02:	6480                	ld	s0,8(s1)
ffffffffc0207e04:	00941663          	bne	s0,s1,ffffffffc0207e10 <vfs_mount+0x36>
ffffffffc0207e08:	a8ad                	j	ffffffffc0207e82 <vfs_mount+0xa8>
ffffffffc0207e0a:	6400                	ld	s0,8(s0)
ffffffffc0207e0c:	06940b63          	beq	s0,s1,ffffffffc0207e82 <vfs_mount+0xa8>
ffffffffc0207e10:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e14:	dbfd                	beqz	a5,ffffffffc0207e0a <vfs_mount+0x30>
ffffffffc0207e16:	fe043503          	ld	a0,-32(s0)
ffffffffc0207e1a:	85ca                	mv	a1,s2
ffffffffc0207e1c:	5c6030ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc0207e20:	f56d                	bnez	a0,ffffffffc0207e0a <vfs_mount+0x30>
ffffffffc0207e22:	ff043783          	ld	a5,-16(s0)
ffffffffc0207e26:	e3a5                	bnez	a5,ffffffffc0207e86 <vfs_mount+0xac>
ffffffffc0207e28:	fe043783          	ld	a5,-32(s0)
ffffffffc0207e2c:	c3c9                	beqz	a5,ffffffffc0207eae <vfs_mount+0xd4>
ffffffffc0207e2e:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e32:	cfb5                	beqz	a5,ffffffffc0207eae <vfs_mount+0xd4>
ffffffffc0207e34:	fe843503          	ld	a0,-24(s0)
ffffffffc0207e38:	c939                	beqz	a0,ffffffffc0207e8e <vfs_mount+0xb4>
ffffffffc0207e3a:	4d38                	lw	a4,88(a0)
ffffffffc0207e3c:	6785                	lui	a5,0x1
ffffffffc0207e3e:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207e42:	04f71663          	bne	a4,a5,ffffffffc0207e8e <vfs_mount+0xb4>
ffffffffc0207e46:	ff040593          	addi	a1,s0,-16
ffffffffc0207e4a:	9982                	jalr	s3
ffffffffc0207e4c:	84aa                	mv	s1,a0
ffffffffc0207e4e:	ed01                	bnez	a0,ffffffffc0207e66 <vfs_mount+0x8c>
ffffffffc0207e50:	ff043783          	ld	a5,-16(s0)
ffffffffc0207e54:	cfad                	beqz	a5,ffffffffc0207ece <vfs_mount+0xf4>
ffffffffc0207e56:	fe043583          	ld	a1,-32(s0)
ffffffffc0207e5a:	00006517          	auipc	a0,0x6
ffffffffc0207e5e:	7b650513          	addi	a0,a0,1974 # ffffffffc020e610 <syscalls+0xb60>
ffffffffc0207e62:	b44f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207e66:	0008e517          	auipc	a0,0x8e
ffffffffc0207e6a:	9c250513          	addi	a0,a0,-1598 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207e6e:	ef2fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207e72:	70a2                	ld	ra,40(sp)
ffffffffc0207e74:	7402                	ld	s0,32(sp)
ffffffffc0207e76:	6942                	ld	s2,16(sp)
ffffffffc0207e78:	69a2                	ld	s3,8(sp)
ffffffffc0207e7a:	8526                	mv	a0,s1
ffffffffc0207e7c:	64e2                	ld	s1,24(sp)
ffffffffc0207e7e:	6145                	addi	sp,sp,48
ffffffffc0207e80:	8082                	ret
ffffffffc0207e82:	54cd                	li	s1,-13
ffffffffc0207e84:	b7cd                	j	ffffffffc0207e66 <vfs_mount+0x8c>
ffffffffc0207e86:	54c5                	li	s1,-15
ffffffffc0207e88:	bff9                	j	ffffffffc0207e66 <vfs_mount+0x8c>
ffffffffc0207e8a:	db3ff0ef          	jal	ra,ffffffffc0207c3c <find_mount.part.0>
ffffffffc0207e8e:	00006697          	auipc	a3,0x6
ffffffffc0207e92:	73268693          	addi	a3,a3,1842 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0207e96:	00004617          	auipc	a2,0x4
ffffffffc0207e9a:	a8a60613          	addi	a2,a2,-1398 # ffffffffc020b920 <commands+0x210>
ffffffffc0207e9e:	0ed00593          	li	a1,237
ffffffffc0207ea2:	00006517          	auipc	a0,0x6
ffffffffc0207ea6:	66650513          	addi	a0,a0,1638 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207eaa:	df4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207eae:	00006697          	auipc	a3,0x6
ffffffffc0207eb2:	6e268693          	addi	a3,a3,1762 # ffffffffc020e590 <syscalls+0xae0>
ffffffffc0207eb6:	00004617          	auipc	a2,0x4
ffffffffc0207eba:	a6a60613          	addi	a2,a2,-1430 # ffffffffc020b920 <commands+0x210>
ffffffffc0207ebe:	0eb00593          	li	a1,235
ffffffffc0207ec2:	00006517          	auipc	a0,0x6
ffffffffc0207ec6:	64650513          	addi	a0,a0,1606 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207eca:	dd4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207ece:	00006697          	auipc	a3,0x6
ffffffffc0207ed2:	72a68693          	addi	a3,a3,1834 # ffffffffc020e5f8 <syscalls+0xb48>
ffffffffc0207ed6:	00004617          	auipc	a2,0x4
ffffffffc0207eda:	a4a60613          	addi	a2,a2,-1462 # ffffffffc020b920 <commands+0x210>
ffffffffc0207ede:	0ef00593          	li	a1,239
ffffffffc0207ee2:	00006517          	auipc	a0,0x6
ffffffffc0207ee6:	62650513          	addi	a0,a0,1574 # ffffffffc020e508 <syscalls+0xa58>
ffffffffc0207eea:	db4f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207eee <vfs_open>:
ffffffffc0207eee:	711d                	addi	sp,sp,-96
ffffffffc0207ef0:	e4a6                	sd	s1,72(sp)
ffffffffc0207ef2:	e0ca                	sd	s2,64(sp)
ffffffffc0207ef4:	fc4e                	sd	s3,56(sp)
ffffffffc0207ef6:	ec86                	sd	ra,88(sp)
ffffffffc0207ef8:	e8a2                	sd	s0,80(sp)
ffffffffc0207efa:	f852                	sd	s4,48(sp)
ffffffffc0207efc:	f456                	sd	s5,40(sp)
ffffffffc0207efe:	0035f793          	andi	a5,a1,3
ffffffffc0207f02:	84ae                	mv	s1,a1
ffffffffc0207f04:	892a                	mv	s2,a0
ffffffffc0207f06:	89b2                	mv	s3,a2
ffffffffc0207f08:	0e078663          	beqz	a5,ffffffffc0207ff4 <vfs_open+0x106>
ffffffffc0207f0c:	470d                	li	a4,3
ffffffffc0207f0e:	0105fa93          	andi	s5,a1,16
ffffffffc0207f12:	0ce78f63          	beq	a5,a4,ffffffffc0207ff0 <vfs_open+0x102>
ffffffffc0207f16:	002c                	addi	a1,sp,8
ffffffffc0207f18:	854a                	mv	a0,s2
ffffffffc0207f1a:	2ae000ef          	jal	ra,ffffffffc02081c8 <vfs_lookup>
ffffffffc0207f1e:	842a                	mv	s0,a0
ffffffffc0207f20:	0044fa13          	andi	s4,s1,4
ffffffffc0207f24:	e159                	bnez	a0,ffffffffc0207faa <vfs_open+0xbc>
ffffffffc0207f26:	00c4f793          	andi	a5,s1,12
ffffffffc0207f2a:	4731                	li	a4,12
ffffffffc0207f2c:	0ee78263          	beq	a5,a4,ffffffffc0208010 <vfs_open+0x122>
ffffffffc0207f30:	6422                	ld	s0,8(sp)
ffffffffc0207f32:	12040163          	beqz	s0,ffffffffc0208054 <vfs_open+0x166>
ffffffffc0207f36:	783c                	ld	a5,112(s0)
ffffffffc0207f38:	cff1                	beqz	a5,ffffffffc0208014 <vfs_open+0x126>
ffffffffc0207f3a:	679c                	ld	a5,8(a5)
ffffffffc0207f3c:	cfe1                	beqz	a5,ffffffffc0208014 <vfs_open+0x126>
ffffffffc0207f3e:	8522                	mv	a0,s0
ffffffffc0207f40:	00006597          	auipc	a1,0x6
ffffffffc0207f44:	7b058593          	addi	a1,a1,1968 # ffffffffc020e6f0 <syscalls+0xc40>
ffffffffc0207f48:	8c3ff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0207f4c:	783c                	ld	a5,112(s0)
ffffffffc0207f4e:	6522                	ld	a0,8(sp)
ffffffffc0207f50:	85a6                	mv	a1,s1
ffffffffc0207f52:	679c                	ld	a5,8(a5)
ffffffffc0207f54:	9782                	jalr	a5
ffffffffc0207f56:	842a                	mv	s0,a0
ffffffffc0207f58:	6522                	ld	a0,8(sp)
ffffffffc0207f5a:	e845                	bnez	s0,ffffffffc020800a <vfs_open+0x11c>
ffffffffc0207f5c:	015a6a33          	or	s4,s4,s5
ffffffffc0207f60:	89fff0ef          	jal	ra,ffffffffc02077fe <inode_open_inc>
ffffffffc0207f64:	020a0663          	beqz	s4,ffffffffc0207f90 <vfs_open+0xa2>
ffffffffc0207f68:	64a2                	ld	s1,8(sp)
ffffffffc0207f6a:	c4e9                	beqz	s1,ffffffffc0208034 <vfs_open+0x146>
ffffffffc0207f6c:	78bc                	ld	a5,112(s1)
ffffffffc0207f6e:	c3f9                	beqz	a5,ffffffffc0208034 <vfs_open+0x146>
ffffffffc0207f70:	73bc                	ld	a5,96(a5)
ffffffffc0207f72:	c3e9                	beqz	a5,ffffffffc0208034 <vfs_open+0x146>
ffffffffc0207f74:	00006597          	auipc	a1,0x6
ffffffffc0207f78:	7dc58593          	addi	a1,a1,2012 # ffffffffc020e750 <syscalls+0xca0>
ffffffffc0207f7c:	8526                	mv	a0,s1
ffffffffc0207f7e:	88dff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0207f82:	78bc                	ld	a5,112(s1)
ffffffffc0207f84:	6522                	ld	a0,8(sp)
ffffffffc0207f86:	4581                	li	a1,0
ffffffffc0207f88:	73bc                	ld	a5,96(a5)
ffffffffc0207f8a:	9782                	jalr	a5
ffffffffc0207f8c:	87aa                	mv	a5,a0
ffffffffc0207f8e:	e92d                	bnez	a0,ffffffffc0208000 <vfs_open+0x112>
ffffffffc0207f90:	67a2                	ld	a5,8(sp)
ffffffffc0207f92:	00f9b023          	sd	a5,0(s3)
ffffffffc0207f96:	60e6                	ld	ra,88(sp)
ffffffffc0207f98:	8522                	mv	a0,s0
ffffffffc0207f9a:	6446                	ld	s0,80(sp)
ffffffffc0207f9c:	64a6                	ld	s1,72(sp)
ffffffffc0207f9e:	6906                	ld	s2,64(sp)
ffffffffc0207fa0:	79e2                	ld	s3,56(sp)
ffffffffc0207fa2:	7a42                	ld	s4,48(sp)
ffffffffc0207fa4:	7aa2                	ld	s5,40(sp)
ffffffffc0207fa6:	6125                	addi	sp,sp,96
ffffffffc0207fa8:	8082                	ret
ffffffffc0207faa:	57c1                	li	a5,-16
ffffffffc0207fac:	fef515e3          	bne	a0,a5,ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0207fb0:	fe0a03e3          	beqz	s4,ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0207fb4:	0810                	addi	a2,sp,16
ffffffffc0207fb6:	082c                	addi	a1,sp,24
ffffffffc0207fb8:	854a                	mv	a0,s2
ffffffffc0207fba:	2a4000ef          	jal	ra,ffffffffc020825e <vfs_lookup_parent>
ffffffffc0207fbe:	842a                	mv	s0,a0
ffffffffc0207fc0:	f979                	bnez	a0,ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0207fc2:	6462                	ld	s0,24(sp)
ffffffffc0207fc4:	c845                	beqz	s0,ffffffffc0208074 <vfs_open+0x186>
ffffffffc0207fc6:	783c                	ld	a5,112(s0)
ffffffffc0207fc8:	c7d5                	beqz	a5,ffffffffc0208074 <vfs_open+0x186>
ffffffffc0207fca:	77bc                	ld	a5,104(a5)
ffffffffc0207fcc:	c7c5                	beqz	a5,ffffffffc0208074 <vfs_open+0x186>
ffffffffc0207fce:	8522                	mv	a0,s0
ffffffffc0207fd0:	00006597          	auipc	a1,0x6
ffffffffc0207fd4:	6b858593          	addi	a1,a1,1720 # ffffffffc020e688 <syscalls+0xbd8>
ffffffffc0207fd8:	833ff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0207fdc:	783c                	ld	a5,112(s0)
ffffffffc0207fde:	65c2                	ld	a1,16(sp)
ffffffffc0207fe0:	6562                	ld	a0,24(sp)
ffffffffc0207fe2:	77bc                	ld	a5,104(a5)
ffffffffc0207fe4:	4034d613          	srai	a2,s1,0x3
ffffffffc0207fe8:	0034                	addi	a3,sp,8
ffffffffc0207fea:	8a05                	andi	a2,a2,1
ffffffffc0207fec:	9782                	jalr	a5
ffffffffc0207fee:	b789                	j	ffffffffc0207f30 <vfs_open+0x42>
ffffffffc0207ff0:	5475                	li	s0,-3
ffffffffc0207ff2:	b755                	j	ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0207ff4:	0105fa93          	andi	s5,a1,16
ffffffffc0207ff8:	5475                	li	s0,-3
ffffffffc0207ffa:	f80a9ee3          	bnez	s5,ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0207ffe:	bf21                	j	ffffffffc0207f16 <vfs_open+0x28>
ffffffffc0208000:	6522                	ld	a0,8(sp)
ffffffffc0208002:	843e                	mv	s0,a5
ffffffffc0208004:	965ff0ef          	jal	ra,ffffffffc0207968 <inode_open_dec>
ffffffffc0208008:	6522                	ld	a0,8(sp)
ffffffffc020800a:	8b7ff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020800e:	b761                	j	ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0208010:	5425                	li	s0,-23
ffffffffc0208012:	b751                	j	ffffffffc0207f96 <vfs_open+0xa8>
ffffffffc0208014:	00006697          	auipc	a3,0x6
ffffffffc0208018:	68c68693          	addi	a3,a3,1676 # ffffffffc020e6a0 <syscalls+0xbf0>
ffffffffc020801c:	00004617          	auipc	a2,0x4
ffffffffc0208020:	90460613          	addi	a2,a2,-1788 # ffffffffc020b920 <commands+0x210>
ffffffffc0208024:	03300593          	li	a1,51
ffffffffc0208028:	00006517          	auipc	a0,0x6
ffffffffc020802c:	64850513          	addi	a0,a0,1608 # ffffffffc020e670 <syscalls+0xbc0>
ffffffffc0208030:	c6ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208034:	00006697          	auipc	a3,0x6
ffffffffc0208038:	6c468693          	addi	a3,a3,1732 # ffffffffc020e6f8 <syscalls+0xc48>
ffffffffc020803c:	00004617          	auipc	a2,0x4
ffffffffc0208040:	8e460613          	addi	a2,a2,-1820 # ffffffffc020b920 <commands+0x210>
ffffffffc0208044:	03a00593          	li	a1,58
ffffffffc0208048:	00006517          	auipc	a0,0x6
ffffffffc020804c:	62850513          	addi	a0,a0,1576 # ffffffffc020e670 <syscalls+0xbc0>
ffffffffc0208050:	c4ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208054:	00006697          	auipc	a3,0x6
ffffffffc0208058:	63c68693          	addi	a3,a3,1596 # ffffffffc020e690 <syscalls+0xbe0>
ffffffffc020805c:	00004617          	auipc	a2,0x4
ffffffffc0208060:	8c460613          	addi	a2,a2,-1852 # ffffffffc020b920 <commands+0x210>
ffffffffc0208064:	03100593          	li	a1,49
ffffffffc0208068:	00006517          	auipc	a0,0x6
ffffffffc020806c:	60850513          	addi	a0,a0,1544 # ffffffffc020e670 <syscalls+0xbc0>
ffffffffc0208070:	c2ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208074:	00006697          	auipc	a3,0x6
ffffffffc0208078:	5ac68693          	addi	a3,a3,1452 # ffffffffc020e620 <syscalls+0xb70>
ffffffffc020807c:	00004617          	auipc	a2,0x4
ffffffffc0208080:	8a460613          	addi	a2,a2,-1884 # ffffffffc020b920 <commands+0x210>
ffffffffc0208084:	02c00593          	li	a1,44
ffffffffc0208088:	00006517          	auipc	a0,0x6
ffffffffc020808c:	5e850513          	addi	a0,a0,1512 # ffffffffc020e670 <syscalls+0xbc0>
ffffffffc0208090:	c0ef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208094 <vfs_close>:
ffffffffc0208094:	1141                	addi	sp,sp,-16
ffffffffc0208096:	e406                	sd	ra,8(sp)
ffffffffc0208098:	e022                	sd	s0,0(sp)
ffffffffc020809a:	842a                	mv	s0,a0
ffffffffc020809c:	8cdff0ef          	jal	ra,ffffffffc0207968 <inode_open_dec>
ffffffffc02080a0:	8522                	mv	a0,s0
ffffffffc02080a2:	81fff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc02080a6:	60a2                	ld	ra,8(sp)
ffffffffc02080a8:	6402                	ld	s0,0(sp)
ffffffffc02080aa:	4501                	li	a0,0
ffffffffc02080ac:	0141                	addi	sp,sp,16
ffffffffc02080ae:	8082                	ret

ffffffffc02080b0 <get_device>:
ffffffffc02080b0:	7179                	addi	sp,sp,-48
ffffffffc02080b2:	ec26                	sd	s1,24(sp)
ffffffffc02080b4:	e84a                	sd	s2,16(sp)
ffffffffc02080b6:	f406                	sd	ra,40(sp)
ffffffffc02080b8:	f022                	sd	s0,32(sp)
ffffffffc02080ba:	00054303          	lbu	t1,0(a0)
ffffffffc02080be:	892e                	mv	s2,a1
ffffffffc02080c0:	84b2                	mv	s1,a2
ffffffffc02080c2:	02030463          	beqz	t1,ffffffffc02080ea <get_device+0x3a>
ffffffffc02080c6:	00150413          	addi	s0,a0,1
ffffffffc02080ca:	86a2                	mv	a3,s0
ffffffffc02080cc:	879a                	mv	a5,t1
ffffffffc02080ce:	4701                	li	a4,0
ffffffffc02080d0:	03a00813          	li	a6,58
ffffffffc02080d4:	02f00893          	li	a7,47
ffffffffc02080d8:	03078263          	beq	a5,a6,ffffffffc02080fc <get_device+0x4c>
ffffffffc02080dc:	05178963          	beq	a5,a7,ffffffffc020812e <get_device+0x7e>
ffffffffc02080e0:	0006c783          	lbu	a5,0(a3)
ffffffffc02080e4:	2705                	addiw	a4,a4,1
ffffffffc02080e6:	0685                	addi	a3,a3,1
ffffffffc02080e8:	fbe5                	bnez	a5,ffffffffc02080d8 <get_device+0x28>
ffffffffc02080ea:	7402                	ld	s0,32(sp)
ffffffffc02080ec:	00a93023          	sd	a0,0(s2)
ffffffffc02080f0:	70a2                	ld	ra,40(sp)
ffffffffc02080f2:	6942                	ld	s2,16(sp)
ffffffffc02080f4:	8526                	mv	a0,s1
ffffffffc02080f6:	64e2                	ld	s1,24(sp)
ffffffffc02080f8:	6145                	addi	sp,sp,48
ffffffffc02080fa:	a279                	j	ffffffffc0208288 <vfs_get_curdir>
ffffffffc02080fc:	cb15                	beqz	a4,ffffffffc0208130 <get_device+0x80>
ffffffffc02080fe:	00e507b3          	add	a5,a0,a4
ffffffffc0208102:	0705                	addi	a4,a4,1
ffffffffc0208104:	00078023          	sb	zero,0(a5)
ffffffffc0208108:	972a                	add	a4,a4,a0
ffffffffc020810a:	02f00613          	li	a2,47
ffffffffc020810e:	00074783          	lbu	a5,0(a4)
ffffffffc0208112:	86ba                	mv	a3,a4
ffffffffc0208114:	0705                	addi	a4,a4,1
ffffffffc0208116:	fec78ce3          	beq	a5,a2,ffffffffc020810e <get_device+0x5e>
ffffffffc020811a:	7402                	ld	s0,32(sp)
ffffffffc020811c:	70a2                	ld	ra,40(sp)
ffffffffc020811e:	00d93023          	sd	a3,0(s2)
ffffffffc0208122:	85a6                	mv	a1,s1
ffffffffc0208124:	6942                	ld	s2,16(sp)
ffffffffc0208126:	64e2                	ld	s1,24(sp)
ffffffffc0208128:	6145                	addi	sp,sp,48
ffffffffc020812a:	ba9ff06f          	j	ffffffffc0207cd2 <vfs_get_root>
ffffffffc020812e:	ff55                	bnez	a4,ffffffffc02080ea <get_device+0x3a>
ffffffffc0208130:	02f00793          	li	a5,47
ffffffffc0208134:	04f30563          	beq	t1,a5,ffffffffc020817e <get_device+0xce>
ffffffffc0208138:	03a00793          	li	a5,58
ffffffffc020813c:	06f31663          	bne	t1,a5,ffffffffc02081a8 <get_device+0xf8>
ffffffffc0208140:	0028                	addi	a0,sp,8
ffffffffc0208142:	146000ef          	jal	ra,ffffffffc0208288 <vfs_get_curdir>
ffffffffc0208146:	e515                	bnez	a0,ffffffffc0208172 <get_device+0xc2>
ffffffffc0208148:	67a2                	ld	a5,8(sp)
ffffffffc020814a:	77a8                	ld	a0,104(a5)
ffffffffc020814c:	cd15                	beqz	a0,ffffffffc0208188 <get_device+0xd8>
ffffffffc020814e:	617c                	ld	a5,192(a0)
ffffffffc0208150:	9782                	jalr	a5
ffffffffc0208152:	87aa                	mv	a5,a0
ffffffffc0208154:	6522                	ld	a0,8(sp)
ffffffffc0208156:	e09c                	sd	a5,0(s1)
ffffffffc0208158:	f68ff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020815c:	02f00713          	li	a4,47
ffffffffc0208160:	a011                	j	ffffffffc0208164 <get_device+0xb4>
ffffffffc0208162:	0405                	addi	s0,s0,1
ffffffffc0208164:	00044783          	lbu	a5,0(s0)
ffffffffc0208168:	fee78de3          	beq	a5,a4,ffffffffc0208162 <get_device+0xb2>
ffffffffc020816c:	00893023          	sd	s0,0(s2)
ffffffffc0208170:	4501                	li	a0,0
ffffffffc0208172:	70a2                	ld	ra,40(sp)
ffffffffc0208174:	7402                	ld	s0,32(sp)
ffffffffc0208176:	64e2                	ld	s1,24(sp)
ffffffffc0208178:	6942                	ld	s2,16(sp)
ffffffffc020817a:	6145                	addi	sp,sp,48
ffffffffc020817c:	8082                	ret
ffffffffc020817e:	8526                	mv	a0,s1
ffffffffc0208180:	93fff0ef          	jal	ra,ffffffffc0207abe <vfs_get_bootfs>
ffffffffc0208184:	dd61                	beqz	a0,ffffffffc020815c <get_device+0xac>
ffffffffc0208186:	b7f5                	j	ffffffffc0208172 <get_device+0xc2>
ffffffffc0208188:	00006697          	auipc	a3,0x6
ffffffffc020818c:	60068693          	addi	a3,a3,1536 # ffffffffc020e788 <syscalls+0xcd8>
ffffffffc0208190:	00003617          	auipc	a2,0x3
ffffffffc0208194:	79060613          	addi	a2,a2,1936 # ffffffffc020b920 <commands+0x210>
ffffffffc0208198:	03900593          	li	a1,57
ffffffffc020819c:	00006517          	auipc	a0,0x6
ffffffffc02081a0:	5d450513          	addi	a0,a0,1492 # ffffffffc020e770 <syscalls+0xcc0>
ffffffffc02081a4:	afaf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02081a8:	00006697          	auipc	a3,0x6
ffffffffc02081ac:	5b868693          	addi	a3,a3,1464 # ffffffffc020e760 <syscalls+0xcb0>
ffffffffc02081b0:	00003617          	auipc	a2,0x3
ffffffffc02081b4:	77060613          	addi	a2,a2,1904 # ffffffffc020b920 <commands+0x210>
ffffffffc02081b8:	03300593          	li	a1,51
ffffffffc02081bc:	00006517          	auipc	a0,0x6
ffffffffc02081c0:	5b450513          	addi	a0,a0,1460 # ffffffffc020e770 <syscalls+0xcc0>
ffffffffc02081c4:	adaf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02081c8 <vfs_lookup>:
ffffffffc02081c8:	7139                	addi	sp,sp,-64
ffffffffc02081ca:	f426                	sd	s1,40(sp)
ffffffffc02081cc:	0830                	addi	a2,sp,24
ffffffffc02081ce:	84ae                	mv	s1,a1
ffffffffc02081d0:	002c                	addi	a1,sp,8
ffffffffc02081d2:	f822                	sd	s0,48(sp)
ffffffffc02081d4:	fc06                	sd	ra,56(sp)
ffffffffc02081d6:	f04a                	sd	s2,32(sp)
ffffffffc02081d8:	e42a                	sd	a0,8(sp)
ffffffffc02081da:	ed7ff0ef          	jal	ra,ffffffffc02080b0 <get_device>
ffffffffc02081de:	842a                	mv	s0,a0
ffffffffc02081e0:	ed1d                	bnez	a0,ffffffffc020821e <vfs_lookup+0x56>
ffffffffc02081e2:	67a2                	ld	a5,8(sp)
ffffffffc02081e4:	6962                	ld	s2,24(sp)
ffffffffc02081e6:	0007c783          	lbu	a5,0(a5)
ffffffffc02081ea:	c3a9                	beqz	a5,ffffffffc020822c <vfs_lookup+0x64>
ffffffffc02081ec:	04090963          	beqz	s2,ffffffffc020823e <vfs_lookup+0x76>
ffffffffc02081f0:	07093783          	ld	a5,112(s2)
ffffffffc02081f4:	c7a9                	beqz	a5,ffffffffc020823e <vfs_lookup+0x76>
ffffffffc02081f6:	7bbc                	ld	a5,112(a5)
ffffffffc02081f8:	c3b9                	beqz	a5,ffffffffc020823e <vfs_lookup+0x76>
ffffffffc02081fa:	854a                	mv	a0,s2
ffffffffc02081fc:	00006597          	auipc	a1,0x6
ffffffffc0208200:	5f458593          	addi	a1,a1,1524 # ffffffffc020e7f0 <syscalls+0xd40>
ffffffffc0208204:	e06ff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0208208:	07093783          	ld	a5,112(s2)
ffffffffc020820c:	65a2                	ld	a1,8(sp)
ffffffffc020820e:	6562                	ld	a0,24(sp)
ffffffffc0208210:	7bbc                	ld	a5,112(a5)
ffffffffc0208212:	8626                	mv	a2,s1
ffffffffc0208214:	9782                	jalr	a5
ffffffffc0208216:	842a                	mv	s0,a0
ffffffffc0208218:	6562                	ld	a0,24(sp)
ffffffffc020821a:	ea6ff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020821e:	70e2                	ld	ra,56(sp)
ffffffffc0208220:	8522                	mv	a0,s0
ffffffffc0208222:	7442                	ld	s0,48(sp)
ffffffffc0208224:	74a2                	ld	s1,40(sp)
ffffffffc0208226:	7902                	ld	s2,32(sp)
ffffffffc0208228:	6121                	addi	sp,sp,64
ffffffffc020822a:	8082                	ret
ffffffffc020822c:	70e2                	ld	ra,56(sp)
ffffffffc020822e:	8522                	mv	a0,s0
ffffffffc0208230:	7442                	ld	s0,48(sp)
ffffffffc0208232:	0124b023          	sd	s2,0(s1)
ffffffffc0208236:	74a2                	ld	s1,40(sp)
ffffffffc0208238:	7902                	ld	s2,32(sp)
ffffffffc020823a:	6121                	addi	sp,sp,64
ffffffffc020823c:	8082                	ret
ffffffffc020823e:	00006697          	auipc	a3,0x6
ffffffffc0208242:	56268693          	addi	a3,a3,1378 # ffffffffc020e7a0 <syscalls+0xcf0>
ffffffffc0208246:	00003617          	auipc	a2,0x3
ffffffffc020824a:	6da60613          	addi	a2,a2,1754 # ffffffffc020b920 <commands+0x210>
ffffffffc020824e:	04f00593          	li	a1,79
ffffffffc0208252:	00006517          	auipc	a0,0x6
ffffffffc0208256:	51e50513          	addi	a0,a0,1310 # ffffffffc020e770 <syscalls+0xcc0>
ffffffffc020825a:	a44f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020825e <vfs_lookup_parent>:
ffffffffc020825e:	7139                	addi	sp,sp,-64
ffffffffc0208260:	f822                	sd	s0,48(sp)
ffffffffc0208262:	f426                	sd	s1,40(sp)
ffffffffc0208264:	842e                	mv	s0,a1
ffffffffc0208266:	84b2                	mv	s1,a2
ffffffffc0208268:	002c                	addi	a1,sp,8
ffffffffc020826a:	0830                	addi	a2,sp,24
ffffffffc020826c:	fc06                	sd	ra,56(sp)
ffffffffc020826e:	e42a                	sd	a0,8(sp)
ffffffffc0208270:	e41ff0ef          	jal	ra,ffffffffc02080b0 <get_device>
ffffffffc0208274:	e509                	bnez	a0,ffffffffc020827e <vfs_lookup_parent+0x20>
ffffffffc0208276:	67a2                	ld	a5,8(sp)
ffffffffc0208278:	e09c                	sd	a5,0(s1)
ffffffffc020827a:	67e2                	ld	a5,24(sp)
ffffffffc020827c:	e01c                	sd	a5,0(s0)
ffffffffc020827e:	70e2                	ld	ra,56(sp)
ffffffffc0208280:	7442                	ld	s0,48(sp)
ffffffffc0208282:	74a2                	ld	s1,40(sp)
ffffffffc0208284:	6121                	addi	sp,sp,64
ffffffffc0208286:	8082                	ret

ffffffffc0208288 <vfs_get_curdir>:
ffffffffc0208288:	0008e797          	auipc	a5,0x8e
ffffffffc020828c:	6387b783          	ld	a5,1592(a5) # ffffffffc02968c0 <current>
ffffffffc0208290:	1487b783          	ld	a5,328(a5)
ffffffffc0208294:	1101                	addi	sp,sp,-32
ffffffffc0208296:	e426                	sd	s1,8(sp)
ffffffffc0208298:	6384                	ld	s1,0(a5)
ffffffffc020829a:	ec06                	sd	ra,24(sp)
ffffffffc020829c:	e822                	sd	s0,16(sp)
ffffffffc020829e:	cc81                	beqz	s1,ffffffffc02082b6 <vfs_get_curdir+0x2e>
ffffffffc02082a0:	842a                	mv	s0,a0
ffffffffc02082a2:	8526                	mv	a0,s1
ffffffffc02082a4:	d4eff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc02082a8:	4501                	li	a0,0
ffffffffc02082aa:	e004                	sd	s1,0(s0)
ffffffffc02082ac:	60e2                	ld	ra,24(sp)
ffffffffc02082ae:	6442                	ld	s0,16(sp)
ffffffffc02082b0:	64a2                	ld	s1,8(sp)
ffffffffc02082b2:	6105                	addi	sp,sp,32
ffffffffc02082b4:	8082                	ret
ffffffffc02082b6:	5541                	li	a0,-16
ffffffffc02082b8:	bfd5                	j	ffffffffc02082ac <vfs_get_curdir+0x24>

ffffffffc02082ba <vfs_set_curdir>:
ffffffffc02082ba:	7139                	addi	sp,sp,-64
ffffffffc02082bc:	f04a                	sd	s2,32(sp)
ffffffffc02082be:	0008e917          	auipc	s2,0x8e
ffffffffc02082c2:	60290913          	addi	s2,s2,1538 # ffffffffc02968c0 <current>
ffffffffc02082c6:	00093783          	ld	a5,0(s2)
ffffffffc02082ca:	f822                	sd	s0,48(sp)
ffffffffc02082cc:	842a                	mv	s0,a0
ffffffffc02082ce:	1487b503          	ld	a0,328(a5)
ffffffffc02082d2:	ec4e                	sd	s3,24(sp)
ffffffffc02082d4:	fc06                	sd	ra,56(sp)
ffffffffc02082d6:	f426                	sd	s1,40(sp)
ffffffffc02082d8:	eebfc0ef          	jal	ra,ffffffffc02051c2 <lock_files>
ffffffffc02082dc:	00093783          	ld	a5,0(s2)
ffffffffc02082e0:	1487b503          	ld	a0,328(a5)
ffffffffc02082e4:	00053983          	ld	s3,0(a0)
ffffffffc02082e8:	07340963          	beq	s0,s3,ffffffffc020835a <vfs_set_curdir+0xa0>
ffffffffc02082ec:	cc39                	beqz	s0,ffffffffc020834a <vfs_set_curdir+0x90>
ffffffffc02082ee:	783c                	ld	a5,112(s0)
ffffffffc02082f0:	c7bd                	beqz	a5,ffffffffc020835e <vfs_set_curdir+0xa4>
ffffffffc02082f2:	6bbc                	ld	a5,80(a5)
ffffffffc02082f4:	c7ad                	beqz	a5,ffffffffc020835e <vfs_set_curdir+0xa4>
ffffffffc02082f6:	00006597          	auipc	a1,0x6
ffffffffc02082fa:	56a58593          	addi	a1,a1,1386 # ffffffffc020e860 <syscalls+0xdb0>
ffffffffc02082fe:	8522                	mv	a0,s0
ffffffffc0208300:	d0aff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0208304:	783c                	ld	a5,112(s0)
ffffffffc0208306:	006c                	addi	a1,sp,12
ffffffffc0208308:	8522                	mv	a0,s0
ffffffffc020830a:	6bbc                	ld	a5,80(a5)
ffffffffc020830c:	9782                	jalr	a5
ffffffffc020830e:	84aa                	mv	s1,a0
ffffffffc0208310:	e901                	bnez	a0,ffffffffc0208320 <vfs_set_curdir+0x66>
ffffffffc0208312:	47b2                	lw	a5,12(sp)
ffffffffc0208314:	669d                	lui	a3,0x7
ffffffffc0208316:	6709                	lui	a4,0x2
ffffffffc0208318:	8ff5                	and	a5,a5,a3
ffffffffc020831a:	54b9                	li	s1,-18
ffffffffc020831c:	02e78063          	beq	a5,a4,ffffffffc020833c <vfs_set_curdir+0x82>
ffffffffc0208320:	00093783          	ld	a5,0(s2)
ffffffffc0208324:	1487b503          	ld	a0,328(a5)
ffffffffc0208328:	ea1fc0ef          	jal	ra,ffffffffc02051c8 <unlock_files>
ffffffffc020832c:	70e2                	ld	ra,56(sp)
ffffffffc020832e:	7442                	ld	s0,48(sp)
ffffffffc0208330:	7902                	ld	s2,32(sp)
ffffffffc0208332:	69e2                	ld	s3,24(sp)
ffffffffc0208334:	8526                	mv	a0,s1
ffffffffc0208336:	74a2                	ld	s1,40(sp)
ffffffffc0208338:	6121                	addi	sp,sp,64
ffffffffc020833a:	8082                	ret
ffffffffc020833c:	8522                	mv	a0,s0
ffffffffc020833e:	cb4ff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc0208342:	00093783          	ld	a5,0(s2)
ffffffffc0208346:	1487b503          	ld	a0,328(a5)
ffffffffc020834a:	e100                	sd	s0,0(a0)
ffffffffc020834c:	4481                	li	s1,0
ffffffffc020834e:	fc098de3          	beqz	s3,ffffffffc0208328 <vfs_set_curdir+0x6e>
ffffffffc0208352:	854e                	mv	a0,s3
ffffffffc0208354:	d6cff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc0208358:	b7e1                	j	ffffffffc0208320 <vfs_set_curdir+0x66>
ffffffffc020835a:	4481                	li	s1,0
ffffffffc020835c:	b7f1                	j	ffffffffc0208328 <vfs_set_curdir+0x6e>
ffffffffc020835e:	00006697          	auipc	a3,0x6
ffffffffc0208362:	49a68693          	addi	a3,a3,1178 # ffffffffc020e7f8 <syscalls+0xd48>
ffffffffc0208366:	00003617          	auipc	a2,0x3
ffffffffc020836a:	5ba60613          	addi	a2,a2,1466 # ffffffffc020b920 <commands+0x210>
ffffffffc020836e:	04300593          	li	a1,67
ffffffffc0208372:	00006517          	auipc	a0,0x6
ffffffffc0208376:	4d650513          	addi	a0,a0,1238 # ffffffffc020e848 <syscalls+0xd98>
ffffffffc020837a:	924f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020837e <vfs_chdir>:
ffffffffc020837e:	1101                	addi	sp,sp,-32
ffffffffc0208380:	002c                	addi	a1,sp,8
ffffffffc0208382:	e822                	sd	s0,16(sp)
ffffffffc0208384:	ec06                	sd	ra,24(sp)
ffffffffc0208386:	e43ff0ef          	jal	ra,ffffffffc02081c8 <vfs_lookup>
ffffffffc020838a:	842a                	mv	s0,a0
ffffffffc020838c:	c511                	beqz	a0,ffffffffc0208398 <vfs_chdir+0x1a>
ffffffffc020838e:	60e2                	ld	ra,24(sp)
ffffffffc0208390:	8522                	mv	a0,s0
ffffffffc0208392:	6442                	ld	s0,16(sp)
ffffffffc0208394:	6105                	addi	sp,sp,32
ffffffffc0208396:	8082                	ret
ffffffffc0208398:	6522                	ld	a0,8(sp)
ffffffffc020839a:	f21ff0ef          	jal	ra,ffffffffc02082ba <vfs_set_curdir>
ffffffffc020839e:	842a                	mv	s0,a0
ffffffffc02083a0:	6522                	ld	a0,8(sp)
ffffffffc02083a2:	d1eff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc02083a6:	60e2                	ld	ra,24(sp)
ffffffffc02083a8:	8522                	mv	a0,s0
ffffffffc02083aa:	6442                	ld	s0,16(sp)
ffffffffc02083ac:	6105                	addi	sp,sp,32
ffffffffc02083ae:	8082                	ret

ffffffffc02083b0 <vfs_getcwd>:
ffffffffc02083b0:	0008e797          	auipc	a5,0x8e
ffffffffc02083b4:	5107b783          	ld	a5,1296(a5) # ffffffffc02968c0 <current>
ffffffffc02083b8:	1487b783          	ld	a5,328(a5)
ffffffffc02083bc:	7179                	addi	sp,sp,-48
ffffffffc02083be:	ec26                	sd	s1,24(sp)
ffffffffc02083c0:	6384                	ld	s1,0(a5)
ffffffffc02083c2:	f406                	sd	ra,40(sp)
ffffffffc02083c4:	f022                	sd	s0,32(sp)
ffffffffc02083c6:	e84a                	sd	s2,16(sp)
ffffffffc02083c8:	ccbd                	beqz	s1,ffffffffc0208446 <vfs_getcwd+0x96>
ffffffffc02083ca:	892a                	mv	s2,a0
ffffffffc02083cc:	8526                	mv	a0,s1
ffffffffc02083ce:	c24ff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc02083d2:	74a8                	ld	a0,104(s1)
ffffffffc02083d4:	c93d                	beqz	a0,ffffffffc020844a <vfs_getcwd+0x9a>
ffffffffc02083d6:	9b3ff0ef          	jal	ra,ffffffffc0207d88 <vfs_get_devname>
ffffffffc02083da:	842a                	mv	s0,a0
ffffffffc02083dc:	7bf020ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc02083e0:	862a                	mv	a2,a0
ffffffffc02083e2:	85a2                	mv	a1,s0
ffffffffc02083e4:	4701                	li	a4,0
ffffffffc02083e6:	4685                	li	a3,1
ffffffffc02083e8:	854a                	mv	a0,s2
ffffffffc02083ea:	802fd0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc02083ee:	842a                	mv	s0,a0
ffffffffc02083f0:	c919                	beqz	a0,ffffffffc0208406 <vfs_getcwd+0x56>
ffffffffc02083f2:	8526                	mv	a0,s1
ffffffffc02083f4:	cccff0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc02083f8:	70a2                	ld	ra,40(sp)
ffffffffc02083fa:	8522                	mv	a0,s0
ffffffffc02083fc:	7402                	ld	s0,32(sp)
ffffffffc02083fe:	64e2                	ld	s1,24(sp)
ffffffffc0208400:	6942                	ld	s2,16(sp)
ffffffffc0208402:	6145                	addi	sp,sp,48
ffffffffc0208404:	8082                	ret
ffffffffc0208406:	03a00793          	li	a5,58
ffffffffc020840a:	4701                	li	a4,0
ffffffffc020840c:	4685                	li	a3,1
ffffffffc020840e:	4605                	li	a2,1
ffffffffc0208410:	00f10593          	addi	a1,sp,15
ffffffffc0208414:	854a                	mv	a0,s2
ffffffffc0208416:	00f107a3          	sb	a5,15(sp)
ffffffffc020841a:	fd3fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020841e:	842a                	mv	s0,a0
ffffffffc0208420:	f969                	bnez	a0,ffffffffc02083f2 <vfs_getcwd+0x42>
ffffffffc0208422:	78bc                	ld	a5,112(s1)
ffffffffc0208424:	c3b9                	beqz	a5,ffffffffc020846a <vfs_getcwd+0xba>
ffffffffc0208426:	7f9c                	ld	a5,56(a5)
ffffffffc0208428:	c3a9                	beqz	a5,ffffffffc020846a <vfs_getcwd+0xba>
ffffffffc020842a:	00006597          	auipc	a1,0x6
ffffffffc020842e:	49658593          	addi	a1,a1,1174 # ffffffffc020e8c0 <syscalls+0xe10>
ffffffffc0208432:	8526                	mv	a0,s1
ffffffffc0208434:	bd6ff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0208438:	78bc                	ld	a5,112(s1)
ffffffffc020843a:	85ca                	mv	a1,s2
ffffffffc020843c:	8526                	mv	a0,s1
ffffffffc020843e:	7f9c                	ld	a5,56(a5)
ffffffffc0208440:	9782                	jalr	a5
ffffffffc0208442:	842a                	mv	s0,a0
ffffffffc0208444:	b77d                	j	ffffffffc02083f2 <vfs_getcwd+0x42>
ffffffffc0208446:	5441                	li	s0,-16
ffffffffc0208448:	bf45                	j	ffffffffc02083f8 <vfs_getcwd+0x48>
ffffffffc020844a:	00006697          	auipc	a3,0x6
ffffffffc020844e:	33e68693          	addi	a3,a3,830 # ffffffffc020e788 <syscalls+0xcd8>
ffffffffc0208452:	00003617          	auipc	a2,0x3
ffffffffc0208456:	4ce60613          	addi	a2,a2,1230 # ffffffffc020b920 <commands+0x210>
ffffffffc020845a:	06e00593          	li	a1,110
ffffffffc020845e:	00006517          	auipc	a0,0x6
ffffffffc0208462:	3ea50513          	addi	a0,a0,1002 # ffffffffc020e848 <syscalls+0xd98>
ffffffffc0208466:	838f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020846a:	00006697          	auipc	a3,0x6
ffffffffc020846e:	3fe68693          	addi	a3,a3,1022 # ffffffffc020e868 <syscalls+0xdb8>
ffffffffc0208472:	00003617          	auipc	a2,0x3
ffffffffc0208476:	4ae60613          	addi	a2,a2,1198 # ffffffffc020b920 <commands+0x210>
ffffffffc020847a:	07800593          	li	a1,120
ffffffffc020847e:	00006517          	auipc	a0,0x6
ffffffffc0208482:	3ca50513          	addi	a0,a0,970 # ffffffffc020e848 <syscalls+0xd98>
ffffffffc0208486:	818f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020848a <dev_lookup>:
ffffffffc020848a:	0005c783          	lbu	a5,0(a1)
ffffffffc020848e:	e385                	bnez	a5,ffffffffc02084ae <dev_lookup+0x24>
ffffffffc0208490:	1101                	addi	sp,sp,-32
ffffffffc0208492:	e822                	sd	s0,16(sp)
ffffffffc0208494:	e426                	sd	s1,8(sp)
ffffffffc0208496:	ec06                	sd	ra,24(sp)
ffffffffc0208498:	84aa                	mv	s1,a0
ffffffffc020849a:	8432                	mv	s0,a2
ffffffffc020849c:	b56ff0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc02084a0:	60e2                	ld	ra,24(sp)
ffffffffc02084a2:	e004                	sd	s1,0(s0)
ffffffffc02084a4:	6442                	ld	s0,16(sp)
ffffffffc02084a6:	64a2                	ld	s1,8(sp)
ffffffffc02084a8:	4501                	li	a0,0
ffffffffc02084aa:	6105                	addi	sp,sp,32
ffffffffc02084ac:	8082                	ret
ffffffffc02084ae:	5541                	li	a0,-16
ffffffffc02084b0:	8082                	ret

ffffffffc02084b2 <dev_fstat>:
ffffffffc02084b2:	1101                	addi	sp,sp,-32
ffffffffc02084b4:	e426                	sd	s1,8(sp)
ffffffffc02084b6:	84ae                	mv	s1,a1
ffffffffc02084b8:	e822                	sd	s0,16(sp)
ffffffffc02084ba:	02000613          	li	a2,32
ffffffffc02084be:	842a                	mv	s0,a0
ffffffffc02084c0:	4581                	li	a1,0
ffffffffc02084c2:	8526                	mv	a0,s1
ffffffffc02084c4:	ec06                	sd	ra,24(sp)
ffffffffc02084c6:	777020ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc02084ca:	c429                	beqz	s0,ffffffffc0208514 <dev_fstat+0x62>
ffffffffc02084cc:	783c                	ld	a5,112(s0)
ffffffffc02084ce:	c3b9                	beqz	a5,ffffffffc0208514 <dev_fstat+0x62>
ffffffffc02084d0:	6bbc                	ld	a5,80(a5)
ffffffffc02084d2:	c3a9                	beqz	a5,ffffffffc0208514 <dev_fstat+0x62>
ffffffffc02084d4:	00006597          	auipc	a1,0x6
ffffffffc02084d8:	38c58593          	addi	a1,a1,908 # ffffffffc020e860 <syscalls+0xdb0>
ffffffffc02084dc:	8522                	mv	a0,s0
ffffffffc02084de:	b2cff0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02084e2:	783c                	ld	a5,112(s0)
ffffffffc02084e4:	85a6                	mv	a1,s1
ffffffffc02084e6:	8522                	mv	a0,s0
ffffffffc02084e8:	6bbc                	ld	a5,80(a5)
ffffffffc02084ea:	9782                	jalr	a5
ffffffffc02084ec:	ed19                	bnez	a0,ffffffffc020850a <dev_fstat+0x58>
ffffffffc02084ee:	4c38                	lw	a4,88(s0)
ffffffffc02084f0:	6785                	lui	a5,0x1
ffffffffc02084f2:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02084f6:	02f71f63          	bne	a4,a5,ffffffffc0208534 <dev_fstat+0x82>
ffffffffc02084fa:	6018                	ld	a4,0(s0)
ffffffffc02084fc:	641c                	ld	a5,8(s0)
ffffffffc02084fe:	4685                	li	a3,1
ffffffffc0208500:	e494                	sd	a3,8(s1)
ffffffffc0208502:	02e787b3          	mul	a5,a5,a4
ffffffffc0208506:	e898                	sd	a4,16(s1)
ffffffffc0208508:	ec9c                	sd	a5,24(s1)
ffffffffc020850a:	60e2                	ld	ra,24(sp)
ffffffffc020850c:	6442                	ld	s0,16(sp)
ffffffffc020850e:	64a2                	ld	s1,8(sp)
ffffffffc0208510:	6105                	addi	sp,sp,32
ffffffffc0208512:	8082                	ret
ffffffffc0208514:	00006697          	auipc	a3,0x6
ffffffffc0208518:	2e468693          	addi	a3,a3,740 # ffffffffc020e7f8 <syscalls+0xd48>
ffffffffc020851c:	00003617          	auipc	a2,0x3
ffffffffc0208520:	40460613          	addi	a2,a2,1028 # ffffffffc020b920 <commands+0x210>
ffffffffc0208524:	04200593          	li	a1,66
ffffffffc0208528:	00006517          	auipc	a0,0x6
ffffffffc020852c:	3a850513          	addi	a0,a0,936 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc0208530:	f6ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208534:	00006697          	auipc	a3,0x6
ffffffffc0208538:	08c68693          	addi	a3,a3,140 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc020853c:	00003617          	auipc	a2,0x3
ffffffffc0208540:	3e460613          	addi	a2,a2,996 # ffffffffc020b920 <commands+0x210>
ffffffffc0208544:	04500593          	li	a1,69
ffffffffc0208548:	00006517          	auipc	a0,0x6
ffffffffc020854c:	38850513          	addi	a0,a0,904 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc0208550:	f4ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208554 <dev_ioctl>:
ffffffffc0208554:	c909                	beqz	a0,ffffffffc0208566 <dev_ioctl+0x12>
ffffffffc0208556:	4d34                	lw	a3,88(a0)
ffffffffc0208558:	6705                	lui	a4,0x1
ffffffffc020855a:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020855e:	00e69463          	bne	a3,a4,ffffffffc0208566 <dev_ioctl+0x12>
ffffffffc0208562:	751c                	ld	a5,40(a0)
ffffffffc0208564:	8782                	jr	a5
ffffffffc0208566:	1141                	addi	sp,sp,-16
ffffffffc0208568:	00006697          	auipc	a3,0x6
ffffffffc020856c:	05868693          	addi	a3,a3,88 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208570:	00003617          	auipc	a2,0x3
ffffffffc0208574:	3b060613          	addi	a2,a2,944 # ffffffffc020b920 <commands+0x210>
ffffffffc0208578:	03500593          	li	a1,53
ffffffffc020857c:	00006517          	auipc	a0,0x6
ffffffffc0208580:	35450513          	addi	a0,a0,852 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc0208584:	e406                	sd	ra,8(sp)
ffffffffc0208586:	f19f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020858a <dev_tryseek>:
ffffffffc020858a:	c51d                	beqz	a0,ffffffffc02085b8 <dev_tryseek+0x2e>
ffffffffc020858c:	4d38                	lw	a4,88(a0)
ffffffffc020858e:	6785                	lui	a5,0x1
ffffffffc0208590:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208594:	02f71263          	bne	a4,a5,ffffffffc02085b8 <dev_tryseek+0x2e>
ffffffffc0208598:	611c                	ld	a5,0(a0)
ffffffffc020859a:	cf89                	beqz	a5,ffffffffc02085b4 <dev_tryseek+0x2a>
ffffffffc020859c:	6518                	ld	a4,8(a0)
ffffffffc020859e:	02e5f6b3          	remu	a3,a1,a4
ffffffffc02085a2:	ea89                	bnez	a3,ffffffffc02085b4 <dev_tryseek+0x2a>
ffffffffc02085a4:	0005c863          	bltz	a1,ffffffffc02085b4 <dev_tryseek+0x2a>
ffffffffc02085a8:	02e787b3          	mul	a5,a5,a4
ffffffffc02085ac:	00f5f463          	bgeu	a1,a5,ffffffffc02085b4 <dev_tryseek+0x2a>
ffffffffc02085b0:	4501                	li	a0,0
ffffffffc02085b2:	8082                	ret
ffffffffc02085b4:	5575                	li	a0,-3
ffffffffc02085b6:	8082                	ret
ffffffffc02085b8:	1141                	addi	sp,sp,-16
ffffffffc02085ba:	00006697          	auipc	a3,0x6
ffffffffc02085be:	00668693          	addi	a3,a3,6 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc02085c2:	00003617          	auipc	a2,0x3
ffffffffc02085c6:	35e60613          	addi	a2,a2,862 # ffffffffc020b920 <commands+0x210>
ffffffffc02085ca:	05f00593          	li	a1,95
ffffffffc02085ce:	00006517          	auipc	a0,0x6
ffffffffc02085d2:	30250513          	addi	a0,a0,770 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc02085d6:	e406                	sd	ra,8(sp)
ffffffffc02085d8:	ec7f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085dc <dev_gettype>:
ffffffffc02085dc:	c10d                	beqz	a0,ffffffffc02085fe <dev_gettype+0x22>
ffffffffc02085de:	4d38                	lw	a4,88(a0)
ffffffffc02085e0:	6785                	lui	a5,0x1
ffffffffc02085e2:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085e6:	00f71c63          	bne	a4,a5,ffffffffc02085fe <dev_gettype+0x22>
ffffffffc02085ea:	6118                	ld	a4,0(a0)
ffffffffc02085ec:	6795                	lui	a5,0x5
ffffffffc02085ee:	c701                	beqz	a4,ffffffffc02085f6 <dev_gettype+0x1a>
ffffffffc02085f0:	c19c                	sw	a5,0(a1)
ffffffffc02085f2:	4501                	li	a0,0
ffffffffc02085f4:	8082                	ret
ffffffffc02085f6:	6791                	lui	a5,0x4
ffffffffc02085f8:	c19c                	sw	a5,0(a1)
ffffffffc02085fa:	4501                	li	a0,0
ffffffffc02085fc:	8082                	ret
ffffffffc02085fe:	1141                	addi	sp,sp,-16
ffffffffc0208600:	00006697          	auipc	a3,0x6
ffffffffc0208604:	fc068693          	addi	a3,a3,-64 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208608:	00003617          	auipc	a2,0x3
ffffffffc020860c:	31860613          	addi	a2,a2,792 # ffffffffc020b920 <commands+0x210>
ffffffffc0208610:	05300593          	li	a1,83
ffffffffc0208614:	00006517          	auipc	a0,0x6
ffffffffc0208618:	2bc50513          	addi	a0,a0,700 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc020861c:	e406                	sd	ra,8(sp)
ffffffffc020861e:	e81f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208622 <dev_write>:
ffffffffc0208622:	c911                	beqz	a0,ffffffffc0208636 <dev_write+0x14>
ffffffffc0208624:	4d34                	lw	a3,88(a0)
ffffffffc0208626:	6705                	lui	a4,0x1
ffffffffc0208628:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020862c:	00e69563          	bne	a3,a4,ffffffffc0208636 <dev_write+0x14>
ffffffffc0208630:	711c                	ld	a5,32(a0)
ffffffffc0208632:	4605                	li	a2,1
ffffffffc0208634:	8782                	jr	a5
ffffffffc0208636:	1141                	addi	sp,sp,-16
ffffffffc0208638:	00006697          	auipc	a3,0x6
ffffffffc020863c:	f8868693          	addi	a3,a3,-120 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208640:	00003617          	auipc	a2,0x3
ffffffffc0208644:	2e060613          	addi	a2,a2,736 # ffffffffc020b920 <commands+0x210>
ffffffffc0208648:	02c00593          	li	a1,44
ffffffffc020864c:	00006517          	auipc	a0,0x6
ffffffffc0208650:	28450513          	addi	a0,a0,644 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc0208654:	e406                	sd	ra,8(sp)
ffffffffc0208656:	e49f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020865a <dev_read>:
ffffffffc020865a:	c911                	beqz	a0,ffffffffc020866e <dev_read+0x14>
ffffffffc020865c:	4d34                	lw	a3,88(a0)
ffffffffc020865e:	6705                	lui	a4,0x1
ffffffffc0208660:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208664:	00e69563          	bne	a3,a4,ffffffffc020866e <dev_read+0x14>
ffffffffc0208668:	711c                	ld	a5,32(a0)
ffffffffc020866a:	4601                	li	a2,0
ffffffffc020866c:	8782                	jr	a5
ffffffffc020866e:	1141                	addi	sp,sp,-16
ffffffffc0208670:	00006697          	auipc	a3,0x6
ffffffffc0208674:	f5068693          	addi	a3,a3,-176 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208678:	00003617          	auipc	a2,0x3
ffffffffc020867c:	2a860613          	addi	a2,a2,680 # ffffffffc020b920 <commands+0x210>
ffffffffc0208680:	02300593          	li	a1,35
ffffffffc0208684:	00006517          	auipc	a0,0x6
ffffffffc0208688:	24c50513          	addi	a0,a0,588 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc020868c:	e406                	sd	ra,8(sp)
ffffffffc020868e:	e11f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208692 <dev_close>:
ffffffffc0208692:	c909                	beqz	a0,ffffffffc02086a4 <dev_close+0x12>
ffffffffc0208694:	4d34                	lw	a3,88(a0)
ffffffffc0208696:	6705                	lui	a4,0x1
ffffffffc0208698:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020869c:	00e69463          	bne	a3,a4,ffffffffc02086a4 <dev_close+0x12>
ffffffffc02086a0:	6d1c                	ld	a5,24(a0)
ffffffffc02086a2:	8782                	jr	a5
ffffffffc02086a4:	1141                	addi	sp,sp,-16
ffffffffc02086a6:	00006697          	auipc	a3,0x6
ffffffffc02086aa:	f1a68693          	addi	a3,a3,-230 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc02086ae:	00003617          	auipc	a2,0x3
ffffffffc02086b2:	27260613          	addi	a2,a2,626 # ffffffffc020b920 <commands+0x210>
ffffffffc02086b6:	45e9                	li	a1,26
ffffffffc02086b8:	00006517          	auipc	a0,0x6
ffffffffc02086bc:	21850513          	addi	a0,a0,536 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc02086c0:	e406                	sd	ra,8(sp)
ffffffffc02086c2:	dddf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086c6 <dev_open>:
ffffffffc02086c6:	03c5f713          	andi	a4,a1,60
ffffffffc02086ca:	eb11                	bnez	a4,ffffffffc02086de <dev_open+0x18>
ffffffffc02086cc:	c919                	beqz	a0,ffffffffc02086e2 <dev_open+0x1c>
ffffffffc02086ce:	4d34                	lw	a3,88(a0)
ffffffffc02086d0:	6705                	lui	a4,0x1
ffffffffc02086d2:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086d6:	00e69663          	bne	a3,a4,ffffffffc02086e2 <dev_open+0x1c>
ffffffffc02086da:	691c                	ld	a5,16(a0)
ffffffffc02086dc:	8782                	jr	a5
ffffffffc02086de:	5575                	li	a0,-3
ffffffffc02086e0:	8082                	ret
ffffffffc02086e2:	1141                	addi	sp,sp,-16
ffffffffc02086e4:	00006697          	auipc	a3,0x6
ffffffffc02086e8:	edc68693          	addi	a3,a3,-292 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc02086ec:	00003617          	auipc	a2,0x3
ffffffffc02086f0:	23460613          	addi	a2,a2,564 # ffffffffc020b920 <commands+0x210>
ffffffffc02086f4:	45c5                	li	a1,17
ffffffffc02086f6:	00006517          	auipc	a0,0x6
ffffffffc02086fa:	1da50513          	addi	a0,a0,474 # ffffffffc020e8d0 <syscalls+0xe20>
ffffffffc02086fe:	e406                	sd	ra,8(sp)
ffffffffc0208700:	d9ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208704 <dev_init>:
ffffffffc0208704:	1141                	addi	sp,sp,-16
ffffffffc0208706:	e406                	sd	ra,8(sp)
ffffffffc0208708:	542000ef          	jal	ra,ffffffffc0208c4a <dev_init_stdin>
ffffffffc020870c:	65a000ef          	jal	ra,ffffffffc0208d66 <dev_init_stdout>
ffffffffc0208710:	60a2                	ld	ra,8(sp)
ffffffffc0208712:	0141                	addi	sp,sp,16
ffffffffc0208714:	a439                	j	ffffffffc0208922 <dev_init_disk0>

ffffffffc0208716 <dev_create_inode>:
ffffffffc0208716:	6505                	lui	a0,0x1
ffffffffc0208718:	1141                	addi	sp,sp,-16
ffffffffc020871a:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020871e:	e022                	sd	s0,0(sp)
ffffffffc0208720:	e406                	sd	ra,8(sp)
ffffffffc0208722:	852ff0ef          	jal	ra,ffffffffc0207774 <__alloc_inode>
ffffffffc0208726:	842a                	mv	s0,a0
ffffffffc0208728:	c901                	beqz	a0,ffffffffc0208738 <dev_create_inode+0x22>
ffffffffc020872a:	4601                	li	a2,0
ffffffffc020872c:	00006597          	auipc	a1,0x6
ffffffffc0208730:	1bc58593          	addi	a1,a1,444 # ffffffffc020e8e8 <dev_node_ops>
ffffffffc0208734:	85cff0ef          	jal	ra,ffffffffc0207790 <inode_init>
ffffffffc0208738:	60a2                	ld	ra,8(sp)
ffffffffc020873a:	8522                	mv	a0,s0
ffffffffc020873c:	6402                	ld	s0,0(sp)
ffffffffc020873e:	0141                	addi	sp,sp,16
ffffffffc0208740:	8082                	ret

ffffffffc0208742 <disk0_open>:
ffffffffc0208742:	4501                	li	a0,0
ffffffffc0208744:	8082                	ret

ffffffffc0208746 <disk0_close>:
ffffffffc0208746:	4501                	li	a0,0
ffffffffc0208748:	8082                	ret

ffffffffc020874a <disk0_ioctl>:
ffffffffc020874a:	5531                	li	a0,-20
ffffffffc020874c:	8082                	ret

ffffffffc020874e <disk0_io>:
ffffffffc020874e:	659c                	ld	a5,8(a1)
ffffffffc0208750:	7159                	addi	sp,sp,-112
ffffffffc0208752:	eca6                	sd	s1,88(sp)
ffffffffc0208754:	f45e                	sd	s7,40(sp)
ffffffffc0208756:	6d84                	ld	s1,24(a1)
ffffffffc0208758:	6b85                	lui	s7,0x1
ffffffffc020875a:	1bfd                	addi	s7,s7,-1
ffffffffc020875c:	e4ce                	sd	s3,72(sp)
ffffffffc020875e:	43f7d993          	srai	s3,a5,0x3f
ffffffffc0208762:	0179f9b3          	and	s3,s3,s7
ffffffffc0208766:	99be                	add	s3,s3,a5
ffffffffc0208768:	8fc5                	or	a5,a5,s1
ffffffffc020876a:	f486                	sd	ra,104(sp)
ffffffffc020876c:	f0a2                	sd	s0,96(sp)
ffffffffc020876e:	e8ca                	sd	s2,80(sp)
ffffffffc0208770:	e0d2                	sd	s4,64(sp)
ffffffffc0208772:	fc56                	sd	s5,56(sp)
ffffffffc0208774:	f85a                	sd	s6,48(sp)
ffffffffc0208776:	f062                	sd	s8,32(sp)
ffffffffc0208778:	ec66                	sd	s9,24(sp)
ffffffffc020877a:	e86a                	sd	s10,16(sp)
ffffffffc020877c:	0177f7b3          	and	a5,a5,s7
ffffffffc0208780:	10079d63          	bnez	a5,ffffffffc020889a <disk0_io+0x14c>
ffffffffc0208784:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208788:	00c4d713          	srli	a4,s1,0xc
ffffffffc020878c:	2981                	sext.w	s3,s3
ffffffffc020878e:	2701                	sext.w	a4,a4
ffffffffc0208790:	00e987bb          	addw	a5,s3,a4
ffffffffc0208794:	6114                	ld	a3,0(a0)
ffffffffc0208796:	1782                	slli	a5,a5,0x20
ffffffffc0208798:	9381                	srli	a5,a5,0x20
ffffffffc020879a:	10f6e063          	bltu	a3,a5,ffffffffc020889a <disk0_io+0x14c>
ffffffffc020879e:	4501                	li	a0,0
ffffffffc02087a0:	ef19                	bnez	a4,ffffffffc02087be <disk0_io+0x70>
ffffffffc02087a2:	70a6                	ld	ra,104(sp)
ffffffffc02087a4:	7406                	ld	s0,96(sp)
ffffffffc02087a6:	64e6                	ld	s1,88(sp)
ffffffffc02087a8:	6946                	ld	s2,80(sp)
ffffffffc02087aa:	69a6                	ld	s3,72(sp)
ffffffffc02087ac:	6a06                	ld	s4,64(sp)
ffffffffc02087ae:	7ae2                	ld	s5,56(sp)
ffffffffc02087b0:	7b42                	ld	s6,48(sp)
ffffffffc02087b2:	7ba2                	ld	s7,40(sp)
ffffffffc02087b4:	7c02                	ld	s8,32(sp)
ffffffffc02087b6:	6ce2                	ld	s9,24(sp)
ffffffffc02087b8:	6d42                	ld	s10,16(sp)
ffffffffc02087ba:	6165                	addi	sp,sp,112
ffffffffc02087bc:	8082                	ret
ffffffffc02087be:	0008d517          	auipc	a0,0x8d
ffffffffc02087c2:	08250513          	addi	a0,a0,130 # ffffffffc0295840 <disk0_sem>
ffffffffc02087c6:	8b2e                	mv	s6,a1
ffffffffc02087c8:	8c32                	mv	s8,a2
ffffffffc02087ca:	0008ea97          	auipc	s5,0x8e
ffffffffc02087ce:	12ea8a93          	addi	s5,s5,302 # ffffffffc02968f8 <disk0_buffer>
ffffffffc02087d2:	d93fb0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02087d6:	6c91                	lui	s9,0x4
ffffffffc02087d8:	e4b9                	bnez	s1,ffffffffc0208826 <disk0_io+0xd8>
ffffffffc02087da:	a845                	j	ffffffffc020888a <disk0_io+0x13c>
ffffffffc02087dc:	00c4d413          	srli	s0,s1,0xc
ffffffffc02087e0:	0034169b          	slliw	a3,s0,0x3
ffffffffc02087e4:	00068d1b          	sext.w	s10,a3
ffffffffc02087e8:	1682                	slli	a3,a3,0x20
ffffffffc02087ea:	2401                	sext.w	s0,s0
ffffffffc02087ec:	9281                	srli	a3,a3,0x20
ffffffffc02087ee:	8926                	mv	s2,s1
ffffffffc02087f0:	00399a1b          	slliw	s4,s3,0x3
ffffffffc02087f4:	862e                	mv	a2,a1
ffffffffc02087f6:	4509                	li	a0,2
ffffffffc02087f8:	85d2                	mv	a1,s4
ffffffffc02087fa:	b46f80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc02087fe:	e165                	bnez	a0,ffffffffc02088de <disk0_io+0x190>
ffffffffc0208800:	000ab583          	ld	a1,0(s5)
ffffffffc0208804:	0038                	addi	a4,sp,8
ffffffffc0208806:	4685                	li	a3,1
ffffffffc0208808:	864a                	mv	a2,s2
ffffffffc020880a:	855a                	mv	a0,s6
ffffffffc020880c:	be1fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208810:	67a2                	ld	a5,8(sp)
ffffffffc0208812:	09279663          	bne	a5,s2,ffffffffc020889e <disk0_io+0x150>
ffffffffc0208816:	017977b3          	and	a5,s2,s7
ffffffffc020881a:	e3d1                	bnez	a5,ffffffffc020889e <disk0_io+0x150>
ffffffffc020881c:	412484b3          	sub	s1,s1,s2
ffffffffc0208820:	013409bb          	addw	s3,s0,s3
ffffffffc0208824:	c0bd                	beqz	s1,ffffffffc020888a <disk0_io+0x13c>
ffffffffc0208826:	000ab583          	ld	a1,0(s5)
ffffffffc020882a:	000c1b63          	bnez	s8,ffffffffc0208840 <disk0_io+0xf2>
ffffffffc020882e:	fb94e7e3          	bltu	s1,s9,ffffffffc02087dc <disk0_io+0x8e>
ffffffffc0208832:	02000693          	li	a3,32
ffffffffc0208836:	02000d13          	li	s10,32
ffffffffc020883a:	4411                	li	s0,4
ffffffffc020883c:	6911                	lui	s2,0x4
ffffffffc020883e:	bf4d                	j	ffffffffc02087f0 <disk0_io+0xa2>
ffffffffc0208840:	0038                	addi	a4,sp,8
ffffffffc0208842:	4681                	li	a3,0
ffffffffc0208844:	6611                	lui	a2,0x4
ffffffffc0208846:	855a                	mv	a0,s6
ffffffffc0208848:	ba5fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020884c:	6422                	ld	s0,8(sp)
ffffffffc020884e:	c825                	beqz	s0,ffffffffc02088be <disk0_io+0x170>
ffffffffc0208850:	0684e763          	bltu	s1,s0,ffffffffc02088be <disk0_io+0x170>
ffffffffc0208854:	017477b3          	and	a5,s0,s7
ffffffffc0208858:	e3bd                	bnez	a5,ffffffffc02088be <disk0_io+0x170>
ffffffffc020885a:	8031                	srli	s0,s0,0xc
ffffffffc020885c:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208860:	000ab603          	ld	a2,0(s5)
ffffffffc0208864:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208868:	02079693          	slli	a3,a5,0x20
ffffffffc020886c:	9281                	srli	a3,a3,0x20
ffffffffc020886e:	85ca                	mv	a1,s2
ffffffffc0208870:	4509                	li	a0,2
ffffffffc0208872:	2401                	sext.w	s0,s0
ffffffffc0208874:	00078a1b          	sext.w	s4,a5
ffffffffc0208878:	b5ef80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc020887c:	e151                	bnez	a0,ffffffffc0208900 <disk0_io+0x1b2>
ffffffffc020887e:	6922                	ld	s2,8(sp)
ffffffffc0208880:	013409bb          	addw	s3,s0,s3
ffffffffc0208884:	412484b3          	sub	s1,s1,s2
ffffffffc0208888:	fcd9                	bnez	s1,ffffffffc0208826 <disk0_io+0xd8>
ffffffffc020888a:	0008d517          	auipc	a0,0x8d
ffffffffc020888e:	fb650513          	addi	a0,a0,-74 # ffffffffc0295840 <disk0_sem>
ffffffffc0208892:	ccffb0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0208896:	4501                	li	a0,0
ffffffffc0208898:	b729                	j	ffffffffc02087a2 <disk0_io+0x54>
ffffffffc020889a:	5575                	li	a0,-3
ffffffffc020889c:	b719                	j	ffffffffc02087a2 <disk0_io+0x54>
ffffffffc020889e:	00006697          	auipc	a3,0x6
ffffffffc02088a2:	1c268693          	addi	a3,a3,450 # ffffffffc020ea60 <dev_node_ops+0x178>
ffffffffc02088a6:	00003617          	auipc	a2,0x3
ffffffffc02088aa:	07a60613          	addi	a2,a2,122 # ffffffffc020b920 <commands+0x210>
ffffffffc02088ae:	06200593          	li	a1,98
ffffffffc02088b2:	00006517          	auipc	a0,0x6
ffffffffc02088b6:	0f650513          	addi	a0,a0,246 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02088ba:	be5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088be:	00006697          	auipc	a3,0x6
ffffffffc02088c2:	0aa68693          	addi	a3,a3,170 # ffffffffc020e968 <dev_node_ops+0x80>
ffffffffc02088c6:	00003617          	auipc	a2,0x3
ffffffffc02088ca:	05a60613          	addi	a2,a2,90 # ffffffffc020b920 <commands+0x210>
ffffffffc02088ce:	05700593          	li	a1,87
ffffffffc02088d2:	00006517          	auipc	a0,0x6
ffffffffc02088d6:	0d650513          	addi	a0,a0,214 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02088da:	bc5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088de:	88aa                	mv	a7,a0
ffffffffc02088e0:	886a                	mv	a6,s10
ffffffffc02088e2:	87a2                	mv	a5,s0
ffffffffc02088e4:	8752                	mv	a4,s4
ffffffffc02088e6:	86ce                	mv	a3,s3
ffffffffc02088e8:	00006617          	auipc	a2,0x6
ffffffffc02088ec:	13060613          	addi	a2,a2,304 # ffffffffc020ea18 <dev_node_ops+0x130>
ffffffffc02088f0:	02d00593          	li	a1,45
ffffffffc02088f4:	00006517          	auipc	a0,0x6
ffffffffc02088f8:	0b450513          	addi	a0,a0,180 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02088fc:	ba3f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208900:	88aa                	mv	a7,a0
ffffffffc0208902:	8852                	mv	a6,s4
ffffffffc0208904:	87a2                	mv	a5,s0
ffffffffc0208906:	874a                	mv	a4,s2
ffffffffc0208908:	86ce                	mv	a3,s3
ffffffffc020890a:	00006617          	auipc	a2,0x6
ffffffffc020890e:	0be60613          	addi	a2,a2,190 # ffffffffc020e9c8 <dev_node_ops+0xe0>
ffffffffc0208912:	03700593          	li	a1,55
ffffffffc0208916:	00006517          	auipc	a0,0x6
ffffffffc020891a:	09250513          	addi	a0,a0,146 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc020891e:	b81f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208922 <dev_init_disk0>:
ffffffffc0208922:	1101                	addi	sp,sp,-32
ffffffffc0208924:	ec06                	sd	ra,24(sp)
ffffffffc0208926:	e822                	sd	s0,16(sp)
ffffffffc0208928:	e426                	sd	s1,8(sp)
ffffffffc020892a:	dedff0ef          	jal	ra,ffffffffc0208716 <dev_create_inode>
ffffffffc020892e:	c541                	beqz	a0,ffffffffc02089b6 <dev_init_disk0+0x94>
ffffffffc0208930:	4d38                	lw	a4,88(a0)
ffffffffc0208932:	6485                	lui	s1,0x1
ffffffffc0208934:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208938:	842a                	mv	s0,a0
ffffffffc020893a:	0cf71f63          	bne	a4,a5,ffffffffc0208a18 <dev_init_disk0+0xf6>
ffffffffc020893e:	4509                	li	a0,2
ffffffffc0208940:	9b4f80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0208944:	cd55                	beqz	a0,ffffffffc0208a00 <dev_init_disk0+0xde>
ffffffffc0208946:	4509                	li	a0,2
ffffffffc0208948:	9d0f80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc020894c:	00355793          	srli	a5,a0,0x3
ffffffffc0208950:	e01c                	sd	a5,0(s0)
ffffffffc0208952:	00000797          	auipc	a5,0x0
ffffffffc0208956:	df078793          	addi	a5,a5,-528 # ffffffffc0208742 <disk0_open>
ffffffffc020895a:	e81c                	sd	a5,16(s0)
ffffffffc020895c:	00000797          	auipc	a5,0x0
ffffffffc0208960:	dea78793          	addi	a5,a5,-534 # ffffffffc0208746 <disk0_close>
ffffffffc0208964:	ec1c                	sd	a5,24(s0)
ffffffffc0208966:	00000797          	auipc	a5,0x0
ffffffffc020896a:	de878793          	addi	a5,a5,-536 # ffffffffc020874e <disk0_io>
ffffffffc020896e:	f01c                	sd	a5,32(s0)
ffffffffc0208970:	00000797          	auipc	a5,0x0
ffffffffc0208974:	dda78793          	addi	a5,a5,-550 # ffffffffc020874a <disk0_ioctl>
ffffffffc0208978:	f41c                	sd	a5,40(s0)
ffffffffc020897a:	4585                	li	a1,1
ffffffffc020897c:	0008d517          	auipc	a0,0x8d
ffffffffc0208980:	ec450513          	addi	a0,a0,-316 # ffffffffc0295840 <disk0_sem>
ffffffffc0208984:	e404                	sd	s1,8(s0)
ffffffffc0208986:	bd5fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020898a:	6511                	lui	a0,0x4
ffffffffc020898c:	e02f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208990:	0008e797          	auipc	a5,0x8e
ffffffffc0208994:	f6a7b423          	sd	a0,-152(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208998:	c921                	beqz	a0,ffffffffc02089e8 <dev_init_disk0+0xc6>
ffffffffc020899a:	4605                	li	a2,1
ffffffffc020899c:	85a2                	mv	a1,s0
ffffffffc020899e:	00006517          	auipc	a0,0x6
ffffffffc02089a2:	15250513          	addi	a0,a0,338 # ffffffffc020eaf0 <dev_node_ops+0x208>
ffffffffc02089a6:	c2cff0ef          	jal	ra,ffffffffc0207dd2 <vfs_add_dev>
ffffffffc02089aa:	e115                	bnez	a0,ffffffffc02089ce <dev_init_disk0+0xac>
ffffffffc02089ac:	60e2                	ld	ra,24(sp)
ffffffffc02089ae:	6442                	ld	s0,16(sp)
ffffffffc02089b0:	64a2                	ld	s1,8(sp)
ffffffffc02089b2:	6105                	addi	sp,sp,32
ffffffffc02089b4:	8082                	ret
ffffffffc02089b6:	00006617          	auipc	a2,0x6
ffffffffc02089ba:	0da60613          	addi	a2,a2,218 # ffffffffc020ea90 <dev_node_ops+0x1a8>
ffffffffc02089be:	08700593          	li	a1,135
ffffffffc02089c2:	00006517          	auipc	a0,0x6
ffffffffc02089c6:	fe650513          	addi	a0,a0,-26 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02089ca:	ad5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089ce:	86aa                	mv	a3,a0
ffffffffc02089d0:	00006617          	auipc	a2,0x6
ffffffffc02089d4:	12860613          	addi	a2,a2,296 # ffffffffc020eaf8 <dev_node_ops+0x210>
ffffffffc02089d8:	08d00593          	li	a1,141
ffffffffc02089dc:	00006517          	auipc	a0,0x6
ffffffffc02089e0:	fcc50513          	addi	a0,a0,-52 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02089e4:	abbf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089e8:	00006617          	auipc	a2,0x6
ffffffffc02089ec:	0e860613          	addi	a2,a2,232 # ffffffffc020ead0 <dev_node_ops+0x1e8>
ffffffffc02089f0:	07f00593          	li	a1,127
ffffffffc02089f4:	00006517          	auipc	a0,0x6
ffffffffc02089f8:	fb450513          	addi	a0,a0,-76 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc02089fc:	aa3f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a00:	00006617          	auipc	a2,0x6
ffffffffc0208a04:	0b060613          	addi	a2,a2,176 # ffffffffc020eab0 <dev_node_ops+0x1c8>
ffffffffc0208a08:	07300593          	li	a1,115
ffffffffc0208a0c:	00006517          	auipc	a0,0x6
ffffffffc0208a10:	f9c50513          	addi	a0,a0,-100 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc0208a14:	a8bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a18:	00006697          	auipc	a3,0x6
ffffffffc0208a1c:	ba868693          	addi	a3,a3,-1112 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208a20:	00003617          	auipc	a2,0x3
ffffffffc0208a24:	f0060613          	addi	a2,a2,-256 # ffffffffc020b920 <commands+0x210>
ffffffffc0208a28:	08900593          	li	a1,137
ffffffffc0208a2c:	00006517          	auipc	a0,0x6
ffffffffc0208a30:	f7c50513          	addi	a0,a0,-132 # ffffffffc020e9a8 <dev_node_ops+0xc0>
ffffffffc0208a34:	a6bf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a38 <stdin_open>:
ffffffffc0208a38:	4501                	li	a0,0
ffffffffc0208a3a:	e191                	bnez	a1,ffffffffc0208a3e <stdin_open+0x6>
ffffffffc0208a3c:	8082                	ret
ffffffffc0208a3e:	5575                	li	a0,-3
ffffffffc0208a40:	8082                	ret

ffffffffc0208a42 <stdin_close>:
ffffffffc0208a42:	4501                	li	a0,0
ffffffffc0208a44:	8082                	ret

ffffffffc0208a46 <stdin_ioctl>:
ffffffffc0208a46:	5575                	li	a0,-3
ffffffffc0208a48:	8082                	ret

ffffffffc0208a4a <stdin_io>:
ffffffffc0208a4a:	7135                	addi	sp,sp,-160
ffffffffc0208a4c:	ed06                	sd	ra,152(sp)
ffffffffc0208a4e:	e922                	sd	s0,144(sp)
ffffffffc0208a50:	e526                	sd	s1,136(sp)
ffffffffc0208a52:	e14a                	sd	s2,128(sp)
ffffffffc0208a54:	fcce                	sd	s3,120(sp)
ffffffffc0208a56:	f8d2                	sd	s4,112(sp)
ffffffffc0208a58:	f4d6                	sd	s5,104(sp)
ffffffffc0208a5a:	f0da                	sd	s6,96(sp)
ffffffffc0208a5c:	ecde                	sd	s7,88(sp)
ffffffffc0208a5e:	e8e2                	sd	s8,80(sp)
ffffffffc0208a60:	e4e6                	sd	s9,72(sp)
ffffffffc0208a62:	e0ea                	sd	s10,64(sp)
ffffffffc0208a64:	fc6e                	sd	s11,56(sp)
ffffffffc0208a66:	14061163          	bnez	a2,ffffffffc0208ba8 <stdin_io+0x15e>
ffffffffc0208a6a:	0005bd83          	ld	s11,0(a1)
ffffffffc0208a6e:	0185bd03          	ld	s10,24(a1)
ffffffffc0208a72:	8b2e                	mv	s6,a1
ffffffffc0208a74:	100027f3          	csrr	a5,sstatus
ffffffffc0208a78:	8b89                	andi	a5,a5,2
ffffffffc0208a7a:	10079e63          	bnez	a5,ffffffffc0208b96 <stdin_io+0x14c>
ffffffffc0208a7e:	4401                	li	s0,0
ffffffffc0208a80:	100d0963          	beqz	s10,ffffffffc0208b92 <stdin_io+0x148>
ffffffffc0208a84:	0008e997          	auipc	s3,0x8e
ffffffffc0208a88:	e7c98993          	addi	s3,s3,-388 # ffffffffc0296900 <p_rpos>
ffffffffc0208a8c:	0009b783          	ld	a5,0(s3)
ffffffffc0208a90:	800004b7          	lui	s1,0x80000
ffffffffc0208a94:	6c85                	lui	s9,0x1
ffffffffc0208a96:	4a81                	li	s5,0
ffffffffc0208a98:	0008ea17          	auipc	s4,0x8e
ffffffffc0208a9c:	e70a0a13          	addi	s4,s4,-400 # ffffffffc0296908 <p_wpos>
ffffffffc0208aa0:	0491                	addi	s1,s1,4
ffffffffc0208aa2:	0008d917          	auipc	s2,0x8d
ffffffffc0208aa6:	db690913          	addi	s2,s2,-586 # ffffffffc0295858 <__wait_queue>
ffffffffc0208aaa:	1cfd                	addi	s9,s9,-1
ffffffffc0208aac:	000a3703          	ld	a4,0(s4)
ffffffffc0208ab0:	000a8c1b          	sext.w	s8,s5
ffffffffc0208ab4:	8be2                	mv	s7,s8
ffffffffc0208ab6:	02e7d763          	bge	a5,a4,ffffffffc0208ae4 <stdin_io+0x9a>
ffffffffc0208aba:	a859                	j	ffffffffc0208b50 <stdin_io+0x106>
ffffffffc0208abc:	815fe0ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0208ac0:	100027f3          	csrr	a5,sstatus
ffffffffc0208ac4:	8b89                	andi	a5,a5,2
ffffffffc0208ac6:	4401                	li	s0,0
ffffffffc0208ac8:	ef8d                	bnez	a5,ffffffffc0208b02 <stdin_io+0xb8>
ffffffffc0208aca:	0028                	addi	a0,sp,8
ffffffffc0208acc:	b2bfb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208ad0:	e121                	bnez	a0,ffffffffc0208b10 <stdin_io+0xc6>
ffffffffc0208ad2:	47c2                	lw	a5,16(sp)
ffffffffc0208ad4:	04979563          	bne	a5,s1,ffffffffc0208b1e <stdin_io+0xd4>
ffffffffc0208ad8:	0009b783          	ld	a5,0(s3)
ffffffffc0208adc:	000a3703          	ld	a4,0(s4)
ffffffffc0208ae0:	06e7c863          	blt	a5,a4,ffffffffc0208b50 <stdin_io+0x106>
ffffffffc0208ae4:	8626                	mv	a2,s1
ffffffffc0208ae6:	002c                	addi	a1,sp,8
ffffffffc0208ae8:	854a                	mv	a0,s2
ffffffffc0208aea:	c37fb0ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc0208aee:	d479                	beqz	s0,ffffffffc0208abc <stdin_io+0x72>
ffffffffc0208af0:	97cf80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208af4:	fdcfe0ef          	jal	ra,ffffffffc02072d0 <schedule>
ffffffffc0208af8:	100027f3          	csrr	a5,sstatus
ffffffffc0208afc:	8b89                	andi	a5,a5,2
ffffffffc0208afe:	4401                	li	s0,0
ffffffffc0208b00:	d7e9                	beqz	a5,ffffffffc0208aca <stdin_io+0x80>
ffffffffc0208b02:	970f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b06:	0028                	addi	a0,sp,8
ffffffffc0208b08:	4405                	li	s0,1
ffffffffc0208b0a:	aedfb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208b0e:	d171                	beqz	a0,ffffffffc0208ad2 <stdin_io+0x88>
ffffffffc0208b10:	002c                	addi	a1,sp,8
ffffffffc0208b12:	854a                	mv	a0,s2
ffffffffc0208b14:	a89fb0ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc0208b18:	47c2                	lw	a5,16(sp)
ffffffffc0208b1a:	fa978fe3          	beq	a5,s1,ffffffffc0208ad8 <stdin_io+0x8e>
ffffffffc0208b1e:	e435                	bnez	s0,ffffffffc0208b8a <stdin_io+0x140>
ffffffffc0208b20:	060b8963          	beqz	s7,ffffffffc0208b92 <stdin_io+0x148>
ffffffffc0208b24:	018b3783          	ld	a5,24(s6)
ffffffffc0208b28:	41578ab3          	sub	s5,a5,s5
ffffffffc0208b2c:	015b3c23          	sd	s5,24(s6)
ffffffffc0208b30:	60ea                	ld	ra,152(sp)
ffffffffc0208b32:	644a                	ld	s0,144(sp)
ffffffffc0208b34:	64aa                	ld	s1,136(sp)
ffffffffc0208b36:	690a                	ld	s2,128(sp)
ffffffffc0208b38:	79e6                	ld	s3,120(sp)
ffffffffc0208b3a:	7a46                	ld	s4,112(sp)
ffffffffc0208b3c:	7aa6                	ld	s5,104(sp)
ffffffffc0208b3e:	7b06                	ld	s6,96(sp)
ffffffffc0208b40:	6c46                	ld	s8,80(sp)
ffffffffc0208b42:	6ca6                	ld	s9,72(sp)
ffffffffc0208b44:	6d06                	ld	s10,64(sp)
ffffffffc0208b46:	7de2                	ld	s11,56(sp)
ffffffffc0208b48:	855e                	mv	a0,s7
ffffffffc0208b4a:	6be6                	ld	s7,88(sp)
ffffffffc0208b4c:	610d                	addi	sp,sp,160
ffffffffc0208b4e:	8082                	ret
ffffffffc0208b50:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208b54:	03475693          	srli	a3,a4,0x34
ffffffffc0208b58:	00d78733          	add	a4,a5,a3
ffffffffc0208b5c:	01977733          	and	a4,a4,s9
ffffffffc0208b60:	8f15                	sub	a4,a4,a3
ffffffffc0208b62:	0008d697          	auipc	a3,0x8d
ffffffffc0208b66:	d0668693          	addi	a3,a3,-762 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208b6a:	9736                	add	a4,a4,a3
ffffffffc0208b6c:	00074683          	lbu	a3,0(a4)
ffffffffc0208b70:	0785                	addi	a5,a5,1
ffffffffc0208b72:	015d8733          	add	a4,s11,s5
ffffffffc0208b76:	00d70023          	sb	a3,0(a4)
ffffffffc0208b7a:	00f9b023          	sd	a5,0(s3)
ffffffffc0208b7e:	0a85                	addi	s5,s5,1
ffffffffc0208b80:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208b84:	f3aae4e3          	bltu	s5,s10,ffffffffc0208aac <stdin_io+0x62>
ffffffffc0208b88:	dc51                	beqz	s0,ffffffffc0208b24 <stdin_io+0xda>
ffffffffc0208b8a:	8e2f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b8e:	f80b9be3          	bnez	s7,ffffffffc0208b24 <stdin_io+0xda>
ffffffffc0208b92:	4b81                	li	s7,0
ffffffffc0208b94:	bf71                	j	ffffffffc0208b30 <stdin_io+0xe6>
ffffffffc0208b96:	8dcf80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b9a:	4405                	li	s0,1
ffffffffc0208b9c:	ee0d14e3          	bnez	s10,ffffffffc0208a84 <stdin_io+0x3a>
ffffffffc0208ba0:	8ccf80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208ba4:	4b81                	li	s7,0
ffffffffc0208ba6:	b769                	j	ffffffffc0208b30 <stdin_io+0xe6>
ffffffffc0208ba8:	5bf5                	li	s7,-3
ffffffffc0208baa:	b759                	j	ffffffffc0208b30 <stdin_io+0xe6>

ffffffffc0208bac <dev_stdin_write>:
ffffffffc0208bac:	e111                	bnez	a0,ffffffffc0208bb0 <dev_stdin_write+0x4>
ffffffffc0208bae:	8082                	ret
ffffffffc0208bb0:	1101                	addi	sp,sp,-32
ffffffffc0208bb2:	e822                	sd	s0,16(sp)
ffffffffc0208bb4:	ec06                	sd	ra,24(sp)
ffffffffc0208bb6:	e426                	sd	s1,8(sp)
ffffffffc0208bb8:	842a                	mv	s0,a0
ffffffffc0208bba:	100027f3          	csrr	a5,sstatus
ffffffffc0208bbe:	8b89                	andi	a5,a5,2
ffffffffc0208bc0:	4481                	li	s1,0
ffffffffc0208bc2:	e3c1                	bnez	a5,ffffffffc0208c42 <dev_stdin_write+0x96>
ffffffffc0208bc4:	0008e597          	auipc	a1,0x8e
ffffffffc0208bc8:	d4458593          	addi	a1,a1,-700 # ffffffffc0296908 <p_wpos>
ffffffffc0208bcc:	6198                	ld	a4,0(a1)
ffffffffc0208bce:	6605                	lui	a2,0x1
ffffffffc0208bd0:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208bd4:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208bd8:	92d1                	srli	a3,a3,0x34
ffffffffc0208bda:	00d707b3          	add	a5,a4,a3
ffffffffc0208bde:	8fe9                	and	a5,a5,a0
ffffffffc0208be0:	8f95                	sub	a5,a5,a3
ffffffffc0208be2:	0008d697          	auipc	a3,0x8d
ffffffffc0208be6:	c8668693          	addi	a3,a3,-890 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208bea:	97b6                	add	a5,a5,a3
ffffffffc0208bec:	00878023          	sb	s0,0(a5)
ffffffffc0208bf0:	0008e797          	auipc	a5,0x8e
ffffffffc0208bf4:	d107b783          	ld	a5,-752(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208bf8:	40f707b3          	sub	a5,a4,a5
ffffffffc0208bfc:	00c7d463          	bge	a5,a2,ffffffffc0208c04 <dev_stdin_write+0x58>
ffffffffc0208c00:	0705                	addi	a4,a4,1
ffffffffc0208c02:	e198                	sd	a4,0(a1)
ffffffffc0208c04:	0008d517          	auipc	a0,0x8d
ffffffffc0208c08:	c5450513          	addi	a0,a0,-940 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c0c:	9dffb0ef          	jal	ra,ffffffffc02045ea <wait_queue_empty>
ffffffffc0208c10:	cd09                	beqz	a0,ffffffffc0208c2a <dev_stdin_write+0x7e>
ffffffffc0208c12:	e491                	bnez	s1,ffffffffc0208c1e <dev_stdin_write+0x72>
ffffffffc0208c14:	60e2                	ld	ra,24(sp)
ffffffffc0208c16:	6442                	ld	s0,16(sp)
ffffffffc0208c18:	64a2                	ld	s1,8(sp)
ffffffffc0208c1a:	6105                	addi	sp,sp,32
ffffffffc0208c1c:	8082                	ret
ffffffffc0208c1e:	6442                	ld	s0,16(sp)
ffffffffc0208c20:	60e2                	ld	ra,24(sp)
ffffffffc0208c22:	64a2                	ld	s1,8(sp)
ffffffffc0208c24:	6105                	addi	sp,sp,32
ffffffffc0208c26:	846f806f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208c2a:	800005b7          	lui	a1,0x80000
ffffffffc0208c2e:	4605                	li	a2,1
ffffffffc0208c30:	0591                	addi	a1,a1,4
ffffffffc0208c32:	0008d517          	auipc	a0,0x8d
ffffffffc0208c36:	c2650513          	addi	a0,a0,-986 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c3a:	a19fb0ef          	jal	ra,ffffffffc0204652 <wakeup_queue>
ffffffffc0208c3e:	d8f9                	beqz	s1,ffffffffc0208c14 <dev_stdin_write+0x68>
ffffffffc0208c40:	bff9                	j	ffffffffc0208c1e <dev_stdin_write+0x72>
ffffffffc0208c42:	830f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208c46:	4485                	li	s1,1
ffffffffc0208c48:	bfb5                	j	ffffffffc0208bc4 <dev_stdin_write+0x18>

ffffffffc0208c4a <dev_init_stdin>:
ffffffffc0208c4a:	1141                	addi	sp,sp,-16
ffffffffc0208c4c:	e406                	sd	ra,8(sp)
ffffffffc0208c4e:	e022                	sd	s0,0(sp)
ffffffffc0208c50:	ac7ff0ef          	jal	ra,ffffffffc0208716 <dev_create_inode>
ffffffffc0208c54:	c93d                	beqz	a0,ffffffffc0208cca <dev_init_stdin+0x80>
ffffffffc0208c56:	4d38                	lw	a4,88(a0)
ffffffffc0208c58:	6785                	lui	a5,0x1
ffffffffc0208c5a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c5e:	842a                	mv	s0,a0
ffffffffc0208c60:	08f71e63          	bne	a4,a5,ffffffffc0208cfc <dev_init_stdin+0xb2>
ffffffffc0208c64:	4785                	li	a5,1
ffffffffc0208c66:	e41c                	sd	a5,8(s0)
ffffffffc0208c68:	00000797          	auipc	a5,0x0
ffffffffc0208c6c:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a38 <stdin_open>
ffffffffc0208c70:	e81c                	sd	a5,16(s0)
ffffffffc0208c72:	00000797          	auipc	a5,0x0
ffffffffc0208c76:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a42 <stdin_close>
ffffffffc0208c7a:	ec1c                	sd	a5,24(s0)
ffffffffc0208c7c:	00000797          	auipc	a5,0x0
ffffffffc0208c80:	dce78793          	addi	a5,a5,-562 # ffffffffc0208a4a <stdin_io>
ffffffffc0208c84:	f01c                	sd	a5,32(s0)
ffffffffc0208c86:	00000797          	auipc	a5,0x0
ffffffffc0208c8a:	dc078793          	addi	a5,a5,-576 # ffffffffc0208a46 <stdin_ioctl>
ffffffffc0208c8e:	f41c                	sd	a5,40(s0)
ffffffffc0208c90:	0008d517          	auipc	a0,0x8d
ffffffffc0208c94:	bc850513          	addi	a0,a0,-1080 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c98:	00043023          	sd	zero,0(s0)
ffffffffc0208c9c:	0008e797          	auipc	a5,0x8e
ffffffffc0208ca0:	c607b623          	sd	zero,-916(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208ca4:	0008e797          	auipc	a5,0x8e
ffffffffc0208ca8:	c407be23          	sd	zero,-932(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208cac:	8ebfb0ef          	jal	ra,ffffffffc0204596 <wait_queue_init>
ffffffffc0208cb0:	4601                	li	a2,0
ffffffffc0208cb2:	85a2                	mv	a1,s0
ffffffffc0208cb4:	00006517          	auipc	a0,0x6
ffffffffc0208cb8:	ea450513          	addi	a0,a0,-348 # ffffffffc020eb58 <dev_node_ops+0x270>
ffffffffc0208cbc:	916ff0ef          	jal	ra,ffffffffc0207dd2 <vfs_add_dev>
ffffffffc0208cc0:	e10d                	bnez	a0,ffffffffc0208ce2 <dev_init_stdin+0x98>
ffffffffc0208cc2:	60a2                	ld	ra,8(sp)
ffffffffc0208cc4:	6402                	ld	s0,0(sp)
ffffffffc0208cc6:	0141                	addi	sp,sp,16
ffffffffc0208cc8:	8082                	ret
ffffffffc0208cca:	00006617          	auipc	a2,0x6
ffffffffc0208cce:	e4e60613          	addi	a2,a2,-434 # ffffffffc020eb18 <dev_node_ops+0x230>
ffffffffc0208cd2:	07500593          	li	a1,117
ffffffffc0208cd6:	00006517          	auipc	a0,0x6
ffffffffc0208cda:	e6250513          	addi	a0,a0,-414 # ffffffffc020eb38 <dev_node_ops+0x250>
ffffffffc0208cde:	fc0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208ce2:	86aa                	mv	a3,a0
ffffffffc0208ce4:	00006617          	auipc	a2,0x6
ffffffffc0208ce8:	e7c60613          	addi	a2,a2,-388 # ffffffffc020eb60 <dev_node_ops+0x278>
ffffffffc0208cec:	07b00593          	li	a1,123
ffffffffc0208cf0:	00006517          	auipc	a0,0x6
ffffffffc0208cf4:	e4850513          	addi	a0,a0,-440 # ffffffffc020eb38 <dev_node_ops+0x250>
ffffffffc0208cf8:	fa6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cfc:	00006697          	auipc	a3,0x6
ffffffffc0208d00:	8c468693          	addi	a3,a3,-1852 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208d04:	00003617          	auipc	a2,0x3
ffffffffc0208d08:	c1c60613          	addi	a2,a2,-996 # ffffffffc020b920 <commands+0x210>
ffffffffc0208d0c:	07700593          	li	a1,119
ffffffffc0208d10:	00006517          	auipc	a0,0x6
ffffffffc0208d14:	e2850513          	addi	a0,a0,-472 # ffffffffc020eb38 <dev_node_ops+0x250>
ffffffffc0208d18:	f86f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d1c <stdout_open>:
ffffffffc0208d1c:	4785                	li	a5,1
ffffffffc0208d1e:	4501                	li	a0,0
ffffffffc0208d20:	00f59363          	bne	a1,a5,ffffffffc0208d26 <stdout_open+0xa>
ffffffffc0208d24:	8082                	ret
ffffffffc0208d26:	5575                	li	a0,-3
ffffffffc0208d28:	8082                	ret

ffffffffc0208d2a <stdout_close>:
ffffffffc0208d2a:	4501                	li	a0,0
ffffffffc0208d2c:	8082                	ret

ffffffffc0208d2e <stdout_ioctl>:
ffffffffc0208d2e:	5575                	li	a0,-3
ffffffffc0208d30:	8082                	ret

ffffffffc0208d32 <stdout_io>:
ffffffffc0208d32:	ca05                	beqz	a2,ffffffffc0208d62 <stdout_io+0x30>
ffffffffc0208d34:	6d9c                	ld	a5,24(a1)
ffffffffc0208d36:	1101                	addi	sp,sp,-32
ffffffffc0208d38:	e822                	sd	s0,16(sp)
ffffffffc0208d3a:	e426                	sd	s1,8(sp)
ffffffffc0208d3c:	ec06                	sd	ra,24(sp)
ffffffffc0208d3e:	6180                	ld	s0,0(a1)
ffffffffc0208d40:	84ae                	mv	s1,a1
ffffffffc0208d42:	cb91                	beqz	a5,ffffffffc0208d56 <stdout_io+0x24>
ffffffffc0208d44:	00044503          	lbu	a0,0(s0)
ffffffffc0208d48:	0405                	addi	s0,s0,1
ffffffffc0208d4a:	c98f70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208d4e:	6c9c                	ld	a5,24(s1)
ffffffffc0208d50:	17fd                	addi	a5,a5,-1
ffffffffc0208d52:	ec9c                	sd	a5,24(s1)
ffffffffc0208d54:	fbe5                	bnez	a5,ffffffffc0208d44 <stdout_io+0x12>
ffffffffc0208d56:	60e2                	ld	ra,24(sp)
ffffffffc0208d58:	6442                	ld	s0,16(sp)
ffffffffc0208d5a:	64a2                	ld	s1,8(sp)
ffffffffc0208d5c:	4501                	li	a0,0
ffffffffc0208d5e:	6105                	addi	sp,sp,32
ffffffffc0208d60:	8082                	ret
ffffffffc0208d62:	5575                	li	a0,-3
ffffffffc0208d64:	8082                	ret

ffffffffc0208d66 <dev_init_stdout>:
ffffffffc0208d66:	1141                	addi	sp,sp,-16
ffffffffc0208d68:	e406                	sd	ra,8(sp)
ffffffffc0208d6a:	9adff0ef          	jal	ra,ffffffffc0208716 <dev_create_inode>
ffffffffc0208d6e:	c939                	beqz	a0,ffffffffc0208dc4 <dev_init_stdout+0x5e>
ffffffffc0208d70:	4d38                	lw	a4,88(a0)
ffffffffc0208d72:	6785                	lui	a5,0x1
ffffffffc0208d74:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d78:	85aa                	mv	a1,a0
ffffffffc0208d7a:	06f71e63          	bne	a4,a5,ffffffffc0208df6 <dev_init_stdout+0x90>
ffffffffc0208d7e:	4785                	li	a5,1
ffffffffc0208d80:	e51c                	sd	a5,8(a0)
ffffffffc0208d82:	00000797          	auipc	a5,0x0
ffffffffc0208d86:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208d1c <stdout_open>
ffffffffc0208d8a:	e91c                	sd	a5,16(a0)
ffffffffc0208d8c:	00000797          	auipc	a5,0x0
ffffffffc0208d90:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208d2a <stdout_close>
ffffffffc0208d94:	ed1c                	sd	a5,24(a0)
ffffffffc0208d96:	00000797          	auipc	a5,0x0
ffffffffc0208d9a:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208d32 <stdout_io>
ffffffffc0208d9e:	f11c                	sd	a5,32(a0)
ffffffffc0208da0:	00000797          	auipc	a5,0x0
ffffffffc0208da4:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208d2e <stdout_ioctl>
ffffffffc0208da8:	00053023          	sd	zero,0(a0)
ffffffffc0208dac:	f51c                	sd	a5,40(a0)
ffffffffc0208dae:	4601                	li	a2,0
ffffffffc0208db0:	00006517          	auipc	a0,0x6
ffffffffc0208db4:	e1050513          	addi	a0,a0,-496 # ffffffffc020ebc0 <dev_node_ops+0x2d8>
ffffffffc0208db8:	81aff0ef          	jal	ra,ffffffffc0207dd2 <vfs_add_dev>
ffffffffc0208dbc:	e105                	bnez	a0,ffffffffc0208ddc <dev_init_stdout+0x76>
ffffffffc0208dbe:	60a2                	ld	ra,8(sp)
ffffffffc0208dc0:	0141                	addi	sp,sp,16
ffffffffc0208dc2:	8082                	ret
ffffffffc0208dc4:	00006617          	auipc	a2,0x6
ffffffffc0208dc8:	dbc60613          	addi	a2,a2,-580 # ffffffffc020eb80 <dev_node_ops+0x298>
ffffffffc0208dcc:	03700593          	li	a1,55
ffffffffc0208dd0:	00006517          	auipc	a0,0x6
ffffffffc0208dd4:	dd050513          	addi	a0,a0,-560 # ffffffffc020eba0 <dev_node_ops+0x2b8>
ffffffffc0208dd8:	ec6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208ddc:	86aa                	mv	a3,a0
ffffffffc0208dde:	00006617          	auipc	a2,0x6
ffffffffc0208de2:	dea60613          	addi	a2,a2,-534 # ffffffffc020ebc8 <dev_node_ops+0x2e0>
ffffffffc0208de6:	03d00593          	li	a1,61
ffffffffc0208dea:	00006517          	auipc	a0,0x6
ffffffffc0208dee:	db650513          	addi	a0,a0,-586 # ffffffffc020eba0 <dev_node_ops+0x2b8>
ffffffffc0208df2:	eacf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208df6:	00005697          	auipc	a3,0x5
ffffffffc0208dfa:	7ca68693          	addi	a3,a3,1994 # ffffffffc020e5c0 <syscalls+0xb10>
ffffffffc0208dfe:	00003617          	auipc	a2,0x3
ffffffffc0208e02:	b2260613          	addi	a2,a2,-1246 # ffffffffc020b920 <commands+0x210>
ffffffffc0208e06:	03900593          	li	a1,57
ffffffffc0208e0a:	00006517          	auipc	a0,0x6
ffffffffc0208e0e:	d9650513          	addi	a0,a0,-618 # ffffffffc020eba0 <dev_node_ops+0x2b8>
ffffffffc0208e12:	e8cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e16 <bitmap_translate.part.0>:
ffffffffc0208e16:	1141                	addi	sp,sp,-16
ffffffffc0208e18:	00006697          	auipc	a3,0x6
ffffffffc0208e1c:	dd068693          	addi	a3,a3,-560 # ffffffffc020ebe8 <dev_node_ops+0x300>
ffffffffc0208e20:	00003617          	auipc	a2,0x3
ffffffffc0208e24:	b0060613          	addi	a2,a2,-1280 # ffffffffc020b920 <commands+0x210>
ffffffffc0208e28:	04c00593          	li	a1,76
ffffffffc0208e2c:	00006517          	auipc	a0,0x6
ffffffffc0208e30:	dd450513          	addi	a0,a0,-556 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0208e34:	e406                	sd	ra,8(sp)
ffffffffc0208e36:	e68f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e3a <bitmap_create>:
ffffffffc0208e3a:	7139                	addi	sp,sp,-64
ffffffffc0208e3c:	fc06                	sd	ra,56(sp)
ffffffffc0208e3e:	f822                	sd	s0,48(sp)
ffffffffc0208e40:	f426                	sd	s1,40(sp)
ffffffffc0208e42:	f04a                	sd	s2,32(sp)
ffffffffc0208e44:	ec4e                	sd	s3,24(sp)
ffffffffc0208e46:	e852                	sd	s4,16(sp)
ffffffffc0208e48:	e456                	sd	s5,8(sp)
ffffffffc0208e4a:	c14d                	beqz	a0,ffffffffc0208eec <bitmap_create+0xb2>
ffffffffc0208e4c:	842a                	mv	s0,a0
ffffffffc0208e4e:	4541                	li	a0,16
ffffffffc0208e50:	93ef90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208e54:	84aa                	mv	s1,a0
ffffffffc0208e56:	cd25                	beqz	a0,ffffffffc0208ece <bitmap_create+0x94>
ffffffffc0208e58:	02041a13          	slli	s4,s0,0x20
ffffffffc0208e5c:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208e60:	01fa0793          	addi	a5,s4,31
ffffffffc0208e64:	0057d993          	srli	s3,a5,0x5
ffffffffc0208e68:	00299a93          	slli	s5,s3,0x2
ffffffffc0208e6c:	8556                	mv	a0,s5
ffffffffc0208e6e:	894e                	mv	s2,s3
ffffffffc0208e70:	91ef90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208e74:	c53d                	beqz	a0,ffffffffc0208ee2 <bitmap_create+0xa8>
ffffffffc0208e76:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208e7a:	c080                	sw	s0,0(s1)
ffffffffc0208e7c:	8656                	mv	a2,s5
ffffffffc0208e7e:	0ff00593          	li	a1,255
ffffffffc0208e82:	5ba020ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0208e86:	e488                	sd	a0,8(s1)
ffffffffc0208e88:	0996                	slli	s3,s3,0x5
ffffffffc0208e8a:	053a0263          	beq	s4,s3,ffffffffc0208ece <bitmap_create+0x94>
ffffffffc0208e8e:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208e92:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208e96:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208e9a:	40d4073b          	subw	a4,s0,a3
ffffffffc0208e9e:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208ea2:	08f61463          	bne	a2,a5,ffffffffc0208f2a <bitmap_create+0xf0>
ffffffffc0208ea6:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208eaa:	47f9                	li	a5,30
ffffffffc0208eac:	04d7ef63          	bltu	a5,a3,ffffffffc0208f0a <bitmap_create+0xd0>
ffffffffc0208eb0:	1402                	slli	s0,s0,0x20
ffffffffc0208eb2:	8079                	srli	s0,s0,0x1e
ffffffffc0208eb4:	9522                	add	a0,a0,s0
ffffffffc0208eb6:	411c                	lw	a5,0(a0)
ffffffffc0208eb8:	4585                	li	a1,1
ffffffffc0208eba:	02000613          	li	a2,32
ffffffffc0208ebe:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208ec2:	8fb5                	xor	a5,a5,a3
ffffffffc0208ec4:	2705                	addiw	a4,a4,1
ffffffffc0208ec6:	2781                	sext.w	a5,a5
ffffffffc0208ec8:	fec71be3          	bne	a4,a2,ffffffffc0208ebe <bitmap_create+0x84>
ffffffffc0208ecc:	c11c                	sw	a5,0(a0)
ffffffffc0208ece:	70e2                	ld	ra,56(sp)
ffffffffc0208ed0:	7442                	ld	s0,48(sp)
ffffffffc0208ed2:	7902                	ld	s2,32(sp)
ffffffffc0208ed4:	69e2                	ld	s3,24(sp)
ffffffffc0208ed6:	6a42                	ld	s4,16(sp)
ffffffffc0208ed8:	6aa2                	ld	s5,8(sp)
ffffffffc0208eda:	8526                	mv	a0,s1
ffffffffc0208edc:	74a2                	ld	s1,40(sp)
ffffffffc0208ede:	6121                	addi	sp,sp,64
ffffffffc0208ee0:	8082                	ret
ffffffffc0208ee2:	8526                	mv	a0,s1
ffffffffc0208ee4:	95af90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208ee8:	4481                	li	s1,0
ffffffffc0208eea:	b7d5                	j	ffffffffc0208ece <bitmap_create+0x94>
ffffffffc0208eec:	00006697          	auipc	a3,0x6
ffffffffc0208ef0:	d2c68693          	addi	a3,a3,-724 # ffffffffc020ec18 <dev_node_ops+0x330>
ffffffffc0208ef4:	00003617          	auipc	a2,0x3
ffffffffc0208ef8:	a2c60613          	addi	a2,a2,-1492 # ffffffffc020b920 <commands+0x210>
ffffffffc0208efc:	45d5                	li	a1,21
ffffffffc0208efe:	00006517          	auipc	a0,0x6
ffffffffc0208f02:	d0250513          	addi	a0,a0,-766 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0208f06:	d98f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f0a:	00006697          	auipc	a3,0x6
ffffffffc0208f0e:	d4e68693          	addi	a3,a3,-690 # ffffffffc020ec58 <dev_node_ops+0x370>
ffffffffc0208f12:	00003617          	auipc	a2,0x3
ffffffffc0208f16:	a0e60613          	addi	a2,a2,-1522 # ffffffffc020b920 <commands+0x210>
ffffffffc0208f1a:	02b00593          	li	a1,43
ffffffffc0208f1e:	00006517          	auipc	a0,0x6
ffffffffc0208f22:	ce250513          	addi	a0,a0,-798 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0208f26:	d78f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f2a:	00006697          	auipc	a3,0x6
ffffffffc0208f2e:	d1668693          	addi	a3,a3,-746 # ffffffffc020ec40 <dev_node_ops+0x358>
ffffffffc0208f32:	00003617          	auipc	a2,0x3
ffffffffc0208f36:	9ee60613          	addi	a2,a2,-1554 # ffffffffc020b920 <commands+0x210>
ffffffffc0208f3a:	02a00593          	li	a1,42
ffffffffc0208f3e:	00006517          	auipc	a0,0x6
ffffffffc0208f42:	cc250513          	addi	a0,a0,-830 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0208f46:	d58f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f4a <bitmap_alloc>:
ffffffffc0208f4a:	4150                	lw	a2,4(a0)
ffffffffc0208f4c:	651c                	ld	a5,8(a0)
ffffffffc0208f4e:	c231                	beqz	a2,ffffffffc0208f92 <bitmap_alloc+0x48>
ffffffffc0208f50:	4701                	li	a4,0
ffffffffc0208f52:	a029                	j	ffffffffc0208f5c <bitmap_alloc+0x12>
ffffffffc0208f54:	2705                	addiw	a4,a4,1
ffffffffc0208f56:	0791                	addi	a5,a5,4
ffffffffc0208f58:	02e60d63          	beq	a2,a4,ffffffffc0208f92 <bitmap_alloc+0x48>
ffffffffc0208f5c:	4394                	lw	a3,0(a5)
ffffffffc0208f5e:	dafd                	beqz	a3,ffffffffc0208f54 <bitmap_alloc+0xa>
ffffffffc0208f60:	4501                	li	a0,0
ffffffffc0208f62:	4885                	li	a7,1
ffffffffc0208f64:	8e36                	mv	t3,a3
ffffffffc0208f66:	02000313          	li	t1,32
ffffffffc0208f6a:	a021                	j	ffffffffc0208f72 <bitmap_alloc+0x28>
ffffffffc0208f6c:	2505                	addiw	a0,a0,1
ffffffffc0208f6e:	02650463          	beq	a0,t1,ffffffffc0208f96 <bitmap_alloc+0x4c>
ffffffffc0208f72:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208f76:	0106f633          	and	a2,a3,a6
ffffffffc0208f7a:	2601                	sext.w	a2,a2
ffffffffc0208f7c:	da65                	beqz	a2,ffffffffc0208f6c <bitmap_alloc+0x22>
ffffffffc0208f7e:	010e4833          	xor	a6,t3,a6
ffffffffc0208f82:	0057171b          	slliw	a4,a4,0x5
ffffffffc0208f86:	9f29                	addw	a4,a4,a0
ffffffffc0208f88:	0107a023          	sw	a6,0(a5)
ffffffffc0208f8c:	c198                	sw	a4,0(a1)
ffffffffc0208f8e:	4501                	li	a0,0
ffffffffc0208f90:	8082                	ret
ffffffffc0208f92:	5571                	li	a0,-4
ffffffffc0208f94:	8082                	ret
ffffffffc0208f96:	1141                	addi	sp,sp,-16
ffffffffc0208f98:	00004697          	auipc	a3,0x4
ffffffffc0208f9c:	a0868693          	addi	a3,a3,-1528 # ffffffffc020c9a0 <default_pmm_manager+0x598>
ffffffffc0208fa0:	00003617          	auipc	a2,0x3
ffffffffc0208fa4:	98060613          	addi	a2,a2,-1664 # ffffffffc020b920 <commands+0x210>
ffffffffc0208fa8:	04300593          	li	a1,67
ffffffffc0208fac:	00006517          	auipc	a0,0x6
ffffffffc0208fb0:	c5450513          	addi	a0,a0,-940 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0208fb4:	e406                	sd	ra,8(sp)
ffffffffc0208fb6:	ce8f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208fba <bitmap_test>:
ffffffffc0208fba:	411c                	lw	a5,0(a0)
ffffffffc0208fbc:	00f5ff63          	bgeu	a1,a5,ffffffffc0208fda <bitmap_test+0x20>
ffffffffc0208fc0:	651c                	ld	a5,8(a0)
ffffffffc0208fc2:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208fc6:	070a                	slli	a4,a4,0x2
ffffffffc0208fc8:	97ba                	add	a5,a5,a4
ffffffffc0208fca:	4388                	lw	a0,0(a5)
ffffffffc0208fcc:	4785                	li	a5,1
ffffffffc0208fce:	00b795bb          	sllw	a1,a5,a1
ffffffffc0208fd2:	8d6d                	and	a0,a0,a1
ffffffffc0208fd4:	1502                	slli	a0,a0,0x20
ffffffffc0208fd6:	9101                	srli	a0,a0,0x20
ffffffffc0208fd8:	8082                	ret
ffffffffc0208fda:	1141                	addi	sp,sp,-16
ffffffffc0208fdc:	e406                	sd	ra,8(sp)
ffffffffc0208fde:	e39ff0ef          	jal	ra,ffffffffc0208e16 <bitmap_translate.part.0>

ffffffffc0208fe2 <bitmap_free>:
ffffffffc0208fe2:	411c                	lw	a5,0(a0)
ffffffffc0208fe4:	1141                	addi	sp,sp,-16
ffffffffc0208fe6:	e406                	sd	ra,8(sp)
ffffffffc0208fe8:	02f5f463          	bgeu	a1,a5,ffffffffc0209010 <bitmap_free+0x2e>
ffffffffc0208fec:	651c                	ld	a5,8(a0)
ffffffffc0208fee:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208ff2:	070a                	slli	a4,a4,0x2
ffffffffc0208ff4:	97ba                	add	a5,a5,a4
ffffffffc0208ff6:	4398                	lw	a4,0(a5)
ffffffffc0208ff8:	4685                	li	a3,1
ffffffffc0208ffa:	00b695bb          	sllw	a1,a3,a1
ffffffffc0208ffe:	00b776b3          	and	a3,a4,a1
ffffffffc0209002:	2681                	sext.w	a3,a3
ffffffffc0209004:	ea81                	bnez	a3,ffffffffc0209014 <bitmap_free+0x32>
ffffffffc0209006:	60a2                	ld	ra,8(sp)
ffffffffc0209008:	8f4d                	or	a4,a4,a1
ffffffffc020900a:	c398                	sw	a4,0(a5)
ffffffffc020900c:	0141                	addi	sp,sp,16
ffffffffc020900e:	8082                	ret
ffffffffc0209010:	e07ff0ef          	jal	ra,ffffffffc0208e16 <bitmap_translate.part.0>
ffffffffc0209014:	00006697          	auipc	a3,0x6
ffffffffc0209018:	c6c68693          	addi	a3,a3,-916 # ffffffffc020ec80 <dev_node_ops+0x398>
ffffffffc020901c:	00003617          	auipc	a2,0x3
ffffffffc0209020:	90460613          	addi	a2,a2,-1788 # ffffffffc020b920 <commands+0x210>
ffffffffc0209024:	05f00593          	li	a1,95
ffffffffc0209028:	00006517          	auipc	a0,0x6
ffffffffc020902c:	bd850513          	addi	a0,a0,-1064 # ffffffffc020ec00 <dev_node_ops+0x318>
ffffffffc0209030:	c6ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209034 <bitmap_destroy>:
ffffffffc0209034:	1141                	addi	sp,sp,-16
ffffffffc0209036:	e022                	sd	s0,0(sp)
ffffffffc0209038:	842a                	mv	s0,a0
ffffffffc020903a:	6508                	ld	a0,8(a0)
ffffffffc020903c:	e406                	sd	ra,8(sp)
ffffffffc020903e:	800f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209042:	8522                	mv	a0,s0
ffffffffc0209044:	6402                	ld	s0,0(sp)
ffffffffc0209046:	60a2                	ld	ra,8(sp)
ffffffffc0209048:	0141                	addi	sp,sp,16
ffffffffc020904a:	ff5f806f          	j	ffffffffc020203e <kfree>

ffffffffc020904e <bitmap_getdata>:
ffffffffc020904e:	c589                	beqz	a1,ffffffffc0209058 <bitmap_getdata+0xa>
ffffffffc0209050:	00456783          	lwu	a5,4(a0)
ffffffffc0209054:	078a                	slli	a5,a5,0x2
ffffffffc0209056:	e19c                	sd	a5,0(a1)
ffffffffc0209058:	6508                	ld	a0,8(a0)
ffffffffc020905a:	8082                	ret

ffffffffc020905c <sfs_init>:
ffffffffc020905c:	1141                	addi	sp,sp,-16
ffffffffc020905e:	00006517          	auipc	a0,0x6
ffffffffc0209062:	a9250513          	addi	a0,a0,-1390 # ffffffffc020eaf0 <dev_node_ops+0x208>
ffffffffc0209066:	e406                	sd	ra,8(sp)
ffffffffc0209068:	554000ef          	jal	ra,ffffffffc02095bc <sfs_mount>
ffffffffc020906c:	e501                	bnez	a0,ffffffffc0209074 <sfs_init+0x18>
ffffffffc020906e:	60a2                	ld	ra,8(sp)
ffffffffc0209070:	0141                	addi	sp,sp,16
ffffffffc0209072:	8082                	ret
ffffffffc0209074:	86aa                	mv	a3,a0
ffffffffc0209076:	00006617          	auipc	a2,0x6
ffffffffc020907a:	c1a60613          	addi	a2,a2,-998 # ffffffffc020ec90 <dev_node_ops+0x3a8>
ffffffffc020907e:	45c1                	li	a1,16
ffffffffc0209080:	00006517          	auipc	a0,0x6
ffffffffc0209084:	c3050513          	addi	a0,a0,-976 # ffffffffc020ecb0 <dev_node_ops+0x3c8>
ffffffffc0209088:	c16f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020908c <sfs_unmount>:
ffffffffc020908c:	1141                	addi	sp,sp,-16
ffffffffc020908e:	e406                	sd	ra,8(sp)
ffffffffc0209090:	e022                	sd	s0,0(sp)
ffffffffc0209092:	cd1d                	beqz	a0,ffffffffc02090d0 <sfs_unmount+0x44>
ffffffffc0209094:	0b052783          	lw	a5,176(a0)
ffffffffc0209098:	842a                	mv	s0,a0
ffffffffc020909a:	eb9d                	bnez	a5,ffffffffc02090d0 <sfs_unmount+0x44>
ffffffffc020909c:	7158                	ld	a4,160(a0)
ffffffffc020909e:	09850793          	addi	a5,a0,152
ffffffffc02090a2:	02f71563          	bne	a4,a5,ffffffffc02090cc <sfs_unmount+0x40>
ffffffffc02090a6:	613c                	ld	a5,64(a0)
ffffffffc02090a8:	e7a1                	bnez	a5,ffffffffc02090f0 <sfs_unmount+0x64>
ffffffffc02090aa:	7d08                	ld	a0,56(a0)
ffffffffc02090ac:	f89ff0ef          	jal	ra,ffffffffc0209034 <bitmap_destroy>
ffffffffc02090b0:	6428                	ld	a0,72(s0)
ffffffffc02090b2:	f8df80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02090b6:	7448                	ld	a0,168(s0)
ffffffffc02090b8:	f87f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02090bc:	8522                	mv	a0,s0
ffffffffc02090be:	f81f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02090c2:	4501                	li	a0,0
ffffffffc02090c4:	60a2                	ld	ra,8(sp)
ffffffffc02090c6:	6402                	ld	s0,0(sp)
ffffffffc02090c8:	0141                	addi	sp,sp,16
ffffffffc02090ca:	8082                	ret
ffffffffc02090cc:	5545                	li	a0,-15
ffffffffc02090ce:	bfdd                	j	ffffffffc02090c4 <sfs_unmount+0x38>
ffffffffc02090d0:	00006697          	auipc	a3,0x6
ffffffffc02090d4:	bf868693          	addi	a3,a3,-1032 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc02090d8:	00003617          	auipc	a2,0x3
ffffffffc02090dc:	84860613          	addi	a2,a2,-1976 # ffffffffc020b920 <commands+0x210>
ffffffffc02090e0:	04100593          	li	a1,65
ffffffffc02090e4:	00006517          	auipc	a0,0x6
ffffffffc02090e8:	c1450513          	addi	a0,a0,-1004 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc02090ec:	bb2f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02090f0:	00006697          	auipc	a3,0x6
ffffffffc02090f4:	c2068693          	addi	a3,a3,-992 # ffffffffc020ed10 <dev_node_ops+0x428>
ffffffffc02090f8:	00003617          	auipc	a2,0x3
ffffffffc02090fc:	82860613          	addi	a2,a2,-2008 # ffffffffc020b920 <commands+0x210>
ffffffffc0209100:	04500593          	li	a1,69
ffffffffc0209104:	00006517          	auipc	a0,0x6
ffffffffc0209108:	bf450513          	addi	a0,a0,-1036 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc020910c:	b92f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209110 <sfs_cleanup>:
ffffffffc0209110:	1101                	addi	sp,sp,-32
ffffffffc0209112:	ec06                	sd	ra,24(sp)
ffffffffc0209114:	e822                	sd	s0,16(sp)
ffffffffc0209116:	e426                	sd	s1,8(sp)
ffffffffc0209118:	e04a                	sd	s2,0(sp)
ffffffffc020911a:	c525                	beqz	a0,ffffffffc0209182 <sfs_cleanup+0x72>
ffffffffc020911c:	0b052783          	lw	a5,176(a0)
ffffffffc0209120:	84aa                	mv	s1,a0
ffffffffc0209122:	e3a5                	bnez	a5,ffffffffc0209182 <sfs_cleanup+0x72>
ffffffffc0209124:	4158                	lw	a4,4(a0)
ffffffffc0209126:	4514                	lw	a3,8(a0)
ffffffffc0209128:	00c50913          	addi	s2,a0,12
ffffffffc020912c:	85ca                	mv	a1,s2
ffffffffc020912e:	40d7063b          	subw	a2,a4,a3
ffffffffc0209132:	00006517          	auipc	a0,0x6
ffffffffc0209136:	bf650513          	addi	a0,a0,-1034 # ffffffffc020ed28 <dev_node_ops+0x440>
ffffffffc020913a:	86cf70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020913e:	02000413          	li	s0,32
ffffffffc0209142:	a019                	j	ffffffffc0209148 <sfs_cleanup+0x38>
ffffffffc0209144:	347d                	addiw	s0,s0,-1
ffffffffc0209146:	c819                	beqz	s0,ffffffffc020915c <sfs_cleanup+0x4c>
ffffffffc0209148:	7cdc                	ld	a5,184(s1)
ffffffffc020914a:	8526                	mv	a0,s1
ffffffffc020914c:	9782                	jalr	a5
ffffffffc020914e:	f97d                	bnez	a0,ffffffffc0209144 <sfs_cleanup+0x34>
ffffffffc0209150:	60e2                	ld	ra,24(sp)
ffffffffc0209152:	6442                	ld	s0,16(sp)
ffffffffc0209154:	64a2                	ld	s1,8(sp)
ffffffffc0209156:	6902                	ld	s2,0(sp)
ffffffffc0209158:	6105                	addi	sp,sp,32
ffffffffc020915a:	8082                	ret
ffffffffc020915c:	6442                	ld	s0,16(sp)
ffffffffc020915e:	60e2                	ld	ra,24(sp)
ffffffffc0209160:	64a2                	ld	s1,8(sp)
ffffffffc0209162:	86ca                	mv	a3,s2
ffffffffc0209164:	6902                	ld	s2,0(sp)
ffffffffc0209166:	872a                	mv	a4,a0
ffffffffc0209168:	00006617          	auipc	a2,0x6
ffffffffc020916c:	be060613          	addi	a2,a2,-1056 # ffffffffc020ed48 <dev_node_ops+0x460>
ffffffffc0209170:	05f00593          	li	a1,95
ffffffffc0209174:	00006517          	auipc	a0,0x6
ffffffffc0209178:	b8450513          	addi	a0,a0,-1148 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc020917c:	6105                	addi	sp,sp,32
ffffffffc020917e:	b88f706f          	j	ffffffffc0200506 <__warn>
ffffffffc0209182:	00006697          	auipc	a3,0x6
ffffffffc0209186:	b4668693          	addi	a3,a3,-1210 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020918a:	00002617          	auipc	a2,0x2
ffffffffc020918e:	79660613          	addi	a2,a2,1942 # ffffffffc020b920 <commands+0x210>
ffffffffc0209192:	05400593          	li	a1,84
ffffffffc0209196:	00006517          	auipc	a0,0x6
ffffffffc020919a:	b6250513          	addi	a0,a0,-1182 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc020919e:	b00f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02091a2 <sfs_sync>:
ffffffffc02091a2:	7179                	addi	sp,sp,-48
ffffffffc02091a4:	f406                	sd	ra,40(sp)
ffffffffc02091a6:	f022                	sd	s0,32(sp)
ffffffffc02091a8:	ec26                	sd	s1,24(sp)
ffffffffc02091aa:	e84a                	sd	s2,16(sp)
ffffffffc02091ac:	e44e                	sd	s3,8(sp)
ffffffffc02091ae:	e052                	sd	s4,0(sp)
ffffffffc02091b0:	cd4d                	beqz	a0,ffffffffc020926a <sfs_sync+0xc8>
ffffffffc02091b2:	0b052783          	lw	a5,176(a0)
ffffffffc02091b6:	8a2a                	mv	s4,a0
ffffffffc02091b8:	ebcd                	bnez	a5,ffffffffc020926a <sfs_sync+0xc8>
ffffffffc02091ba:	52f010ef          	jal	ra,ffffffffc020aee8 <lock_sfs_fs>
ffffffffc02091be:	0a0a3403          	ld	s0,160(s4)
ffffffffc02091c2:	098a0913          	addi	s2,s4,152
ffffffffc02091c6:	02890763          	beq	s2,s0,ffffffffc02091f4 <sfs_sync+0x52>
ffffffffc02091ca:	00004997          	auipc	s3,0x4
ffffffffc02091ce:	0de98993          	addi	s3,s3,222 # ffffffffc020d2a8 <default_pmm_manager+0xea0>
ffffffffc02091d2:	7c1c                	ld	a5,56(s0)
ffffffffc02091d4:	fc840493          	addi	s1,s0,-56
ffffffffc02091d8:	cbb5                	beqz	a5,ffffffffc020924c <sfs_sync+0xaa>
ffffffffc02091da:	7b9c                	ld	a5,48(a5)
ffffffffc02091dc:	cba5                	beqz	a5,ffffffffc020924c <sfs_sync+0xaa>
ffffffffc02091de:	85ce                	mv	a1,s3
ffffffffc02091e0:	8526                	mv	a0,s1
ffffffffc02091e2:	e28fe0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02091e6:	7c1c                	ld	a5,56(s0)
ffffffffc02091e8:	8526                	mv	a0,s1
ffffffffc02091ea:	7b9c                	ld	a5,48(a5)
ffffffffc02091ec:	9782                	jalr	a5
ffffffffc02091ee:	6400                	ld	s0,8(s0)
ffffffffc02091f0:	fe8911e3          	bne	s2,s0,ffffffffc02091d2 <sfs_sync+0x30>
ffffffffc02091f4:	8552                	mv	a0,s4
ffffffffc02091f6:	503010ef          	jal	ra,ffffffffc020aef8 <unlock_sfs_fs>
ffffffffc02091fa:	040a3783          	ld	a5,64(s4)
ffffffffc02091fe:	4501                	li	a0,0
ffffffffc0209200:	eb89                	bnez	a5,ffffffffc0209212 <sfs_sync+0x70>
ffffffffc0209202:	70a2                	ld	ra,40(sp)
ffffffffc0209204:	7402                	ld	s0,32(sp)
ffffffffc0209206:	64e2                	ld	s1,24(sp)
ffffffffc0209208:	6942                	ld	s2,16(sp)
ffffffffc020920a:	69a2                	ld	s3,8(sp)
ffffffffc020920c:	6a02                	ld	s4,0(sp)
ffffffffc020920e:	6145                	addi	sp,sp,48
ffffffffc0209210:	8082                	ret
ffffffffc0209212:	040a3023          	sd	zero,64(s4)
ffffffffc0209216:	8552                	mv	a0,s4
ffffffffc0209218:	3b5010ef          	jal	ra,ffffffffc020adcc <sfs_sync_super>
ffffffffc020921c:	cd01                	beqz	a0,ffffffffc0209234 <sfs_sync+0x92>
ffffffffc020921e:	70a2                	ld	ra,40(sp)
ffffffffc0209220:	7402                	ld	s0,32(sp)
ffffffffc0209222:	4785                	li	a5,1
ffffffffc0209224:	04fa3023          	sd	a5,64(s4)
ffffffffc0209228:	64e2                	ld	s1,24(sp)
ffffffffc020922a:	6942                	ld	s2,16(sp)
ffffffffc020922c:	69a2                	ld	s3,8(sp)
ffffffffc020922e:	6a02                	ld	s4,0(sp)
ffffffffc0209230:	6145                	addi	sp,sp,48
ffffffffc0209232:	8082                	ret
ffffffffc0209234:	8552                	mv	a0,s4
ffffffffc0209236:	3dd010ef          	jal	ra,ffffffffc020ae12 <sfs_sync_freemap>
ffffffffc020923a:	f175                	bnez	a0,ffffffffc020921e <sfs_sync+0x7c>
ffffffffc020923c:	70a2                	ld	ra,40(sp)
ffffffffc020923e:	7402                	ld	s0,32(sp)
ffffffffc0209240:	64e2                	ld	s1,24(sp)
ffffffffc0209242:	6942                	ld	s2,16(sp)
ffffffffc0209244:	69a2                	ld	s3,8(sp)
ffffffffc0209246:	6a02                	ld	s4,0(sp)
ffffffffc0209248:	6145                	addi	sp,sp,48
ffffffffc020924a:	8082                	ret
ffffffffc020924c:	00004697          	auipc	a3,0x4
ffffffffc0209250:	00c68693          	addi	a3,a3,12 # ffffffffc020d258 <default_pmm_manager+0xe50>
ffffffffc0209254:	00002617          	auipc	a2,0x2
ffffffffc0209258:	6cc60613          	addi	a2,a2,1740 # ffffffffc020b920 <commands+0x210>
ffffffffc020925c:	45ed                	li	a1,27
ffffffffc020925e:	00006517          	auipc	a0,0x6
ffffffffc0209262:	a9a50513          	addi	a0,a0,-1382 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc0209266:	a38f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020926a:	00006697          	auipc	a3,0x6
ffffffffc020926e:	a5e68693          	addi	a3,a3,-1442 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc0209272:	00002617          	auipc	a2,0x2
ffffffffc0209276:	6ae60613          	addi	a2,a2,1710 # ffffffffc020b920 <commands+0x210>
ffffffffc020927a:	45d5                	li	a1,21
ffffffffc020927c:	00006517          	auipc	a0,0x6
ffffffffc0209280:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc0209284:	a1af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209288 <sfs_get_root>:
ffffffffc0209288:	1101                	addi	sp,sp,-32
ffffffffc020928a:	ec06                	sd	ra,24(sp)
ffffffffc020928c:	cd09                	beqz	a0,ffffffffc02092a6 <sfs_get_root+0x1e>
ffffffffc020928e:	0b052783          	lw	a5,176(a0)
ffffffffc0209292:	eb91                	bnez	a5,ffffffffc02092a6 <sfs_get_root+0x1e>
ffffffffc0209294:	4605                	li	a2,1
ffffffffc0209296:	002c                	addi	a1,sp,8
ffffffffc0209298:	366010ef          	jal	ra,ffffffffc020a5fe <sfs_load_inode>
ffffffffc020929c:	e50d                	bnez	a0,ffffffffc02092c6 <sfs_get_root+0x3e>
ffffffffc020929e:	60e2                	ld	ra,24(sp)
ffffffffc02092a0:	6522                	ld	a0,8(sp)
ffffffffc02092a2:	6105                	addi	sp,sp,32
ffffffffc02092a4:	8082                	ret
ffffffffc02092a6:	00006697          	auipc	a3,0x6
ffffffffc02092aa:	a2268693          	addi	a3,a3,-1502 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc02092ae:	00002617          	auipc	a2,0x2
ffffffffc02092b2:	67260613          	addi	a2,a2,1650 # ffffffffc020b920 <commands+0x210>
ffffffffc02092b6:	03600593          	li	a1,54
ffffffffc02092ba:	00006517          	auipc	a0,0x6
ffffffffc02092be:	a3e50513          	addi	a0,a0,-1474 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc02092c2:	9dcf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02092c6:	86aa                	mv	a3,a0
ffffffffc02092c8:	00006617          	auipc	a2,0x6
ffffffffc02092cc:	aa060613          	addi	a2,a2,-1376 # ffffffffc020ed68 <dev_node_ops+0x480>
ffffffffc02092d0:	03700593          	li	a1,55
ffffffffc02092d4:	00006517          	auipc	a0,0x6
ffffffffc02092d8:	a2450513          	addi	a0,a0,-1500 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc02092dc:	9c2f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02092e0 <sfs_do_mount>:
ffffffffc02092e0:	6518                	ld	a4,8(a0)
ffffffffc02092e2:	7171                	addi	sp,sp,-176
ffffffffc02092e4:	f506                	sd	ra,168(sp)
ffffffffc02092e6:	f122                	sd	s0,160(sp)
ffffffffc02092e8:	ed26                	sd	s1,152(sp)
ffffffffc02092ea:	e94a                	sd	s2,144(sp)
ffffffffc02092ec:	e54e                	sd	s3,136(sp)
ffffffffc02092ee:	e152                	sd	s4,128(sp)
ffffffffc02092f0:	fcd6                	sd	s5,120(sp)
ffffffffc02092f2:	f8da                	sd	s6,112(sp)
ffffffffc02092f4:	f4de                	sd	s7,104(sp)
ffffffffc02092f6:	f0e2                	sd	s8,96(sp)
ffffffffc02092f8:	ece6                	sd	s9,88(sp)
ffffffffc02092fa:	e8ea                	sd	s10,80(sp)
ffffffffc02092fc:	e4ee                	sd	s11,72(sp)
ffffffffc02092fe:	6785                	lui	a5,0x1
ffffffffc0209300:	24f71663          	bne	a4,a5,ffffffffc020954c <sfs_do_mount+0x26c>
ffffffffc0209304:	892a                	mv	s2,a0
ffffffffc0209306:	4501                	li	a0,0
ffffffffc0209308:	8aae                	mv	s5,a1
ffffffffc020930a:	f00fe0ef          	jal	ra,ffffffffc0207a0a <__alloc_fs>
ffffffffc020930e:	842a                	mv	s0,a0
ffffffffc0209310:	24050463          	beqz	a0,ffffffffc0209558 <sfs_do_mount+0x278>
ffffffffc0209314:	0b052b03          	lw	s6,176(a0)
ffffffffc0209318:	260b1263          	bnez	s6,ffffffffc020957c <sfs_do_mount+0x29c>
ffffffffc020931c:	03253823          	sd	s2,48(a0)
ffffffffc0209320:	6505                	lui	a0,0x1
ffffffffc0209322:	c6df80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0209326:	e428                	sd	a0,72(s0)
ffffffffc0209328:	84aa                	mv	s1,a0
ffffffffc020932a:	16050363          	beqz	a0,ffffffffc0209490 <sfs_do_mount+0x1b0>
ffffffffc020932e:	85aa                	mv	a1,a0
ffffffffc0209330:	4681                	li	a3,0
ffffffffc0209332:	6605                	lui	a2,0x1
ffffffffc0209334:	1008                	addi	a0,sp,32
ffffffffc0209336:	8acfc0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc020933a:	02093783          	ld	a5,32(s2)
ffffffffc020933e:	85aa                	mv	a1,a0
ffffffffc0209340:	4601                	li	a2,0
ffffffffc0209342:	854a                	mv	a0,s2
ffffffffc0209344:	9782                	jalr	a5
ffffffffc0209346:	8a2a                	mv	s4,a0
ffffffffc0209348:	10051e63          	bnez	a0,ffffffffc0209464 <sfs_do_mount+0x184>
ffffffffc020934c:	408c                	lw	a1,0(s1)
ffffffffc020934e:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc0209352:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc0209356:	14c59863          	bne	a1,a2,ffffffffc02094a6 <sfs_do_mount+0x1c6>
ffffffffc020935a:	40dc                	lw	a5,4(s1)
ffffffffc020935c:	00093603          	ld	a2,0(s2)
ffffffffc0209360:	02079713          	slli	a4,a5,0x20
ffffffffc0209364:	9301                	srli	a4,a4,0x20
ffffffffc0209366:	12e66763          	bltu	a2,a4,ffffffffc0209494 <sfs_do_mount+0x1b4>
ffffffffc020936a:	020485a3          	sb	zero,43(s1)
ffffffffc020936e:	0084af03          	lw	t5,8(s1)
ffffffffc0209372:	00c4ae83          	lw	t4,12(s1)
ffffffffc0209376:	0104ae03          	lw	t3,16(s1)
ffffffffc020937a:	0144a303          	lw	t1,20(s1)
ffffffffc020937e:	0184a883          	lw	a7,24(s1)
ffffffffc0209382:	01c4a803          	lw	a6,28(s1)
ffffffffc0209386:	5090                	lw	a2,32(s1)
ffffffffc0209388:	50d4                	lw	a3,36(s1)
ffffffffc020938a:	5498                	lw	a4,40(s1)
ffffffffc020938c:	6511                	lui	a0,0x4
ffffffffc020938e:	c00c                	sw	a1,0(s0)
ffffffffc0209390:	c05c                	sw	a5,4(s0)
ffffffffc0209392:	01e42423          	sw	t5,8(s0)
ffffffffc0209396:	01d42623          	sw	t4,12(s0)
ffffffffc020939a:	01c42823          	sw	t3,16(s0)
ffffffffc020939e:	00642a23          	sw	t1,20(s0)
ffffffffc02093a2:	01142c23          	sw	a7,24(s0)
ffffffffc02093a6:	01042e23          	sw	a6,28(s0)
ffffffffc02093aa:	d010                	sw	a2,32(s0)
ffffffffc02093ac:	d054                	sw	a3,36(s0)
ffffffffc02093ae:	d418                	sw	a4,40(s0)
ffffffffc02093b0:	bdff80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02093b4:	f448                	sd	a0,168(s0)
ffffffffc02093b6:	8c2a                	mv	s8,a0
ffffffffc02093b8:	18050c63          	beqz	a0,ffffffffc0209550 <sfs_do_mount+0x270>
ffffffffc02093bc:	6711                	lui	a4,0x4
ffffffffc02093be:	87aa                	mv	a5,a0
ffffffffc02093c0:	972a                	add	a4,a4,a0
ffffffffc02093c2:	e79c                	sd	a5,8(a5)
ffffffffc02093c4:	e39c                	sd	a5,0(a5)
ffffffffc02093c6:	07c1                	addi	a5,a5,16
ffffffffc02093c8:	fee79de3          	bne	a5,a4,ffffffffc02093c2 <sfs_do_mount+0xe2>
ffffffffc02093cc:	0044eb83          	lwu	s7,4(s1)
ffffffffc02093d0:	67a1                	lui	a5,0x8
ffffffffc02093d2:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc02093d6:	9bce                	add	s7,s7,s3
ffffffffc02093d8:	77e1                	lui	a5,0xffff8
ffffffffc02093da:	00fbfbb3          	and	s7,s7,a5
ffffffffc02093de:	2b81                	sext.w	s7,s7
ffffffffc02093e0:	855e                	mv	a0,s7
ffffffffc02093e2:	a59ff0ef          	jal	ra,ffffffffc0208e3a <bitmap_create>
ffffffffc02093e6:	fc08                	sd	a0,56(s0)
ffffffffc02093e8:	8d2a                	mv	s10,a0
ffffffffc02093ea:	14050f63          	beqz	a0,ffffffffc0209548 <sfs_do_mount+0x268>
ffffffffc02093ee:	0044e783          	lwu	a5,4(s1)
ffffffffc02093f2:	082c                	addi	a1,sp,24
ffffffffc02093f4:	97ce                	add	a5,a5,s3
ffffffffc02093f6:	00f7d713          	srli	a4,a5,0xf
ffffffffc02093fa:	e43a                	sd	a4,8(sp)
ffffffffc02093fc:	40f7d993          	srai	s3,a5,0xf
ffffffffc0209400:	c4fff0ef          	jal	ra,ffffffffc020904e <bitmap_getdata>
ffffffffc0209404:	14050c63          	beqz	a0,ffffffffc020955c <sfs_do_mount+0x27c>
ffffffffc0209408:	00c9979b          	slliw	a5,s3,0xc
ffffffffc020940c:	66e2                	ld	a3,24(sp)
ffffffffc020940e:	1782                	slli	a5,a5,0x20
ffffffffc0209410:	9381                	srli	a5,a5,0x20
ffffffffc0209412:	14d79563          	bne	a5,a3,ffffffffc020955c <sfs_do_mount+0x27c>
ffffffffc0209416:	6722                	ld	a4,8(sp)
ffffffffc0209418:	6d89                	lui	s11,0x2
ffffffffc020941a:	89aa                	mv	s3,a0
ffffffffc020941c:	00c71c93          	slli	s9,a4,0xc
ffffffffc0209420:	9caa                	add	s9,s9,a0
ffffffffc0209422:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0209426:	e711                	bnez	a4,ffffffffc0209432 <sfs_do_mount+0x152>
ffffffffc0209428:	a079                	j	ffffffffc02094b6 <sfs_do_mount+0x1d6>
ffffffffc020942a:	6785                	lui	a5,0x1
ffffffffc020942c:	99be                	add	s3,s3,a5
ffffffffc020942e:	093c8463          	beq	s9,s3,ffffffffc02094b6 <sfs_do_mount+0x1d6>
ffffffffc0209432:	013d86bb          	addw	a3,s11,s3
ffffffffc0209436:	1682                	slli	a3,a3,0x20
ffffffffc0209438:	6605                	lui	a2,0x1
ffffffffc020943a:	85ce                	mv	a1,s3
ffffffffc020943c:	9281                	srli	a3,a3,0x20
ffffffffc020943e:	1008                	addi	a0,sp,32
ffffffffc0209440:	fa3fb0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0209444:	02093783          	ld	a5,32(s2)
ffffffffc0209448:	85aa                	mv	a1,a0
ffffffffc020944a:	4601                	li	a2,0
ffffffffc020944c:	854a                	mv	a0,s2
ffffffffc020944e:	9782                	jalr	a5
ffffffffc0209450:	dd69                	beqz	a0,ffffffffc020942a <sfs_do_mount+0x14a>
ffffffffc0209452:	e42a                	sd	a0,8(sp)
ffffffffc0209454:	856a                	mv	a0,s10
ffffffffc0209456:	bdfff0ef          	jal	ra,ffffffffc0209034 <bitmap_destroy>
ffffffffc020945a:	67a2                	ld	a5,8(sp)
ffffffffc020945c:	8a3e                	mv	s4,a5
ffffffffc020945e:	8562                	mv	a0,s8
ffffffffc0209460:	bdff80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209464:	8526                	mv	a0,s1
ffffffffc0209466:	bd9f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020946a:	8522                	mv	a0,s0
ffffffffc020946c:	bd3f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209470:	70aa                	ld	ra,168(sp)
ffffffffc0209472:	740a                	ld	s0,160(sp)
ffffffffc0209474:	64ea                	ld	s1,152(sp)
ffffffffc0209476:	694a                	ld	s2,144(sp)
ffffffffc0209478:	69aa                	ld	s3,136(sp)
ffffffffc020947a:	7ae6                	ld	s5,120(sp)
ffffffffc020947c:	7b46                	ld	s6,112(sp)
ffffffffc020947e:	7ba6                	ld	s7,104(sp)
ffffffffc0209480:	7c06                	ld	s8,96(sp)
ffffffffc0209482:	6ce6                	ld	s9,88(sp)
ffffffffc0209484:	6d46                	ld	s10,80(sp)
ffffffffc0209486:	6da6                	ld	s11,72(sp)
ffffffffc0209488:	8552                	mv	a0,s4
ffffffffc020948a:	6a0a                	ld	s4,128(sp)
ffffffffc020948c:	614d                	addi	sp,sp,176
ffffffffc020948e:	8082                	ret
ffffffffc0209490:	5a71                	li	s4,-4
ffffffffc0209492:	bfe1                	j	ffffffffc020946a <sfs_do_mount+0x18a>
ffffffffc0209494:	85be                	mv	a1,a5
ffffffffc0209496:	00006517          	auipc	a0,0x6
ffffffffc020949a:	92a50513          	addi	a0,a0,-1750 # ffffffffc020edc0 <dev_node_ops+0x4d8>
ffffffffc020949e:	d09f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094a2:	5a75                	li	s4,-3
ffffffffc02094a4:	b7c1                	j	ffffffffc0209464 <sfs_do_mount+0x184>
ffffffffc02094a6:	00006517          	auipc	a0,0x6
ffffffffc02094aa:	8e250513          	addi	a0,a0,-1822 # ffffffffc020ed88 <dev_node_ops+0x4a0>
ffffffffc02094ae:	cf9f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094b2:	5a75                	li	s4,-3
ffffffffc02094b4:	bf45                	j	ffffffffc0209464 <sfs_do_mount+0x184>
ffffffffc02094b6:	00442903          	lw	s2,4(s0)
ffffffffc02094ba:	4481                	li	s1,0
ffffffffc02094bc:	080b8c63          	beqz	s7,ffffffffc0209554 <sfs_do_mount+0x274>
ffffffffc02094c0:	85a6                	mv	a1,s1
ffffffffc02094c2:	856a                	mv	a0,s10
ffffffffc02094c4:	af7ff0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc02094c8:	c111                	beqz	a0,ffffffffc02094cc <sfs_do_mount+0x1ec>
ffffffffc02094ca:	2b05                	addiw	s6,s6,1
ffffffffc02094cc:	2485                	addiw	s1,s1,1
ffffffffc02094ce:	fe9b99e3          	bne	s7,s1,ffffffffc02094c0 <sfs_do_mount+0x1e0>
ffffffffc02094d2:	441c                	lw	a5,8(s0)
ffffffffc02094d4:	0d679463          	bne	a5,s6,ffffffffc020959c <sfs_do_mount+0x2bc>
ffffffffc02094d8:	4585                	li	a1,1
ffffffffc02094da:	05040513          	addi	a0,s0,80
ffffffffc02094de:	04043023          	sd	zero,64(s0)
ffffffffc02094e2:	878fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02094e6:	4585                	li	a1,1
ffffffffc02094e8:	06840513          	addi	a0,s0,104
ffffffffc02094ec:	86efb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02094f0:	4585                	li	a1,1
ffffffffc02094f2:	08040513          	addi	a0,s0,128
ffffffffc02094f6:	864fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02094fa:	09840793          	addi	a5,s0,152
ffffffffc02094fe:	f05c                	sd	a5,160(s0)
ffffffffc0209500:	ec5c                	sd	a5,152(s0)
ffffffffc0209502:	874a                	mv	a4,s2
ffffffffc0209504:	86da                	mv	a3,s6
ffffffffc0209506:	4169063b          	subw	a2,s2,s6
ffffffffc020950a:	00c40593          	addi	a1,s0,12
ffffffffc020950e:	00006517          	auipc	a0,0x6
ffffffffc0209512:	94250513          	addi	a0,a0,-1726 # ffffffffc020ee50 <dev_node_ops+0x568>
ffffffffc0209516:	c91f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020951a:	00000797          	auipc	a5,0x0
ffffffffc020951e:	c8878793          	addi	a5,a5,-888 # ffffffffc02091a2 <sfs_sync>
ffffffffc0209522:	fc5c                	sd	a5,184(s0)
ffffffffc0209524:	00000797          	auipc	a5,0x0
ffffffffc0209528:	d6478793          	addi	a5,a5,-668 # ffffffffc0209288 <sfs_get_root>
ffffffffc020952c:	e07c                	sd	a5,192(s0)
ffffffffc020952e:	00000797          	auipc	a5,0x0
ffffffffc0209532:	b5e78793          	addi	a5,a5,-1186 # ffffffffc020908c <sfs_unmount>
ffffffffc0209536:	e47c                	sd	a5,200(s0)
ffffffffc0209538:	00000797          	auipc	a5,0x0
ffffffffc020953c:	bd878793          	addi	a5,a5,-1064 # ffffffffc0209110 <sfs_cleanup>
ffffffffc0209540:	e87c                	sd	a5,208(s0)
ffffffffc0209542:	008ab023          	sd	s0,0(s5)
ffffffffc0209546:	b72d                	j	ffffffffc0209470 <sfs_do_mount+0x190>
ffffffffc0209548:	5a71                	li	s4,-4
ffffffffc020954a:	bf11                	j	ffffffffc020945e <sfs_do_mount+0x17e>
ffffffffc020954c:	5a49                	li	s4,-14
ffffffffc020954e:	b70d                	j	ffffffffc0209470 <sfs_do_mount+0x190>
ffffffffc0209550:	5a71                	li	s4,-4
ffffffffc0209552:	bf09                	j	ffffffffc0209464 <sfs_do_mount+0x184>
ffffffffc0209554:	4b01                	li	s6,0
ffffffffc0209556:	bfb5                	j	ffffffffc02094d2 <sfs_do_mount+0x1f2>
ffffffffc0209558:	5a71                	li	s4,-4
ffffffffc020955a:	bf19                	j	ffffffffc0209470 <sfs_do_mount+0x190>
ffffffffc020955c:	00006697          	auipc	a3,0x6
ffffffffc0209560:	89468693          	addi	a3,a3,-1900 # ffffffffc020edf0 <dev_node_ops+0x508>
ffffffffc0209564:	00002617          	auipc	a2,0x2
ffffffffc0209568:	3bc60613          	addi	a2,a2,956 # ffffffffc020b920 <commands+0x210>
ffffffffc020956c:	08300593          	li	a1,131
ffffffffc0209570:	00005517          	auipc	a0,0x5
ffffffffc0209574:	78850513          	addi	a0,a0,1928 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc0209578:	f27f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020957c:	00005697          	auipc	a3,0x5
ffffffffc0209580:	74c68693          	addi	a3,a3,1868 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc0209584:	00002617          	auipc	a2,0x2
ffffffffc0209588:	39c60613          	addi	a2,a2,924 # ffffffffc020b920 <commands+0x210>
ffffffffc020958c:	0a300593          	li	a1,163
ffffffffc0209590:	00005517          	auipc	a0,0x5
ffffffffc0209594:	76850513          	addi	a0,a0,1896 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc0209598:	f07f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020959c:	00006697          	auipc	a3,0x6
ffffffffc02095a0:	88468693          	addi	a3,a3,-1916 # ffffffffc020ee20 <dev_node_ops+0x538>
ffffffffc02095a4:	00002617          	auipc	a2,0x2
ffffffffc02095a8:	37c60613          	addi	a2,a2,892 # ffffffffc020b920 <commands+0x210>
ffffffffc02095ac:	0e000593          	li	a1,224
ffffffffc02095b0:	00005517          	auipc	a0,0x5
ffffffffc02095b4:	74850513          	addi	a0,a0,1864 # ffffffffc020ecf8 <dev_node_ops+0x410>
ffffffffc02095b8:	ee7f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02095bc <sfs_mount>:
ffffffffc02095bc:	00000597          	auipc	a1,0x0
ffffffffc02095c0:	d2458593          	addi	a1,a1,-732 # ffffffffc02092e0 <sfs_do_mount>
ffffffffc02095c4:	817fe06f          	j	ffffffffc0207dda <vfs_mount>

ffffffffc02095c8 <sfs_opendir>:
ffffffffc02095c8:	0235f593          	andi	a1,a1,35
ffffffffc02095cc:	4501                	li	a0,0
ffffffffc02095ce:	e191                	bnez	a1,ffffffffc02095d2 <sfs_opendir+0xa>
ffffffffc02095d0:	8082                	ret
ffffffffc02095d2:	553d                	li	a0,-17
ffffffffc02095d4:	8082                	ret

ffffffffc02095d6 <sfs_openfile>:
ffffffffc02095d6:	4501                	li	a0,0
ffffffffc02095d8:	8082                	ret

ffffffffc02095da <sfs_gettype>:
ffffffffc02095da:	1141                	addi	sp,sp,-16
ffffffffc02095dc:	e406                	sd	ra,8(sp)
ffffffffc02095de:	c939                	beqz	a0,ffffffffc0209634 <sfs_gettype+0x5a>
ffffffffc02095e0:	4d34                	lw	a3,88(a0)
ffffffffc02095e2:	6785                	lui	a5,0x1
ffffffffc02095e4:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02095e8:	04e69663          	bne	a3,a4,ffffffffc0209634 <sfs_gettype+0x5a>
ffffffffc02095ec:	6114                	ld	a3,0(a0)
ffffffffc02095ee:	4709                	li	a4,2
ffffffffc02095f0:	0046d683          	lhu	a3,4(a3)
ffffffffc02095f4:	02e68a63          	beq	a3,a4,ffffffffc0209628 <sfs_gettype+0x4e>
ffffffffc02095f8:	470d                	li	a4,3
ffffffffc02095fa:	02e68163          	beq	a3,a4,ffffffffc020961c <sfs_gettype+0x42>
ffffffffc02095fe:	4705                	li	a4,1
ffffffffc0209600:	00e68f63          	beq	a3,a4,ffffffffc020961e <sfs_gettype+0x44>
ffffffffc0209604:	00006617          	auipc	a2,0x6
ffffffffc0209608:	8bc60613          	addi	a2,a2,-1860 # ffffffffc020eec0 <dev_node_ops+0x5d8>
ffffffffc020960c:	39800593          	li	a1,920
ffffffffc0209610:	00006517          	auipc	a0,0x6
ffffffffc0209614:	89850513          	addi	a0,a0,-1896 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209618:	e87f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020961c:	678d                	lui	a5,0x3
ffffffffc020961e:	60a2                	ld	ra,8(sp)
ffffffffc0209620:	c19c                	sw	a5,0(a1)
ffffffffc0209622:	4501                	li	a0,0
ffffffffc0209624:	0141                	addi	sp,sp,16
ffffffffc0209626:	8082                	ret
ffffffffc0209628:	60a2                	ld	ra,8(sp)
ffffffffc020962a:	6789                	lui	a5,0x2
ffffffffc020962c:	c19c                	sw	a5,0(a1)
ffffffffc020962e:	4501                	li	a0,0
ffffffffc0209630:	0141                	addi	sp,sp,16
ffffffffc0209632:	8082                	ret
ffffffffc0209634:	00006697          	auipc	a3,0x6
ffffffffc0209638:	83c68693          	addi	a3,a3,-1988 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020963c:	00002617          	auipc	a2,0x2
ffffffffc0209640:	2e460613          	addi	a2,a2,740 # ffffffffc020b920 <commands+0x210>
ffffffffc0209644:	38c00593          	li	a1,908
ffffffffc0209648:	00006517          	auipc	a0,0x6
ffffffffc020964c:	86050513          	addi	a0,a0,-1952 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209650:	e4ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209654 <sfs_fsync>:
ffffffffc0209654:	7179                	addi	sp,sp,-48
ffffffffc0209656:	ec26                	sd	s1,24(sp)
ffffffffc0209658:	7524                	ld	s1,104(a0)
ffffffffc020965a:	f406                	sd	ra,40(sp)
ffffffffc020965c:	f022                	sd	s0,32(sp)
ffffffffc020965e:	e84a                	sd	s2,16(sp)
ffffffffc0209660:	e44e                	sd	s3,8(sp)
ffffffffc0209662:	c4bd                	beqz	s1,ffffffffc02096d0 <sfs_fsync+0x7c>
ffffffffc0209664:	0b04a783          	lw	a5,176(s1)
ffffffffc0209668:	e7a5                	bnez	a5,ffffffffc02096d0 <sfs_fsync+0x7c>
ffffffffc020966a:	4d38                	lw	a4,88(a0)
ffffffffc020966c:	6785                	lui	a5,0x1
ffffffffc020966e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209672:	842a                	mv	s0,a0
ffffffffc0209674:	06f71e63          	bne	a4,a5,ffffffffc02096f0 <sfs_fsync+0x9c>
ffffffffc0209678:	691c                	ld	a5,16(a0)
ffffffffc020967a:	4901                	li	s2,0
ffffffffc020967c:	eb89                	bnez	a5,ffffffffc020968e <sfs_fsync+0x3a>
ffffffffc020967e:	70a2                	ld	ra,40(sp)
ffffffffc0209680:	7402                	ld	s0,32(sp)
ffffffffc0209682:	64e2                	ld	s1,24(sp)
ffffffffc0209684:	69a2                	ld	s3,8(sp)
ffffffffc0209686:	854a                	mv	a0,s2
ffffffffc0209688:	6942                	ld	s2,16(sp)
ffffffffc020968a:	6145                	addi	sp,sp,48
ffffffffc020968c:	8082                	ret
ffffffffc020968e:	02050993          	addi	s3,a0,32
ffffffffc0209692:	854e                	mv	a0,s3
ffffffffc0209694:	ed1fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0209698:	681c                	ld	a5,16(s0)
ffffffffc020969a:	ef81                	bnez	a5,ffffffffc02096b2 <sfs_fsync+0x5e>
ffffffffc020969c:	854e                	mv	a0,s3
ffffffffc020969e:	ec3fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02096a2:	70a2                	ld	ra,40(sp)
ffffffffc02096a4:	7402                	ld	s0,32(sp)
ffffffffc02096a6:	64e2                	ld	s1,24(sp)
ffffffffc02096a8:	69a2                	ld	s3,8(sp)
ffffffffc02096aa:	854a                	mv	a0,s2
ffffffffc02096ac:	6942                	ld	s2,16(sp)
ffffffffc02096ae:	6145                	addi	sp,sp,48
ffffffffc02096b0:	8082                	ret
ffffffffc02096b2:	4414                	lw	a3,8(s0)
ffffffffc02096b4:	600c                	ld	a1,0(s0)
ffffffffc02096b6:	00043823          	sd	zero,16(s0)
ffffffffc02096ba:	4701                	li	a4,0
ffffffffc02096bc:	04000613          	li	a2,64
ffffffffc02096c0:	8526                	mv	a0,s1
ffffffffc02096c2:	676010ef          	jal	ra,ffffffffc020ad38 <sfs_wbuf>
ffffffffc02096c6:	892a                	mv	s2,a0
ffffffffc02096c8:	d971                	beqz	a0,ffffffffc020969c <sfs_fsync+0x48>
ffffffffc02096ca:	4785                	li	a5,1
ffffffffc02096cc:	e81c                	sd	a5,16(s0)
ffffffffc02096ce:	b7f9                	j	ffffffffc020969c <sfs_fsync+0x48>
ffffffffc02096d0:	00005697          	auipc	a3,0x5
ffffffffc02096d4:	5f868693          	addi	a3,a3,1528 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc02096d8:	00002617          	auipc	a2,0x2
ffffffffc02096dc:	24860613          	addi	a2,a2,584 # ffffffffc020b920 <commands+0x210>
ffffffffc02096e0:	2d000593          	li	a1,720
ffffffffc02096e4:	00005517          	auipc	a0,0x5
ffffffffc02096e8:	7c450513          	addi	a0,a0,1988 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc02096ec:	db3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02096f0:	00005697          	auipc	a3,0x5
ffffffffc02096f4:	78068693          	addi	a3,a3,1920 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc02096f8:	00002617          	auipc	a2,0x2
ffffffffc02096fc:	22860613          	addi	a2,a2,552 # ffffffffc020b920 <commands+0x210>
ffffffffc0209700:	2d100593          	li	a1,721
ffffffffc0209704:	00005517          	auipc	a0,0x5
ffffffffc0209708:	7a450513          	addi	a0,a0,1956 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020970c:	d93f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209710 <sfs_fstat>:
ffffffffc0209710:	1101                	addi	sp,sp,-32
ffffffffc0209712:	e426                	sd	s1,8(sp)
ffffffffc0209714:	84ae                	mv	s1,a1
ffffffffc0209716:	e822                	sd	s0,16(sp)
ffffffffc0209718:	02000613          	li	a2,32
ffffffffc020971c:	842a                	mv	s0,a0
ffffffffc020971e:	4581                	li	a1,0
ffffffffc0209720:	8526                	mv	a0,s1
ffffffffc0209722:	ec06                	sd	ra,24(sp)
ffffffffc0209724:	519010ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc0209728:	c439                	beqz	s0,ffffffffc0209776 <sfs_fstat+0x66>
ffffffffc020972a:	783c                	ld	a5,112(s0)
ffffffffc020972c:	c7a9                	beqz	a5,ffffffffc0209776 <sfs_fstat+0x66>
ffffffffc020972e:	6bbc                	ld	a5,80(a5)
ffffffffc0209730:	c3b9                	beqz	a5,ffffffffc0209776 <sfs_fstat+0x66>
ffffffffc0209732:	00005597          	auipc	a1,0x5
ffffffffc0209736:	12e58593          	addi	a1,a1,302 # ffffffffc020e860 <syscalls+0xdb0>
ffffffffc020973a:	8522                	mv	a0,s0
ffffffffc020973c:	8cefe0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0209740:	783c                	ld	a5,112(s0)
ffffffffc0209742:	85a6                	mv	a1,s1
ffffffffc0209744:	8522                	mv	a0,s0
ffffffffc0209746:	6bbc                	ld	a5,80(a5)
ffffffffc0209748:	9782                	jalr	a5
ffffffffc020974a:	e10d                	bnez	a0,ffffffffc020976c <sfs_fstat+0x5c>
ffffffffc020974c:	4c38                	lw	a4,88(s0)
ffffffffc020974e:	6785                	lui	a5,0x1
ffffffffc0209750:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209754:	04f71163          	bne	a4,a5,ffffffffc0209796 <sfs_fstat+0x86>
ffffffffc0209758:	601c                	ld	a5,0(s0)
ffffffffc020975a:	0067d683          	lhu	a3,6(a5)
ffffffffc020975e:	0087e703          	lwu	a4,8(a5)
ffffffffc0209762:	0007e783          	lwu	a5,0(a5)
ffffffffc0209766:	e494                	sd	a3,8(s1)
ffffffffc0209768:	e898                	sd	a4,16(s1)
ffffffffc020976a:	ec9c                	sd	a5,24(s1)
ffffffffc020976c:	60e2                	ld	ra,24(sp)
ffffffffc020976e:	6442                	ld	s0,16(sp)
ffffffffc0209770:	64a2                	ld	s1,8(sp)
ffffffffc0209772:	6105                	addi	sp,sp,32
ffffffffc0209774:	8082                	ret
ffffffffc0209776:	00005697          	auipc	a3,0x5
ffffffffc020977a:	08268693          	addi	a3,a3,130 # ffffffffc020e7f8 <syscalls+0xd48>
ffffffffc020977e:	00002617          	auipc	a2,0x2
ffffffffc0209782:	1a260613          	addi	a2,a2,418 # ffffffffc020b920 <commands+0x210>
ffffffffc0209786:	2c100593          	li	a1,705
ffffffffc020978a:	00005517          	auipc	a0,0x5
ffffffffc020978e:	71e50513          	addi	a0,a0,1822 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209792:	d0df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209796:	00005697          	auipc	a3,0x5
ffffffffc020979a:	6da68693          	addi	a3,a3,1754 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020979e:	00002617          	auipc	a2,0x2
ffffffffc02097a2:	18260613          	addi	a2,a2,386 # ffffffffc020b920 <commands+0x210>
ffffffffc02097a6:	2c400593          	li	a1,708
ffffffffc02097aa:	00005517          	auipc	a0,0x5
ffffffffc02097ae:	6fe50513          	addi	a0,a0,1790 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc02097b2:	cedf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02097b6 <sfs_tryseek>:
ffffffffc02097b6:	080007b7          	lui	a5,0x8000
ffffffffc02097ba:	04f5fd63          	bgeu	a1,a5,ffffffffc0209814 <sfs_tryseek+0x5e>
ffffffffc02097be:	1101                	addi	sp,sp,-32
ffffffffc02097c0:	e822                	sd	s0,16(sp)
ffffffffc02097c2:	ec06                	sd	ra,24(sp)
ffffffffc02097c4:	e426                	sd	s1,8(sp)
ffffffffc02097c6:	842a                	mv	s0,a0
ffffffffc02097c8:	c921                	beqz	a0,ffffffffc0209818 <sfs_tryseek+0x62>
ffffffffc02097ca:	4d38                	lw	a4,88(a0)
ffffffffc02097cc:	6785                	lui	a5,0x1
ffffffffc02097ce:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02097d2:	04f71363          	bne	a4,a5,ffffffffc0209818 <sfs_tryseek+0x62>
ffffffffc02097d6:	611c                	ld	a5,0(a0)
ffffffffc02097d8:	84ae                	mv	s1,a1
ffffffffc02097da:	0007e783          	lwu	a5,0(a5)
ffffffffc02097de:	02b7d563          	bge	a5,a1,ffffffffc0209808 <sfs_tryseek+0x52>
ffffffffc02097e2:	793c                	ld	a5,112(a0)
ffffffffc02097e4:	cbb1                	beqz	a5,ffffffffc0209838 <sfs_tryseek+0x82>
ffffffffc02097e6:	73bc                	ld	a5,96(a5)
ffffffffc02097e8:	cba1                	beqz	a5,ffffffffc0209838 <sfs_tryseek+0x82>
ffffffffc02097ea:	00005597          	auipc	a1,0x5
ffffffffc02097ee:	f6658593          	addi	a1,a1,-154 # ffffffffc020e750 <syscalls+0xca0>
ffffffffc02097f2:	818fe0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02097f6:	783c                	ld	a5,112(s0)
ffffffffc02097f8:	8522                	mv	a0,s0
ffffffffc02097fa:	6442                	ld	s0,16(sp)
ffffffffc02097fc:	60e2                	ld	ra,24(sp)
ffffffffc02097fe:	73bc                	ld	a5,96(a5)
ffffffffc0209800:	85a6                	mv	a1,s1
ffffffffc0209802:	64a2                	ld	s1,8(sp)
ffffffffc0209804:	6105                	addi	sp,sp,32
ffffffffc0209806:	8782                	jr	a5
ffffffffc0209808:	60e2                	ld	ra,24(sp)
ffffffffc020980a:	6442                	ld	s0,16(sp)
ffffffffc020980c:	64a2                	ld	s1,8(sp)
ffffffffc020980e:	4501                	li	a0,0
ffffffffc0209810:	6105                	addi	sp,sp,32
ffffffffc0209812:	8082                	ret
ffffffffc0209814:	5575                	li	a0,-3
ffffffffc0209816:	8082                	ret
ffffffffc0209818:	00005697          	auipc	a3,0x5
ffffffffc020981c:	65868693          	addi	a3,a3,1624 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc0209820:	00002617          	auipc	a2,0x2
ffffffffc0209824:	10060613          	addi	a2,a2,256 # ffffffffc020b920 <commands+0x210>
ffffffffc0209828:	3a300593          	li	a1,931
ffffffffc020982c:	00005517          	auipc	a0,0x5
ffffffffc0209830:	67c50513          	addi	a0,a0,1660 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209834:	c6bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209838:	00005697          	auipc	a3,0x5
ffffffffc020983c:	ec068693          	addi	a3,a3,-320 # ffffffffc020e6f8 <syscalls+0xc48>
ffffffffc0209840:	00002617          	auipc	a2,0x2
ffffffffc0209844:	0e060613          	addi	a2,a2,224 # ffffffffc020b920 <commands+0x210>
ffffffffc0209848:	3a500593          	li	a1,933
ffffffffc020984c:	00005517          	auipc	a0,0x5
ffffffffc0209850:	65c50513          	addi	a0,a0,1628 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209854:	c4bf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209858 <sfs_close>:
ffffffffc0209858:	1141                	addi	sp,sp,-16
ffffffffc020985a:	e406                	sd	ra,8(sp)
ffffffffc020985c:	e022                	sd	s0,0(sp)
ffffffffc020985e:	c11d                	beqz	a0,ffffffffc0209884 <sfs_close+0x2c>
ffffffffc0209860:	793c                	ld	a5,112(a0)
ffffffffc0209862:	842a                	mv	s0,a0
ffffffffc0209864:	c385                	beqz	a5,ffffffffc0209884 <sfs_close+0x2c>
ffffffffc0209866:	7b9c                	ld	a5,48(a5)
ffffffffc0209868:	cf91                	beqz	a5,ffffffffc0209884 <sfs_close+0x2c>
ffffffffc020986a:	00004597          	auipc	a1,0x4
ffffffffc020986e:	a3e58593          	addi	a1,a1,-1474 # ffffffffc020d2a8 <default_pmm_manager+0xea0>
ffffffffc0209872:	f99fd0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc0209876:	783c                	ld	a5,112(s0)
ffffffffc0209878:	8522                	mv	a0,s0
ffffffffc020987a:	6402                	ld	s0,0(sp)
ffffffffc020987c:	60a2                	ld	ra,8(sp)
ffffffffc020987e:	7b9c                	ld	a5,48(a5)
ffffffffc0209880:	0141                	addi	sp,sp,16
ffffffffc0209882:	8782                	jr	a5
ffffffffc0209884:	00004697          	auipc	a3,0x4
ffffffffc0209888:	9d468693          	addi	a3,a3,-1580 # ffffffffc020d258 <default_pmm_manager+0xe50>
ffffffffc020988c:	00002617          	auipc	a2,0x2
ffffffffc0209890:	09460613          	addi	a2,a2,148 # ffffffffc020b920 <commands+0x210>
ffffffffc0209894:	21c00593          	li	a1,540
ffffffffc0209898:	00005517          	auipc	a0,0x5
ffffffffc020989c:	61050513          	addi	a0,a0,1552 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc02098a0:	bfff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098a4 <sfs_io.part.0>:
ffffffffc02098a4:	1141                	addi	sp,sp,-16
ffffffffc02098a6:	00005697          	auipc	a3,0x5
ffffffffc02098aa:	5ca68693          	addi	a3,a3,1482 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc02098ae:	00002617          	auipc	a2,0x2
ffffffffc02098b2:	07260613          	addi	a2,a2,114 # ffffffffc020b920 <commands+0x210>
ffffffffc02098b6:	2a000593          	li	a1,672
ffffffffc02098ba:	00005517          	auipc	a0,0x5
ffffffffc02098be:	5ee50513          	addi	a0,a0,1518 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc02098c2:	e406                	sd	ra,8(sp)
ffffffffc02098c4:	bdbf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098c8 <sfs_block_free>:
ffffffffc02098c8:	1101                	addi	sp,sp,-32
ffffffffc02098ca:	e426                	sd	s1,8(sp)
ffffffffc02098cc:	ec06                	sd	ra,24(sp)
ffffffffc02098ce:	e822                	sd	s0,16(sp)
ffffffffc02098d0:	4154                	lw	a3,4(a0)
ffffffffc02098d2:	84ae                	mv	s1,a1
ffffffffc02098d4:	c595                	beqz	a1,ffffffffc0209900 <sfs_block_free+0x38>
ffffffffc02098d6:	02d5f563          	bgeu	a1,a3,ffffffffc0209900 <sfs_block_free+0x38>
ffffffffc02098da:	842a                	mv	s0,a0
ffffffffc02098dc:	7d08                	ld	a0,56(a0)
ffffffffc02098de:	edcff0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc02098e2:	ed05                	bnez	a0,ffffffffc020991a <sfs_block_free+0x52>
ffffffffc02098e4:	7c08                	ld	a0,56(s0)
ffffffffc02098e6:	85a6                	mv	a1,s1
ffffffffc02098e8:	efaff0ef          	jal	ra,ffffffffc0208fe2 <bitmap_free>
ffffffffc02098ec:	441c                	lw	a5,8(s0)
ffffffffc02098ee:	4705                	li	a4,1
ffffffffc02098f0:	60e2                	ld	ra,24(sp)
ffffffffc02098f2:	2785                	addiw	a5,a5,1
ffffffffc02098f4:	e038                	sd	a4,64(s0)
ffffffffc02098f6:	c41c                	sw	a5,8(s0)
ffffffffc02098f8:	6442                	ld	s0,16(sp)
ffffffffc02098fa:	64a2                	ld	s1,8(sp)
ffffffffc02098fc:	6105                	addi	sp,sp,32
ffffffffc02098fe:	8082                	ret
ffffffffc0209900:	8726                	mv	a4,s1
ffffffffc0209902:	00005617          	auipc	a2,0x5
ffffffffc0209906:	5d660613          	addi	a2,a2,1494 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc020990a:	05300593          	li	a1,83
ffffffffc020990e:	00005517          	auipc	a0,0x5
ffffffffc0209912:	59a50513          	addi	a0,a0,1434 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209916:	b89f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020991a:	00005697          	auipc	a3,0x5
ffffffffc020991e:	5f668693          	addi	a3,a3,1526 # ffffffffc020ef10 <dev_node_ops+0x628>
ffffffffc0209922:	00002617          	auipc	a2,0x2
ffffffffc0209926:	ffe60613          	addi	a2,a2,-2 # ffffffffc020b920 <commands+0x210>
ffffffffc020992a:	06a00593          	li	a1,106
ffffffffc020992e:	00005517          	auipc	a0,0x5
ffffffffc0209932:	57a50513          	addi	a0,a0,1402 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209936:	b69f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020993a <sfs_reclaim>:
ffffffffc020993a:	1101                	addi	sp,sp,-32
ffffffffc020993c:	e426                	sd	s1,8(sp)
ffffffffc020993e:	7524                	ld	s1,104(a0)
ffffffffc0209940:	ec06                	sd	ra,24(sp)
ffffffffc0209942:	e822                	sd	s0,16(sp)
ffffffffc0209944:	e04a                	sd	s2,0(sp)
ffffffffc0209946:	0e048a63          	beqz	s1,ffffffffc0209a3a <sfs_reclaim+0x100>
ffffffffc020994a:	0b04a783          	lw	a5,176(s1)
ffffffffc020994e:	0e079663          	bnez	a5,ffffffffc0209a3a <sfs_reclaim+0x100>
ffffffffc0209952:	4d38                	lw	a4,88(a0)
ffffffffc0209954:	6785                	lui	a5,0x1
ffffffffc0209956:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020995a:	842a                	mv	s0,a0
ffffffffc020995c:	10f71f63          	bne	a4,a5,ffffffffc0209a7a <sfs_reclaim+0x140>
ffffffffc0209960:	8526                	mv	a0,s1
ffffffffc0209962:	586010ef          	jal	ra,ffffffffc020aee8 <lock_sfs_fs>
ffffffffc0209966:	4c1c                	lw	a5,24(s0)
ffffffffc0209968:	0ef05963          	blez	a5,ffffffffc0209a5a <sfs_reclaim+0x120>
ffffffffc020996c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0209970:	cc18                	sw	a4,24(s0)
ffffffffc0209972:	eb59                	bnez	a4,ffffffffc0209a08 <sfs_reclaim+0xce>
ffffffffc0209974:	05c42903          	lw	s2,92(s0)
ffffffffc0209978:	08091863          	bnez	s2,ffffffffc0209a08 <sfs_reclaim+0xce>
ffffffffc020997c:	601c                	ld	a5,0(s0)
ffffffffc020997e:	0067d783          	lhu	a5,6(a5)
ffffffffc0209982:	e785                	bnez	a5,ffffffffc02099aa <sfs_reclaim+0x70>
ffffffffc0209984:	783c                	ld	a5,112(s0)
ffffffffc0209986:	10078a63          	beqz	a5,ffffffffc0209a9a <sfs_reclaim+0x160>
ffffffffc020998a:	73bc                	ld	a5,96(a5)
ffffffffc020998c:	10078763          	beqz	a5,ffffffffc0209a9a <sfs_reclaim+0x160>
ffffffffc0209990:	00005597          	auipc	a1,0x5
ffffffffc0209994:	dc058593          	addi	a1,a1,-576 # ffffffffc020e750 <syscalls+0xca0>
ffffffffc0209998:	8522                	mv	a0,s0
ffffffffc020999a:	e71fd0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc020999e:	783c                	ld	a5,112(s0)
ffffffffc02099a0:	4581                	li	a1,0
ffffffffc02099a2:	8522                	mv	a0,s0
ffffffffc02099a4:	73bc                	ld	a5,96(a5)
ffffffffc02099a6:	9782                	jalr	a5
ffffffffc02099a8:	e559                	bnez	a0,ffffffffc0209a36 <sfs_reclaim+0xfc>
ffffffffc02099aa:	681c                	ld	a5,16(s0)
ffffffffc02099ac:	c39d                	beqz	a5,ffffffffc02099d2 <sfs_reclaim+0x98>
ffffffffc02099ae:	783c                	ld	a5,112(s0)
ffffffffc02099b0:	10078563          	beqz	a5,ffffffffc0209aba <sfs_reclaim+0x180>
ffffffffc02099b4:	7b9c                	ld	a5,48(a5)
ffffffffc02099b6:	10078263          	beqz	a5,ffffffffc0209aba <sfs_reclaim+0x180>
ffffffffc02099ba:	8522                	mv	a0,s0
ffffffffc02099bc:	00004597          	auipc	a1,0x4
ffffffffc02099c0:	8ec58593          	addi	a1,a1,-1812 # ffffffffc020d2a8 <default_pmm_manager+0xea0>
ffffffffc02099c4:	e47fd0ef          	jal	ra,ffffffffc020780a <inode_check>
ffffffffc02099c8:	783c                	ld	a5,112(s0)
ffffffffc02099ca:	8522                	mv	a0,s0
ffffffffc02099cc:	7b9c                	ld	a5,48(a5)
ffffffffc02099ce:	9782                	jalr	a5
ffffffffc02099d0:	e13d                	bnez	a0,ffffffffc0209a36 <sfs_reclaim+0xfc>
ffffffffc02099d2:	7c18                	ld	a4,56(s0)
ffffffffc02099d4:	603c                	ld	a5,64(s0)
ffffffffc02099d6:	8526                	mv	a0,s1
ffffffffc02099d8:	e71c                	sd	a5,8(a4)
ffffffffc02099da:	e398                	sd	a4,0(a5)
ffffffffc02099dc:	6438                	ld	a4,72(s0)
ffffffffc02099de:	683c                	ld	a5,80(s0)
ffffffffc02099e0:	e71c                	sd	a5,8(a4)
ffffffffc02099e2:	e398                	sd	a4,0(a5)
ffffffffc02099e4:	514010ef          	jal	ra,ffffffffc020aef8 <unlock_sfs_fs>
ffffffffc02099e8:	6008                	ld	a0,0(s0)
ffffffffc02099ea:	00655783          	lhu	a5,6(a0)
ffffffffc02099ee:	cb85                	beqz	a5,ffffffffc0209a1e <sfs_reclaim+0xe4>
ffffffffc02099f0:	e4ef80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02099f4:	8522                	mv	a0,s0
ffffffffc02099f6:	da9fd0ef          	jal	ra,ffffffffc020779e <inode_kill>
ffffffffc02099fa:	60e2                	ld	ra,24(sp)
ffffffffc02099fc:	6442                	ld	s0,16(sp)
ffffffffc02099fe:	64a2                	ld	s1,8(sp)
ffffffffc0209a00:	854a                	mv	a0,s2
ffffffffc0209a02:	6902                	ld	s2,0(sp)
ffffffffc0209a04:	6105                	addi	sp,sp,32
ffffffffc0209a06:	8082                	ret
ffffffffc0209a08:	5945                	li	s2,-15
ffffffffc0209a0a:	8526                	mv	a0,s1
ffffffffc0209a0c:	4ec010ef          	jal	ra,ffffffffc020aef8 <unlock_sfs_fs>
ffffffffc0209a10:	60e2                	ld	ra,24(sp)
ffffffffc0209a12:	6442                	ld	s0,16(sp)
ffffffffc0209a14:	64a2                	ld	s1,8(sp)
ffffffffc0209a16:	854a                	mv	a0,s2
ffffffffc0209a18:	6902                	ld	s2,0(sp)
ffffffffc0209a1a:	6105                	addi	sp,sp,32
ffffffffc0209a1c:	8082                	ret
ffffffffc0209a1e:	440c                	lw	a1,8(s0)
ffffffffc0209a20:	8526                	mv	a0,s1
ffffffffc0209a22:	ea7ff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc0209a26:	6008                	ld	a0,0(s0)
ffffffffc0209a28:	5d4c                	lw	a1,60(a0)
ffffffffc0209a2a:	d1f9                	beqz	a1,ffffffffc02099f0 <sfs_reclaim+0xb6>
ffffffffc0209a2c:	8526                	mv	a0,s1
ffffffffc0209a2e:	e9bff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc0209a32:	6008                	ld	a0,0(s0)
ffffffffc0209a34:	bf75                	j	ffffffffc02099f0 <sfs_reclaim+0xb6>
ffffffffc0209a36:	892a                	mv	s2,a0
ffffffffc0209a38:	bfc9                	j	ffffffffc0209a0a <sfs_reclaim+0xd0>
ffffffffc0209a3a:	00005697          	auipc	a3,0x5
ffffffffc0209a3e:	28e68693          	addi	a3,a3,654 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc0209a42:	00002617          	auipc	a2,0x2
ffffffffc0209a46:	ede60613          	addi	a2,a2,-290 # ffffffffc020b920 <commands+0x210>
ffffffffc0209a4a:	36100593          	li	a1,865
ffffffffc0209a4e:	00005517          	auipc	a0,0x5
ffffffffc0209a52:	45a50513          	addi	a0,a0,1114 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209a56:	a49f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a5a:	00005697          	auipc	a3,0x5
ffffffffc0209a5e:	4d668693          	addi	a3,a3,1238 # ffffffffc020ef30 <dev_node_ops+0x648>
ffffffffc0209a62:	00002617          	auipc	a2,0x2
ffffffffc0209a66:	ebe60613          	addi	a2,a2,-322 # ffffffffc020b920 <commands+0x210>
ffffffffc0209a6a:	36700593          	li	a1,871
ffffffffc0209a6e:	00005517          	auipc	a0,0x5
ffffffffc0209a72:	43a50513          	addi	a0,a0,1082 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209a76:	a29f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a7a:	00005697          	auipc	a3,0x5
ffffffffc0209a7e:	3f668693          	addi	a3,a3,1014 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc0209a82:	00002617          	auipc	a2,0x2
ffffffffc0209a86:	e9e60613          	addi	a2,a2,-354 # ffffffffc020b920 <commands+0x210>
ffffffffc0209a8a:	36200593          	li	a1,866
ffffffffc0209a8e:	00005517          	auipc	a0,0x5
ffffffffc0209a92:	41a50513          	addi	a0,a0,1050 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209a96:	a09f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a9a:	00005697          	auipc	a3,0x5
ffffffffc0209a9e:	c5e68693          	addi	a3,a3,-930 # ffffffffc020e6f8 <syscalls+0xc48>
ffffffffc0209aa2:	00002617          	auipc	a2,0x2
ffffffffc0209aa6:	e7e60613          	addi	a2,a2,-386 # ffffffffc020b920 <commands+0x210>
ffffffffc0209aaa:	36c00593          	li	a1,876
ffffffffc0209aae:	00005517          	auipc	a0,0x5
ffffffffc0209ab2:	3fa50513          	addi	a0,a0,1018 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209ab6:	9e9f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209aba:	00003697          	auipc	a3,0x3
ffffffffc0209abe:	79e68693          	addi	a3,a3,1950 # ffffffffc020d258 <default_pmm_manager+0xe50>
ffffffffc0209ac2:	00002617          	auipc	a2,0x2
ffffffffc0209ac6:	e5e60613          	addi	a2,a2,-418 # ffffffffc020b920 <commands+0x210>
ffffffffc0209aca:	37100593          	li	a1,881
ffffffffc0209ace:	00005517          	auipc	a0,0x5
ffffffffc0209ad2:	3da50513          	addi	a0,a0,986 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209ad6:	9c9f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ada <sfs_block_alloc>:
ffffffffc0209ada:	1101                	addi	sp,sp,-32
ffffffffc0209adc:	e822                	sd	s0,16(sp)
ffffffffc0209ade:	842a                	mv	s0,a0
ffffffffc0209ae0:	7d08                	ld	a0,56(a0)
ffffffffc0209ae2:	e426                	sd	s1,8(sp)
ffffffffc0209ae4:	ec06                	sd	ra,24(sp)
ffffffffc0209ae6:	84ae                	mv	s1,a1
ffffffffc0209ae8:	c62ff0ef          	jal	ra,ffffffffc0208f4a <bitmap_alloc>
ffffffffc0209aec:	e90d                	bnez	a0,ffffffffc0209b1e <sfs_block_alloc+0x44>
ffffffffc0209aee:	441c                	lw	a5,8(s0)
ffffffffc0209af0:	cbad                	beqz	a5,ffffffffc0209b62 <sfs_block_alloc+0x88>
ffffffffc0209af2:	37fd                	addiw	a5,a5,-1
ffffffffc0209af4:	c41c                	sw	a5,8(s0)
ffffffffc0209af6:	408c                	lw	a1,0(s1)
ffffffffc0209af8:	4785                	li	a5,1
ffffffffc0209afa:	e03c                	sd	a5,64(s0)
ffffffffc0209afc:	4054                	lw	a3,4(s0)
ffffffffc0209afe:	c58d                	beqz	a1,ffffffffc0209b28 <sfs_block_alloc+0x4e>
ffffffffc0209b00:	02d5f463          	bgeu	a1,a3,ffffffffc0209b28 <sfs_block_alloc+0x4e>
ffffffffc0209b04:	7c08                	ld	a0,56(s0)
ffffffffc0209b06:	cb4ff0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc0209b0a:	ed05                	bnez	a0,ffffffffc0209b42 <sfs_block_alloc+0x68>
ffffffffc0209b0c:	8522                	mv	a0,s0
ffffffffc0209b0e:	6442                	ld	s0,16(sp)
ffffffffc0209b10:	408c                	lw	a1,0(s1)
ffffffffc0209b12:	60e2                	ld	ra,24(sp)
ffffffffc0209b14:	64a2                	ld	s1,8(sp)
ffffffffc0209b16:	4605                	li	a2,1
ffffffffc0209b18:	6105                	addi	sp,sp,32
ffffffffc0209b1a:	36e0106f          	j	ffffffffc020ae88 <sfs_clear_block>
ffffffffc0209b1e:	60e2                	ld	ra,24(sp)
ffffffffc0209b20:	6442                	ld	s0,16(sp)
ffffffffc0209b22:	64a2                	ld	s1,8(sp)
ffffffffc0209b24:	6105                	addi	sp,sp,32
ffffffffc0209b26:	8082                	ret
ffffffffc0209b28:	872e                	mv	a4,a1
ffffffffc0209b2a:	00005617          	auipc	a2,0x5
ffffffffc0209b2e:	3ae60613          	addi	a2,a2,942 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc0209b32:	05300593          	li	a1,83
ffffffffc0209b36:	00005517          	auipc	a0,0x5
ffffffffc0209b3a:	37250513          	addi	a0,a0,882 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209b3e:	961f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b42:	00005697          	auipc	a3,0x5
ffffffffc0209b46:	42668693          	addi	a3,a3,1062 # ffffffffc020ef68 <dev_node_ops+0x680>
ffffffffc0209b4a:	00002617          	auipc	a2,0x2
ffffffffc0209b4e:	dd660613          	addi	a2,a2,-554 # ffffffffc020b920 <commands+0x210>
ffffffffc0209b52:	06100593          	li	a1,97
ffffffffc0209b56:	00005517          	auipc	a0,0x5
ffffffffc0209b5a:	35250513          	addi	a0,a0,850 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209b5e:	941f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b62:	00005697          	auipc	a3,0x5
ffffffffc0209b66:	3e668693          	addi	a3,a3,998 # ffffffffc020ef48 <dev_node_ops+0x660>
ffffffffc0209b6a:	00002617          	auipc	a2,0x2
ffffffffc0209b6e:	db660613          	addi	a2,a2,-586 # ffffffffc020b920 <commands+0x210>
ffffffffc0209b72:	05f00593          	li	a1,95
ffffffffc0209b76:	00005517          	auipc	a0,0x5
ffffffffc0209b7a:	33250513          	addi	a0,a0,818 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209b7e:	921f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b82 <sfs_bmap_load_nolock>:
ffffffffc0209b82:	7159                	addi	sp,sp,-112
ffffffffc0209b84:	f85a                	sd	s6,48(sp)
ffffffffc0209b86:	0005bb03          	ld	s6,0(a1)
ffffffffc0209b8a:	f45e                	sd	s7,40(sp)
ffffffffc0209b8c:	f486                	sd	ra,104(sp)
ffffffffc0209b8e:	008b2b83          	lw	s7,8(s6)
ffffffffc0209b92:	f0a2                	sd	s0,96(sp)
ffffffffc0209b94:	eca6                	sd	s1,88(sp)
ffffffffc0209b96:	e8ca                	sd	s2,80(sp)
ffffffffc0209b98:	e4ce                	sd	s3,72(sp)
ffffffffc0209b9a:	e0d2                	sd	s4,64(sp)
ffffffffc0209b9c:	fc56                	sd	s5,56(sp)
ffffffffc0209b9e:	f062                	sd	s8,32(sp)
ffffffffc0209ba0:	ec66                	sd	s9,24(sp)
ffffffffc0209ba2:	18cbe363          	bltu	s7,a2,ffffffffc0209d28 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209ba6:	47ad                	li	a5,11
ffffffffc0209ba8:	8aae                	mv	s5,a1
ffffffffc0209baa:	8432                	mv	s0,a2
ffffffffc0209bac:	84aa                	mv	s1,a0
ffffffffc0209bae:	89b6                	mv	s3,a3
ffffffffc0209bb0:	04c7f563          	bgeu	a5,a2,ffffffffc0209bfa <sfs_bmap_load_nolock+0x78>
ffffffffc0209bb4:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209bb8:	0007069b          	sext.w	a3,a4
ffffffffc0209bbc:	3ff00793          	li	a5,1023
ffffffffc0209bc0:	1ad7e163          	bltu	a5,a3,ffffffffc0209d62 <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209bc4:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209bc8:	02071793          	slli	a5,a4,0x20
ffffffffc0209bcc:	c602                	sw	zero,12(sp)
ffffffffc0209bce:	c452                	sw	s4,8(sp)
ffffffffc0209bd0:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209bd4:	0e0a1e63          	bnez	s4,ffffffffc0209cd0 <sfs_bmap_load_nolock+0x14e>
ffffffffc0209bd8:	0acb8663          	beq	s7,a2,ffffffffc0209c84 <sfs_bmap_load_nolock+0x102>
ffffffffc0209bdc:	4a01                	li	s4,0
ffffffffc0209bde:	40d4                	lw	a3,4(s1)
ffffffffc0209be0:	8752                	mv	a4,s4
ffffffffc0209be2:	00005617          	auipc	a2,0x5
ffffffffc0209be6:	2f660613          	addi	a2,a2,758 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc0209bea:	05300593          	li	a1,83
ffffffffc0209bee:	00005517          	auipc	a0,0x5
ffffffffc0209bf2:	2ba50513          	addi	a0,a0,698 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209bf6:	8a9f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bfa:	02061793          	slli	a5,a2,0x20
ffffffffc0209bfe:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209c02:	9a5a                	add	s4,s4,s6
ffffffffc0209c04:	00ca2583          	lw	a1,12(s4)
ffffffffc0209c08:	c22e                	sw	a1,4(sp)
ffffffffc0209c0a:	ed99                	bnez	a1,ffffffffc0209c28 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209c0c:	fccb98e3          	bne	s7,a2,ffffffffc0209bdc <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c10:	004c                	addi	a1,sp,4
ffffffffc0209c12:	ec9ff0ef          	jal	ra,ffffffffc0209ada <sfs_block_alloc>
ffffffffc0209c16:	892a                	mv	s2,a0
ffffffffc0209c18:	e921                	bnez	a0,ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c1a:	4592                	lw	a1,4(sp)
ffffffffc0209c1c:	4705                	li	a4,1
ffffffffc0209c1e:	00ba2623          	sw	a1,12(s4)
ffffffffc0209c22:	00eab823          	sd	a4,16(s5)
ffffffffc0209c26:	d9dd                	beqz	a1,ffffffffc0209bdc <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c28:	40d4                	lw	a3,4(s1)
ffffffffc0209c2a:	10d5ff63          	bgeu	a1,a3,ffffffffc0209d48 <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209c2e:	7c88                	ld	a0,56(s1)
ffffffffc0209c30:	b8aff0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc0209c34:	18051363          	bnez	a0,ffffffffc0209dba <sfs_bmap_load_nolock+0x238>
ffffffffc0209c38:	4a12                	lw	s4,4(sp)
ffffffffc0209c3a:	fa0a02e3          	beqz	s4,ffffffffc0209bde <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c3e:	40dc                	lw	a5,4(s1)
ffffffffc0209c40:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209bde <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c44:	7c88                	ld	a0,56(s1)
ffffffffc0209c46:	85d2                	mv	a1,s4
ffffffffc0209c48:	b72ff0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc0209c4c:	12051763          	bnez	a0,ffffffffc0209d7a <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209c50:	008b9763          	bne	s7,s0,ffffffffc0209c5e <sfs_bmap_load_nolock+0xdc>
ffffffffc0209c54:	008b2783          	lw	a5,8(s6)
ffffffffc0209c58:	2785                	addiw	a5,a5,1
ffffffffc0209c5a:	00fb2423          	sw	a5,8(s6)
ffffffffc0209c5e:	4901                	li	s2,0
ffffffffc0209c60:	00098463          	beqz	s3,ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c64:	0149a023          	sw	s4,0(s3)
ffffffffc0209c68:	70a6                	ld	ra,104(sp)
ffffffffc0209c6a:	7406                	ld	s0,96(sp)
ffffffffc0209c6c:	64e6                	ld	s1,88(sp)
ffffffffc0209c6e:	69a6                	ld	s3,72(sp)
ffffffffc0209c70:	6a06                	ld	s4,64(sp)
ffffffffc0209c72:	7ae2                	ld	s5,56(sp)
ffffffffc0209c74:	7b42                	ld	s6,48(sp)
ffffffffc0209c76:	7ba2                	ld	s7,40(sp)
ffffffffc0209c78:	7c02                	ld	s8,32(sp)
ffffffffc0209c7a:	6ce2                	ld	s9,24(sp)
ffffffffc0209c7c:	854a                	mv	a0,s2
ffffffffc0209c7e:	6946                	ld	s2,80(sp)
ffffffffc0209c80:	6165                	addi	sp,sp,112
ffffffffc0209c82:	8082                	ret
ffffffffc0209c84:	002c                	addi	a1,sp,8
ffffffffc0209c86:	e55ff0ef          	jal	ra,ffffffffc0209ada <sfs_block_alloc>
ffffffffc0209c8a:	892a                	mv	s2,a0
ffffffffc0209c8c:	00c10c93          	addi	s9,sp,12
ffffffffc0209c90:	fd61                	bnez	a0,ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c92:	85e6                	mv	a1,s9
ffffffffc0209c94:	8526                	mv	a0,s1
ffffffffc0209c96:	e45ff0ef          	jal	ra,ffffffffc0209ada <sfs_block_alloc>
ffffffffc0209c9a:	892a                	mv	s2,a0
ffffffffc0209c9c:	e925                	bnez	a0,ffffffffc0209d0c <sfs_bmap_load_nolock+0x18a>
ffffffffc0209c9e:	46a2                	lw	a3,8(sp)
ffffffffc0209ca0:	85e6                	mv	a1,s9
ffffffffc0209ca2:	8762                	mv	a4,s8
ffffffffc0209ca4:	4611                	li	a2,4
ffffffffc0209ca6:	8526                	mv	a0,s1
ffffffffc0209ca8:	090010ef          	jal	ra,ffffffffc020ad38 <sfs_wbuf>
ffffffffc0209cac:	45b2                	lw	a1,12(sp)
ffffffffc0209cae:	892a                	mv	s2,a0
ffffffffc0209cb0:	e939                	bnez	a0,ffffffffc0209d06 <sfs_bmap_load_nolock+0x184>
ffffffffc0209cb2:	03cb2683          	lw	a3,60(s6)
ffffffffc0209cb6:	4722                	lw	a4,8(sp)
ffffffffc0209cb8:	c22e                	sw	a1,4(sp)
ffffffffc0209cba:	f6d706e3          	beq	a4,a3,ffffffffc0209c26 <sfs_bmap_load_nolock+0xa4>
ffffffffc0209cbe:	eef1                	bnez	a3,ffffffffc0209d9a <sfs_bmap_load_nolock+0x218>
ffffffffc0209cc0:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209cc4:	4705                	li	a4,1
ffffffffc0209cc6:	00eab823          	sd	a4,16(s5)
ffffffffc0209cca:	f00589e3          	beqz	a1,ffffffffc0209bdc <sfs_bmap_load_nolock+0x5a>
ffffffffc0209cce:	bfa9                	j	ffffffffc0209c28 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209cd0:	00c10c93          	addi	s9,sp,12
ffffffffc0209cd4:	8762                	mv	a4,s8
ffffffffc0209cd6:	86d2                	mv	a3,s4
ffffffffc0209cd8:	4611                	li	a2,4
ffffffffc0209cda:	85e6                	mv	a1,s9
ffffffffc0209cdc:	7dd000ef          	jal	ra,ffffffffc020acb8 <sfs_rbuf>
ffffffffc0209ce0:	892a                	mv	s2,a0
ffffffffc0209ce2:	f159                	bnez	a0,ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209ce4:	45b2                	lw	a1,12(sp)
ffffffffc0209ce6:	e995                	bnez	a1,ffffffffc0209d1a <sfs_bmap_load_nolock+0x198>
ffffffffc0209ce8:	fa8b85e3          	beq	s7,s0,ffffffffc0209c92 <sfs_bmap_load_nolock+0x110>
ffffffffc0209cec:	03cb2703          	lw	a4,60(s6)
ffffffffc0209cf0:	47a2                	lw	a5,8(sp)
ffffffffc0209cf2:	c202                	sw	zero,4(sp)
ffffffffc0209cf4:	eee784e3          	beq	a5,a4,ffffffffc0209bdc <sfs_bmap_load_nolock+0x5a>
ffffffffc0209cf8:	e34d                	bnez	a4,ffffffffc0209d9a <sfs_bmap_load_nolock+0x218>
ffffffffc0209cfa:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209cfe:	4785                	li	a5,1
ffffffffc0209d00:	00fab823          	sd	a5,16(s5)
ffffffffc0209d04:	bde1                	j	ffffffffc0209bdc <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d06:	8526                	mv	a0,s1
ffffffffc0209d08:	bc1ff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc0209d0c:	45a2                	lw	a1,8(sp)
ffffffffc0209d0e:	f4ba0de3          	beq	s4,a1,ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d12:	8526                	mv	a0,s1
ffffffffc0209d14:	bb5ff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc0209d18:	bf81                	j	ffffffffc0209c68 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d1a:	03cb2683          	lw	a3,60(s6)
ffffffffc0209d1e:	4722                	lw	a4,8(sp)
ffffffffc0209d20:	c22e                	sw	a1,4(sp)
ffffffffc0209d22:	f8e69ee3          	bne	a3,a4,ffffffffc0209cbe <sfs_bmap_load_nolock+0x13c>
ffffffffc0209d26:	b709                	j	ffffffffc0209c28 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209d28:	00005697          	auipc	a3,0x5
ffffffffc0209d2c:	26868693          	addi	a3,a3,616 # ffffffffc020ef90 <dev_node_ops+0x6a8>
ffffffffc0209d30:	00002617          	auipc	a2,0x2
ffffffffc0209d34:	bf060613          	addi	a2,a2,-1040 # ffffffffc020b920 <commands+0x210>
ffffffffc0209d38:	16400593          	li	a1,356
ffffffffc0209d3c:	00005517          	auipc	a0,0x5
ffffffffc0209d40:	16c50513          	addi	a0,a0,364 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209d44:	f5af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d48:	872e                	mv	a4,a1
ffffffffc0209d4a:	00005617          	auipc	a2,0x5
ffffffffc0209d4e:	18e60613          	addi	a2,a2,398 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc0209d52:	05300593          	li	a1,83
ffffffffc0209d56:	00005517          	auipc	a0,0x5
ffffffffc0209d5a:	15250513          	addi	a0,a0,338 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209d5e:	f40f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d62:	00005617          	auipc	a2,0x5
ffffffffc0209d66:	25e60613          	addi	a2,a2,606 # ffffffffc020efc0 <dev_node_ops+0x6d8>
ffffffffc0209d6a:	11e00593          	li	a1,286
ffffffffc0209d6e:	00005517          	auipc	a0,0x5
ffffffffc0209d72:	13a50513          	addi	a0,a0,314 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209d76:	f28f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d7a:	00005697          	auipc	a3,0x5
ffffffffc0209d7e:	19668693          	addi	a3,a3,406 # ffffffffc020ef10 <dev_node_ops+0x628>
ffffffffc0209d82:	00002617          	auipc	a2,0x2
ffffffffc0209d86:	b9e60613          	addi	a2,a2,-1122 # ffffffffc020b920 <commands+0x210>
ffffffffc0209d8a:	16b00593          	li	a1,363
ffffffffc0209d8e:	00005517          	auipc	a0,0x5
ffffffffc0209d92:	11a50513          	addi	a0,a0,282 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209d96:	f08f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d9a:	00005697          	auipc	a3,0x5
ffffffffc0209d9e:	20e68693          	addi	a3,a3,526 # ffffffffc020efa8 <dev_node_ops+0x6c0>
ffffffffc0209da2:	00002617          	auipc	a2,0x2
ffffffffc0209da6:	b7e60613          	addi	a2,a2,-1154 # ffffffffc020b920 <commands+0x210>
ffffffffc0209daa:	11800593          	li	a1,280
ffffffffc0209dae:	00005517          	auipc	a0,0x5
ffffffffc0209db2:	0fa50513          	addi	a0,a0,250 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209db6:	ee8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209dba:	00005697          	auipc	a3,0x5
ffffffffc0209dbe:	23668693          	addi	a3,a3,566 # ffffffffc020eff0 <dev_node_ops+0x708>
ffffffffc0209dc2:	00002617          	auipc	a2,0x2
ffffffffc0209dc6:	b5e60613          	addi	a2,a2,-1186 # ffffffffc020b920 <commands+0x210>
ffffffffc0209dca:	12100593          	li	a1,289
ffffffffc0209dce:	00005517          	auipc	a0,0x5
ffffffffc0209dd2:	0da50513          	addi	a0,a0,218 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209dd6:	ec8f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209dda <sfs_io_nolock>:
ffffffffc0209dda:	7175                	addi	sp,sp,-144
ffffffffc0209ddc:	f0d2                	sd	s4,96(sp)
ffffffffc0209dde:	8a2e                	mv	s4,a1
ffffffffc0209de0:	618c                	ld	a1,0(a1)
ffffffffc0209de2:	e506                	sd	ra,136(sp)
ffffffffc0209de4:	e122                	sd	s0,128(sp)
ffffffffc0209de6:	0045d883          	lhu	a7,4(a1)
ffffffffc0209dea:	fca6                	sd	s1,120(sp)
ffffffffc0209dec:	f8ca                	sd	s2,112(sp)
ffffffffc0209dee:	f4ce                	sd	s3,104(sp)
ffffffffc0209df0:	ecd6                	sd	s5,88(sp)
ffffffffc0209df2:	e8da                	sd	s6,80(sp)
ffffffffc0209df4:	e4de                	sd	s7,72(sp)
ffffffffc0209df6:	e0e2                	sd	s8,64(sp)
ffffffffc0209df8:	fc66                	sd	s9,56(sp)
ffffffffc0209dfa:	f86a                	sd	s10,48(sp)
ffffffffc0209dfc:	f46e                	sd	s11,40(sp)
ffffffffc0209dfe:	4809                	li	a6,2
ffffffffc0209e00:	19088763          	beq	a7,a6,ffffffffc0209f8e <sfs_io_nolock+0x1b4>
ffffffffc0209e04:	00073a83          	ld	s5,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc0209e08:	8c3a                	mv	s8,a4
ffffffffc0209e0a:	000c3023          	sd	zero,0(s8)
ffffffffc0209e0e:	08000737          	lui	a4,0x8000
ffffffffc0209e12:	84b6                	mv	s1,a3
ffffffffc0209e14:	8d36                	mv	s10,a3
ffffffffc0209e16:	9ab6                	add	s5,s5,a3
ffffffffc0209e18:	16e6f963          	bgeu	a3,a4,ffffffffc0209f8a <sfs_io_nolock+0x1b0>
ffffffffc0209e1c:	16dac763          	blt	s5,a3,ffffffffc0209f8a <sfs_io_nolock+0x1b0>
ffffffffc0209e20:	892a                	mv	s2,a0
ffffffffc0209e22:	4501                	li	a0,0
ffffffffc0209e24:	0d568163          	beq	a3,s5,ffffffffc0209ee6 <sfs_io_nolock+0x10c>
ffffffffc0209e28:	8432                	mv	s0,a2
ffffffffc0209e2a:	01577463          	bgeu	a4,s5,ffffffffc0209e32 <sfs_io_nolock+0x58>
ffffffffc0209e2e:	08000ab7          	lui	s5,0x8000
ffffffffc0209e32:	cbe9                	beqz	a5,ffffffffc0209f04 <sfs_io_nolock+0x12a>
ffffffffc0209e34:	00001797          	auipc	a5,0x1
ffffffffc0209e38:	f0478793          	addi	a5,a5,-252 # ffffffffc020ad38 <sfs_wbuf>
ffffffffc0209e3c:	00001c97          	auipc	s9,0x1
ffffffffc0209e40:	e1cc8c93          	addi	s9,s9,-484 # ffffffffc020ac58 <sfs_wblock>
ffffffffc0209e44:	e03e                	sd	a5,0(sp)
ffffffffc0209e46:	6705                	lui	a4,0x1
ffffffffc0209e48:	40c4dd93          	srai	s11,s1,0xc
ffffffffc0209e4c:	40cadb13          	srai	s6,s5,0xc
ffffffffc0209e50:	fff70b93          	addi	s7,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209e54:	41bb07bb          	subw	a5,s6,s11
ffffffffc0209e58:	0174fbb3          	and	s7,s1,s7
ffffffffc0209e5c:	8b3e                	mv	s6,a5
ffffffffc0209e5e:	2d81                	sext.w	s11,s11
ffffffffc0209e60:	89de                	mv	s3,s7
ffffffffc0209e62:	020b8b63          	beqz	s7,ffffffffc0209e98 <sfs_io_nolock+0xbe>
ffffffffc0209e66:	409a89b3          	sub	s3,s5,s1
ffffffffc0209e6a:	efd5                	bnez	a5,ffffffffc0209f26 <sfs_io_nolock+0x14c>
ffffffffc0209e6c:	0874                	addi	a3,sp,28
ffffffffc0209e6e:	866e                	mv	a2,s11
ffffffffc0209e70:	85d2                	mv	a1,s4
ffffffffc0209e72:	854a                	mv	a0,s2
ffffffffc0209e74:	e43e                	sd	a5,8(sp)
ffffffffc0209e76:	d0dff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc0209e7a:	e161                	bnez	a0,ffffffffc0209f3a <sfs_io_nolock+0x160>
ffffffffc0209e7c:	46f2                	lw	a3,28(sp)
ffffffffc0209e7e:	6782                	ld	a5,0(sp)
ffffffffc0209e80:	875e                	mv	a4,s7
ffffffffc0209e82:	864e                	mv	a2,s3
ffffffffc0209e84:	85a2                	mv	a1,s0
ffffffffc0209e86:	854a                	mv	a0,s2
ffffffffc0209e88:	9782                	jalr	a5
ffffffffc0209e8a:	e945                	bnez	a0,ffffffffc0209f3a <sfs_io_nolock+0x160>
ffffffffc0209e8c:	67a2                	ld	a5,8(sp)
ffffffffc0209e8e:	cf85                	beqz	a5,ffffffffc0209ec6 <sfs_io_nolock+0xec>
ffffffffc0209e90:	944e                	add	s0,s0,s3
ffffffffc0209e92:	2d85                	addiw	s11,s11,1
ffffffffc0209e94:	fffb079b          	addiw	a5,s6,-1
ffffffffc0209e98:	cfd5                	beqz	a5,ffffffffc0209f54 <sfs_io_nolock+0x17a>
ffffffffc0209e9a:	01b78bbb          	addw	s7,a5,s11
ffffffffc0209e9e:	6b05                	lui	s6,0x1
ffffffffc0209ea0:	a821                	j	ffffffffc0209eb8 <sfs_io_nolock+0xde>
ffffffffc0209ea2:	4672                	lw	a2,28(sp)
ffffffffc0209ea4:	4685                	li	a3,1
ffffffffc0209ea6:	85a2                	mv	a1,s0
ffffffffc0209ea8:	854a                	mv	a0,s2
ffffffffc0209eaa:	9c82                	jalr	s9
ffffffffc0209eac:	ed09                	bnez	a0,ffffffffc0209ec6 <sfs_io_nolock+0xec>
ffffffffc0209eae:	2d85                	addiw	s11,s11,1
ffffffffc0209eb0:	99da                	add	s3,s3,s6
ffffffffc0209eb2:	945a                	add	s0,s0,s6
ffffffffc0209eb4:	0b7d8163          	beq	s11,s7,ffffffffc0209f56 <sfs_io_nolock+0x17c>
ffffffffc0209eb8:	0874                	addi	a3,sp,28
ffffffffc0209eba:	866e                	mv	a2,s11
ffffffffc0209ebc:	85d2                	mv	a1,s4
ffffffffc0209ebe:	854a                	mv	a0,s2
ffffffffc0209ec0:	cc3ff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc0209ec4:	dd79                	beqz	a0,ffffffffc0209ea2 <sfs_io_nolock+0xc8>
ffffffffc0209ec6:	01348d33          	add	s10,s1,s3
ffffffffc0209eca:	000a3783          	ld	a5,0(s4)
ffffffffc0209ece:	013c3023          	sd	s3,0(s8)
ffffffffc0209ed2:	0007e703          	lwu	a4,0(a5)
ffffffffc0209ed6:	01a77863          	bgeu	a4,s10,ffffffffc0209ee6 <sfs_io_nolock+0x10c>
ffffffffc0209eda:	013484bb          	addw	s1,s1,s3
ffffffffc0209ede:	c384                	sw	s1,0(a5)
ffffffffc0209ee0:	4785                	li	a5,1
ffffffffc0209ee2:	00fa3823          	sd	a5,16(s4)
ffffffffc0209ee6:	60aa                	ld	ra,136(sp)
ffffffffc0209ee8:	640a                	ld	s0,128(sp)
ffffffffc0209eea:	74e6                	ld	s1,120(sp)
ffffffffc0209eec:	7946                	ld	s2,112(sp)
ffffffffc0209eee:	79a6                	ld	s3,104(sp)
ffffffffc0209ef0:	7a06                	ld	s4,96(sp)
ffffffffc0209ef2:	6ae6                	ld	s5,88(sp)
ffffffffc0209ef4:	6b46                	ld	s6,80(sp)
ffffffffc0209ef6:	6ba6                	ld	s7,72(sp)
ffffffffc0209ef8:	6c06                	ld	s8,64(sp)
ffffffffc0209efa:	7ce2                	ld	s9,56(sp)
ffffffffc0209efc:	7d42                	ld	s10,48(sp)
ffffffffc0209efe:	7da2                	ld	s11,40(sp)
ffffffffc0209f00:	6149                	addi	sp,sp,144
ffffffffc0209f02:	8082                	ret
ffffffffc0209f04:	0005e783          	lwu	a5,0(a1)
ffffffffc0209f08:	4501                	li	a0,0
ffffffffc0209f0a:	fcf4dee3          	bge	s1,a5,ffffffffc0209ee6 <sfs_io_nolock+0x10c>
ffffffffc0209f0e:	0357c863          	blt	a5,s5,ffffffffc0209f3e <sfs_io_nolock+0x164>
ffffffffc0209f12:	00001797          	auipc	a5,0x1
ffffffffc0209f16:	da678793          	addi	a5,a5,-602 # ffffffffc020acb8 <sfs_rbuf>
ffffffffc0209f1a:	00001c97          	auipc	s9,0x1
ffffffffc0209f1e:	cdec8c93          	addi	s9,s9,-802 # ffffffffc020abf8 <sfs_rblock>
ffffffffc0209f22:	e03e                	sd	a5,0(sp)
ffffffffc0209f24:	b70d                	j	ffffffffc0209e46 <sfs_io_nolock+0x6c>
ffffffffc0209f26:	0874                	addi	a3,sp,28
ffffffffc0209f28:	866e                	mv	a2,s11
ffffffffc0209f2a:	85d2                	mv	a1,s4
ffffffffc0209f2c:	854a                	mv	a0,s2
ffffffffc0209f2e:	417709b3          	sub	s3,a4,s7
ffffffffc0209f32:	e43e                	sd	a5,8(sp)
ffffffffc0209f34:	c4fff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc0209f38:	d131                	beqz	a0,ffffffffc0209e7c <sfs_io_nolock+0xa2>
ffffffffc0209f3a:	4981                	li	s3,0
ffffffffc0209f3c:	b779                	j	ffffffffc0209eca <sfs_io_nolock+0xf0>
ffffffffc0209f3e:	8abe                	mv	s5,a5
ffffffffc0209f40:	00001797          	auipc	a5,0x1
ffffffffc0209f44:	d7878793          	addi	a5,a5,-648 # ffffffffc020acb8 <sfs_rbuf>
ffffffffc0209f48:	00001c97          	auipc	s9,0x1
ffffffffc0209f4c:	cb0c8c93          	addi	s9,s9,-848 # ffffffffc020abf8 <sfs_rblock>
ffffffffc0209f50:	e03e                	sd	a5,0(sp)
ffffffffc0209f52:	bdd5                	j	ffffffffc0209e46 <sfs_io_nolock+0x6c>
ffffffffc0209f54:	8bee                	mv	s7,s11
ffffffffc0209f56:	1ad2                	slli	s5,s5,0x34
ffffffffc0209f58:	034adb13          	srli	s6,s5,0x34
ffffffffc0209f5c:	000a9663          	bnez	s5,ffffffffc0209f68 <sfs_io_nolock+0x18e>
ffffffffc0209f60:	01348d33          	add	s10,s1,s3
ffffffffc0209f64:	4501                	li	a0,0
ffffffffc0209f66:	b795                	j	ffffffffc0209eca <sfs_io_nolock+0xf0>
ffffffffc0209f68:	0874                	addi	a3,sp,28
ffffffffc0209f6a:	865e                	mv	a2,s7
ffffffffc0209f6c:	85d2                	mv	a1,s4
ffffffffc0209f6e:	854a                	mv	a0,s2
ffffffffc0209f70:	c13ff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc0209f74:	f929                	bnez	a0,ffffffffc0209ec6 <sfs_io_nolock+0xec>
ffffffffc0209f76:	46f2                	lw	a3,28(sp)
ffffffffc0209f78:	6782                	ld	a5,0(sp)
ffffffffc0209f7a:	4701                	li	a4,0
ffffffffc0209f7c:	865a                	mv	a2,s6
ffffffffc0209f7e:	85a2                	mv	a1,s0
ffffffffc0209f80:	854a                	mv	a0,s2
ffffffffc0209f82:	9782                	jalr	a5
ffffffffc0209f84:	f129                	bnez	a0,ffffffffc0209ec6 <sfs_io_nolock+0xec>
ffffffffc0209f86:	99da                	add	s3,s3,s6
ffffffffc0209f88:	bf3d                	j	ffffffffc0209ec6 <sfs_io_nolock+0xec>
ffffffffc0209f8a:	5575                	li	a0,-3
ffffffffc0209f8c:	bfa9                	j	ffffffffc0209ee6 <sfs_io_nolock+0x10c>
ffffffffc0209f8e:	00005697          	auipc	a3,0x5
ffffffffc0209f92:	08a68693          	addi	a3,a3,138 # ffffffffc020f018 <dev_node_ops+0x730>
ffffffffc0209f96:	00002617          	auipc	a2,0x2
ffffffffc0209f9a:	98a60613          	addi	a2,a2,-1654 # ffffffffc020b920 <commands+0x210>
ffffffffc0209f9e:	22b00593          	li	a1,555
ffffffffc0209fa2:	00005517          	auipc	a0,0x5
ffffffffc0209fa6:	f0650513          	addi	a0,a0,-250 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc0209faa:	cf4f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209fae <sfs_read>:
ffffffffc0209fae:	7139                	addi	sp,sp,-64
ffffffffc0209fb0:	f04a                	sd	s2,32(sp)
ffffffffc0209fb2:	06853903          	ld	s2,104(a0)
ffffffffc0209fb6:	fc06                	sd	ra,56(sp)
ffffffffc0209fb8:	f822                	sd	s0,48(sp)
ffffffffc0209fba:	f426                	sd	s1,40(sp)
ffffffffc0209fbc:	ec4e                	sd	s3,24(sp)
ffffffffc0209fbe:	04090f63          	beqz	s2,ffffffffc020a01c <sfs_read+0x6e>
ffffffffc0209fc2:	0b092783          	lw	a5,176(s2)
ffffffffc0209fc6:	ebb9                	bnez	a5,ffffffffc020a01c <sfs_read+0x6e>
ffffffffc0209fc8:	4d38                	lw	a4,88(a0)
ffffffffc0209fca:	6785                	lui	a5,0x1
ffffffffc0209fcc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209fd0:	842a                	mv	s0,a0
ffffffffc0209fd2:	06f71563          	bne	a4,a5,ffffffffc020a03c <sfs_read+0x8e>
ffffffffc0209fd6:	02050993          	addi	s3,a0,32
ffffffffc0209fda:	854e                	mv	a0,s3
ffffffffc0209fdc:	84ae                	mv	s1,a1
ffffffffc0209fde:	d86fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0209fe2:	0184b803          	ld	a6,24(s1)
ffffffffc0209fe6:	6494                	ld	a3,8(s1)
ffffffffc0209fe8:	6090                	ld	a2,0(s1)
ffffffffc0209fea:	85a2                	mv	a1,s0
ffffffffc0209fec:	4781                	li	a5,0
ffffffffc0209fee:	0038                	addi	a4,sp,8
ffffffffc0209ff0:	854a                	mv	a0,s2
ffffffffc0209ff2:	e442                	sd	a6,8(sp)
ffffffffc0209ff4:	de7ff0ef          	jal	ra,ffffffffc0209dda <sfs_io_nolock>
ffffffffc0209ff8:	65a2                	ld	a1,8(sp)
ffffffffc0209ffa:	842a                	mv	s0,a0
ffffffffc0209ffc:	ed81                	bnez	a1,ffffffffc020a014 <sfs_read+0x66>
ffffffffc0209ffe:	854e                	mv	a0,s3
ffffffffc020a000:	d60fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a004:	70e2                	ld	ra,56(sp)
ffffffffc020a006:	8522                	mv	a0,s0
ffffffffc020a008:	7442                	ld	s0,48(sp)
ffffffffc020a00a:	74a2                	ld	s1,40(sp)
ffffffffc020a00c:	7902                	ld	s2,32(sp)
ffffffffc020a00e:	69e2                	ld	s3,24(sp)
ffffffffc020a010:	6121                	addi	sp,sp,64
ffffffffc020a012:	8082                	ret
ffffffffc020a014:	8526                	mv	a0,s1
ffffffffc020a016:	c42fb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a01a:	b7d5                	j	ffffffffc0209ffe <sfs_read+0x50>
ffffffffc020a01c:	00005697          	auipc	a3,0x5
ffffffffc020a020:	cac68693          	addi	a3,a3,-852 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020a024:	00002617          	auipc	a2,0x2
ffffffffc020a028:	8fc60613          	addi	a2,a2,-1796 # ffffffffc020b920 <commands+0x210>
ffffffffc020a02c:	29f00593          	li	a1,671
ffffffffc020a030:	00005517          	auipc	a0,0x5
ffffffffc020a034:	e7850513          	addi	a0,a0,-392 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a038:	c66f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a03c:	869ff0ef          	jal	ra,ffffffffc02098a4 <sfs_io.part.0>

ffffffffc020a040 <sfs_write>:
ffffffffc020a040:	7139                	addi	sp,sp,-64
ffffffffc020a042:	f04a                	sd	s2,32(sp)
ffffffffc020a044:	06853903          	ld	s2,104(a0)
ffffffffc020a048:	fc06                	sd	ra,56(sp)
ffffffffc020a04a:	f822                	sd	s0,48(sp)
ffffffffc020a04c:	f426                	sd	s1,40(sp)
ffffffffc020a04e:	ec4e                	sd	s3,24(sp)
ffffffffc020a050:	04090f63          	beqz	s2,ffffffffc020a0ae <sfs_write+0x6e>
ffffffffc020a054:	0b092783          	lw	a5,176(s2)
ffffffffc020a058:	ebb9                	bnez	a5,ffffffffc020a0ae <sfs_write+0x6e>
ffffffffc020a05a:	4d38                	lw	a4,88(a0)
ffffffffc020a05c:	6785                	lui	a5,0x1
ffffffffc020a05e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a062:	842a                	mv	s0,a0
ffffffffc020a064:	06f71563          	bne	a4,a5,ffffffffc020a0ce <sfs_write+0x8e>
ffffffffc020a068:	02050993          	addi	s3,a0,32
ffffffffc020a06c:	854e                	mv	a0,s3
ffffffffc020a06e:	84ae                	mv	s1,a1
ffffffffc020a070:	cf4fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a074:	0184b803          	ld	a6,24(s1)
ffffffffc020a078:	6494                	ld	a3,8(s1)
ffffffffc020a07a:	6090                	ld	a2,0(s1)
ffffffffc020a07c:	85a2                	mv	a1,s0
ffffffffc020a07e:	4785                	li	a5,1
ffffffffc020a080:	0038                	addi	a4,sp,8
ffffffffc020a082:	854a                	mv	a0,s2
ffffffffc020a084:	e442                	sd	a6,8(sp)
ffffffffc020a086:	d55ff0ef          	jal	ra,ffffffffc0209dda <sfs_io_nolock>
ffffffffc020a08a:	65a2                	ld	a1,8(sp)
ffffffffc020a08c:	842a                	mv	s0,a0
ffffffffc020a08e:	ed81                	bnez	a1,ffffffffc020a0a6 <sfs_write+0x66>
ffffffffc020a090:	854e                	mv	a0,s3
ffffffffc020a092:	ccefa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a096:	70e2                	ld	ra,56(sp)
ffffffffc020a098:	8522                	mv	a0,s0
ffffffffc020a09a:	7442                	ld	s0,48(sp)
ffffffffc020a09c:	74a2                	ld	s1,40(sp)
ffffffffc020a09e:	7902                	ld	s2,32(sp)
ffffffffc020a0a0:	69e2                	ld	s3,24(sp)
ffffffffc020a0a2:	6121                	addi	sp,sp,64
ffffffffc020a0a4:	8082                	ret
ffffffffc020a0a6:	8526                	mv	a0,s1
ffffffffc020a0a8:	bb0fb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a0ac:	b7d5                	j	ffffffffc020a090 <sfs_write+0x50>
ffffffffc020a0ae:	00005697          	auipc	a3,0x5
ffffffffc020a0b2:	c1a68693          	addi	a3,a3,-998 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020a0b6:	00002617          	auipc	a2,0x2
ffffffffc020a0ba:	86a60613          	addi	a2,a2,-1942 # ffffffffc020b920 <commands+0x210>
ffffffffc020a0be:	29f00593          	li	a1,671
ffffffffc020a0c2:	00005517          	auipc	a0,0x5
ffffffffc020a0c6:	de650513          	addi	a0,a0,-538 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a0ca:	bd4f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0ce:	fd6ff0ef          	jal	ra,ffffffffc02098a4 <sfs_io.part.0>

ffffffffc020a0d2 <sfs_dirent_read_nolock>:
ffffffffc020a0d2:	6198                	ld	a4,0(a1)
ffffffffc020a0d4:	7179                	addi	sp,sp,-48
ffffffffc020a0d6:	f406                	sd	ra,40(sp)
ffffffffc020a0d8:	00475883          	lhu	a7,4(a4)
ffffffffc020a0dc:	f022                	sd	s0,32(sp)
ffffffffc020a0de:	ec26                	sd	s1,24(sp)
ffffffffc020a0e0:	4809                	li	a6,2
ffffffffc020a0e2:	05089b63          	bne	a7,a6,ffffffffc020a138 <sfs_dirent_read_nolock+0x66>
ffffffffc020a0e6:	4718                	lw	a4,8(a4)
ffffffffc020a0e8:	87b2                	mv	a5,a2
ffffffffc020a0ea:	2601                	sext.w	a2,a2
ffffffffc020a0ec:	04e7f663          	bgeu	a5,a4,ffffffffc020a138 <sfs_dirent_read_nolock+0x66>
ffffffffc020a0f0:	84b6                	mv	s1,a3
ffffffffc020a0f2:	0074                	addi	a3,sp,12
ffffffffc020a0f4:	842a                	mv	s0,a0
ffffffffc020a0f6:	a8dff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc020a0fa:	c511                	beqz	a0,ffffffffc020a106 <sfs_dirent_read_nolock+0x34>
ffffffffc020a0fc:	70a2                	ld	ra,40(sp)
ffffffffc020a0fe:	7402                	ld	s0,32(sp)
ffffffffc020a100:	64e2                	ld	s1,24(sp)
ffffffffc020a102:	6145                	addi	sp,sp,48
ffffffffc020a104:	8082                	ret
ffffffffc020a106:	45b2                	lw	a1,12(sp)
ffffffffc020a108:	4054                	lw	a3,4(s0)
ffffffffc020a10a:	c5b9                	beqz	a1,ffffffffc020a158 <sfs_dirent_read_nolock+0x86>
ffffffffc020a10c:	04d5f663          	bgeu	a1,a3,ffffffffc020a158 <sfs_dirent_read_nolock+0x86>
ffffffffc020a110:	7c08                	ld	a0,56(s0)
ffffffffc020a112:	ea9fe0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc020a116:	ed31                	bnez	a0,ffffffffc020a172 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a118:	46b2                	lw	a3,12(sp)
ffffffffc020a11a:	4701                	li	a4,0
ffffffffc020a11c:	10400613          	li	a2,260
ffffffffc020a120:	85a6                	mv	a1,s1
ffffffffc020a122:	8522                	mv	a0,s0
ffffffffc020a124:	395000ef          	jal	ra,ffffffffc020acb8 <sfs_rbuf>
ffffffffc020a128:	f971                	bnez	a0,ffffffffc020a0fc <sfs_dirent_read_nolock+0x2a>
ffffffffc020a12a:	100481a3          	sb	zero,259(s1)
ffffffffc020a12e:	70a2                	ld	ra,40(sp)
ffffffffc020a130:	7402                	ld	s0,32(sp)
ffffffffc020a132:	64e2                	ld	s1,24(sp)
ffffffffc020a134:	6145                	addi	sp,sp,48
ffffffffc020a136:	8082                	ret
ffffffffc020a138:	00005697          	auipc	a3,0x5
ffffffffc020a13c:	f0068693          	addi	a3,a3,-256 # ffffffffc020f038 <dev_node_ops+0x750>
ffffffffc020a140:	00001617          	auipc	a2,0x1
ffffffffc020a144:	7e060613          	addi	a2,a2,2016 # ffffffffc020b920 <commands+0x210>
ffffffffc020a148:	18e00593          	li	a1,398
ffffffffc020a14c:	00005517          	auipc	a0,0x5
ffffffffc020a150:	d5c50513          	addi	a0,a0,-676 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a154:	b4af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a158:	872e                	mv	a4,a1
ffffffffc020a15a:	00005617          	auipc	a2,0x5
ffffffffc020a15e:	d7e60613          	addi	a2,a2,-642 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc020a162:	05300593          	li	a1,83
ffffffffc020a166:	00005517          	auipc	a0,0x5
ffffffffc020a16a:	d4250513          	addi	a0,a0,-702 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a16e:	b30f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a172:	00005697          	auipc	a3,0x5
ffffffffc020a176:	d9e68693          	addi	a3,a3,-610 # ffffffffc020ef10 <dev_node_ops+0x628>
ffffffffc020a17a:	00001617          	auipc	a2,0x1
ffffffffc020a17e:	7a660613          	addi	a2,a2,1958 # ffffffffc020b920 <commands+0x210>
ffffffffc020a182:	19500593          	li	a1,405
ffffffffc020a186:	00005517          	auipc	a0,0x5
ffffffffc020a18a:	d2250513          	addi	a0,a0,-734 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a18e:	b10f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a192 <sfs_getdirentry>:
ffffffffc020a192:	715d                	addi	sp,sp,-80
ffffffffc020a194:	ec56                	sd	s5,24(sp)
ffffffffc020a196:	8aaa                	mv	s5,a0
ffffffffc020a198:	10400513          	li	a0,260
ffffffffc020a19c:	e85a                	sd	s6,16(sp)
ffffffffc020a19e:	e486                	sd	ra,72(sp)
ffffffffc020a1a0:	e0a2                	sd	s0,64(sp)
ffffffffc020a1a2:	fc26                	sd	s1,56(sp)
ffffffffc020a1a4:	f84a                	sd	s2,48(sp)
ffffffffc020a1a6:	f44e                	sd	s3,40(sp)
ffffffffc020a1a8:	f052                	sd	s4,32(sp)
ffffffffc020a1aa:	e45e                	sd	s7,8(sp)
ffffffffc020a1ac:	e062                	sd	s8,0(sp)
ffffffffc020a1ae:	8b2e                	mv	s6,a1
ffffffffc020a1b0:	ddff70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a1b4:	cd61                	beqz	a0,ffffffffc020a28c <sfs_getdirentry+0xfa>
ffffffffc020a1b6:	068abb83          	ld	s7,104(s5) # 8000068 <_binary_bin_sfs_img_size+0x7f8ad68>
ffffffffc020a1ba:	0c0b8b63          	beqz	s7,ffffffffc020a290 <sfs_getdirentry+0xfe>
ffffffffc020a1be:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a1c2:	e7f9                	bnez	a5,ffffffffc020a290 <sfs_getdirentry+0xfe>
ffffffffc020a1c4:	058aa703          	lw	a4,88(s5)
ffffffffc020a1c8:	6785                	lui	a5,0x1
ffffffffc020a1ca:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a1ce:	0ef71163          	bne	a4,a5,ffffffffc020a2b0 <sfs_getdirentry+0x11e>
ffffffffc020a1d2:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a1d6:	892a                	mv	s2,a0
ffffffffc020a1d8:	0a09c163          	bltz	s3,ffffffffc020a27a <sfs_getdirentry+0xe8>
ffffffffc020a1dc:	0ff9f793          	zext.b	a5,s3
ffffffffc020a1e0:	efc9                	bnez	a5,ffffffffc020a27a <sfs_getdirentry+0xe8>
ffffffffc020a1e2:	000ab783          	ld	a5,0(s5)
ffffffffc020a1e6:	0089d993          	srli	s3,s3,0x8
ffffffffc020a1ea:	2981                	sext.w	s3,s3
ffffffffc020a1ec:	479c                	lw	a5,8(a5)
ffffffffc020a1ee:	0937eb63          	bltu	a5,s3,ffffffffc020a284 <sfs_getdirentry+0xf2>
ffffffffc020a1f2:	020a8c13          	addi	s8,s5,32
ffffffffc020a1f6:	8562                	mv	a0,s8
ffffffffc020a1f8:	b6cfa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a1fc:	000ab783          	ld	a5,0(s5)
ffffffffc020a200:	0087aa03          	lw	s4,8(a5)
ffffffffc020a204:	07405663          	blez	s4,ffffffffc020a270 <sfs_getdirentry+0xde>
ffffffffc020a208:	4481                	li	s1,0
ffffffffc020a20a:	a811                	j	ffffffffc020a21e <sfs_getdirentry+0x8c>
ffffffffc020a20c:	00092783          	lw	a5,0(s2)
ffffffffc020a210:	c781                	beqz	a5,ffffffffc020a218 <sfs_getdirentry+0x86>
ffffffffc020a212:	02098263          	beqz	s3,ffffffffc020a236 <sfs_getdirentry+0xa4>
ffffffffc020a216:	39fd                	addiw	s3,s3,-1
ffffffffc020a218:	2485                	addiw	s1,s1,1
ffffffffc020a21a:	049a0b63          	beq	s4,s1,ffffffffc020a270 <sfs_getdirentry+0xde>
ffffffffc020a21e:	86ca                	mv	a3,s2
ffffffffc020a220:	8626                	mv	a2,s1
ffffffffc020a222:	85d6                	mv	a1,s5
ffffffffc020a224:	855e                	mv	a0,s7
ffffffffc020a226:	eadff0ef          	jal	ra,ffffffffc020a0d2 <sfs_dirent_read_nolock>
ffffffffc020a22a:	842a                	mv	s0,a0
ffffffffc020a22c:	d165                	beqz	a0,ffffffffc020a20c <sfs_getdirentry+0x7a>
ffffffffc020a22e:	8562                	mv	a0,s8
ffffffffc020a230:	b30fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a234:	a831                	j	ffffffffc020a250 <sfs_getdirentry+0xbe>
ffffffffc020a236:	8562                	mv	a0,s8
ffffffffc020a238:	b28fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a23c:	4701                	li	a4,0
ffffffffc020a23e:	4685                	li	a3,1
ffffffffc020a240:	10000613          	li	a2,256
ffffffffc020a244:	00490593          	addi	a1,s2,4
ffffffffc020a248:	855a                	mv	a0,s6
ffffffffc020a24a:	9a2fb0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020a24e:	842a                	mv	s0,a0
ffffffffc020a250:	854a                	mv	a0,s2
ffffffffc020a252:	dedf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a256:	60a6                	ld	ra,72(sp)
ffffffffc020a258:	8522                	mv	a0,s0
ffffffffc020a25a:	6406                	ld	s0,64(sp)
ffffffffc020a25c:	74e2                	ld	s1,56(sp)
ffffffffc020a25e:	7942                	ld	s2,48(sp)
ffffffffc020a260:	79a2                	ld	s3,40(sp)
ffffffffc020a262:	7a02                	ld	s4,32(sp)
ffffffffc020a264:	6ae2                	ld	s5,24(sp)
ffffffffc020a266:	6b42                	ld	s6,16(sp)
ffffffffc020a268:	6ba2                	ld	s7,8(sp)
ffffffffc020a26a:	6c02                	ld	s8,0(sp)
ffffffffc020a26c:	6161                	addi	sp,sp,80
ffffffffc020a26e:	8082                	ret
ffffffffc020a270:	8562                	mv	a0,s8
ffffffffc020a272:	5441                	li	s0,-16
ffffffffc020a274:	aecfa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a278:	bfe1                	j	ffffffffc020a250 <sfs_getdirentry+0xbe>
ffffffffc020a27a:	854a                	mv	a0,s2
ffffffffc020a27c:	dc3f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a280:	5475                	li	s0,-3
ffffffffc020a282:	bfd1                	j	ffffffffc020a256 <sfs_getdirentry+0xc4>
ffffffffc020a284:	dbbf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a288:	5441                	li	s0,-16
ffffffffc020a28a:	b7f1                	j	ffffffffc020a256 <sfs_getdirentry+0xc4>
ffffffffc020a28c:	5471                	li	s0,-4
ffffffffc020a28e:	b7e1                	j	ffffffffc020a256 <sfs_getdirentry+0xc4>
ffffffffc020a290:	00005697          	auipc	a3,0x5
ffffffffc020a294:	a3868693          	addi	a3,a3,-1480 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020a298:	00001617          	auipc	a2,0x1
ffffffffc020a29c:	68860613          	addi	a2,a2,1672 # ffffffffc020b920 <commands+0x210>
ffffffffc020a2a0:	34300593          	li	a1,835
ffffffffc020a2a4:	00005517          	auipc	a0,0x5
ffffffffc020a2a8:	c0450513          	addi	a0,a0,-1020 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a2ac:	9f2f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a2b0:	00005697          	auipc	a3,0x5
ffffffffc020a2b4:	bc068693          	addi	a3,a3,-1088 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020a2b8:	00001617          	auipc	a2,0x1
ffffffffc020a2bc:	66860613          	addi	a2,a2,1640 # ffffffffc020b920 <commands+0x210>
ffffffffc020a2c0:	34400593          	li	a1,836
ffffffffc020a2c4:	00005517          	auipc	a0,0x5
ffffffffc020a2c8:	be450513          	addi	a0,a0,-1052 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a2cc:	9d2f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a2d0 <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a2d0:	715d                	addi	sp,sp,-80
ffffffffc020a2d2:	f052                	sd	s4,32(sp)
ffffffffc020a2d4:	8a2a                	mv	s4,a0
ffffffffc020a2d6:	8532                	mv	a0,a2
ffffffffc020a2d8:	f44e                	sd	s3,40(sp)
ffffffffc020a2da:	e85a                	sd	s6,16(sp)
ffffffffc020a2dc:	e45e                	sd	s7,8(sp)
ffffffffc020a2de:	e486                	sd	ra,72(sp)
ffffffffc020a2e0:	e0a2                	sd	s0,64(sp)
ffffffffc020a2e2:	fc26                	sd	s1,56(sp)
ffffffffc020a2e4:	f84a                	sd	s2,48(sp)
ffffffffc020a2e6:	ec56                	sd	s5,24(sp)
ffffffffc020a2e8:	e062                	sd	s8,0(sp)
ffffffffc020a2ea:	8b32                	mv	s6,a2
ffffffffc020a2ec:	89ae                	mv	s3,a1
ffffffffc020a2ee:	8bb6                	mv	s7,a3
ffffffffc020a2f0:	0aa010ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc020a2f4:	0ff00793          	li	a5,255
ffffffffc020a2f8:	06a7ef63          	bltu	a5,a0,ffffffffc020a376 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a2fc:	10400513          	li	a0,260
ffffffffc020a300:	c8ff70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a304:	892a                	mv	s2,a0
ffffffffc020a306:	c535                	beqz	a0,ffffffffc020a372 <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a308:	0009b783          	ld	a5,0(s3)
ffffffffc020a30c:	0087aa83          	lw	s5,8(a5)
ffffffffc020a310:	05505a63          	blez	s5,ffffffffc020a364 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a314:	4481                	li	s1,0
ffffffffc020a316:	00450c13          	addi	s8,a0,4
ffffffffc020a31a:	a829                	j	ffffffffc020a334 <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a31c:	00092783          	lw	a5,0(s2)
ffffffffc020a320:	c799                	beqz	a5,ffffffffc020a32e <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a322:	85e2                	mv	a1,s8
ffffffffc020a324:	855a                	mv	a0,s6
ffffffffc020a326:	0bc010ef          	jal	ra,ffffffffc020b3e2 <strcmp>
ffffffffc020a32a:	842a                	mv	s0,a0
ffffffffc020a32c:	cd15                	beqz	a0,ffffffffc020a368 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a32e:	2485                	addiw	s1,s1,1
ffffffffc020a330:	029a8a63          	beq	s5,s1,ffffffffc020a364 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a334:	86ca                	mv	a3,s2
ffffffffc020a336:	8626                	mv	a2,s1
ffffffffc020a338:	85ce                	mv	a1,s3
ffffffffc020a33a:	8552                	mv	a0,s4
ffffffffc020a33c:	d97ff0ef          	jal	ra,ffffffffc020a0d2 <sfs_dirent_read_nolock>
ffffffffc020a340:	842a                	mv	s0,a0
ffffffffc020a342:	dd69                	beqz	a0,ffffffffc020a31c <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a344:	854a                	mv	a0,s2
ffffffffc020a346:	cf9f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a34a:	60a6                	ld	ra,72(sp)
ffffffffc020a34c:	8522                	mv	a0,s0
ffffffffc020a34e:	6406                	ld	s0,64(sp)
ffffffffc020a350:	74e2                	ld	s1,56(sp)
ffffffffc020a352:	7942                	ld	s2,48(sp)
ffffffffc020a354:	79a2                	ld	s3,40(sp)
ffffffffc020a356:	7a02                	ld	s4,32(sp)
ffffffffc020a358:	6ae2                	ld	s5,24(sp)
ffffffffc020a35a:	6b42                	ld	s6,16(sp)
ffffffffc020a35c:	6ba2                	ld	s7,8(sp)
ffffffffc020a35e:	6c02                	ld	s8,0(sp)
ffffffffc020a360:	6161                	addi	sp,sp,80
ffffffffc020a362:	8082                	ret
ffffffffc020a364:	5441                	li	s0,-16
ffffffffc020a366:	bff9                	j	ffffffffc020a344 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a368:	00092783          	lw	a5,0(s2)
ffffffffc020a36c:	00fba023          	sw	a5,0(s7)
ffffffffc020a370:	bfd1                	j	ffffffffc020a344 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a372:	5471                	li	s0,-4
ffffffffc020a374:	bfd9                	j	ffffffffc020a34a <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a376:	00005697          	auipc	a3,0x5
ffffffffc020a37a:	d1268693          	addi	a3,a3,-750 # ffffffffc020f088 <dev_node_ops+0x7a0>
ffffffffc020a37e:	00001617          	auipc	a2,0x1
ffffffffc020a382:	5a260613          	addi	a2,a2,1442 # ffffffffc020b920 <commands+0x210>
ffffffffc020a386:	1ba00593          	li	a1,442
ffffffffc020a38a:	00005517          	auipc	a0,0x5
ffffffffc020a38e:	b1e50513          	addi	a0,a0,-1250 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a392:	90cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a396 <sfs_truncfile>:
ffffffffc020a396:	7175                	addi	sp,sp,-144
ffffffffc020a398:	e506                	sd	ra,136(sp)
ffffffffc020a39a:	e122                	sd	s0,128(sp)
ffffffffc020a39c:	fca6                	sd	s1,120(sp)
ffffffffc020a39e:	f8ca                	sd	s2,112(sp)
ffffffffc020a3a0:	f4ce                	sd	s3,104(sp)
ffffffffc020a3a2:	f0d2                	sd	s4,96(sp)
ffffffffc020a3a4:	ecd6                	sd	s5,88(sp)
ffffffffc020a3a6:	e8da                	sd	s6,80(sp)
ffffffffc020a3a8:	e4de                	sd	s7,72(sp)
ffffffffc020a3aa:	e0e2                	sd	s8,64(sp)
ffffffffc020a3ac:	fc66                	sd	s9,56(sp)
ffffffffc020a3ae:	f86a                	sd	s10,48(sp)
ffffffffc020a3b0:	f46e                	sd	s11,40(sp)
ffffffffc020a3b2:	080007b7          	lui	a5,0x8000
ffffffffc020a3b6:	16b7e463          	bltu	a5,a1,ffffffffc020a51e <sfs_truncfile+0x188>
ffffffffc020a3ba:	06853c83          	ld	s9,104(a0)
ffffffffc020a3be:	89aa                	mv	s3,a0
ffffffffc020a3c0:	160c8163          	beqz	s9,ffffffffc020a522 <sfs_truncfile+0x18c>
ffffffffc020a3c4:	0b0ca783          	lw	a5,176(s9)
ffffffffc020a3c8:	14079d63          	bnez	a5,ffffffffc020a522 <sfs_truncfile+0x18c>
ffffffffc020a3cc:	4d38                	lw	a4,88(a0)
ffffffffc020a3ce:	6405                	lui	s0,0x1
ffffffffc020a3d0:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a3d4:	16f71763          	bne	a4,a5,ffffffffc020a542 <sfs_truncfile+0x1ac>
ffffffffc020a3d8:	00053a83          	ld	s5,0(a0)
ffffffffc020a3dc:	147d                	addi	s0,s0,-1
ffffffffc020a3de:	942e                	add	s0,s0,a1
ffffffffc020a3e0:	000ae783          	lwu	a5,0(s5)
ffffffffc020a3e4:	8031                	srli	s0,s0,0xc
ffffffffc020a3e6:	8a2e                	mv	s4,a1
ffffffffc020a3e8:	2401                	sext.w	s0,s0
ffffffffc020a3ea:	02b79763          	bne	a5,a1,ffffffffc020a418 <sfs_truncfile+0x82>
ffffffffc020a3ee:	008aa783          	lw	a5,8(s5)
ffffffffc020a3f2:	4901                	li	s2,0
ffffffffc020a3f4:	18879763          	bne	a5,s0,ffffffffc020a582 <sfs_truncfile+0x1ec>
ffffffffc020a3f8:	60aa                	ld	ra,136(sp)
ffffffffc020a3fa:	640a                	ld	s0,128(sp)
ffffffffc020a3fc:	74e6                	ld	s1,120(sp)
ffffffffc020a3fe:	79a6                	ld	s3,104(sp)
ffffffffc020a400:	7a06                	ld	s4,96(sp)
ffffffffc020a402:	6ae6                	ld	s5,88(sp)
ffffffffc020a404:	6b46                	ld	s6,80(sp)
ffffffffc020a406:	6ba6                	ld	s7,72(sp)
ffffffffc020a408:	6c06                	ld	s8,64(sp)
ffffffffc020a40a:	7ce2                	ld	s9,56(sp)
ffffffffc020a40c:	7d42                	ld	s10,48(sp)
ffffffffc020a40e:	7da2                	ld	s11,40(sp)
ffffffffc020a410:	854a                	mv	a0,s2
ffffffffc020a412:	7946                	ld	s2,112(sp)
ffffffffc020a414:	6149                	addi	sp,sp,144
ffffffffc020a416:	8082                	ret
ffffffffc020a418:	02050b13          	addi	s6,a0,32
ffffffffc020a41c:	855a                	mv	a0,s6
ffffffffc020a41e:	946fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a422:	008aa483          	lw	s1,8(s5)
ffffffffc020a426:	0a84e663          	bltu	s1,s0,ffffffffc020a4d2 <sfs_truncfile+0x13c>
ffffffffc020a42a:	0c947163          	bgeu	s0,s1,ffffffffc020a4ec <sfs_truncfile+0x156>
ffffffffc020a42e:	4dad                	li	s11,11
ffffffffc020a430:	4b85                	li	s7,1
ffffffffc020a432:	a09d                	j	ffffffffc020a498 <sfs_truncfile+0x102>
ffffffffc020a434:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a438:	0009079b          	sext.w	a5,s2
ffffffffc020a43c:	3ff00713          	li	a4,1023
ffffffffc020a440:	04f76563          	bltu	a4,a5,ffffffffc020a48a <sfs_truncfile+0xf4>
ffffffffc020a444:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a448:	040c0163          	beqz	s8,ffffffffc020a48a <sfs_truncfile+0xf4>
ffffffffc020a44c:	004ca783          	lw	a5,4(s9)
ffffffffc020a450:	18fc7963          	bgeu	s8,a5,ffffffffc020a5e2 <sfs_truncfile+0x24c>
ffffffffc020a454:	038cb503          	ld	a0,56(s9)
ffffffffc020a458:	85e2                	mv	a1,s8
ffffffffc020a45a:	b61fe0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc020a45e:	16051263          	bnez	a0,ffffffffc020a5c2 <sfs_truncfile+0x22c>
ffffffffc020a462:	02091793          	slli	a5,s2,0x20
ffffffffc020a466:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a46a:	86e2                	mv	a3,s8
ffffffffc020a46c:	4611                	li	a2,4
ffffffffc020a46e:	082c                	addi	a1,sp,24
ffffffffc020a470:	8566                	mv	a0,s9
ffffffffc020a472:	e43a                	sd	a4,8(sp)
ffffffffc020a474:	ce02                	sw	zero,28(sp)
ffffffffc020a476:	043000ef          	jal	ra,ffffffffc020acb8 <sfs_rbuf>
ffffffffc020a47a:	892a                	mv	s2,a0
ffffffffc020a47c:	e141                	bnez	a0,ffffffffc020a4fc <sfs_truncfile+0x166>
ffffffffc020a47e:	47e2                	lw	a5,24(sp)
ffffffffc020a480:	6722                	ld	a4,8(sp)
ffffffffc020a482:	e3c9                	bnez	a5,ffffffffc020a504 <sfs_truncfile+0x16e>
ffffffffc020a484:	008d2603          	lw	a2,8(s10)
ffffffffc020a488:	367d                	addiw	a2,a2,-1
ffffffffc020a48a:	00cd2423          	sw	a2,8(s10)
ffffffffc020a48e:	0179b823          	sd	s7,16(s3)
ffffffffc020a492:	34fd                	addiw	s1,s1,-1
ffffffffc020a494:	04940a63          	beq	s0,s1,ffffffffc020a4e8 <sfs_truncfile+0x152>
ffffffffc020a498:	0009bd03          	ld	s10,0(s3)
ffffffffc020a49c:	008d2703          	lw	a4,8(s10)
ffffffffc020a4a0:	c369                	beqz	a4,ffffffffc020a562 <sfs_truncfile+0x1cc>
ffffffffc020a4a2:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a4a6:	0007861b          	sext.w	a2,a5
ffffffffc020a4aa:	f8cde5e3          	bltu	s11,a2,ffffffffc020a434 <sfs_truncfile+0x9e>
ffffffffc020a4ae:	02079713          	slli	a4,a5,0x20
ffffffffc020a4b2:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a4b6:	00fd0933          	add	s2,s10,a5
ffffffffc020a4ba:	00c92583          	lw	a1,12(s2)
ffffffffc020a4be:	d5f1                	beqz	a1,ffffffffc020a48a <sfs_truncfile+0xf4>
ffffffffc020a4c0:	8566                	mv	a0,s9
ffffffffc020a4c2:	c06ff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc020a4c6:	00092623          	sw	zero,12(s2)
ffffffffc020a4ca:	008d2603          	lw	a2,8(s10)
ffffffffc020a4ce:	367d                	addiw	a2,a2,-1
ffffffffc020a4d0:	bf6d                	j	ffffffffc020a48a <sfs_truncfile+0xf4>
ffffffffc020a4d2:	4681                	li	a3,0
ffffffffc020a4d4:	8626                	mv	a2,s1
ffffffffc020a4d6:	85ce                	mv	a1,s3
ffffffffc020a4d8:	8566                	mv	a0,s9
ffffffffc020a4da:	ea8ff0ef          	jal	ra,ffffffffc0209b82 <sfs_bmap_load_nolock>
ffffffffc020a4de:	892a                	mv	s2,a0
ffffffffc020a4e0:	ed11                	bnez	a0,ffffffffc020a4fc <sfs_truncfile+0x166>
ffffffffc020a4e2:	2485                	addiw	s1,s1,1
ffffffffc020a4e4:	fe9417e3          	bne	s0,s1,ffffffffc020a4d2 <sfs_truncfile+0x13c>
ffffffffc020a4e8:	008aa483          	lw	s1,8(s5)
ffffffffc020a4ec:	0a941b63          	bne	s0,s1,ffffffffc020a5a2 <sfs_truncfile+0x20c>
ffffffffc020a4f0:	014aa023          	sw	s4,0(s5)
ffffffffc020a4f4:	4785                	li	a5,1
ffffffffc020a4f6:	00f9b823          	sd	a5,16(s3)
ffffffffc020a4fa:	4901                	li	s2,0
ffffffffc020a4fc:	855a                	mv	a0,s6
ffffffffc020a4fe:	862fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a502:	bddd                	j	ffffffffc020a3f8 <sfs_truncfile+0x62>
ffffffffc020a504:	86e2                	mv	a3,s8
ffffffffc020a506:	4611                	li	a2,4
ffffffffc020a508:	086c                	addi	a1,sp,28
ffffffffc020a50a:	8566                	mv	a0,s9
ffffffffc020a50c:	02d000ef          	jal	ra,ffffffffc020ad38 <sfs_wbuf>
ffffffffc020a510:	892a                	mv	s2,a0
ffffffffc020a512:	f56d                	bnez	a0,ffffffffc020a4fc <sfs_truncfile+0x166>
ffffffffc020a514:	45e2                	lw	a1,24(sp)
ffffffffc020a516:	8566                	mv	a0,s9
ffffffffc020a518:	bb0ff0ef          	jal	ra,ffffffffc02098c8 <sfs_block_free>
ffffffffc020a51c:	b7a5                	j	ffffffffc020a484 <sfs_truncfile+0xee>
ffffffffc020a51e:	5975                	li	s2,-3
ffffffffc020a520:	bde1                	j	ffffffffc020a3f8 <sfs_truncfile+0x62>
ffffffffc020a522:	00004697          	auipc	a3,0x4
ffffffffc020a526:	7a668693          	addi	a3,a3,1958 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020a52a:	00001617          	auipc	a2,0x1
ffffffffc020a52e:	3f660613          	addi	a2,a2,1014 # ffffffffc020b920 <commands+0x210>
ffffffffc020a532:	3b200593          	li	a1,946
ffffffffc020a536:	00005517          	auipc	a0,0x5
ffffffffc020a53a:	97250513          	addi	a0,a0,-1678 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a53e:	f61f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a542:	00005697          	auipc	a3,0x5
ffffffffc020a546:	92e68693          	addi	a3,a3,-1746 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020a54a:	00001617          	auipc	a2,0x1
ffffffffc020a54e:	3d660613          	addi	a2,a2,982 # ffffffffc020b920 <commands+0x210>
ffffffffc020a552:	3b300593          	li	a1,947
ffffffffc020a556:	00005517          	auipc	a0,0x5
ffffffffc020a55a:	95250513          	addi	a0,a0,-1710 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a55e:	f41f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a562:	00005697          	auipc	a3,0x5
ffffffffc020a566:	b6668693          	addi	a3,a3,-1178 # ffffffffc020f0c8 <dev_node_ops+0x7e0>
ffffffffc020a56a:	00001617          	auipc	a2,0x1
ffffffffc020a56e:	3b660613          	addi	a2,a2,950 # ffffffffc020b920 <commands+0x210>
ffffffffc020a572:	17b00593          	li	a1,379
ffffffffc020a576:	00005517          	auipc	a0,0x5
ffffffffc020a57a:	93250513          	addi	a0,a0,-1742 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a57e:	f21f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a582:	00005697          	auipc	a3,0x5
ffffffffc020a586:	b2e68693          	addi	a3,a3,-1234 # ffffffffc020f0b0 <dev_node_ops+0x7c8>
ffffffffc020a58a:	00001617          	auipc	a2,0x1
ffffffffc020a58e:	39660613          	addi	a2,a2,918 # ffffffffc020b920 <commands+0x210>
ffffffffc020a592:	3ba00593          	li	a1,954
ffffffffc020a596:	00005517          	auipc	a0,0x5
ffffffffc020a59a:	91250513          	addi	a0,a0,-1774 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a59e:	f01f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5a2:	00005697          	auipc	a3,0x5
ffffffffc020a5a6:	b7668693          	addi	a3,a3,-1162 # ffffffffc020f118 <dev_node_ops+0x830>
ffffffffc020a5aa:	00001617          	auipc	a2,0x1
ffffffffc020a5ae:	37660613          	addi	a2,a2,886 # ffffffffc020b920 <commands+0x210>
ffffffffc020a5b2:	3d300593          	li	a1,979
ffffffffc020a5b6:	00005517          	auipc	a0,0x5
ffffffffc020a5ba:	8f250513          	addi	a0,a0,-1806 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a5be:	ee1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5c2:	00005697          	auipc	a3,0x5
ffffffffc020a5c6:	b1e68693          	addi	a3,a3,-1250 # ffffffffc020f0e0 <dev_node_ops+0x7f8>
ffffffffc020a5ca:	00001617          	auipc	a2,0x1
ffffffffc020a5ce:	35660613          	addi	a2,a2,854 # ffffffffc020b920 <commands+0x210>
ffffffffc020a5d2:	12b00593          	li	a1,299
ffffffffc020a5d6:	00005517          	auipc	a0,0x5
ffffffffc020a5da:	8d250513          	addi	a0,a0,-1838 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a5de:	ec1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5e2:	8762                	mv	a4,s8
ffffffffc020a5e4:	86be                	mv	a3,a5
ffffffffc020a5e6:	00005617          	auipc	a2,0x5
ffffffffc020a5ea:	8f260613          	addi	a2,a2,-1806 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc020a5ee:	05300593          	li	a1,83
ffffffffc020a5f2:	00005517          	auipc	a0,0x5
ffffffffc020a5f6:	8b650513          	addi	a0,a0,-1866 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a5fa:	ea5f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a5fe <sfs_load_inode>:
ffffffffc020a5fe:	7139                	addi	sp,sp,-64
ffffffffc020a600:	fc06                	sd	ra,56(sp)
ffffffffc020a602:	f822                	sd	s0,48(sp)
ffffffffc020a604:	f426                	sd	s1,40(sp)
ffffffffc020a606:	f04a                	sd	s2,32(sp)
ffffffffc020a608:	84b2                	mv	s1,a2
ffffffffc020a60a:	892a                	mv	s2,a0
ffffffffc020a60c:	ec4e                	sd	s3,24(sp)
ffffffffc020a60e:	e852                	sd	s4,16(sp)
ffffffffc020a610:	89ae                	mv	s3,a1
ffffffffc020a612:	e456                	sd	s5,8(sp)
ffffffffc020a614:	0d5000ef          	jal	ra,ffffffffc020aee8 <lock_sfs_fs>
ffffffffc020a618:	45a9                	li	a1,10
ffffffffc020a61a:	8526                	mv	a0,s1
ffffffffc020a61c:	0a893403          	ld	s0,168(s2)
ffffffffc020a620:	0e9000ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc020a624:	02051793          	slli	a5,a0,0x20
ffffffffc020a628:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a62c:	9722                	add	a4,a4,s0
ffffffffc020a62e:	843a                	mv	s0,a4
ffffffffc020a630:	a029                	j	ffffffffc020a63a <sfs_load_inode+0x3c>
ffffffffc020a632:	fc042783          	lw	a5,-64(s0)
ffffffffc020a636:	10978863          	beq	a5,s1,ffffffffc020a746 <sfs_load_inode+0x148>
ffffffffc020a63a:	6400                	ld	s0,8(s0)
ffffffffc020a63c:	fe871be3          	bne	a4,s0,ffffffffc020a632 <sfs_load_inode+0x34>
ffffffffc020a640:	04000513          	li	a0,64
ffffffffc020a644:	94bf70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a648:	8aaa                	mv	s5,a0
ffffffffc020a64a:	16050563          	beqz	a0,ffffffffc020a7b4 <sfs_load_inode+0x1b6>
ffffffffc020a64e:	00492683          	lw	a3,4(s2)
ffffffffc020a652:	18048363          	beqz	s1,ffffffffc020a7d8 <sfs_load_inode+0x1da>
ffffffffc020a656:	18d4f163          	bgeu	s1,a3,ffffffffc020a7d8 <sfs_load_inode+0x1da>
ffffffffc020a65a:	03893503          	ld	a0,56(s2)
ffffffffc020a65e:	85a6                	mv	a1,s1
ffffffffc020a660:	95bfe0ef          	jal	ra,ffffffffc0208fba <bitmap_test>
ffffffffc020a664:	18051763          	bnez	a0,ffffffffc020a7f2 <sfs_load_inode+0x1f4>
ffffffffc020a668:	4701                	li	a4,0
ffffffffc020a66a:	86a6                	mv	a3,s1
ffffffffc020a66c:	04000613          	li	a2,64
ffffffffc020a670:	85d6                	mv	a1,s5
ffffffffc020a672:	854a                	mv	a0,s2
ffffffffc020a674:	644000ef          	jal	ra,ffffffffc020acb8 <sfs_rbuf>
ffffffffc020a678:	842a                	mv	s0,a0
ffffffffc020a67a:	0e051563          	bnez	a0,ffffffffc020a764 <sfs_load_inode+0x166>
ffffffffc020a67e:	006ad783          	lhu	a5,6(s5)
ffffffffc020a682:	12078b63          	beqz	a5,ffffffffc020a7b8 <sfs_load_inode+0x1ba>
ffffffffc020a686:	6405                	lui	s0,0x1
ffffffffc020a688:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a68c:	8e8fd0ef          	jal	ra,ffffffffc0207774 <__alloc_inode>
ffffffffc020a690:	8a2a                	mv	s4,a0
ffffffffc020a692:	c961                	beqz	a0,ffffffffc020a762 <sfs_load_inode+0x164>
ffffffffc020a694:	004ad683          	lhu	a3,4(s5)
ffffffffc020a698:	4785                	li	a5,1
ffffffffc020a69a:	0cf69c63          	bne	a3,a5,ffffffffc020a772 <sfs_load_inode+0x174>
ffffffffc020a69e:	864a                	mv	a2,s2
ffffffffc020a6a0:	00005597          	auipc	a1,0x5
ffffffffc020a6a4:	b8858593          	addi	a1,a1,-1144 # ffffffffc020f228 <sfs_node_fileops>
ffffffffc020a6a8:	8e8fd0ef          	jal	ra,ffffffffc0207790 <inode_init>
ffffffffc020a6ac:	058a2783          	lw	a5,88(s4)
ffffffffc020a6b0:	23540413          	addi	s0,s0,565
ffffffffc020a6b4:	0e879063          	bne	a5,s0,ffffffffc020a794 <sfs_load_inode+0x196>
ffffffffc020a6b8:	4785                	li	a5,1
ffffffffc020a6ba:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a6be:	015a3023          	sd	s5,0(s4)
ffffffffc020a6c2:	009a2423          	sw	s1,8(s4)
ffffffffc020a6c6:	000a3823          	sd	zero,16(s4)
ffffffffc020a6ca:	4585                	li	a1,1
ffffffffc020a6cc:	020a0513          	addi	a0,s4,32
ffffffffc020a6d0:	e8bf90ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020a6d4:	058a2703          	lw	a4,88(s4)
ffffffffc020a6d8:	6785                	lui	a5,0x1
ffffffffc020a6da:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a6de:	14f71663          	bne	a4,a5,ffffffffc020a82a <sfs_load_inode+0x22c>
ffffffffc020a6e2:	0a093703          	ld	a4,160(s2)
ffffffffc020a6e6:	038a0793          	addi	a5,s4,56
ffffffffc020a6ea:	008a2503          	lw	a0,8(s4)
ffffffffc020a6ee:	e31c                	sd	a5,0(a4)
ffffffffc020a6f0:	0af93023          	sd	a5,160(s2)
ffffffffc020a6f4:	09890793          	addi	a5,s2,152
ffffffffc020a6f8:	0a893403          	ld	s0,168(s2)
ffffffffc020a6fc:	45a9                	li	a1,10
ffffffffc020a6fe:	04ea3023          	sd	a4,64(s4)
ffffffffc020a702:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a706:	003000ef          	jal	ra,ffffffffc020af08 <hash32>
ffffffffc020a70a:	02051713          	slli	a4,a0,0x20
ffffffffc020a70e:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a712:	97a2                	add	a5,a5,s0
ffffffffc020a714:	6798                	ld	a4,8(a5)
ffffffffc020a716:	048a0693          	addi	a3,s4,72
ffffffffc020a71a:	e314                	sd	a3,0(a4)
ffffffffc020a71c:	e794                	sd	a3,8(a5)
ffffffffc020a71e:	04ea3823          	sd	a4,80(s4)
ffffffffc020a722:	04fa3423          	sd	a5,72(s4)
ffffffffc020a726:	854a                	mv	a0,s2
ffffffffc020a728:	7d0000ef          	jal	ra,ffffffffc020aef8 <unlock_sfs_fs>
ffffffffc020a72c:	4401                	li	s0,0
ffffffffc020a72e:	0149b023          	sd	s4,0(s3)
ffffffffc020a732:	70e2                	ld	ra,56(sp)
ffffffffc020a734:	8522                	mv	a0,s0
ffffffffc020a736:	7442                	ld	s0,48(sp)
ffffffffc020a738:	74a2                	ld	s1,40(sp)
ffffffffc020a73a:	7902                	ld	s2,32(sp)
ffffffffc020a73c:	69e2                	ld	s3,24(sp)
ffffffffc020a73e:	6a42                	ld	s4,16(sp)
ffffffffc020a740:	6aa2                	ld	s5,8(sp)
ffffffffc020a742:	6121                	addi	sp,sp,64
ffffffffc020a744:	8082                	ret
ffffffffc020a746:	fb840a13          	addi	s4,s0,-72
ffffffffc020a74a:	8552                	mv	a0,s4
ffffffffc020a74c:	8a6fd0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc020a750:	4785                	li	a5,1
ffffffffc020a752:	fcf51ae3          	bne	a0,a5,ffffffffc020a726 <sfs_load_inode+0x128>
ffffffffc020a756:	fd042783          	lw	a5,-48(s0)
ffffffffc020a75a:	2785                	addiw	a5,a5,1
ffffffffc020a75c:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a760:	b7d9                	j	ffffffffc020a726 <sfs_load_inode+0x128>
ffffffffc020a762:	5471                	li	s0,-4
ffffffffc020a764:	8556                	mv	a0,s5
ffffffffc020a766:	8d9f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a76a:	854a                	mv	a0,s2
ffffffffc020a76c:	78c000ef          	jal	ra,ffffffffc020aef8 <unlock_sfs_fs>
ffffffffc020a770:	b7c9                	j	ffffffffc020a732 <sfs_load_inode+0x134>
ffffffffc020a772:	4789                	li	a5,2
ffffffffc020a774:	08f69f63          	bne	a3,a5,ffffffffc020a812 <sfs_load_inode+0x214>
ffffffffc020a778:	864a                	mv	a2,s2
ffffffffc020a77a:	00005597          	auipc	a1,0x5
ffffffffc020a77e:	a2e58593          	addi	a1,a1,-1490 # ffffffffc020f1a8 <sfs_node_dirops>
ffffffffc020a782:	80efd0ef          	jal	ra,ffffffffc0207790 <inode_init>
ffffffffc020a786:	058a2703          	lw	a4,88(s4)
ffffffffc020a78a:	6785                	lui	a5,0x1
ffffffffc020a78c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a790:	f2f704e3          	beq	a4,a5,ffffffffc020a6b8 <sfs_load_inode+0xba>
ffffffffc020a794:	00004697          	auipc	a3,0x4
ffffffffc020a798:	6dc68693          	addi	a3,a3,1756 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020a79c:	00001617          	auipc	a2,0x1
ffffffffc020a7a0:	18460613          	addi	a2,a2,388 # ffffffffc020b920 <commands+0x210>
ffffffffc020a7a4:	07700593          	li	a1,119
ffffffffc020a7a8:	00004517          	auipc	a0,0x4
ffffffffc020a7ac:	70050513          	addi	a0,a0,1792 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a7b0:	ceff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7b4:	5471                	li	s0,-4
ffffffffc020a7b6:	bf55                	j	ffffffffc020a76a <sfs_load_inode+0x16c>
ffffffffc020a7b8:	00005697          	auipc	a3,0x5
ffffffffc020a7bc:	97868693          	addi	a3,a3,-1672 # ffffffffc020f130 <dev_node_ops+0x848>
ffffffffc020a7c0:	00001617          	auipc	a2,0x1
ffffffffc020a7c4:	16060613          	addi	a2,a2,352 # ffffffffc020b920 <commands+0x210>
ffffffffc020a7c8:	0ad00593          	li	a1,173
ffffffffc020a7cc:	00004517          	auipc	a0,0x4
ffffffffc020a7d0:	6dc50513          	addi	a0,a0,1756 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a7d4:	ccbf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7d8:	8726                	mv	a4,s1
ffffffffc020a7da:	00004617          	auipc	a2,0x4
ffffffffc020a7de:	6fe60613          	addi	a2,a2,1790 # ffffffffc020eed8 <dev_node_ops+0x5f0>
ffffffffc020a7e2:	05300593          	li	a1,83
ffffffffc020a7e6:	00004517          	auipc	a0,0x4
ffffffffc020a7ea:	6c250513          	addi	a0,a0,1730 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a7ee:	cb1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7f2:	00004697          	auipc	a3,0x4
ffffffffc020a7f6:	71e68693          	addi	a3,a3,1822 # ffffffffc020ef10 <dev_node_ops+0x628>
ffffffffc020a7fa:	00001617          	auipc	a2,0x1
ffffffffc020a7fe:	12660613          	addi	a2,a2,294 # ffffffffc020b920 <commands+0x210>
ffffffffc020a802:	0a800593          	li	a1,168
ffffffffc020a806:	00004517          	auipc	a0,0x4
ffffffffc020a80a:	6a250513          	addi	a0,a0,1698 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a80e:	c91f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a812:	00004617          	auipc	a2,0x4
ffffffffc020a816:	6ae60613          	addi	a2,a2,1710 # ffffffffc020eec0 <dev_node_ops+0x5d8>
ffffffffc020a81a:	02e00593          	li	a1,46
ffffffffc020a81e:	00004517          	auipc	a0,0x4
ffffffffc020a822:	68a50513          	addi	a0,a0,1674 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a826:	c79f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a82a:	00004697          	auipc	a3,0x4
ffffffffc020a82e:	64668693          	addi	a3,a3,1606 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020a832:	00001617          	auipc	a2,0x1
ffffffffc020a836:	0ee60613          	addi	a2,a2,238 # ffffffffc020b920 <commands+0x210>
ffffffffc020a83a:	0b100593          	li	a1,177
ffffffffc020a83e:	00004517          	auipc	a0,0x4
ffffffffc020a842:	66a50513          	addi	a0,a0,1642 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a846:	c59f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a84a <sfs_lookup>:
ffffffffc020a84a:	7139                	addi	sp,sp,-64
ffffffffc020a84c:	ec4e                	sd	s3,24(sp)
ffffffffc020a84e:	06853983          	ld	s3,104(a0)
ffffffffc020a852:	fc06                	sd	ra,56(sp)
ffffffffc020a854:	f822                	sd	s0,48(sp)
ffffffffc020a856:	f426                	sd	s1,40(sp)
ffffffffc020a858:	f04a                	sd	s2,32(sp)
ffffffffc020a85a:	e852                	sd	s4,16(sp)
ffffffffc020a85c:	0a098c63          	beqz	s3,ffffffffc020a914 <sfs_lookup+0xca>
ffffffffc020a860:	0b09a783          	lw	a5,176(s3)
ffffffffc020a864:	ebc5                	bnez	a5,ffffffffc020a914 <sfs_lookup+0xca>
ffffffffc020a866:	0005c783          	lbu	a5,0(a1)
ffffffffc020a86a:	84ae                	mv	s1,a1
ffffffffc020a86c:	c7c1                	beqz	a5,ffffffffc020a8f4 <sfs_lookup+0xaa>
ffffffffc020a86e:	02f00713          	li	a4,47
ffffffffc020a872:	08e78163          	beq	a5,a4,ffffffffc020a8f4 <sfs_lookup+0xaa>
ffffffffc020a876:	842a                	mv	s0,a0
ffffffffc020a878:	8a32                	mv	s4,a2
ffffffffc020a87a:	f79fc0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc020a87e:	4c38                	lw	a4,88(s0)
ffffffffc020a880:	6785                	lui	a5,0x1
ffffffffc020a882:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a886:	0af71763          	bne	a4,a5,ffffffffc020a934 <sfs_lookup+0xea>
ffffffffc020a88a:	6018                	ld	a4,0(s0)
ffffffffc020a88c:	4789                	li	a5,2
ffffffffc020a88e:	00475703          	lhu	a4,4(a4)
ffffffffc020a892:	04f71c63          	bne	a4,a5,ffffffffc020a8ea <sfs_lookup+0xa0>
ffffffffc020a896:	02040913          	addi	s2,s0,32
ffffffffc020a89a:	854a                	mv	a0,s2
ffffffffc020a89c:	cc9f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a8a0:	8626                	mv	a2,s1
ffffffffc020a8a2:	0054                	addi	a3,sp,4
ffffffffc020a8a4:	85a2                	mv	a1,s0
ffffffffc020a8a6:	854e                	mv	a0,s3
ffffffffc020a8a8:	a29ff0ef          	jal	ra,ffffffffc020a2d0 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a8ac:	84aa                	mv	s1,a0
ffffffffc020a8ae:	854a                	mv	a0,s2
ffffffffc020a8b0:	cb1f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a8b4:	cc89                	beqz	s1,ffffffffc020a8ce <sfs_lookup+0x84>
ffffffffc020a8b6:	8522                	mv	a0,s0
ffffffffc020a8b8:	808fd0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020a8bc:	70e2                	ld	ra,56(sp)
ffffffffc020a8be:	7442                	ld	s0,48(sp)
ffffffffc020a8c0:	7902                	ld	s2,32(sp)
ffffffffc020a8c2:	69e2                	ld	s3,24(sp)
ffffffffc020a8c4:	6a42                	ld	s4,16(sp)
ffffffffc020a8c6:	8526                	mv	a0,s1
ffffffffc020a8c8:	74a2                	ld	s1,40(sp)
ffffffffc020a8ca:	6121                	addi	sp,sp,64
ffffffffc020a8cc:	8082                	ret
ffffffffc020a8ce:	4612                	lw	a2,4(sp)
ffffffffc020a8d0:	002c                	addi	a1,sp,8
ffffffffc020a8d2:	854e                	mv	a0,s3
ffffffffc020a8d4:	d2bff0ef          	jal	ra,ffffffffc020a5fe <sfs_load_inode>
ffffffffc020a8d8:	84aa                	mv	s1,a0
ffffffffc020a8da:	8522                	mv	a0,s0
ffffffffc020a8dc:	fe5fc0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020a8e0:	fcf1                	bnez	s1,ffffffffc020a8bc <sfs_lookup+0x72>
ffffffffc020a8e2:	67a2                	ld	a5,8(sp)
ffffffffc020a8e4:	00fa3023          	sd	a5,0(s4)
ffffffffc020a8e8:	bfd1                	j	ffffffffc020a8bc <sfs_lookup+0x72>
ffffffffc020a8ea:	8522                	mv	a0,s0
ffffffffc020a8ec:	fd5fc0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020a8f0:	54b9                	li	s1,-18
ffffffffc020a8f2:	b7e9                	j	ffffffffc020a8bc <sfs_lookup+0x72>
ffffffffc020a8f4:	00005697          	auipc	a3,0x5
ffffffffc020a8f8:	85468693          	addi	a3,a3,-1964 # ffffffffc020f148 <dev_node_ops+0x860>
ffffffffc020a8fc:	00001617          	auipc	a2,0x1
ffffffffc020a900:	02460613          	addi	a2,a2,36 # ffffffffc020b920 <commands+0x210>
ffffffffc020a904:	3e400593          	li	a1,996
ffffffffc020a908:	00004517          	auipc	a0,0x4
ffffffffc020a90c:	5a050513          	addi	a0,a0,1440 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a910:	b8ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a914:	00004697          	auipc	a3,0x4
ffffffffc020a918:	3b468693          	addi	a3,a3,948 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020a91c:	00001617          	auipc	a2,0x1
ffffffffc020a920:	00460613          	addi	a2,a2,4 # ffffffffc020b920 <commands+0x210>
ffffffffc020a924:	3e300593          	li	a1,995
ffffffffc020a928:	00004517          	auipc	a0,0x4
ffffffffc020a92c:	58050513          	addi	a0,a0,1408 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a930:	b6ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a934:	00004697          	auipc	a3,0x4
ffffffffc020a938:	53c68693          	addi	a3,a3,1340 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020a93c:	00001617          	auipc	a2,0x1
ffffffffc020a940:	fe460613          	addi	a2,a2,-28 # ffffffffc020b920 <commands+0x210>
ffffffffc020a944:	3e600593          	li	a1,998
ffffffffc020a948:	00004517          	auipc	a0,0x4
ffffffffc020a94c:	56050513          	addi	a0,a0,1376 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020a950:	b4ff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a954 <sfs_namefile>:
ffffffffc020a954:	6d98                	ld	a4,24(a1)
ffffffffc020a956:	7175                	addi	sp,sp,-144
ffffffffc020a958:	e506                	sd	ra,136(sp)
ffffffffc020a95a:	e122                	sd	s0,128(sp)
ffffffffc020a95c:	fca6                	sd	s1,120(sp)
ffffffffc020a95e:	f8ca                	sd	s2,112(sp)
ffffffffc020a960:	f4ce                	sd	s3,104(sp)
ffffffffc020a962:	f0d2                	sd	s4,96(sp)
ffffffffc020a964:	ecd6                	sd	s5,88(sp)
ffffffffc020a966:	e8da                	sd	s6,80(sp)
ffffffffc020a968:	e4de                	sd	s7,72(sp)
ffffffffc020a96a:	e0e2                	sd	s8,64(sp)
ffffffffc020a96c:	fc66                	sd	s9,56(sp)
ffffffffc020a96e:	f86a                	sd	s10,48(sp)
ffffffffc020a970:	f46e                	sd	s11,40(sp)
ffffffffc020a972:	e42e                	sd	a1,8(sp)
ffffffffc020a974:	4789                	li	a5,2
ffffffffc020a976:	1ae7f363          	bgeu	a5,a4,ffffffffc020ab1c <sfs_namefile+0x1c8>
ffffffffc020a97a:	89aa                	mv	s3,a0
ffffffffc020a97c:	10400513          	li	a0,260
ffffffffc020a980:	e0ef70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a984:	842a                	mv	s0,a0
ffffffffc020a986:	18050b63          	beqz	a0,ffffffffc020ab1c <sfs_namefile+0x1c8>
ffffffffc020a98a:	0689b483          	ld	s1,104(s3)
ffffffffc020a98e:	1e048963          	beqz	s1,ffffffffc020ab80 <sfs_namefile+0x22c>
ffffffffc020a992:	0b04a783          	lw	a5,176(s1)
ffffffffc020a996:	1e079563          	bnez	a5,ffffffffc020ab80 <sfs_namefile+0x22c>
ffffffffc020a99a:	0589ac83          	lw	s9,88(s3)
ffffffffc020a99e:	6785                	lui	a5,0x1
ffffffffc020a9a0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a9a4:	1afc9e63          	bne	s9,a5,ffffffffc020ab60 <sfs_namefile+0x20c>
ffffffffc020a9a8:	6722                	ld	a4,8(sp)
ffffffffc020a9aa:	854e                	mv	a0,s3
ffffffffc020a9ac:	8ace                	mv	s5,s3
ffffffffc020a9ae:	6f1c                	ld	a5,24(a4)
ffffffffc020a9b0:	00073b03          	ld	s6,0(a4)
ffffffffc020a9b4:	02098a13          	addi	s4,s3,32
ffffffffc020a9b8:	ffe78b93          	addi	s7,a5,-2
ffffffffc020a9bc:	9b3e                	add	s6,s6,a5
ffffffffc020a9be:	00004d17          	auipc	s10,0x4
ffffffffc020a9c2:	7aad0d13          	addi	s10,s10,1962 # ffffffffc020f168 <dev_node_ops+0x880>
ffffffffc020a9c6:	e2dfc0ef          	jal	ra,ffffffffc02077f2 <inode_ref_inc>
ffffffffc020a9ca:	00440c13          	addi	s8,s0,4
ffffffffc020a9ce:	e066                	sd	s9,0(sp)
ffffffffc020a9d0:	8552                	mv	a0,s4
ffffffffc020a9d2:	b93f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a9d6:	0854                	addi	a3,sp,20
ffffffffc020a9d8:	866a                	mv	a2,s10
ffffffffc020a9da:	85d6                	mv	a1,s5
ffffffffc020a9dc:	8526                	mv	a0,s1
ffffffffc020a9de:	8f3ff0ef          	jal	ra,ffffffffc020a2d0 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a9e2:	8daa                	mv	s11,a0
ffffffffc020a9e4:	8552                	mv	a0,s4
ffffffffc020a9e6:	b7bf90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a9ea:	020d8863          	beqz	s11,ffffffffc020aa1a <sfs_namefile+0xc6>
ffffffffc020a9ee:	854e                	mv	a0,s3
ffffffffc020a9f0:	ed1fc0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020a9f4:	8522                	mv	a0,s0
ffffffffc020a9f6:	e48f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a9fa:	60aa                	ld	ra,136(sp)
ffffffffc020a9fc:	640a                	ld	s0,128(sp)
ffffffffc020a9fe:	74e6                	ld	s1,120(sp)
ffffffffc020aa00:	7946                	ld	s2,112(sp)
ffffffffc020aa02:	79a6                	ld	s3,104(sp)
ffffffffc020aa04:	7a06                	ld	s4,96(sp)
ffffffffc020aa06:	6ae6                	ld	s5,88(sp)
ffffffffc020aa08:	6b46                	ld	s6,80(sp)
ffffffffc020aa0a:	6ba6                	ld	s7,72(sp)
ffffffffc020aa0c:	6c06                	ld	s8,64(sp)
ffffffffc020aa0e:	7ce2                	ld	s9,56(sp)
ffffffffc020aa10:	7d42                	ld	s10,48(sp)
ffffffffc020aa12:	856e                	mv	a0,s11
ffffffffc020aa14:	7da2                	ld	s11,40(sp)
ffffffffc020aa16:	6149                	addi	sp,sp,144
ffffffffc020aa18:	8082                	ret
ffffffffc020aa1a:	4652                	lw	a2,20(sp)
ffffffffc020aa1c:	082c                	addi	a1,sp,24
ffffffffc020aa1e:	8526                	mv	a0,s1
ffffffffc020aa20:	bdfff0ef          	jal	ra,ffffffffc020a5fe <sfs_load_inode>
ffffffffc020aa24:	8daa                	mv	s11,a0
ffffffffc020aa26:	f561                	bnez	a0,ffffffffc020a9ee <sfs_namefile+0x9a>
ffffffffc020aa28:	854e                	mv	a0,s3
ffffffffc020aa2a:	008aa903          	lw	s2,8(s5)
ffffffffc020aa2e:	e93fc0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020aa32:	6ce2                	ld	s9,24(sp)
ffffffffc020aa34:	0b3c8463          	beq	s9,s3,ffffffffc020aadc <sfs_namefile+0x188>
ffffffffc020aa38:	100c8463          	beqz	s9,ffffffffc020ab40 <sfs_namefile+0x1ec>
ffffffffc020aa3c:	058ca703          	lw	a4,88(s9)
ffffffffc020aa40:	6782                	ld	a5,0(sp)
ffffffffc020aa42:	0ef71f63          	bne	a4,a5,ffffffffc020ab40 <sfs_namefile+0x1ec>
ffffffffc020aa46:	008ca703          	lw	a4,8(s9)
ffffffffc020aa4a:	8ae6                	mv	s5,s9
ffffffffc020aa4c:	0d270a63          	beq	a4,s2,ffffffffc020ab20 <sfs_namefile+0x1cc>
ffffffffc020aa50:	000cb703          	ld	a4,0(s9)
ffffffffc020aa54:	4789                	li	a5,2
ffffffffc020aa56:	00475703          	lhu	a4,4(a4)
ffffffffc020aa5a:	0cf71363          	bne	a4,a5,ffffffffc020ab20 <sfs_namefile+0x1cc>
ffffffffc020aa5e:	020c8a13          	addi	s4,s9,32
ffffffffc020aa62:	8552                	mv	a0,s4
ffffffffc020aa64:	b01f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020aa68:	000cb703          	ld	a4,0(s9)
ffffffffc020aa6c:	00872983          	lw	s3,8(a4)
ffffffffc020aa70:	01304963          	bgtz	s3,ffffffffc020aa82 <sfs_namefile+0x12e>
ffffffffc020aa74:	a899                	j	ffffffffc020aaca <sfs_namefile+0x176>
ffffffffc020aa76:	4018                	lw	a4,0(s0)
ffffffffc020aa78:	01270e63          	beq	a4,s2,ffffffffc020aa94 <sfs_namefile+0x140>
ffffffffc020aa7c:	2d85                	addiw	s11,s11,1
ffffffffc020aa7e:	05b98663          	beq	s3,s11,ffffffffc020aaca <sfs_namefile+0x176>
ffffffffc020aa82:	86a2                	mv	a3,s0
ffffffffc020aa84:	866e                	mv	a2,s11
ffffffffc020aa86:	85e6                	mv	a1,s9
ffffffffc020aa88:	8526                	mv	a0,s1
ffffffffc020aa8a:	e48ff0ef          	jal	ra,ffffffffc020a0d2 <sfs_dirent_read_nolock>
ffffffffc020aa8e:	872a                	mv	a4,a0
ffffffffc020aa90:	d17d                	beqz	a0,ffffffffc020aa76 <sfs_namefile+0x122>
ffffffffc020aa92:	a82d                	j	ffffffffc020aacc <sfs_namefile+0x178>
ffffffffc020aa94:	8552                	mv	a0,s4
ffffffffc020aa96:	acbf90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020aa9a:	8562                	mv	a0,s8
ffffffffc020aa9c:	0ff000ef          	jal	ra,ffffffffc020b39a <strlen>
ffffffffc020aaa0:	00150793          	addi	a5,a0,1
ffffffffc020aaa4:	862a                	mv	a2,a0
ffffffffc020aaa6:	06fbe863          	bltu	s7,a5,ffffffffc020ab16 <sfs_namefile+0x1c2>
ffffffffc020aaaa:	fff64913          	not	s2,a2
ffffffffc020aaae:	995a                	add	s2,s2,s6
ffffffffc020aab0:	85e2                	mv	a1,s8
ffffffffc020aab2:	854a                	mv	a0,s2
ffffffffc020aab4:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020aab8:	1d7000ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020aabc:	02f00793          	li	a5,47
ffffffffc020aac0:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020aac4:	89e6                	mv	s3,s9
ffffffffc020aac6:	8b4a                	mv	s6,s2
ffffffffc020aac8:	b721                	j	ffffffffc020a9d0 <sfs_namefile+0x7c>
ffffffffc020aaca:	5741                	li	a4,-16
ffffffffc020aacc:	8552                	mv	a0,s4
ffffffffc020aace:	e03a                	sd	a4,0(sp)
ffffffffc020aad0:	a91f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020aad4:	6702                	ld	a4,0(sp)
ffffffffc020aad6:	89e6                	mv	s3,s9
ffffffffc020aad8:	8dba                	mv	s11,a4
ffffffffc020aada:	bf11                	j	ffffffffc020a9ee <sfs_namefile+0x9a>
ffffffffc020aadc:	854e                	mv	a0,s3
ffffffffc020aade:	de3fc0ef          	jal	ra,ffffffffc02078c0 <inode_ref_dec>
ffffffffc020aae2:	64a2                	ld	s1,8(sp)
ffffffffc020aae4:	85da                	mv	a1,s6
ffffffffc020aae6:	6c98                	ld	a4,24(s1)
ffffffffc020aae8:	6088                	ld	a0,0(s1)
ffffffffc020aaea:	1779                	addi	a4,a4,-2
ffffffffc020aaec:	41770bb3          	sub	s7,a4,s7
ffffffffc020aaf0:	865e                	mv	a2,s7
ffffffffc020aaf2:	0505                	addi	a0,a0,1
ffffffffc020aaf4:	15b000ef          	jal	ra,ffffffffc020b44e <memmove>
ffffffffc020aaf8:	02f00713          	li	a4,47
ffffffffc020aafc:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ab00:	955e                	add	a0,a0,s7
ffffffffc020ab02:	00050023          	sb	zero,0(a0)
ffffffffc020ab06:	85de                	mv	a1,s7
ffffffffc020ab08:	8526                	mv	a0,s1
ffffffffc020ab0a:	94ffa0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020ab0e:	8522                	mv	a0,s0
ffffffffc020ab10:	d2ef70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020ab14:	b5dd                	j	ffffffffc020a9fa <sfs_namefile+0xa6>
ffffffffc020ab16:	89e6                	mv	s3,s9
ffffffffc020ab18:	5df1                	li	s11,-4
ffffffffc020ab1a:	bdd1                	j	ffffffffc020a9ee <sfs_namefile+0x9a>
ffffffffc020ab1c:	5df1                	li	s11,-4
ffffffffc020ab1e:	bdf1                	j	ffffffffc020a9fa <sfs_namefile+0xa6>
ffffffffc020ab20:	00004697          	auipc	a3,0x4
ffffffffc020ab24:	65068693          	addi	a3,a3,1616 # ffffffffc020f170 <dev_node_ops+0x888>
ffffffffc020ab28:	00001617          	auipc	a2,0x1
ffffffffc020ab2c:	df860613          	addi	a2,a2,-520 # ffffffffc020b920 <commands+0x210>
ffffffffc020ab30:	30200593          	li	a1,770
ffffffffc020ab34:	00004517          	auipc	a0,0x4
ffffffffc020ab38:	37450513          	addi	a0,a0,884 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020ab3c:	963f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab40:	00004697          	auipc	a3,0x4
ffffffffc020ab44:	33068693          	addi	a3,a3,816 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020ab48:	00001617          	auipc	a2,0x1
ffffffffc020ab4c:	dd860613          	addi	a2,a2,-552 # ffffffffc020b920 <commands+0x210>
ffffffffc020ab50:	30100593          	li	a1,769
ffffffffc020ab54:	00004517          	auipc	a0,0x4
ffffffffc020ab58:	35450513          	addi	a0,a0,852 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020ab5c:	943f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab60:	00004697          	auipc	a3,0x4
ffffffffc020ab64:	31068693          	addi	a3,a3,784 # ffffffffc020ee70 <dev_node_ops+0x588>
ffffffffc020ab68:	00001617          	auipc	a2,0x1
ffffffffc020ab6c:	db860613          	addi	a2,a2,-584 # ffffffffc020b920 <commands+0x210>
ffffffffc020ab70:	2ee00593          	li	a1,750
ffffffffc020ab74:	00004517          	auipc	a0,0x4
ffffffffc020ab78:	33450513          	addi	a0,a0,820 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020ab7c:	923f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab80:	00004697          	auipc	a3,0x4
ffffffffc020ab84:	14868693          	addi	a3,a3,328 # ffffffffc020ecc8 <dev_node_ops+0x3e0>
ffffffffc020ab88:	00001617          	auipc	a2,0x1
ffffffffc020ab8c:	d9860613          	addi	a2,a2,-616 # ffffffffc020b920 <commands+0x210>
ffffffffc020ab90:	2ed00593          	li	a1,749
ffffffffc020ab94:	00004517          	auipc	a0,0x4
ffffffffc020ab98:	31450513          	addi	a0,a0,788 # ffffffffc020eea8 <dev_node_ops+0x5c0>
ffffffffc020ab9c:	903f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020aba0 <sfs_rwblock_nolock>:
ffffffffc020aba0:	7139                	addi	sp,sp,-64
ffffffffc020aba2:	f822                	sd	s0,48(sp)
ffffffffc020aba4:	f426                	sd	s1,40(sp)
ffffffffc020aba6:	fc06                	sd	ra,56(sp)
ffffffffc020aba8:	842a                	mv	s0,a0
ffffffffc020abaa:	84b6                	mv	s1,a3
ffffffffc020abac:	e211                	bnez	a2,ffffffffc020abb0 <sfs_rwblock_nolock+0x10>
ffffffffc020abae:	e715                	bnez	a4,ffffffffc020abda <sfs_rwblock_nolock+0x3a>
ffffffffc020abb0:	405c                	lw	a5,4(s0)
ffffffffc020abb2:	02f67463          	bgeu	a2,a5,ffffffffc020abda <sfs_rwblock_nolock+0x3a>
ffffffffc020abb6:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020abba:	1682                	slli	a3,a3,0x20
ffffffffc020abbc:	6605                	lui	a2,0x1
ffffffffc020abbe:	9281                	srli	a3,a3,0x20
ffffffffc020abc0:	850a                	mv	a0,sp
ffffffffc020abc2:	821fa0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc020abc6:	85aa                	mv	a1,a0
ffffffffc020abc8:	7808                	ld	a0,48(s0)
ffffffffc020abca:	8626                	mv	a2,s1
ffffffffc020abcc:	7118                	ld	a4,32(a0)
ffffffffc020abce:	9702                	jalr	a4
ffffffffc020abd0:	70e2                	ld	ra,56(sp)
ffffffffc020abd2:	7442                	ld	s0,48(sp)
ffffffffc020abd4:	74a2                	ld	s1,40(sp)
ffffffffc020abd6:	6121                	addi	sp,sp,64
ffffffffc020abd8:	8082                	ret
ffffffffc020abda:	00004697          	auipc	a3,0x4
ffffffffc020abde:	6ce68693          	addi	a3,a3,1742 # ffffffffc020f2a8 <sfs_node_fileops+0x80>
ffffffffc020abe2:	00001617          	auipc	a2,0x1
ffffffffc020abe6:	d3e60613          	addi	a2,a2,-706 # ffffffffc020b920 <commands+0x210>
ffffffffc020abea:	45d5                	li	a1,21
ffffffffc020abec:	00004517          	auipc	a0,0x4
ffffffffc020abf0:	6f450513          	addi	a0,a0,1780 # ffffffffc020f2e0 <sfs_node_fileops+0xb8>
ffffffffc020abf4:	8abf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020abf8 <sfs_rblock>:
ffffffffc020abf8:	7139                	addi	sp,sp,-64
ffffffffc020abfa:	ec4e                	sd	s3,24(sp)
ffffffffc020abfc:	89b6                	mv	s3,a3
ffffffffc020abfe:	f822                	sd	s0,48(sp)
ffffffffc020ac00:	f04a                	sd	s2,32(sp)
ffffffffc020ac02:	e852                	sd	s4,16(sp)
ffffffffc020ac04:	fc06                	sd	ra,56(sp)
ffffffffc020ac06:	f426                	sd	s1,40(sp)
ffffffffc020ac08:	e456                	sd	s5,8(sp)
ffffffffc020ac0a:	8a2a                	mv	s4,a0
ffffffffc020ac0c:	892e                	mv	s2,a1
ffffffffc020ac0e:	8432                	mv	s0,a2
ffffffffc020ac10:	2e0000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ac14:	04098063          	beqz	s3,ffffffffc020ac54 <sfs_rblock+0x5c>
ffffffffc020ac18:	013409bb          	addw	s3,s0,s3
ffffffffc020ac1c:	6a85                	lui	s5,0x1
ffffffffc020ac1e:	a021                	j	ffffffffc020ac26 <sfs_rblock+0x2e>
ffffffffc020ac20:	9956                	add	s2,s2,s5
ffffffffc020ac22:	02898963          	beq	s3,s0,ffffffffc020ac54 <sfs_rblock+0x5c>
ffffffffc020ac26:	8622                	mv	a2,s0
ffffffffc020ac28:	85ca                	mv	a1,s2
ffffffffc020ac2a:	4705                	li	a4,1
ffffffffc020ac2c:	4681                	li	a3,0
ffffffffc020ac2e:	8552                	mv	a0,s4
ffffffffc020ac30:	f71ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020ac34:	84aa                	mv	s1,a0
ffffffffc020ac36:	2405                	addiw	s0,s0,1
ffffffffc020ac38:	d565                	beqz	a0,ffffffffc020ac20 <sfs_rblock+0x28>
ffffffffc020ac3a:	8552                	mv	a0,s4
ffffffffc020ac3c:	2c4000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020ac40:	70e2                	ld	ra,56(sp)
ffffffffc020ac42:	7442                	ld	s0,48(sp)
ffffffffc020ac44:	7902                	ld	s2,32(sp)
ffffffffc020ac46:	69e2                	ld	s3,24(sp)
ffffffffc020ac48:	6a42                	ld	s4,16(sp)
ffffffffc020ac4a:	6aa2                	ld	s5,8(sp)
ffffffffc020ac4c:	8526                	mv	a0,s1
ffffffffc020ac4e:	74a2                	ld	s1,40(sp)
ffffffffc020ac50:	6121                	addi	sp,sp,64
ffffffffc020ac52:	8082                	ret
ffffffffc020ac54:	4481                	li	s1,0
ffffffffc020ac56:	b7d5                	j	ffffffffc020ac3a <sfs_rblock+0x42>

ffffffffc020ac58 <sfs_wblock>:
ffffffffc020ac58:	7139                	addi	sp,sp,-64
ffffffffc020ac5a:	ec4e                	sd	s3,24(sp)
ffffffffc020ac5c:	89b6                	mv	s3,a3
ffffffffc020ac5e:	f822                	sd	s0,48(sp)
ffffffffc020ac60:	f04a                	sd	s2,32(sp)
ffffffffc020ac62:	e852                	sd	s4,16(sp)
ffffffffc020ac64:	fc06                	sd	ra,56(sp)
ffffffffc020ac66:	f426                	sd	s1,40(sp)
ffffffffc020ac68:	e456                	sd	s5,8(sp)
ffffffffc020ac6a:	8a2a                	mv	s4,a0
ffffffffc020ac6c:	892e                	mv	s2,a1
ffffffffc020ac6e:	8432                	mv	s0,a2
ffffffffc020ac70:	280000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ac74:	04098063          	beqz	s3,ffffffffc020acb4 <sfs_wblock+0x5c>
ffffffffc020ac78:	013409bb          	addw	s3,s0,s3
ffffffffc020ac7c:	6a85                	lui	s5,0x1
ffffffffc020ac7e:	a021                	j	ffffffffc020ac86 <sfs_wblock+0x2e>
ffffffffc020ac80:	9956                	add	s2,s2,s5
ffffffffc020ac82:	02898963          	beq	s3,s0,ffffffffc020acb4 <sfs_wblock+0x5c>
ffffffffc020ac86:	8622                	mv	a2,s0
ffffffffc020ac88:	85ca                	mv	a1,s2
ffffffffc020ac8a:	4705                	li	a4,1
ffffffffc020ac8c:	4685                	li	a3,1
ffffffffc020ac8e:	8552                	mv	a0,s4
ffffffffc020ac90:	f11ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020ac94:	84aa                	mv	s1,a0
ffffffffc020ac96:	2405                	addiw	s0,s0,1
ffffffffc020ac98:	d565                	beqz	a0,ffffffffc020ac80 <sfs_wblock+0x28>
ffffffffc020ac9a:	8552                	mv	a0,s4
ffffffffc020ac9c:	264000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020aca0:	70e2                	ld	ra,56(sp)
ffffffffc020aca2:	7442                	ld	s0,48(sp)
ffffffffc020aca4:	7902                	ld	s2,32(sp)
ffffffffc020aca6:	69e2                	ld	s3,24(sp)
ffffffffc020aca8:	6a42                	ld	s4,16(sp)
ffffffffc020acaa:	6aa2                	ld	s5,8(sp)
ffffffffc020acac:	8526                	mv	a0,s1
ffffffffc020acae:	74a2                	ld	s1,40(sp)
ffffffffc020acb0:	6121                	addi	sp,sp,64
ffffffffc020acb2:	8082                	ret
ffffffffc020acb4:	4481                	li	s1,0
ffffffffc020acb6:	b7d5                	j	ffffffffc020ac9a <sfs_wblock+0x42>

ffffffffc020acb8 <sfs_rbuf>:
ffffffffc020acb8:	7179                	addi	sp,sp,-48
ffffffffc020acba:	f406                	sd	ra,40(sp)
ffffffffc020acbc:	f022                	sd	s0,32(sp)
ffffffffc020acbe:	ec26                	sd	s1,24(sp)
ffffffffc020acc0:	e84a                	sd	s2,16(sp)
ffffffffc020acc2:	e44e                	sd	s3,8(sp)
ffffffffc020acc4:	e052                	sd	s4,0(sp)
ffffffffc020acc6:	6785                	lui	a5,0x1
ffffffffc020acc8:	04f77863          	bgeu	a4,a5,ffffffffc020ad18 <sfs_rbuf+0x60>
ffffffffc020accc:	84ba                	mv	s1,a4
ffffffffc020acce:	9732                	add	a4,a4,a2
ffffffffc020acd0:	89b2                	mv	s3,a2
ffffffffc020acd2:	04e7e363          	bltu	a5,a4,ffffffffc020ad18 <sfs_rbuf+0x60>
ffffffffc020acd6:	8936                	mv	s2,a3
ffffffffc020acd8:	842a                	mv	s0,a0
ffffffffc020acda:	8a2e                	mv	s4,a1
ffffffffc020acdc:	214000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ace0:	642c                	ld	a1,72(s0)
ffffffffc020ace2:	864a                	mv	a2,s2
ffffffffc020ace4:	4705                	li	a4,1
ffffffffc020ace6:	4681                	li	a3,0
ffffffffc020ace8:	8522                	mv	a0,s0
ffffffffc020acea:	eb7ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020acee:	892a                	mv	s2,a0
ffffffffc020acf0:	cd09                	beqz	a0,ffffffffc020ad0a <sfs_rbuf+0x52>
ffffffffc020acf2:	8522                	mv	a0,s0
ffffffffc020acf4:	20c000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020acf8:	70a2                	ld	ra,40(sp)
ffffffffc020acfa:	7402                	ld	s0,32(sp)
ffffffffc020acfc:	64e2                	ld	s1,24(sp)
ffffffffc020acfe:	69a2                	ld	s3,8(sp)
ffffffffc020ad00:	6a02                	ld	s4,0(sp)
ffffffffc020ad02:	854a                	mv	a0,s2
ffffffffc020ad04:	6942                	ld	s2,16(sp)
ffffffffc020ad06:	6145                	addi	sp,sp,48
ffffffffc020ad08:	8082                	ret
ffffffffc020ad0a:	642c                	ld	a1,72(s0)
ffffffffc020ad0c:	864e                	mv	a2,s3
ffffffffc020ad0e:	8552                	mv	a0,s4
ffffffffc020ad10:	95a6                	add	a1,a1,s1
ffffffffc020ad12:	77c000ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020ad16:	bff1                	j	ffffffffc020acf2 <sfs_rbuf+0x3a>
ffffffffc020ad18:	00004697          	auipc	a3,0x4
ffffffffc020ad1c:	5e068693          	addi	a3,a3,1504 # ffffffffc020f2f8 <sfs_node_fileops+0xd0>
ffffffffc020ad20:	00001617          	auipc	a2,0x1
ffffffffc020ad24:	c0060613          	addi	a2,a2,-1024 # ffffffffc020b920 <commands+0x210>
ffffffffc020ad28:	05500593          	li	a1,85
ffffffffc020ad2c:	00004517          	auipc	a0,0x4
ffffffffc020ad30:	5b450513          	addi	a0,a0,1460 # ffffffffc020f2e0 <sfs_node_fileops+0xb8>
ffffffffc020ad34:	f6af50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ad38 <sfs_wbuf>:
ffffffffc020ad38:	7139                	addi	sp,sp,-64
ffffffffc020ad3a:	fc06                	sd	ra,56(sp)
ffffffffc020ad3c:	f822                	sd	s0,48(sp)
ffffffffc020ad3e:	f426                	sd	s1,40(sp)
ffffffffc020ad40:	f04a                	sd	s2,32(sp)
ffffffffc020ad42:	ec4e                	sd	s3,24(sp)
ffffffffc020ad44:	e852                	sd	s4,16(sp)
ffffffffc020ad46:	e456                	sd	s5,8(sp)
ffffffffc020ad48:	6785                	lui	a5,0x1
ffffffffc020ad4a:	06f77163          	bgeu	a4,a5,ffffffffc020adac <sfs_wbuf+0x74>
ffffffffc020ad4e:	893a                	mv	s2,a4
ffffffffc020ad50:	9732                	add	a4,a4,a2
ffffffffc020ad52:	8a32                	mv	s4,a2
ffffffffc020ad54:	04e7ec63          	bltu	a5,a4,ffffffffc020adac <sfs_wbuf+0x74>
ffffffffc020ad58:	842a                	mv	s0,a0
ffffffffc020ad5a:	89b6                	mv	s3,a3
ffffffffc020ad5c:	8aae                	mv	s5,a1
ffffffffc020ad5e:	192000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ad62:	642c                	ld	a1,72(s0)
ffffffffc020ad64:	4705                	li	a4,1
ffffffffc020ad66:	4681                	li	a3,0
ffffffffc020ad68:	864e                	mv	a2,s3
ffffffffc020ad6a:	8522                	mv	a0,s0
ffffffffc020ad6c:	e35ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020ad70:	84aa                	mv	s1,a0
ffffffffc020ad72:	cd11                	beqz	a0,ffffffffc020ad8e <sfs_wbuf+0x56>
ffffffffc020ad74:	8522                	mv	a0,s0
ffffffffc020ad76:	18a000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020ad7a:	70e2                	ld	ra,56(sp)
ffffffffc020ad7c:	7442                	ld	s0,48(sp)
ffffffffc020ad7e:	7902                	ld	s2,32(sp)
ffffffffc020ad80:	69e2                	ld	s3,24(sp)
ffffffffc020ad82:	6a42                	ld	s4,16(sp)
ffffffffc020ad84:	6aa2                	ld	s5,8(sp)
ffffffffc020ad86:	8526                	mv	a0,s1
ffffffffc020ad88:	74a2                	ld	s1,40(sp)
ffffffffc020ad8a:	6121                	addi	sp,sp,64
ffffffffc020ad8c:	8082                	ret
ffffffffc020ad8e:	6428                	ld	a0,72(s0)
ffffffffc020ad90:	8652                	mv	a2,s4
ffffffffc020ad92:	85d6                	mv	a1,s5
ffffffffc020ad94:	954a                	add	a0,a0,s2
ffffffffc020ad96:	6f8000ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020ad9a:	642c                	ld	a1,72(s0)
ffffffffc020ad9c:	4705                	li	a4,1
ffffffffc020ad9e:	4685                	li	a3,1
ffffffffc020ada0:	864e                	mv	a2,s3
ffffffffc020ada2:	8522                	mv	a0,s0
ffffffffc020ada4:	dfdff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020ada8:	84aa                	mv	s1,a0
ffffffffc020adaa:	b7e9                	j	ffffffffc020ad74 <sfs_wbuf+0x3c>
ffffffffc020adac:	00004697          	auipc	a3,0x4
ffffffffc020adb0:	54c68693          	addi	a3,a3,1356 # ffffffffc020f2f8 <sfs_node_fileops+0xd0>
ffffffffc020adb4:	00001617          	auipc	a2,0x1
ffffffffc020adb8:	b6c60613          	addi	a2,a2,-1172 # ffffffffc020b920 <commands+0x210>
ffffffffc020adbc:	06b00593          	li	a1,107
ffffffffc020adc0:	00004517          	auipc	a0,0x4
ffffffffc020adc4:	52050513          	addi	a0,a0,1312 # ffffffffc020f2e0 <sfs_node_fileops+0xb8>
ffffffffc020adc8:	ed6f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020adcc <sfs_sync_super>:
ffffffffc020adcc:	1101                	addi	sp,sp,-32
ffffffffc020adce:	ec06                	sd	ra,24(sp)
ffffffffc020add0:	e822                	sd	s0,16(sp)
ffffffffc020add2:	e426                	sd	s1,8(sp)
ffffffffc020add4:	842a                	mv	s0,a0
ffffffffc020add6:	11a000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020adda:	6428                	ld	a0,72(s0)
ffffffffc020addc:	6605                	lui	a2,0x1
ffffffffc020adde:	4581                	li	a1,0
ffffffffc020ade0:	65c000ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc020ade4:	6428                	ld	a0,72(s0)
ffffffffc020ade6:	85a2                	mv	a1,s0
ffffffffc020ade8:	02c00613          	li	a2,44
ffffffffc020adec:	6a2000ef          	jal	ra,ffffffffc020b48e <memcpy>
ffffffffc020adf0:	642c                	ld	a1,72(s0)
ffffffffc020adf2:	4701                	li	a4,0
ffffffffc020adf4:	4685                	li	a3,1
ffffffffc020adf6:	4601                	li	a2,0
ffffffffc020adf8:	8522                	mv	a0,s0
ffffffffc020adfa:	da7ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020adfe:	84aa                	mv	s1,a0
ffffffffc020ae00:	8522                	mv	a0,s0
ffffffffc020ae02:	0fe000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020ae06:	60e2                	ld	ra,24(sp)
ffffffffc020ae08:	6442                	ld	s0,16(sp)
ffffffffc020ae0a:	8526                	mv	a0,s1
ffffffffc020ae0c:	64a2                	ld	s1,8(sp)
ffffffffc020ae0e:	6105                	addi	sp,sp,32
ffffffffc020ae10:	8082                	ret

ffffffffc020ae12 <sfs_sync_freemap>:
ffffffffc020ae12:	7139                	addi	sp,sp,-64
ffffffffc020ae14:	ec4e                	sd	s3,24(sp)
ffffffffc020ae16:	e852                	sd	s4,16(sp)
ffffffffc020ae18:	00456983          	lwu	s3,4(a0)
ffffffffc020ae1c:	8a2a                	mv	s4,a0
ffffffffc020ae1e:	7d08                	ld	a0,56(a0)
ffffffffc020ae20:	67a1                	lui	a5,0x8
ffffffffc020ae22:	17fd                	addi	a5,a5,-1
ffffffffc020ae24:	4581                	li	a1,0
ffffffffc020ae26:	f822                	sd	s0,48(sp)
ffffffffc020ae28:	fc06                	sd	ra,56(sp)
ffffffffc020ae2a:	f426                	sd	s1,40(sp)
ffffffffc020ae2c:	f04a                	sd	s2,32(sp)
ffffffffc020ae2e:	e456                	sd	s5,8(sp)
ffffffffc020ae30:	99be                	add	s3,s3,a5
ffffffffc020ae32:	a1cfe0ef          	jal	ra,ffffffffc020904e <bitmap_getdata>
ffffffffc020ae36:	00f9d993          	srli	s3,s3,0xf
ffffffffc020ae3a:	842a                	mv	s0,a0
ffffffffc020ae3c:	8552                	mv	a0,s4
ffffffffc020ae3e:	0b2000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ae42:	04098163          	beqz	s3,ffffffffc020ae84 <sfs_sync_freemap+0x72>
ffffffffc020ae46:	09b2                	slli	s3,s3,0xc
ffffffffc020ae48:	99a2                	add	s3,s3,s0
ffffffffc020ae4a:	4909                	li	s2,2
ffffffffc020ae4c:	6a85                	lui	s5,0x1
ffffffffc020ae4e:	a021                	j	ffffffffc020ae56 <sfs_sync_freemap+0x44>
ffffffffc020ae50:	2905                	addiw	s2,s2,1
ffffffffc020ae52:	02898963          	beq	s3,s0,ffffffffc020ae84 <sfs_sync_freemap+0x72>
ffffffffc020ae56:	85a2                	mv	a1,s0
ffffffffc020ae58:	864a                	mv	a2,s2
ffffffffc020ae5a:	4705                	li	a4,1
ffffffffc020ae5c:	4685                	li	a3,1
ffffffffc020ae5e:	8552                	mv	a0,s4
ffffffffc020ae60:	d41ff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020ae64:	84aa                	mv	s1,a0
ffffffffc020ae66:	9456                	add	s0,s0,s5
ffffffffc020ae68:	d565                	beqz	a0,ffffffffc020ae50 <sfs_sync_freemap+0x3e>
ffffffffc020ae6a:	8552                	mv	a0,s4
ffffffffc020ae6c:	094000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020ae70:	70e2                	ld	ra,56(sp)
ffffffffc020ae72:	7442                	ld	s0,48(sp)
ffffffffc020ae74:	7902                	ld	s2,32(sp)
ffffffffc020ae76:	69e2                	ld	s3,24(sp)
ffffffffc020ae78:	6a42                	ld	s4,16(sp)
ffffffffc020ae7a:	6aa2                	ld	s5,8(sp)
ffffffffc020ae7c:	8526                	mv	a0,s1
ffffffffc020ae7e:	74a2                	ld	s1,40(sp)
ffffffffc020ae80:	6121                	addi	sp,sp,64
ffffffffc020ae82:	8082                	ret
ffffffffc020ae84:	4481                	li	s1,0
ffffffffc020ae86:	b7d5                	j	ffffffffc020ae6a <sfs_sync_freemap+0x58>

ffffffffc020ae88 <sfs_clear_block>:
ffffffffc020ae88:	7179                	addi	sp,sp,-48
ffffffffc020ae8a:	f022                	sd	s0,32(sp)
ffffffffc020ae8c:	e84a                	sd	s2,16(sp)
ffffffffc020ae8e:	e44e                	sd	s3,8(sp)
ffffffffc020ae90:	f406                	sd	ra,40(sp)
ffffffffc020ae92:	89b2                	mv	s3,a2
ffffffffc020ae94:	ec26                	sd	s1,24(sp)
ffffffffc020ae96:	892a                	mv	s2,a0
ffffffffc020ae98:	842e                	mv	s0,a1
ffffffffc020ae9a:	056000ef          	jal	ra,ffffffffc020aef0 <lock_sfs_io>
ffffffffc020ae9e:	04893503          	ld	a0,72(s2)
ffffffffc020aea2:	6605                	lui	a2,0x1
ffffffffc020aea4:	4581                	li	a1,0
ffffffffc020aea6:	596000ef          	jal	ra,ffffffffc020b43c <memset>
ffffffffc020aeaa:	02098d63          	beqz	s3,ffffffffc020aee4 <sfs_clear_block+0x5c>
ffffffffc020aeae:	013409bb          	addw	s3,s0,s3
ffffffffc020aeb2:	a019                	j	ffffffffc020aeb8 <sfs_clear_block+0x30>
ffffffffc020aeb4:	02898863          	beq	s3,s0,ffffffffc020aee4 <sfs_clear_block+0x5c>
ffffffffc020aeb8:	04893583          	ld	a1,72(s2)
ffffffffc020aebc:	8622                	mv	a2,s0
ffffffffc020aebe:	4705                	li	a4,1
ffffffffc020aec0:	4685                	li	a3,1
ffffffffc020aec2:	854a                	mv	a0,s2
ffffffffc020aec4:	cddff0ef          	jal	ra,ffffffffc020aba0 <sfs_rwblock_nolock>
ffffffffc020aec8:	84aa                	mv	s1,a0
ffffffffc020aeca:	2405                	addiw	s0,s0,1
ffffffffc020aecc:	d565                	beqz	a0,ffffffffc020aeb4 <sfs_clear_block+0x2c>
ffffffffc020aece:	854a                	mv	a0,s2
ffffffffc020aed0:	030000ef          	jal	ra,ffffffffc020af00 <unlock_sfs_io>
ffffffffc020aed4:	70a2                	ld	ra,40(sp)
ffffffffc020aed6:	7402                	ld	s0,32(sp)
ffffffffc020aed8:	6942                	ld	s2,16(sp)
ffffffffc020aeda:	69a2                	ld	s3,8(sp)
ffffffffc020aedc:	8526                	mv	a0,s1
ffffffffc020aede:	64e2                	ld	s1,24(sp)
ffffffffc020aee0:	6145                	addi	sp,sp,48
ffffffffc020aee2:	8082                	ret
ffffffffc020aee4:	4481                	li	s1,0
ffffffffc020aee6:	b7e5                	j	ffffffffc020aece <sfs_clear_block+0x46>

ffffffffc020aee8 <lock_sfs_fs>:
ffffffffc020aee8:	05050513          	addi	a0,a0,80
ffffffffc020aeec:	e78f906f          	j	ffffffffc0204564 <down>

ffffffffc020aef0 <lock_sfs_io>:
ffffffffc020aef0:	06850513          	addi	a0,a0,104
ffffffffc020aef4:	e70f906f          	j	ffffffffc0204564 <down>

ffffffffc020aef8 <unlock_sfs_fs>:
ffffffffc020aef8:	05050513          	addi	a0,a0,80
ffffffffc020aefc:	e64f906f          	j	ffffffffc0204560 <up>

ffffffffc020af00 <unlock_sfs_io>:
ffffffffc020af00:	06850513          	addi	a0,a0,104
ffffffffc020af04:	e5cf906f          	j	ffffffffc0204560 <up>

ffffffffc020af08 <hash32>:
ffffffffc020af08:	9e3707b7          	lui	a5,0x9e370
ffffffffc020af0c:	2785                	addiw	a5,a5,1
ffffffffc020af0e:	02a7853b          	mulw	a0,a5,a0
ffffffffc020af12:	02000793          	li	a5,32
ffffffffc020af16:	9f8d                	subw	a5,a5,a1
ffffffffc020af18:	00f5553b          	srlw	a0,a0,a5
ffffffffc020af1c:	8082                	ret

ffffffffc020af1e <printnum>:
ffffffffc020af1e:	02071893          	slli	a7,a4,0x20
ffffffffc020af22:	7139                	addi	sp,sp,-64
ffffffffc020af24:	0208d893          	srli	a7,a7,0x20
ffffffffc020af28:	e456                	sd	s5,8(sp)
ffffffffc020af2a:	0316fab3          	remu	s5,a3,a7
ffffffffc020af2e:	f822                	sd	s0,48(sp)
ffffffffc020af30:	f426                	sd	s1,40(sp)
ffffffffc020af32:	f04a                	sd	s2,32(sp)
ffffffffc020af34:	ec4e                	sd	s3,24(sp)
ffffffffc020af36:	fc06                	sd	ra,56(sp)
ffffffffc020af38:	e852                	sd	s4,16(sp)
ffffffffc020af3a:	84aa                	mv	s1,a0
ffffffffc020af3c:	89ae                	mv	s3,a1
ffffffffc020af3e:	8932                	mv	s2,a2
ffffffffc020af40:	fff7841b          	addiw	s0,a5,-1
ffffffffc020af44:	2a81                	sext.w	s5,s5
ffffffffc020af46:	0516f163          	bgeu	a3,a7,ffffffffc020af88 <printnum+0x6a>
ffffffffc020af4a:	8a42                	mv	s4,a6
ffffffffc020af4c:	00805863          	blez	s0,ffffffffc020af5c <printnum+0x3e>
ffffffffc020af50:	347d                	addiw	s0,s0,-1
ffffffffc020af52:	864e                	mv	a2,s3
ffffffffc020af54:	85ca                	mv	a1,s2
ffffffffc020af56:	8552                	mv	a0,s4
ffffffffc020af58:	9482                	jalr	s1
ffffffffc020af5a:	f87d                	bnez	s0,ffffffffc020af50 <printnum+0x32>
ffffffffc020af5c:	1a82                	slli	s5,s5,0x20
ffffffffc020af5e:	00004797          	auipc	a5,0x4
ffffffffc020af62:	3e278793          	addi	a5,a5,994 # ffffffffc020f340 <sfs_node_fileops+0x118>
ffffffffc020af66:	020ada93          	srli	s5,s5,0x20
ffffffffc020af6a:	9abe                	add	s5,s5,a5
ffffffffc020af6c:	7442                	ld	s0,48(sp)
ffffffffc020af6e:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020af72:	70e2                	ld	ra,56(sp)
ffffffffc020af74:	6a42                	ld	s4,16(sp)
ffffffffc020af76:	6aa2                	ld	s5,8(sp)
ffffffffc020af78:	864e                	mv	a2,s3
ffffffffc020af7a:	85ca                	mv	a1,s2
ffffffffc020af7c:	69e2                	ld	s3,24(sp)
ffffffffc020af7e:	7902                	ld	s2,32(sp)
ffffffffc020af80:	87a6                	mv	a5,s1
ffffffffc020af82:	74a2                	ld	s1,40(sp)
ffffffffc020af84:	6121                	addi	sp,sp,64
ffffffffc020af86:	8782                	jr	a5
ffffffffc020af88:	0316d6b3          	divu	a3,a3,a7
ffffffffc020af8c:	87a2                	mv	a5,s0
ffffffffc020af8e:	f91ff0ef          	jal	ra,ffffffffc020af1e <printnum>
ffffffffc020af92:	b7e9                	j	ffffffffc020af5c <printnum+0x3e>

ffffffffc020af94 <sprintputch>:
ffffffffc020af94:	499c                	lw	a5,16(a1)
ffffffffc020af96:	6198                	ld	a4,0(a1)
ffffffffc020af98:	6594                	ld	a3,8(a1)
ffffffffc020af9a:	2785                	addiw	a5,a5,1
ffffffffc020af9c:	c99c                	sw	a5,16(a1)
ffffffffc020af9e:	00d77763          	bgeu	a4,a3,ffffffffc020afac <sprintputch+0x18>
ffffffffc020afa2:	00170793          	addi	a5,a4,1
ffffffffc020afa6:	e19c                	sd	a5,0(a1)
ffffffffc020afa8:	00a70023          	sb	a0,0(a4)
ffffffffc020afac:	8082                	ret

ffffffffc020afae <vprintfmt>:
ffffffffc020afae:	7119                	addi	sp,sp,-128
ffffffffc020afb0:	f4a6                	sd	s1,104(sp)
ffffffffc020afb2:	f0ca                	sd	s2,96(sp)
ffffffffc020afb4:	ecce                	sd	s3,88(sp)
ffffffffc020afb6:	e8d2                	sd	s4,80(sp)
ffffffffc020afb8:	e4d6                	sd	s5,72(sp)
ffffffffc020afba:	e0da                	sd	s6,64(sp)
ffffffffc020afbc:	fc5e                	sd	s7,56(sp)
ffffffffc020afbe:	ec6e                	sd	s11,24(sp)
ffffffffc020afc0:	fc86                	sd	ra,120(sp)
ffffffffc020afc2:	f8a2                	sd	s0,112(sp)
ffffffffc020afc4:	f862                	sd	s8,48(sp)
ffffffffc020afc6:	f466                	sd	s9,40(sp)
ffffffffc020afc8:	f06a                	sd	s10,32(sp)
ffffffffc020afca:	89aa                	mv	s3,a0
ffffffffc020afcc:	892e                	mv	s2,a1
ffffffffc020afce:	84b2                	mv	s1,a2
ffffffffc020afd0:	8db6                	mv	s11,a3
ffffffffc020afd2:	8aba                	mv	s5,a4
ffffffffc020afd4:	02500a13          	li	s4,37
ffffffffc020afd8:	5bfd                	li	s7,-1
ffffffffc020afda:	00004b17          	auipc	s6,0x4
ffffffffc020afde:	392b0b13          	addi	s6,s6,914 # ffffffffc020f36c <sfs_node_fileops+0x144>
ffffffffc020afe2:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020afe6:	001d8413          	addi	s0,s11,1
ffffffffc020afea:	01450b63          	beq	a0,s4,ffffffffc020b000 <vprintfmt+0x52>
ffffffffc020afee:	c129                	beqz	a0,ffffffffc020b030 <vprintfmt+0x82>
ffffffffc020aff0:	864a                	mv	a2,s2
ffffffffc020aff2:	85a6                	mv	a1,s1
ffffffffc020aff4:	0405                	addi	s0,s0,1
ffffffffc020aff6:	9982                	jalr	s3
ffffffffc020aff8:	fff44503          	lbu	a0,-1(s0)
ffffffffc020affc:	ff4519e3          	bne	a0,s4,ffffffffc020afee <vprintfmt+0x40>
ffffffffc020b000:	00044583          	lbu	a1,0(s0)
ffffffffc020b004:	02000813          	li	a6,32
ffffffffc020b008:	4d01                	li	s10,0
ffffffffc020b00a:	4301                	li	t1,0
ffffffffc020b00c:	5cfd                	li	s9,-1
ffffffffc020b00e:	5c7d                	li	s8,-1
ffffffffc020b010:	05500513          	li	a0,85
ffffffffc020b014:	48a5                	li	a7,9
ffffffffc020b016:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b01a:	0ff67613          	zext.b	a2,a2
ffffffffc020b01e:	00140d93          	addi	s11,s0,1
ffffffffc020b022:	04c56263          	bltu	a0,a2,ffffffffc020b066 <vprintfmt+0xb8>
ffffffffc020b026:	060a                	slli	a2,a2,0x2
ffffffffc020b028:	965a                	add	a2,a2,s6
ffffffffc020b02a:	4214                	lw	a3,0(a2)
ffffffffc020b02c:	96da                	add	a3,a3,s6
ffffffffc020b02e:	8682                	jr	a3
ffffffffc020b030:	70e6                	ld	ra,120(sp)
ffffffffc020b032:	7446                	ld	s0,112(sp)
ffffffffc020b034:	74a6                	ld	s1,104(sp)
ffffffffc020b036:	7906                	ld	s2,96(sp)
ffffffffc020b038:	69e6                	ld	s3,88(sp)
ffffffffc020b03a:	6a46                	ld	s4,80(sp)
ffffffffc020b03c:	6aa6                	ld	s5,72(sp)
ffffffffc020b03e:	6b06                	ld	s6,64(sp)
ffffffffc020b040:	7be2                	ld	s7,56(sp)
ffffffffc020b042:	7c42                	ld	s8,48(sp)
ffffffffc020b044:	7ca2                	ld	s9,40(sp)
ffffffffc020b046:	7d02                	ld	s10,32(sp)
ffffffffc020b048:	6de2                	ld	s11,24(sp)
ffffffffc020b04a:	6109                	addi	sp,sp,128
ffffffffc020b04c:	8082                	ret
ffffffffc020b04e:	882e                	mv	a6,a1
ffffffffc020b050:	00144583          	lbu	a1,1(s0)
ffffffffc020b054:	846e                	mv	s0,s11
ffffffffc020b056:	00140d93          	addi	s11,s0,1
ffffffffc020b05a:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b05e:	0ff67613          	zext.b	a2,a2
ffffffffc020b062:	fcc572e3          	bgeu	a0,a2,ffffffffc020b026 <vprintfmt+0x78>
ffffffffc020b066:	864a                	mv	a2,s2
ffffffffc020b068:	85a6                	mv	a1,s1
ffffffffc020b06a:	02500513          	li	a0,37
ffffffffc020b06e:	9982                	jalr	s3
ffffffffc020b070:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b074:	8da2                	mv	s11,s0
ffffffffc020b076:	f74786e3          	beq	a5,s4,ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b07a:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b07e:	1dfd                	addi	s11,s11,-1
ffffffffc020b080:	ff479de3          	bne	a5,s4,ffffffffc020b07a <vprintfmt+0xcc>
ffffffffc020b084:	bfb9                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b086:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b08a:	00144583          	lbu	a1,1(s0)
ffffffffc020b08e:	846e                	mv	s0,s11
ffffffffc020b090:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b094:	0005861b          	sext.w	a2,a1
ffffffffc020b098:	02d8e463          	bltu	a7,a3,ffffffffc020b0c0 <vprintfmt+0x112>
ffffffffc020b09c:	00144583          	lbu	a1,1(s0)
ffffffffc020b0a0:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b0a4:	0196873b          	addw	a4,a3,s9
ffffffffc020b0a8:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b0ac:	9f31                	addw	a4,a4,a2
ffffffffc020b0ae:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b0b2:	0405                	addi	s0,s0,1
ffffffffc020b0b4:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b0b8:	0005861b          	sext.w	a2,a1
ffffffffc020b0bc:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b09c <vprintfmt+0xee>
ffffffffc020b0c0:	f40c5be3          	bgez	s8,ffffffffc020b016 <vprintfmt+0x68>
ffffffffc020b0c4:	8c66                	mv	s8,s9
ffffffffc020b0c6:	5cfd                	li	s9,-1
ffffffffc020b0c8:	b7b9                	j	ffffffffc020b016 <vprintfmt+0x68>
ffffffffc020b0ca:	fffc4693          	not	a3,s8
ffffffffc020b0ce:	96fd                	srai	a3,a3,0x3f
ffffffffc020b0d0:	00dc77b3          	and	a5,s8,a3
ffffffffc020b0d4:	00144583          	lbu	a1,1(s0)
ffffffffc020b0d8:	00078c1b          	sext.w	s8,a5
ffffffffc020b0dc:	846e                	mv	s0,s11
ffffffffc020b0de:	bf25                	j	ffffffffc020b016 <vprintfmt+0x68>
ffffffffc020b0e0:	000aac83          	lw	s9,0(s5)
ffffffffc020b0e4:	00144583          	lbu	a1,1(s0)
ffffffffc020b0e8:	0aa1                	addi	s5,s5,8
ffffffffc020b0ea:	846e                	mv	s0,s11
ffffffffc020b0ec:	bfd1                	j	ffffffffc020b0c0 <vprintfmt+0x112>
ffffffffc020b0ee:	4705                	li	a4,1
ffffffffc020b0f0:	008a8613          	addi	a2,s5,8
ffffffffc020b0f4:	00674463          	blt	a4,t1,ffffffffc020b0fc <vprintfmt+0x14e>
ffffffffc020b0f8:	1c030c63          	beqz	t1,ffffffffc020b2d0 <vprintfmt+0x322>
ffffffffc020b0fc:	000ab683          	ld	a3,0(s5)
ffffffffc020b100:	4741                	li	a4,16
ffffffffc020b102:	8ab2                	mv	s5,a2
ffffffffc020b104:	2801                	sext.w	a6,a6
ffffffffc020b106:	87e2                	mv	a5,s8
ffffffffc020b108:	8626                	mv	a2,s1
ffffffffc020b10a:	85ca                	mv	a1,s2
ffffffffc020b10c:	854e                	mv	a0,s3
ffffffffc020b10e:	e11ff0ef          	jal	ra,ffffffffc020af1e <printnum>
ffffffffc020b112:	bdc1                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b114:	000aa503          	lw	a0,0(s5)
ffffffffc020b118:	864a                	mv	a2,s2
ffffffffc020b11a:	85a6                	mv	a1,s1
ffffffffc020b11c:	0aa1                	addi	s5,s5,8
ffffffffc020b11e:	9982                	jalr	s3
ffffffffc020b120:	b5c9                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b122:	4705                	li	a4,1
ffffffffc020b124:	008a8613          	addi	a2,s5,8
ffffffffc020b128:	00674463          	blt	a4,t1,ffffffffc020b130 <vprintfmt+0x182>
ffffffffc020b12c:	18030d63          	beqz	t1,ffffffffc020b2c6 <vprintfmt+0x318>
ffffffffc020b130:	000ab683          	ld	a3,0(s5)
ffffffffc020b134:	4729                	li	a4,10
ffffffffc020b136:	8ab2                	mv	s5,a2
ffffffffc020b138:	b7f1                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b13a:	00144583          	lbu	a1,1(s0)
ffffffffc020b13e:	4d05                	li	s10,1
ffffffffc020b140:	846e                	mv	s0,s11
ffffffffc020b142:	bdd1                	j	ffffffffc020b016 <vprintfmt+0x68>
ffffffffc020b144:	864a                	mv	a2,s2
ffffffffc020b146:	85a6                	mv	a1,s1
ffffffffc020b148:	02500513          	li	a0,37
ffffffffc020b14c:	9982                	jalr	s3
ffffffffc020b14e:	bd51                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b150:	00144583          	lbu	a1,1(s0)
ffffffffc020b154:	2305                	addiw	t1,t1,1
ffffffffc020b156:	846e                	mv	s0,s11
ffffffffc020b158:	bd7d                	j	ffffffffc020b016 <vprintfmt+0x68>
ffffffffc020b15a:	4705                	li	a4,1
ffffffffc020b15c:	008a8613          	addi	a2,s5,8
ffffffffc020b160:	00674463          	blt	a4,t1,ffffffffc020b168 <vprintfmt+0x1ba>
ffffffffc020b164:	14030c63          	beqz	t1,ffffffffc020b2bc <vprintfmt+0x30e>
ffffffffc020b168:	000ab683          	ld	a3,0(s5)
ffffffffc020b16c:	4721                	li	a4,8
ffffffffc020b16e:	8ab2                	mv	s5,a2
ffffffffc020b170:	bf51                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b172:	03000513          	li	a0,48
ffffffffc020b176:	864a                	mv	a2,s2
ffffffffc020b178:	85a6                	mv	a1,s1
ffffffffc020b17a:	e042                	sd	a6,0(sp)
ffffffffc020b17c:	9982                	jalr	s3
ffffffffc020b17e:	864a                	mv	a2,s2
ffffffffc020b180:	85a6                	mv	a1,s1
ffffffffc020b182:	07800513          	li	a0,120
ffffffffc020b186:	9982                	jalr	s3
ffffffffc020b188:	0aa1                	addi	s5,s5,8
ffffffffc020b18a:	6802                	ld	a6,0(sp)
ffffffffc020b18c:	4741                	li	a4,16
ffffffffc020b18e:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b192:	bf8d                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b194:	000ab403          	ld	s0,0(s5)
ffffffffc020b198:	008a8793          	addi	a5,s5,8
ffffffffc020b19c:	e03e                	sd	a5,0(sp)
ffffffffc020b19e:	14040c63          	beqz	s0,ffffffffc020b2f6 <vprintfmt+0x348>
ffffffffc020b1a2:	11805063          	blez	s8,ffffffffc020b2a2 <vprintfmt+0x2f4>
ffffffffc020b1a6:	02d00693          	li	a3,45
ffffffffc020b1aa:	0cd81963          	bne	a6,a3,ffffffffc020b27c <vprintfmt+0x2ce>
ffffffffc020b1ae:	00044683          	lbu	a3,0(s0)
ffffffffc020b1b2:	0006851b          	sext.w	a0,a3
ffffffffc020b1b6:	ce8d                	beqz	a3,ffffffffc020b1f0 <vprintfmt+0x242>
ffffffffc020b1b8:	00140a93          	addi	s5,s0,1
ffffffffc020b1bc:	05e00413          	li	s0,94
ffffffffc020b1c0:	000cc563          	bltz	s9,ffffffffc020b1ca <vprintfmt+0x21c>
ffffffffc020b1c4:	3cfd                	addiw	s9,s9,-1
ffffffffc020b1c6:	037c8363          	beq	s9,s7,ffffffffc020b1ec <vprintfmt+0x23e>
ffffffffc020b1ca:	864a                	mv	a2,s2
ffffffffc020b1cc:	85a6                	mv	a1,s1
ffffffffc020b1ce:	100d0663          	beqz	s10,ffffffffc020b2da <vprintfmt+0x32c>
ffffffffc020b1d2:	3681                	addiw	a3,a3,-32
ffffffffc020b1d4:	10d47363          	bgeu	s0,a3,ffffffffc020b2da <vprintfmt+0x32c>
ffffffffc020b1d8:	03f00513          	li	a0,63
ffffffffc020b1dc:	9982                	jalr	s3
ffffffffc020b1de:	000ac683          	lbu	a3,0(s5)
ffffffffc020b1e2:	3c7d                	addiw	s8,s8,-1
ffffffffc020b1e4:	0a85                	addi	s5,s5,1
ffffffffc020b1e6:	0006851b          	sext.w	a0,a3
ffffffffc020b1ea:	faf9                	bnez	a3,ffffffffc020b1c0 <vprintfmt+0x212>
ffffffffc020b1ec:	01805a63          	blez	s8,ffffffffc020b200 <vprintfmt+0x252>
ffffffffc020b1f0:	3c7d                	addiw	s8,s8,-1
ffffffffc020b1f2:	864a                	mv	a2,s2
ffffffffc020b1f4:	85a6                	mv	a1,s1
ffffffffc020b1f6:	02000513          	li	a0,32
ffffffffc020b1fa:	9982                	jalr	s3
ffffffffc020b1fc:	fe0c1ae3          	bnez	s8,ffffffffc020b1f0 <vprintfmt+0x242>
ffffffffc020b200:	6a82                	ld	s5,0(sp)
ffffffffc020b202:	b3c5                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b204:	4705                	li	a4,1
ffffffffc020b206:	008a8d13          	addi	s10,s5,8
ffffffffc020b20a:	00674463          	blt	a4,t1,ffffffffc020b212 <vprintfmt+0x264>
ffffffffc020b20e:	0a030463          	beqz	t1,ffffffffc020b2b6 <vprintfmt+0x308>
ffffffffc020b212:	000ab403          	ld	s0,0(s5)
ffffffffc020b216:	0c044463          	bltz	s0,ffffffffc020b2de <vprintfmt+0x330>
ffffffffc020b21a:	86a2                	mv	a3,s0
ffffffffc020b21c:	8aea                	mv	s5,s10
ffffffffc020b21e:	4729                	li	a4,10
ffffffffc020b220:	b5d5                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b222:	000aa783          	lw	a5,0(s5)
ffffffffc020b226:	46e1                	li	a3,24
ffffffffc020b228:	0aa1                	addi	s5,s5,8
ffffffffc020b22a:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b22e:	8fb9                	xor	a5,a5,a4
ffffffffc020b230:	40e7873b          	subw	a4,a5,a4
ffffffffc020b234:	02e6c663          	blt	a3,a4,ffffffffc020b260 <vprintfmt+0x2b2>
ffffffffc020b238:	00371793          	slli	a5,a4,0x3
ffffffffc020b23c:	00004697          	auipc	a3,0x4
ffffffffc020b240:	46468693          	addi	a3,a3,1124 # ffffffffc020f6a0 <error_string>
ffffffffc020b244:	97b6                	add	a5,a5,a3
ffffffffc020b246:	639c                	ld	a5,0(a5)
ffffffffc020b248:	cf81                	beqz	a5,ffffffffc020b260 <vprintfmt+0x2b2>
ffffffffc020b24a:	873e                	mv	a4,a5
ffffffffc020b24c:	00000697          	auipc	a3,0x0
ffffffffc020b250:	28468693          	addi	a3,a3,644 # ffffffffc020b4d0 <etext+0x2a>
ffffffffc020b254:	8626                	mv	a2,s1
ffffffffc020b256:	85ca                	mv	a1,s2
ffffffffc020b258:	854e                	mv	a0,s3
ffffffffc020b25a:	0d4000ef          	jal	ra,ffffffffc020b32e <printfmt>
ffffffffc020b25e:	b351                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b260:	00004697          	auipc	a3,0x4
ffffffffc020b264:	10068693          	addi	a3,a3,256 # ffffffffc020f360 <sfs_node_fileops+0x138>
ffffffffc020b268:	8626                	mv	a2,s1
ffffffffc020b26a:	85ca                	mv	a1,s2
ffffffffc020b26c:	854e                	mv	a0,s3
ffffffffc020b26e:	0c0000ef          	jal	ra,ffffffffc020b32e <printfmt>
ffffffffc020b272:	bb85                	j	ffffffffc020afe2 <vprintfmt+0x34>
ffffffffc020b274:	00004417          	auipc	s0,0x4
ffffffffc020b278:	0e440413          	addi	s0,s0,228 # ffffffffc020f358 <sfs_node_fileops+0x130>
ffffffffc020b27c:	85e6                	mv	a1,s9
ffffffffc020b27e:	8522                	mv	a0,s0
ffffffffc020b280:	e442                	sd	a6,8(sp)
ffffffffc020b282:	132000ef          	jal	ra,ffffffffc020b3b4 <strnlen>
ffffffffc020b286:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b28a:	01805c63          	blez	s8,ffffffffc020b2a2 <vprintfmt+0x2f4>
ffffffffc020b28e:	6822                	ld	a6,8(sp)
ffffffffc020b290:	00080a9b          	sext.w	s5,a6
ffffffffc020b294:	3c7d                	addiw	s8,s8,-1
ffffffffc020b296:	864a                	mv	a2,s2
ffffffffc020b298:	85a6                	mv	a1,s1
ffffffffc020b29a:	8556                	mv	a0,s5
ffffffffc020b29c:	9982                	jalr	s3
ffffffffc020b29e:	fe0c1be3          	bnez	s8,ffffffffc020b294 <vprintfmt+0x2e6>
ffffffffc020b2a2:	00044683          	lbu	a3,0(s0)
ffffffffc020b2a6:	00140a93          	addi	s5,s0,1
ffffffffc020b2aa:	0006851b          	sext.w	a0,a3
ffffffffc020b2ae:	daa9                	beqz	a3,ffffffffc020b200 <vprintfmt+0x252>
ffffffffc020b2b0:	05e00413          	li	s0,94
ffffffffc020b2b4:	b731                	j	ffffffffc020b1c0 <vprintfmt+0x212>
ffffffffc020b2b6:	000aa403          	lw	s0,0(s5)
ffffffffc020b2ba:	bfb1                	j	ffffffffc020b216 <vprintfmt+0x268>
ffffffffc020b2bc:	000ae683          	lwu	a3,0(s5)
ffffffffc020b2c0:	4721                	li	a4,8
ffffffffc020b2c2:	8ab2                	mv	s5,a2
ffffffffc020b2c4:	b581                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b2c6:	000ae683          	lwu	a3,0(s5)
ffffffffc020b2ca:	4729                	li	a4,10
ffffffffc020b2cc:	8ab2                	mv	s5,a2
ffffffffc020b2ce:	bd1d                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b2d0:	000ae683          	lwu	a3,0(s5)
ffffffffc020b2d4:	4741                	li	a4,16
ffffffffc020b2d6:	8ab2                	mv	s5,a2
ffffffffc020b2d8:	b535                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b2da:	9982                	jalr	s3
ffffffffc020b2dc:	b709                	j	ffffffffc020b1de <vprintfmt+0x230>
ffffffffc020b2de:	864a                	mv	a2,s2
ffffffffc020b2e0:	85a6                	mv	a1,s1
ffffffffc020b2e2:	02d00513          	li	a0,45
ffffffffc020b2e6:	e042                	sd	a6,0(sp)
ffffffffc020b2e8:	9982                	jalr	s3
ffffffffc020b2ea:	6802                	ld	a6,0(sp)
ffffffffc020b2ec:	8aea                	mv	s5,s10
ffffffffc020b2ee:	408006b3          	neg	a3,s0
ffffffffc020b2f2:	4729                	li	a4,10
ffffffffc020b2f4:	bd01                	j	ffffffffc020b104 <vprintfmt+0x156>
ffffffffc020b2f6:	03805163          	blez	s8,ffffffffc020b318 <vprintfmt+0x36a>
ffffffffc020b2fa:	02d00693          	li	a3,45
ffffffffc020b2fe:	f6d81be3          	bne	a6,a3,ffffffffc020b274 <vprintfmt+0x2c6>
ffffffffc020b302:	00004417          	auipc	s0,0x4
ffffffffc020b306:	05640413          	addi	s0,s0,86 # ffffffffc020f358 <sfs_node_fileops+0x130>
ffffffffc020b30a:	02800693          	li	a3,40
ffffffffc020b30e:	02800513          	li	a0,40
ffffffffc020b312:	00140a93          	addi	s5,s0,1
ffffffffc020b316:	b55d                	j	ffffffffc020b1bc <vprintfmt+0x20e>
ffffffffc020b318:	00004a97          	auipc	s5,0x4
ffffffffc020b31c:	041a8a93          	addi	s5,s5,65 # ffffffffc020f359 <sfs_node_fileops+0x131>
ffffffffc020b320:	02800513          	li	a0,40
ffffffffc020b324:	02800693          	li	a3,40
ffffffffc020b328:	05e00413          	li	s0,94
ffffffffc020b32c:	bd51                	j	ffffffffc020b1c0 <vprintfmt+0x212>

ffffffffc020b32e <printfmt>:
ffffffffc020b32e:	7139                	addi	sp,sp,-64
ffffffffc020b330:	02010313          	addi	t1,sp,32
ffffffffc020b334:	f03a                	sd	a4,32(sp)
ffffffffc020b336:	871a                	mv	a4,t1
ffffffffc020b338:	ec06                	sd	ra,24(sp)
ffffffffc020b33a:	f43e                	sd	a5,40(sp)
ffffffffc020b33c:	f842                	sd	a6,48(sp)
ffffffffc020b33e:	fc46                	sd	a7,56(sp)
ffffffffc020b340:	e41a                	sd	t1,8(sp)
ffffffffc020b342:	c6dff0ef          	jal	ra,ffffffffc020afae <vprintfmt>
ffffffffc020b346:	60e2                	ld	ra,24(sp)
ffffffffc020b348:	6121                	addi	sp,sp,64
ffffffffc020b34a:	8082                	ret

ffffffffc020b34c <snprintf>:
ffffffffc020b34c:	711d                	addi	sp,sp,-96
ffffffffc020b34e:	15fd                	addi	a1,a1,-1
ffffffffc020b350:	03810313          	addi	t1,sp,56
ffffffffc020b354:	95aa                	add	a1,a1,a0
ffffffffc020b356:	f406                	sd	ra,40(sp)
ffffffffc020b358:	fc36                	sd	a3,56(sp)
ffffffffc020b35a:	e0ba                	sd	a4,64(sp)
ffffffffc020b35c:	e4be                	sd	a5,72(sp)
ffffffffc020b35e:	e8c2                	sd	a6,80(sp)
ffffffffc020b360:	ecc6                	sd	a7,88(sp)
ffffffffc020b362:	e01a                	sd	t1,0(sp)
ffffffffc020b364:	e42a                	sd	a0,8(sp)
ffffffffc020b366:	e82e                	sd	a1,16(sp)
ffffffffc020b368:	cc02                	sw	zero,24(sp)
ffffffffc020b36a:	c515                	beqz	a0,ffffffffc020b396 <snprintf+0x4a>
ffffffffc020b36c:	02a5e563          	bltu	a1,a0,ffffffffc020b396 <snprintf+0x4a>
ffffffffc020b370:	75dd                	lui	a1,0xffff7
ffffffffc020b372:	86b2                	mv	a3,a2
ffffffffc020b374:	00000517          	auipc	a0,0x0
ffffffffc020b378:	c2050513          	addi	a0,a0,-992 # ffffffffc020af94 <sprintputch>
ffffffffc020b37c:	871a                	mv	a4,t1
ffffffffc020b37e:	0030                	addi	a2,sp,8
ffffffffc020b380:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b384:	c2bff0ef          	jal	ra,ffffffffc020afae <vprintfmt>
ffffffffc020b388:	67a2                	ld	a5,8(sp)
ffffffffc020b38a:	00078023          	sb	zero,0(a5)
ffffffffc020b38e:	4562                	lw	a0,24(sp)
ffffffffc020b390:	70a2                	ld	ra,40(sp)
ffffffffc020b392:	6125                	addi	sp,sp,96
ffffffffc020b394:	8082                	ret
ffffffffc020b396:	5575                	li	a0,-3
ffffffffc020b398:	bfe5                	j	ffffffffc020b390 <snprintf+0x44>

ffffffffc020b39a <strlen>:
ffffffffc020b39a:	00054783          	lbu	a5,0(a0)
ffffffffc020b39e:	872a                	mv	a4,a0
ffffffffc020b3a0:	4501                	li	a0,0
ffffffffc020b3a2:	cb81                	beqz	a5,ffffffffc020b3b2 <strlen+0x18>
ffffffffc020b3a4:	0505                	addi	a0,a0,1
ffffffffc020b3a6:	00a707b3          	add	a5,a4,a0
ffffffffc020b3aa:	0007c783          	lbu	a5,0(a5)
ffffffffc020b3ae:	fbfd                	bnez	a5,ffffffffc020b3a4 <strlen+0xa>
ffffffffc020b3b0:	8082                	ret
ffffffffc020b3b2:	8082                	ret

ffffffffc020b3b4 <strnlen>:
ffffffffc020b3b4:	4781                	li	a5,0
ffffffffc020b3b6:	e589                	bnez	a1,ffffffffc020b3c0 <strnlen+0xc>
ffffffffc020b3b8:	a811                	j	ffffffffc020b3cc <strnlen+0x18>
ffffffffc020b3ba:	0785                	addi	a5,a5,1
ffffffffc020b3bc:	00f58863          	beq	a1,a5,ffffffffc020b3cc <strnlen+0x18>
ffffffffc020b3c0:	00f50733          	add	a4,a0,a5
ffffffffc020b3c4:	00074703          	lbu	a4,0(a4)
ffffffffc020b3c8:	fb6d                	bnez	a4,ffffffffc020b3ba <strnlen+0x6>
ffffffffc020b3ca:	85be                	mv	a1,a5
ffffffffc020b3cc:	852e                	mv	a0,a1
ffffffffc020b3ce:	8082                	ret

ffffffffc020b3d0 <strcpy>:
ffffffffc020b3d0:	87aa                	mv	a5,a0
ffffffffc020b3d2:	0005c703          	lbu	a4,0(a1)
ffffffffc020b3d6:	0785                	addi	a5,a5,1
ffffffffc020b3d8:	0585                	addi	a1,a1,1
ffffffffc020b3da:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b3de:	fb75                	bnez	a4,ffffffffc020b3d2 <strcpy+0x2>
ffffffffc020b3e0:	8082                	ret

ffffffffc020b3e2 <strcmp>:
ffffffffc020b3e2:	00054783          	lbu	a5,0(a0)
ffffffffc020b3e6:	0005c703          	lbu	a4,0(a1)
ffffffffc020b3ea:	cb89                	beqz	a5,ffffffffc020b3fc <strcmp+0x1a>
ffffffffc020b3ec:	0505                	addi	a0,a0,1
ffffffffc020b3ee:	0585                	addi	a1,a1,1
ffffffffc020b3f0:	fee789e3          	beq	a5,a4,ffffffffc020b3e2 <strcmp>
ffffffffc020b3f4:	0007851b          	sext.w	a0,a5
ffffffffc020b3f8:	9d19                	subw	a0,a0,a4
ffffffffc020b3fa:	8082                	ret
ffffffffc020b3fc:	4501                	li	a0,0
ffffffffc020b3fe:	bfed                	j	ffffffffc020b3f8 <strcmp+0x16>

ffffffffc020b400 <strncmp>:
ffffffffc020b400:	c20d                	beqz	a2,ffffffffc020b422 <strncmp+0x22>
ffffffffc020b402:	962e                	add	a2,a2,a1
ffffffffc020b404:	a031                	j	ffffffffc020b410 <strncmp+0x10>
ffffffffc020b406:	0505                	addi	a0,a0,1
ffffffffc020b408:	00e79a63          	bne	a5,a4,ffffffffc020b41c <strncmp+0x1c>
ffffffffc020b40c:	00b60b63          	beq	a2,a1,ffffffffc020b422 <strncmp+0x22>
ffffffffc020b410:	00054783          	lbu	a5,0(a0)
ffffffffc020b414:	0585                	addi	a1,a1,1
ffffffffc020b416:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b41a:	f7f5                	bnez	a5,ffffffffc020b406 <strncmp+0x6>
ffffffffc020b41c:	40e7853b          	subw	a0,a5,a4
ffffffffc020b420:	8082                	ret
ffffffffc020b422:	4501                	li	a0,0
ffffffffc020b424:	8082                	ret

ffffffffc020b426 <strchr>:
ffffffffc020b426:	00054783          	lbu	a5,0(a0)
ffffffffc020b42a:	c799                	beqz	a5,ffffffffc020b438 <strchr+0x12>
ffffffffc020b42c:	00f58763          	beq	a1,a5,ffffffffc020b43a <strchr+0x14>
ffffffffc020b430:	00154783          	lbu	a5,1(a0)
ffffffffc020b434:	0505                	addi	a0,a0,1
ffffffffc020b436:	fbfd                	bnez	a5,ffffffffc020b42c <strchr+0x6>
ffffffffc020b438:	4501                	li	a0,0
ffffffffc020b43a:	8082                	ret

ffffffffc020b43c <memset>:
ffffffffc020b43c:	ca01                	beqz	a2,ffffffffc020b44c <memset+0x10>
ffffffffc020b43e:	962a                	add	a2,a2,a0
ffffffffc020b440:	87aa                	mv	a5,a0
ffffffffc020b442:	0785                	addi	a5,a5,1
ffffffffc020b444:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b448:	fec79de3          	bne	a5,a2,ffffffffc020b442 <memset+0x6>
ffffffffc020b44c:	8082                	ret

ffffffffc020b44e <memmove>:
ffffffffc020b44e:	02a5f263          	bgeu	a1,a0,ffffffffc020b472 <memmove+0x24>
ffffffffc020b452:	00c587b3          	add	a5,a1,a2
ffffffffc020b456:	00f57e63          	bgeu	a0,a5,ffffffffc020b472 <memmove+0x24>
ffffffffc020b45a:	00c50733          	add	a4,a0,a2
ffffffffc020b45e:	c615                	beqz	a2,ffffffffc020b48a <memmove+0x3c>
ffffffffc020b460:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b464:	17fd                	addi	a5,a5,-1
ffffffffc020b466:	177d                	addi	a4,a4,-1
ffffffffc020b468:	00d70023          	sb	a3,0(a4)
ffffffffc020b46c:	fef59ae3          	bne	a1,a5,ffffffffc020b460 <memmove+0x12>
ffffffffc020b470:	8082                	ret
ffffffffc020b472:	00c586b3          	add	a3,a1,a2
ffffffffc020b476:	87aa                	mv	a5,a0
ffffffffc020b478:	ca11                	beqz	a2,ffffffffc020b48c <memmove+0x3e>
ffffffffc020b47a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b47e:	0585                	addi	a1,a1,1
ffffffffc020b480:	0785                	addi	a5,a5,1
ffffffffc020b482:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b486:	fed59ae3          	bne	a1,a3,ffffffffc020b47a <memmove+0x2c>
ffffffffc020b48a:	8082                	ret
ffffffffc020b48c:	8082                	ret

ffffffffc020b48e <memcpy>:
ffffffffc020b48e:	ca19                	beqz	a2,ffffffffc020b4a4 <memcpy+0x16>
ffffffffc020b490:	962e                	add	a2,a2,a1
ffffffffc020b492:	87aa                	mv	a5,a0
ffffffffc020b494:	0005c703          	lbu	a4,0(a1)
ffffffffc020b498:	0585                	addi	a1,a1,1
ffffffffc020b49a:	0785                	addi	a5,a5,1
ffffffffc020b49c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b4a0:	fec59ae3          	bne	a1,a2,ffffffffc020b494 <memcpy+0x6>
ffffffffc020b4a4:	8082                	ret
