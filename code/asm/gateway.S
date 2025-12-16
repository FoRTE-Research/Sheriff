	.file	"gateway.c"
 ; GNU C17 (Mitto Systems Limited - msp430-gcc 9.3.1.11) version 9.3.1 (msp430-elf)
 ;	compiled by GNU C version 4.8.5 20150623 (Red Hat 4.8.5-39), GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed:  -I /home/sprakhar/ti/msp430-gcc/include
 ; -imultilib large
 ; -iprefix /home/sprakhar/ti/msp430-gcc/bin/../lib/gcc/msp430-elf/9.3.1/
 ; -D BARE_METAL -D STRINGSEARCH secure-gateway/gateway.c
 ; -mmcu=msp430fr5994 -mlarge
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mcpu=msp430xv2 -auxbase-strip asm/gateway.S -Os -fverbose-asm
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
	.section	.securegateway,"ax",@progbits
	.balign 2
	.global	exit_irq
	.type	exit_irq, @function
exit_irq:
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
 ; secure-gateway/gateway.c:283:     __asm(" irq0: mov.w &0xFFE0, &ISR_ADDRESS");
 ; 283 "secure-gateway/gateway.c" 1
	 irq0: mov.w &0xFFE0, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:284:     __asm(" jmp interrupt_handler_routine");
 ; 284 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:285:     __asm(" irq1: mov.w &0xFFE2, &ISR_ADDRESS");
 ; 285 "secure-gateway/gateway.c" 1
	 irq1: mov.w &0xFFE2, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:286:     __asm(" jmp interrupt_handler_routine");
 ; 286 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:287:     __asm(" irq2: mov.w &0xFFE4, &ISR_ADDRESS");
 ; 287 "secure-gateway/gateway.c" 1
	 irq2: mov.w &0xFFE4, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:288:     __asm(" jmp interrupt_handler_routine");
 ; 288 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:289:     __asm(" irq3: mov.w &0xFFE6, &ISR_ADDRESS");
 ; 289 "secure-gateway/gateway.c" 1
	 irq3: mov.w &0xFFE6, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:290:     __asm(" jmp interrupt_handler_routine");
 ; 290 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:291:     __asm(" irq4: mov.w &0xFFE8, &ISR_ADDRESS");
 ; 291 "secure-gateway/gateway.c" 1
	 irq4: mov.w &0xFFE8, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:292:     __asm(" jmp interrupt_handler_routine");
 ; 292 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:293:     __asm(" irq5: mov.w &0xFFEA, &ISR_ADDRESS");
 ; 293 "secure-gateway/gateway.c" 1
	 irq5: mov.w &0xFFEA, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:294:     __asm(" jmp interrupt_handler_routine");
 ; 294 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:295:     __asm(" irq6: mov.w &0xFFEC, &ISR_ADDRESS");
 ; 295 "secure-gateway/gateway.c" 1
	 irq6: mov.w &0xFFEC, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:296:     __asm(" jmp interrupt_handler_routine");
 ; 296 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:297:     __asm(" irq7: mov.w &0xFFEE, &ISR_ADDRESS");
 ; 297 "secure-gateway/gateway.c" 1
	 irq7: mov.w &0xFFEE, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:298:     __asm(" jmp interrupt_handler_routine");
 ; 298 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:299:     __asm(" irq8: mov.w &0xFFF0, &ISR_ADDRESS");
 ; 299 "secure-gateway/gateway.c" 1
	 irq8: mov.w &0xFFF0, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:300:     __asm(" jmp interrupt_handler_routine");
 ; 300 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:301:     __asm(" irq9: mov.w &0xFFF2, &ISR_ADDRESS");
 ; 301 "secure-gateway/gateway.c" 1
	 irq9: mov.w &0xFFF2, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:302:     __asm(" jmp interrupt_handler_routine");
 ; 302 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:303:     __asm(" irq10: mov.w &0xFFF4, &ISR_ADDRESS");
 ; 303 "secure-gateway/gateway.c" 1
	 irq10: mov.w &0xFFF4, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:304:     __asm(" jmp interrupt_handler_routine");
 ; 304 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:305:     __asm(" irq11: mov.w &0xFFF6, &ISR_ADDRESS");
 ; 305 "secure-gateway/gateway.c" 1
	 irq11: mov.w &0xFFF6, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:306:     __asm(" jmp interrupt_handler_routine");
 ; 306 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:307:     __asm(" irq12: mov.w &0xFFF8, &ISR_ADDRESS");
 ; 307 "secure-gateway/gateway.c" 1
	 irq12: mov.w &0xFFF8, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:308:     __asm(" jmp interrupt_handler_routine");
 ; 308 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:309:     __asm(" irq13: mov.w &0xFFFA, &ISR_ADDRESS");
 ; 309 "secure-gateway/gateway.c" 1
	 irq13: mov.w &0xFFFA, &ISR_ADDRESS
 ; 0 "" 2
 ; secure-gateway/gateway.c:310:     __asm(" jmp interrupt_handler_routine");
 ; 310 "secure-gateway/gateway.c" 1
	 jmp interrupt_handler_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:316:     __asm(" irq14: clr R3");
 ; 316 "secure-gateway/gateway.c" 1
	 irq14: clr R3
 ; 0 "" 2
 ; secure-gateway/gateway.c:317:     __asm(" clr R4");
 ; 317 "secure-gateway/gateway.c" 1
	 clr R4
 ; 0 "" 2
 ; secure-gateway/gateway.c:318:     __asm(" clr R5");
 ; 318 "secure-gateway/gateway.c" 1
	 clr R5
 ; 0 "" 2
 ; secure-gateway/gateway.c:319:     __asm(" clr R6");
 ; 319 "secure-gateway/gateway.c" 1
	 clr R6
 ; 0 "" 2
 ; secure-gateway/gateway.c:320:     __asm(" clr R7");
 ; 320 "secure-gateway/gateway.c" 1
	 clr R7
 ; 0 "" 2
 ; secure-gateway/gateway.c:321:     __asm(" clr R8");
 ; 321 "secure-gateway/gateway.c" 1
	 clr R8
 ; 0 "" 2
 ; secure-gateway/gateway.c:322:     __asm(" clr R9");
 ; 322 "secure-gateway/gateway.c" 1
	 clr R9
 ; 0 "" 2
 ; secure-gateway/gateway.c:323:     __asm(" clr R10");
 ; 323 "secure-gateway/gateway.c" 1
	 clr R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:324:     __asm(" clr R11");
 ; 324 "secure-gateway/gateway.c" 1
	 clr R11
 ; 0 "" 2
 ; secure-gateway/gateway.c:325:     __asm(" clr R12");
 ; 325 "secure-gateway/gateway.c" 1
	 clr R12
 ; 0 "" 2
 ; secure-gateway/gateway.c:326:     __asm(" clr R13");
 ; 326 "secure-gateway/gateway.c" 1
	 clr R13
 ; 0 "" 2
 ; secure-gateway/gateway.c:327:     __asm(" clr R14");
 ; 327 "secure-gateway/gateway.c" 1
	 clr R14
 ; 0 "" 2
 ; secure-gateway/gateway.c:328:     __asm(" clr R15");    
 ; 328 "secure-gateway/gateway.c" 1
	 clr R15
 ; 0 "" 2
 ; secure-gateway/gateway.c:329:     __asm(" and.w #0xFEF8, SR");
 ; 329 "secure-gateway/gateway.c" 1
	 and.w #0xFEF8, SR
 ; 0 "" 2
 ; secure-gateway/gateway.c:330:     __asm(" mov.w &EXIT_RET_SP, SP");
 ; 330 "secure-gateway/gateway.c" 1
	 mov.w &EXIT_RET_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:331:     __asm(" mov.w &0xFFFC, PC");
 ; 331 "secure-gateway/gateway.c" 1
	 mov.w &0xFFFC, PC
 ; 0 "" 2
 ; secure-gateway/gateway.c:335:     __asm(" interrupt_handler_routine: add.w #4, SP");
 ; 335 "secure-gateway/gateway.c" 1
	 interrupt_handler_routine: add.w #4, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:336:     __asm(" mov.w SP, &ISR_SP");
 ; 336 "secure-gateway/gateway.c" 1
	 mov.w SP, &ISR_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:337:     __asm(" sub.w #4, SP");
 ; 337 "secure-gateway/gateway.c" 1
	 sub.w #4, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:339:     __asm(" push &ISR_SP");
 ; 339 "secure-gateway/gateway.c" 1
	 push &ISR_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:341:     __asm(" mov.w &EXIT_RET_SP, &ISR_SP");
 ; 341 "secure-gateway/gateway.c" 1
	 mov.w &EXIT_RET_SP, &ISR_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:343:     __asm(" cmp.w #0x4000, SP");
 ; 343 "secure-gateway/gateway.c" 1
	 cmp.w #0x4000, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:344:     __asm(" jnc nw_routine");           //jump to nw_routine if SP < 0x4000
 ; 344 "secure-gateway/gateway.c" 1
	 jnc nw_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:345:     __asm(" cmp.w #0xEF80, SP");                
 ; 345 "secure-gateway/gateway.c" 1
	 cmp.w #0xEF80, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:346:     __asm(" jnc regular_routine");      //jump to regular_routine if SP < 0xEF80
 ; 346 "secure-gateway/gateway.c" 1
	 jnc regular_routine
 ; 0 "" 2
 ; secure-gateway/gateway.c:350:     __asm(" nw_routine: pushx.a R10");
 ; 350 "secure-gateway/gateway.c" 1
	 nw_routine: pushx.a R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:351:     __asm(" mov.w &INTERRUPT_RET_SP, R10");
 ; 351 "secure-gateway/gateway.c" 1
	 mov.w &INTERRUPT_RET_SP, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:353:     __asm(" add.w #4, SP");
 ; 353 "secure-gateway/gateway.c" 1
	 add.w #4, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:354:     __asm(" pop -6(R10)");                     //store return SP on secure stack
 ; 354 "secure-gateway/gateway.c" 1
	 pop -6(R10)
 ; 0 "" 2
 ; secure-gateway/gateway.c:355:     __asm(" clr -2(SP)");
 ; 355 "secure-gateway/gateway.c" 1
	 clr -2(SP)
 ; 0 "" 2
 ; secure-gateway/gateway.c:356:     __asm(" pop -4(R10)");                     //store return SR on secure stack
 ; 356 "secure-gateway/gateway.c" 1
	 pop -4(R10)
 ; 0 "" 2
 ; secure-gateway/gateway.c:357:     __asm(" clr -2(SP)");
 ; 357 "secure-gateway/gateway.c" 1
	 clr -2(SP)
 ; 0 "" 2
 ; secure-gateway/gateway.c:358:     __asm(" pop -2(R10)");                     //store return PC on secure stack
 ; 358 "secure-gateway/gateway.c" 1
	 pop -2(R10)
 ; 0 "" 2
 ; secure-gateway/gateway.c:359:     __asm(" clr -2(SP)");
 ; 359 "secure-gateway/gateway.c" 1
	 clr -2(SP)
 ; 0 "" 2
 ; secure-gateway/gateway.c:360:     __asm(" mov.w SP, &ISR_SP");
 ; 360 "secure-gateway/gateway.c" 1
	 mov.w SP, &ISR_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:361:     __asm(" movx.a -10(SP), R10");             //restore original R10
 ; 361 "secure-gateway/gateway.c" 1
	 movx.a -10(SP), R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:362:     __asm(" clrx.a -10(SP)");
 ; 362 "secure-gateway/gateway.c" 1
	 clrx.a -10(SP)
 ; 0 "" 2
 ; secure-gateway/gateway.c:363:     __asm(" mov.w &INTERRUPT_RET_SP, SP");     //switch to secure stack
 ; 363 "secure-gateway/gateway.c" 1
	 mov.w &INTERRUPT_RET_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:364:     __asm(" sub.w #6, SP");
 ; 364 "secure-gateway/gateway.c" 1
	 sub.w #6, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:368:     __asm(" regular_routine: pushm.a #13, R15");
 ; 368 "secure-gateway/gateway.c" 1
	 regular_routine: pushm.a #13, R15
 ; 0 "" 2
 ; secure-gateway/gateway.c:372:     __asm(" clr R3");
 ; 372 "secure-gateway/gateway.c" 1
	 clr R3
 ; 0 "" 2
 ; secure-gateway/gateway.c:373:     __asm(" clr R4");
 ; 373 "secure-gateway/gateway.c" 1
	 clr R4
 ; 0 "" 2
 ; secure-gateway/gateway.c:374:     __asm(" clr R5");
 ; 374 "secure-gateway/gateway.c" 1
	 clr R5
 ; 0 "" 2
 ; secure-gateway/gateway.c:375:     __asm(" clr R6");
 ; 375 "secure-gateway/gateway.c" 1
	 clr R6
 ; 0 "" 2
 ; secure-gateway/gateway.c:376:     __asm(" clr R7");
 ; 376 "secure-gateway/gateway.c" 1
	 clr R7
 ; 0 "" 2
 ; secure-gateway/gateway.c:377:     __asm(" clr R8");
 ; 377 "secure-gateway/gateway.c" 1
	 clr R8
 ; 0 "" 2
 ; secure-gateway/gateway.c:378:     __asm(" clr R9");
 ; 378 "secure-gateway/gateway.c" 1
	 clr R9
 ; 0 "" 2
 ; secure-gateway/gateway.c:379:     __asm(" clr R10");
 ; 379 "secure-gateway/gateway.c" 1
	 clr R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:380:     __asm(" clr R11");
 ; 380 "secure-gateway/gateway.c" 1
	 clr R11
 ; 0 "" 2
 ; secure-gateway/gateway.c:381:     __asm(" clr R12");
 ; 381 "secure-gateway/gateway.c" 1
	 clr R12
 ; 0 "" 2
 ; secure-gateway/gateway.c:382:     __asm(" clr R13");
 ; 382 "secure-gateway/gateway.c" 1
	 clr R13
 ; 0 "" 2
 ; secure-gateway/gateway.c:383:     __asm(" clr R14");
 ; 383 "secure-gateway/gateway.c" 1
	 clr R14
 ; 0 "" 2
 ; secure-gateway/gateway.c:384:     __asm(" clr R15");
 ; 384 "secure-gateway/gateway.c" 1
	 clr R15
 ; 0 "" 2
 ; secure-gateway/gateway.c:388:     __asm(" and.w #0xFEF8, SR");
 ; 388 "secure-gateway/gateway.c" 1
	 and.w #0xFEF8, SR
 ; 0 "" 2
 ; secure-gateway/gateway.c:392:     __asm(" push &INTERRUPT_RET_SP");                        //store a copy of INTERRUPT_RET_SP on secure stack before 
 ; 392 "secure-gateway/gateway.c" 1
	 push &INTERRUPT_RET_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:394:     __asm(" mov.w SP, &INTERRUPT_RET_SP");
 ; 394 "secure-gateway/gateway.c" 1
	 mov.w SP, &INTERRUPT_RET_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:398:     __asm(" mov.w &ISR_SP, SP");
 ; 398 "secure-gateway/gateway.c" 1
	 mov.w &ISR_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:402:     __asm(" mov.w &ISR_ADDRESS, PC");
 ; 402 "secure-gateway/gateway.c" 1
	 mov.w &ISR_ADDRESS, PC
 ; 0 "" 2
 ; secure-gateway/gateway.c:406:     __asm(" irqRESET: mov.w &EXIT_RET_SP, SP");
 ; 406 "secure-gateway/gateway.c" 1
	 irqRESET: mov.w &EXIT_RET_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:407:     __asm(" mov.w &0xFFFE, PC");
 ; 407 "secure-gateway/gateway.c" 1
	 mov.w &0xFFFE, PC
 ; 0 "" 2
	.size	exit_irq, .-exit_irq
	.balign 2
	.global	exit_ret
	.type	exit_ret, @function
exit_ret:
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
 ; secure-gateway/gateway.c:245:     __asm(" mov.b &RET_REG_COUNT, R10");
 ; 245 "secure-gateway/gateway.c" 1
	 mov.b &RET_REG_COUNT, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:246:     __asm(" cmp.w #1, R10");
 ; 246 "secure-gateway/gateway.c" 1
	 cmp.w #1, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:247:     __asm(" jeq return_one");
 ; 247 "secure-gateway/gateway.c" 1
	 jeq return_one
 ; 0 "" 2
 ; secure-gateway/gateway.c:248:     __asm(" cmp.w #2, R10");
 ; 248 "secure-gateway/gateway.c" 1
	 cmp.w #2, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:249:     __asm(" jeq return_two");
 ; 249 "secure-gateway/gateway.c" 1
	 jeq return_two
 ; 0 "" 2
 ; secure-gateway/gateway.c:250:     __asm(" cmp.w #4, R10");
 ; 250 "secure-gateway/gateway.c" 1
	 cmp.w #4, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:251:     __asm(" jeq return_four");
 ; 251 "secure-gateway/gateway.c" 1
	 jeq return_four
 ; 0 "" 2
 ; secure-gateway/gateway.c:253:     __asm(" return_none: clr R12");
 ; 253 "secure-gateway/gateway.c" 1
	 return_none: clr R12
 ; 0 "" 2
 ; secure-gateway/gateway.c:254:     __asm(" return_one: clr R13");
 ; 254 "secure-gateway/gateway.c" 1
	 return_one: clr R13
 ; 0 "" 2
 ; secure-gateway/gateway.c:255:     __asm(" return_two: clr R14");
 ; 255 "secure-gateway/gateway.c" 1
	 return_two: clr R14
 ; 0 "" 2
 ; secure-gateway/gateway.c:256:     __asm(" clr R15");
 ; 256 "secure-gateway/gateway.c" 1
	 clr R15
 ; 0 "" 2
 ; secure-gateway/gateway.c:257:     __asm(" return_four: clr R3");
 ; 257 "secure-gateway/gateway.c" 1
	 return_four: clr R3
 ; 0 "" 2
 ; secure-gateway/gateway.c:258:     __asm(" clr R11");
 ; 258 "secure-gateway/gateway.c" 1
	 clr R11
 ; 0 "" 2
 ; secure-gateway/gateway.c:262:     __asm(" and.w #0xFEF8, SR");
 ; 262 "secure-gateway/gateway.c" 1
	 and.w #0xFEF8, SR
 ; 0 "" 2
 ; secure-gateway/gateway.c:266:     __asm(" mov.w &EXIT_RET_SP, SP");
 ; 266 "secure-gateway/gateway.c" 1
	 mov.w &EXIT_RET_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:267:     __asm(" popm.a #7, R10");
 ; 267 "secure-gateway/gateway.c" 1
	 popm.a #7, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:270:     __asm(" mova &EXIT_RET_PC, PC");   
 ; 270 "secure-gateway/gateway.c" 1
	 mova &EXIT_RET_PC, PC
 ; 0 "" 2
 ; secure-gateway/gateway.c:274:     __asm(" fault_trap: jmp fault_trap");              
 ; 274 "secure-gateway/gateway.c" 1
	 fault_trap: jmp fault_trap
 ; 0 "" 2
	.size	exit_ret, .-exit_ret
	.balign 2
	.global	entry_reti
	.type	entry_reti, @function
entry_reti:
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
 ; secure-gateway/gateway.c:416:     __asm(" dint");                  
 ; 416 "secure-gateway/gateway.c" 1
	 dint
 ; 0 "" 2
 ; secure-gateway/gateway.c:417:     __asm(" nop");                    //rest of the function after this is atomic
 ; 417 "secure-gateway/gateway.c" 1
	 nop
 ; 0 "" 2
 ; secure-gateway/gateway.c:421:     __asm(" mov.w &INTERRUPT_RET_SP, SP");   
 ; 421 "secure-gateway/gateway.c" 1
	 mov.w &INTERRUPT_RET_SP, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:426:     __asm(" pop &INTERRUPT_RET_SP");
 ; 426 "secure-gateway/gateway.c" 1
	 pop &INTERRUPT_RET_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:430:     __asm(" popm.a #13, R15");
 ; 430 "secure-gateway/gateway.c" 1
	 popm.a #13, R15
 ; 0 "" 2
 ; secure-gateway/gateway.c:433:     __asm(" pushx.a R10");
 ; 433 "secure-gateway/gateway.c" 1
	 pushx.a R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:434:     __asm(" mov.w SP, R10");
 ; 434 "secure-gateway/gateway.c" 1
	 mov.w SP, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:435:     __asm(" mov.w 4(R10), SP");         //switch to return stack
 ; 435 "secure-gateway/gateway.c" 1
	 mov.w 4(R10), SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:437:     __asm(" push 8(R10)");              //copy return PC to return stack
 ; 437 "secure-gateway/gateway.c" 1
	 push 8(R10)
 ; 0 "" 2
 ; secure-gateway/gateway.c:438:     __asm(" push 6(R10)");              //copy return SR to return stack
 ; 438 "secure-gateway/gateway.c" 1
	 push 6(R10)
 ; 0 "" 2
 ; secure-gateway/gateway.c:439:     __asm(" mova @R10, R10");           //restore original R10
 ; 439 "secure-gateway/gateway.c" 1
	 mova @R10, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:443:     __asm(" reti");
 ; 443 "secure-gateway/gateway.c" 1
	 reti
 ; 0 "" 2
	.size	entry_reti, .-entry_reti
	.balign 2
	.global	entry_call
	.type	entry_call, @function
entry_call:
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       4
; elim fp -> sp       0
; saved regs:(none)
 ; secure-gateway/gateway.c:39:     __asm(" popx.a &EXIT_RET_PC");
 ; 39 "secure-gateway/gateway.c" 1
	 popx.a &EXIT_RET_PC
 ; 0 "" 2
 ; secure-gateway/gateway.c:43:     __asm(" pushm.a #7, R10"); 
 ; 43 "secure-gateway/gateway.c" 1
	 pushm.a #7, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:47:     __asm(" mov.w SP, &EXIT_RET_SP");
 ; 47 "secure-gateway/gateway.c" 1
	 mov.w SP, &EXIT_RET_SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:48:     __asm(" mov.w SP, R10");
 ; 48 "secure-gateway/gateway.c" 1
	 mov.w SP, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:49:     __asm(" mov.w #0xEF7E, SP");
 ; 49 "secure-gateway/gateway.c" 1
	 mov.w #0xEF7E, SP
 ; 0 "" 2
 ; secure-gateway/gateway.c:53:     __asm(" add.w #28, R10");
 ; 53 "secure-gateway/gateway.c" 1
	 add.w #28, R10
 ; 0 "" 2
 ; secure-gateway/gateway.c:54:     __asm(" mov.w @R10+, R9");
 ; 54 "secure-gateway/gateway.c" 1
	 mov.w @R10+, R9
 ; 0 "" 2
 ; secure-gateway/gateway.c:95:     __asm(" cmp.w #0, R9");
 ; 95 "secure-gateway/gateway.c" 1
	 cmp.w #0, R9
 ; 0 "" 2
 ; secure-gateway/gateway.c:96:     __asm(" jeq pbmsrch0");
 ; 96 "secure-gateway/gateway.c" 1
	 jeq pbmsrch0
 ; 0 "" 2
 ; secure-gateway/gateway.c:97:     __asm(" jmp fault_trap");                             //jump to fault_trap if no match
 ; 97 "secure-gateway/gateway.c" 1
	 jmp fault_trap
 ; 0 "" 2
 ; secure-gateway/gateway.c:101:     __asm(" pbmsrch0: mov.b #1, &RET_REG_COUNT");
 ; 101 "secure-gateway/gateway.c" 1
	 pbmsrch0: mov.b #1, &RET_REG_COUNT
 ; 0 "" 2
 ; secure-gateway/gateway.c:102:     __asm(" pushx.a #exit_ret");
 ; 102 "secure-gateway/gateway.c" 1
	 pushx.a #exit_ret
 ; 0 "" 2
 ; secure-gateway/gateway.c:103:     __asm(" br #pbmsrch");
 ; 103 "secure-gateway/gateway.c" 1
	 br #pbmsrch
 ; 0 "" 2
	.size	entry_call, .-entry_call
	.global	RET_REG_COUNT
	.section	.globalvars,"aw"
	.type	RET_REG_COUNT, @object
	.size	RET_REG_COUNT, 1
RET_REG_COUNT:
	.zero	1
	.global	ISR_ADDRESS
	.balign 2
	.type	ISR_ADDRESS, @object
	.size	ISR_ADDRESS, 2
ISR_ADDRESS:
	.short	-4224
	.global	ISR_SP
	.balign 2
	.type	ISR_SP, @object
	.size	ISR_SP, 2
ISR_SP:
	.zero	2
	.global	INTERRUPT_RET_SP
	.balign 2
	.type	INTERRUPT_RET_SP, @object
	.size	INTERRUPT_RET_SP, 2
INTERRUPT_RET_SP:
	.short	-4226
	.global	EXIT_RET_SP
	.balign 2
	.type	EXIT_RET_SP, @object
	.size	EXIT_RET_SP, 2
EXIT_RET_SP:
	.short	11260
	.global	EXIT_RET_PC
	.balign 2
	.type	EXIT_RET_PC, @object
	.size	EXIT_RET_PC, 4
EXIT_RET_PC:
	.long	61312
	.global	SECZONE_INIT_STRUCT
	.section	.ipestruct,"aw"
	.balign 2
	.type	SECZONE_INIT_STRUCT, @object
	.size	SECZONE_INIT_STRUCT, 2
SECZONE_INIT_STRUCT:
	.short	-16657
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 9.3.1.11) 9.3.1"
	.mspabi_attribute 4, 2
	.mspabi_attribute 6, 2
	.mspabi_attribute 8, 2
	.gnu_attribute 4, 1
