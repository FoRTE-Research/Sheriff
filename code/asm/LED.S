	.file	"LED.c"
 ; GNU C17 (Mitto Systems Limited - msp430-gcc 9.3.1.11) version 9.3.1 (msp430-elf)
 ;	compiled by GNU C version 4.8.5 20150623 (Red Hat 4.8.5-39), GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed:  -I /home/sprakhar/ti/msp430-gcc/include
 ; -imultilib large
 ; -iprefix /home/sprakhar/ti/msp430-gcc/bin/../lib/gcc/msp430-elf/9.3.1/
 ; -D BARE_METAL -D STRINGSEARCH benchmarks/LED.c -mmcu=msp430fr5994
 ; -mlarge
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mcpu=msp430xv2 -auxbase-strip asm/LED.S -Os -fverbose-asm
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
	.balign 2
	.global	initLED
	.type	initLED, @function
initLED:
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
 ; benchmarks/LED.c:4:   P1OUT &= ~BIT0;
	BIC.B	#1, &P1OUT	 ; P1OUT,
 ; benchmarks/LED.c:5:   P1DIR |= BIT0;
	BIS.B	#1, &P1DIR	 ; P1DIR,
 ; benchmarks/LED.c:6: }
	; start of epilogue
	RETA	
	.size	initLED, .-initLED
	.balign 2
	.global	LED
	.type	LED, @function
LED:
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
 ; benchmarks/LED.c:9:   if(a){
	CMP.W	#0, R12 { JEQ	.L3	 ;, tmp30,,
 ; benchmarks/LED.c:10:     P1OUT |= BIT0;
	BIS.B	#1, &P1OUT	 ; P1OUT,
.L2:
 ; benchmarks/LED.c:14: }
	; start of epilogue
	RETA	
.L3:
 ; benchmarks/LED.c:12:     P1OUT &= ~BIT0;
	BIC.B	#1, &P1OUT	 ; P1OUT,
 ; benchmarks/LED.c:14: }
	BRA	#.L2	 ;
	.size	LED, .-LED
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 9.3.1.11) 9.3.1"
	.mspabi_attribute 4, 2
	.mspabi_attribute 6, 2
	.mspabi_attribute 8, 2
	.gnu_attribute 4, 1
