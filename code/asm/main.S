	.file	"main.c"
 ; GNU C17 (Mitto Systems Limited - msp430-gcc 9.3.1.11) version 9.3.1 (msp430-elf)
 ;	compiled by GNU C version 4.8.5 20150623 (Red Hat 4.8.5-39), GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed:  -I /home/sprakhar/ti/msp430-gcc/include
 ; -imultilib large
 ; -iprefix /home/sprakhar/ti/msp430-gcc/bin/../lib/gcc/msp430-elf/9.3.1/
 ; -D BARE_METAL -D STRINGSEARCH benchmarks/stringsearch/main.c
 ; -mmcu=msp430fr5994 -mlarge
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mcpu=msp430xv2 -auxbase-strip asm/main.S -Os -fverbose-asm
 ; options enabled:  -faggressive-loop-optimizations -fassume-phsa
 ; -fauto-inc-dec -fbranch-count-reg -fcaller-saves -fcode-hoisting
 ; -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
 ; -fcrossjumping -fcse-follow-jumps -fdefer-pop -fdevirtualize
 ; -fdevirtualize-speculatively -fearly-inlining
 ; -feliminate-unused-debug-types -fexpensive-optimizations
 ; -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
 ; -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
 ; -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
 ; -findirect-inlining -finline -finline-atomics -finline-functions
 ; -finline-functions-called-once -finline-small-functions -fipa-bit-cp
 ; -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
 ; -fipa-pure-const -fipa-ra -fipa-reference -fipa-reference-addressable
 ; -fipa-sra -fipa-stack-alignment -fipa-vrp -fira-hoist-pressure
 ; -fira-share-save-slots -fira-share-spill-slots
 ; -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
 ; -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
 ; -fmath-errno -fmerge-constants -fmerge-debug-strings
 ; -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
 ; -fpartial-inlining -fpeephole -fpeephole2 -fplt -fprefetch-loop-arrays
 ; -freg-struct-return -freorder-blocks -freorder-functions
 ; -frerun-cse-after-loop -fsched-critical-path-heuristic
 ; -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 ; -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 ; -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
 ; -fsemantic-interposition -fshow-column -fshrink-wrap
 ; -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
 ; -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstdarg-opt
 ; -fstore-merging -fstrict-aliasing -fstrict-volatile-bitfields
 ; -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
 ; -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
 ; -ftree-coalesce-vars -ftree-copy-prop -ftree-dce -ftree-dominator-opts
 ; -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
 ; -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
 ; -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
 ; -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra
 ; -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
 ; -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -mlarge
 ; -mmax-inline-shift= -mwarn-mcu

.text
	.section	.crt_0042,"ax",@progbits
	.balign 2
	.type	disable_watchdog, @function
disable_watchdog:
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
 ; benchmarks/stringsearch/../bareBench.h:15:   WDTCTL = WDTPW | WDTHOLD;
	MOV.W	#23168, &WDTCTL	 ;, WDTCTL
	.size	disable_watchdog, .-disable_watchdog
.text
	.balign 2
	.global	initPins
	.type	initPins, @function
initPins:
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
 ; benchmarks/stringsearch/../bareBench.h:21:   P1OUT = 0;
	MOV.B	#0, &P1OUT	 ;, P1OUT
 ; benchmarks/stringsearch/../bareBench.h:22:   P1DIR = 0xFF;
	MOV.B	#-1, &P1DIR	 ;, P1DIR
 ; benchmarks/stringsearch/../bareBench.h:24:   P2OUT = 0;
	MOV.B	#0, &P2OUT	 ;, P2OUT
 ; benchmarks/stringsearch/../bareBench.h:25:   P2DIR = 0xFF;
	MOV.B	#-1, &P2DIR	 ;, P2DIR
 ; benchmarks/stringsearch/../bareBench.h:27:   P3OUT = 0;
	MOV.B	#0, &P3OUT	 ;, P3OUT
 ; benchmarks/stringsearch/../bareBench.h:28:   P3DIR = 0xFF;
	MOV.B	#-1, &P3DIR	 ;, P3DIR
 ; benchmarks/stringsearch/../bareBench.h:30:   P4OUT = 0;
	MOV.B	#0, &P4OUT	 ;, P4OUT
 ; benchmarks/stringsearch/../bareBench.h:31:   P4DIR = 0xFF;
	MOV.B	#-1, &P4DIR	 ;, P4DIR
 ; benchmarks/stringsearch/../bareBench.h:33:   P5OUT = 0;
	MOV.B	#0, &P5OUT	 ;, P5OUT
 ; benchmarks/stringsearch/../bareBench.h:34:   P5DIR = 0xFF;
	MOV.B	#-1, &P5DIR	 ;, P5DIR
 ; benchmarks/stringsearch/../bareBench.h:36:   P6OUT = 0;
	MOV.B	#0, &P6OUT	 ;, P6OUT
 ; benchmarks/stringsearch/../bareBench.h:37:   P6DIR = 0xFF;
	MOV.B	#-1, &P6DIR	 ;, P6DIR
 ; benchmarks/stringsearch/../bareBench.h:39:   P7OUT = 0;
	MOV.B	#0, &P7OUT	 ;, P7OUT
 ; benchmarks/stringsearch/../bareBench.h:40:   P7DIR = 0xFF;
	MOV.B	#-1, &P7DIR	 ;, P7DIR
 ; benchmarks/stringsearch/../bareBench.h:42:   P8OUT = 0;
	MOV.B	#0, &P8OUT	 ;, P8OUT
 ; benchmarks/stringsearch/../bareBench.h:43:   P8DIR = 0xFF;
	MOV.B	#-1, &P8DIR	 ;, P8DIR
 ; benchmarks/stringsearch/../bareBench.h:45:   PJOUT = 0;
	MOV.W	#0, &PJOUT	 ;, PJOUT
 ; benchmarks/stringsearch/../bareBench.h:46:   PJDIR = 0xFFFF;
	MOV.W	#-1, &PJDIR	 ;, PJDIR
 ; benchmarks/stringsearch/../bareBench.h:47: }
	; start of epilogue
	RETA	
	.size	initPins, .-initPins
	.balign 2
	.global	benchmark
	.type	benchmark, @function
benchmark:
; start of function
; framesize_regs:     12
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          12
; elim ap -> fp       16
; elim fp -> sp       0
; saved regs: R6 R8 R10
	; start of prologue
	PUSHM.A	#1, R10	 ;,
	PUSHM.A	#1, R8	 ;,
	PUSHM.A	#1, R6	 ;,
	; end of prologue
	MOVA	#find_strings, R6	 ;, ivtmp.21
	MOVA	#location, R8	 ;, ivtmp.24
 ; benchmarks/stringsearch/main.c:15:     for (i = 0; find_strings[i]; i++)
	MOV.B	#0, R10	 ;, i
.L4:
 ; benchmarks/stringsearch/main.c:15:     for (i = 0; find_strings[i]; i++)
	MOVA	@R6+, R12	 ; MEM[base: _15, offset: 0B], _2
 ; benchmarks/stringsearch/main.c:15:     for (i = 0; find_strings[i]; i++)
	CMPA	#0, R12 { JNE	.L5	 ;,, _2,
 ; benchmarks/stringsearch/main.c:21: }
	; start of epilogue
	POPM.A	#1, r6	 ;,,
	POPM.A	#1, r8	 ;,,
	POPM.A	#1, r10	 ;,,
	RETA	
.L5:
 ; benchmarks/stringsearch/main.c:17:         location[i] = pbmsrch(find_strings[i], i);
	MOV.W	R10, R13	 ; i,
	PUSH    #0       ;,
	CALLA   #entry_call  ;
	INCD    SP       ;
 ; benchmarks/stringsearch/main.c:17:         location[i] = pbmsrch(find_strings[i], i);
	MOVA	R12, @R8	 ; tmp33, MEM[base: _16, offset: 0B]
	ADDA	#4, R8	 ;, ivtmp.24
 ; benchmarks/stringsearch/main.c:15:     for (i = 0; find_strings[i]; i++)
	ADD.W	#1, R10	 ;, i
	BRA	#.L4	 ;
	.size	benchmark, .-benchmark
	.balign 2
	.global	main
	.type	main, @function
main:
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       4
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUBA	#2, R1	 ;,
	; end of prologue
 ; benchmarks/stringsearch/../bareBench.h:53:   initPins();
	CALLA	#initPins	 ;
 ; benchmarks/stringsearch/../bareBench.h:57:   PM5CTL0 &= ~LOCKLPM5;
	BIC.W	#1, &PM5CTL0	 ; PM5CTL0,
 ; benchmarks/stringsearch/../bareBench.h:59:   LED(1);
	MOV.B	#1, R12	 ;,
	CALLA	#LED	 ;
 ; benchmarks/stringsearch/../bareBench.h:60:   for(run = RUNS; run > 0; run--)
	MOV.W	#1, @R1	 ;, run
.L7:
 ; benchmarks/stringsearch/../bareBench.h:60:   for(run = RUNS; run > 0; run--)
	MOV.W	@R1, R12	 ; run, run.2_5
 ; benchmarks/stringsearch/../bareBench.h:60:   for(run = RUNS; run > 0; run--)
	MOV.B	#0, R13	 ;,
	CMP.W	R12, R13 { JL	.L8	 ; run.2_5,,,
 ; benchmarks/stringsearch/../bareBench.h:64:   LED(0);
	MOV.B	#0, R12	 ;,
	CALLA	#LED	 ;
 ; benchmarks/stringsearch/../bareBench.h:67: }
	MOV.B	#0, R12	 ;,
	; start of epilogue
	.refsym	__crt0_call_exit
	ADDA	#2, R1	 ;,
	RETA	
.L8:
 ; benchmarks/stringsearch/../bareBench.h:62:     benchmark();
	CALLA	#benchmark	 ;,
 ; benchmarks/stringsearch/../bareBench.h:60:   for(run = RUNS; run > 0; run--)
	ADD.W	#-1, @R1	 ;, run
	BRA	#.L7	 ;
	.size	main, .-main
	.global	location
	.section .bss
	.balign 2
	.type	location, @object
	.size	location, 512
location:
	.zero	512
	.global	find_strings
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Kur"
.LC1:
	.string	"gent"
.LC2:
	.string	"lass"
.LC3:
	.string	"suns"
.LC4:
	.string	"for"
.LC5:
	.string	"xxx"
.LC6:
	.string	"long"
.LC7:
	.string	"have"
.LC8:
	.string	"where"
.LC9:
	.string	"xxxxxx"
.LC10:
	.string	"pense"
.LC11:
	.string	"pow"
.LC12:
	.string	"xxxxx"
.LC13:
	.string	"Yo"
.LC14:
	.string	"and"
.LC15:
	.string	"faded"
.LC16:
	.string	"20"
.LC17:
	.string	"you"
.LC18:
	.string	"bac"
.LC19:
	.string	"an"
.LC20:
	.string	"way"
.LC21:
	.string	"possibili"
.LC22:
	.string	"fat"
.LC23:
	.string	"imag"
.LC24:
	.string	"th"
.LC25:
	.string	"wor"
.LC26:
	.string	"yo"
.LC27:
	.string	"bxx"
.LC28:
	.string	"wo"
.LC29:
	.string	"kind"
.LC30:
	.string	"4"
.LC31:
	.string	"idle"
.LC32:
	.string	"Do"
.LC33:
	.string	"scare"
.LC34:
	.string	"people"
.LC35:
	.string	"wit"
.LC36:
	.string	"Th"
.LC37:
	.string	"yourself"
.LC38:
	.string	"Forget"
.LC39:
	.string	"succeed"
.LC40:
	.string	"Kee"
.LC41:
	.string	"lov"
.LC42:
	.string	"Stretc"
.LC43:
	.string	"what"
.LC44:
	.string	"life"
.LC45:
	.string	"kno"
.LC46:
	.string	"wha"
.LC47:
	.string	"40"
.LC48:
	.string	"Get"
.LC49:
	.string	"them"
.LC50:
	.string	"Maybe"
.LC51:
	.string	"may"
.LC52:
	.string	"the"
.LC53:
	.string	"your"
.LC54:
	.string	"congratulate"
.LC55:
	.string	"much"
.LC56:
	.string	"either"
.LC57:
	.string	"are"
.LC58:
	.string	"Enjoy"
.LC59:
	.string	"it"
.LC60:
	.string	"be"
.LC61:
	.string	"other"
.LC62:
	.string	"greatest"
.LC63:
	.string	"own"
.LC64:
	.string	"nowhere"
.LC65:
	.string	"room"
.LC66:
	.string	"beauty"
.LC67:
	.string	"feel"
.LC68:
	.string	"Northern"
.LC69:
	.string	"before"
.LC70:
	.string	"Accept"
.LC71:
	.string	"Politicians"
.LC72:
	.string	"get"
.LC73:
	.string	"size"
.LC74:
	.string	"reasonable"
.LC75:
	.string	"their"
.LC76:
	.string	"Dont"
.LC77:
	.string	"support"
.LC78:
	.string	"trust"
.LC79:
	.string	"spouse"
.LC80:
	.string	"one"
.LC81:
	.string	"too"
.LC82:
	.string	"time"
.LC83:
	.string	"careful"
.LC84:
	.string	"with"
.LC85:
	.string	"Dispensing"
.LC86:
	.string	"past"
.LC87:
	.string	"parts"
.LC88:
	.string	"more"
.LC89:
	.string	"me"
	.section	.extravars,"aw"
	.balign 2
	.type	find_strings, @object
	.size	find_strings, 516
find_strings:
	.long	.LC0
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.long	.LC5
	.long	.LC6
	.long	.LC7
	.long	.LC8
	.long	.LC9
	.long	.LC9
	.long	.LC10
	.long	.LC11
	.long	.LC12
	.long	.LC13
	.long	.LC14
	.long	.LC15
	.long	.LC16
	.long	.LC17
	.long	.LC18
	.long	.LC19
	.long	.LC20
	.long	.LC21
	.long	.LC19
	.long	.LC22
	.long	.LC23
	.long	.LC24
	.long	.LC25
	.long	.LC5
	.long	.LC5
	.long	.LC26
	.long	.LC27
	.long	.LC28
	.long	.LC29
	.long	.LC30
	.long	.LC31
	.long	.LC32
	.long	.LC33
	.long	.LC34
	.long	.LC35
	.long	.LC5
	.long	.LC5
	.long	.LC36
	.long	.LC5
	.long	.LC37
	.long	.LC38
	.long	.LC39
	.long	.LC40
	.long	.LC41
	.long	.LC26
	.long	.LC42
	.long	.LC43
	.long	.LC44
	.long	.LC45
	.long	.LC46
	.long	.LC5
	.long	.LC5
	.long	.LC47
	.long	.LC48
	.long	.LC5
	.long	.LC49
	.long	.LC50
	.long	.LC51
	.long	.LC17
	.long	.LC52
	.long	.LC53
	.long	.LC54
	.long	.LC55
	.long	.LC56
	.long	.LC57
	.long	.LC58
	.long	.LC59
	.long	.LC60
	.long	.LC61
	.long	.LC59
	.long	.LC5
	.long	.LC62
	.long	.LC63
	.long	.LC64
	.long	.LC65
	.long	.LC17
	.long	.LC66
	.long	.LC67
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC5
	.long	.LC59
	.long	.LC68
	.long	.LC69
	.long	.LC70
	.long	.LC71
	.long	.LC72
	.long	.LC73
	.long	.LC74
	.long	.LC75
	.long	.LC76
	.long	.LC77
	.long	.LC78
	.long	.LC79
	.long	.LC80
	.long	.LC81
	.long	.LC82
	.long	.LC83
	.long	.LC84
	.long	.LC85
	.long	.LC86
	.long	.LC52
	.long	.LC87
	.long	.LC88
	.long	.LC89
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.long	.LC5
	.long	.LC6
	.long	0
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 9.3.1.11) 9.3.1"
	.mspabi_attribute 4, 2
	.mspabi_attribute 6, 2
	.mspabi_attribute 8, 2
	.gnu_attribute 4, 1
