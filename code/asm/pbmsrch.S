	.file	"pbmsrch.c"
 ; GNU C17 (Mitto Systems Limited - msp430-gcc 9.3.1.11) version 9.3.1 (msp430-elf)
 ;	compiled by GNU C version 4.8.5 20150623 (Red Hat 4.8.5-39), GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed:  -I /home/sprakhar/ti/msp430-gcc/include
 ; -imultilib large
 ; -iprefix /home/sprakhar/ti/msp430-gcc/bin/../lib/gcc/msp430-elf/9.3.1/
 ; -D BARE_METAL -D STRINGSEARCH benchmarks/stringsearch/pbmsrch.c
 ; -mmcu=msp430fr5994 -mlarge
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mdevices-csv-loc=/home/sprakhar/ti/msp430-gcc/include/devices.csv
 ; -mcpu=msp430xv2 -auxbase-strip asm/pbmsrch.S -Os -fverbose-asm
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
	.section	.secure_code,"ax",@progbits
	.balign 2
	.global	init_search
	.type	init_search, @function
init_search:
; start of function
; attributes: 
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
 ; benchmarks/stringsearch/pbmsrch.c:25:     length = 0;
	MOVX.A	#0, &length	 ;, length
	MOVA	R12, R10	 ; string, ivtmp.60
.L2:
 ; benchmarks/stringsearch/pbmsrch.c:26:     while (*str != '\0') {
	MOV.B	@R10+, R13	 ; MEM[base: _45, offset: 0B], _28
	MOVA	&length, R14	 ; length, pretmp_23
 ; benchmarks/stringsearch/pbmsrch.c:26:     while (*str != '\0') {
	CMP.W	#0, R13 { JNE	.L3	 ;, _28,,
 ; benchmarks/stringsearch/pbmsrch.c:59:       len = custom_strlen(string);
	MOVA	R14, &len	 ; pretmp_23, len
	MOVA	#table, R10	 ;, ivtmp.50
	MOVA	#table+1024, R8	 ;, _24
.L4:
 ; benchmarks/stringsearch/pbmsrch.c:60:       for (init_i = 0; init_i <= 255; init_i++)              
	CMPA	R10, R8 { JNE	.L5	 ;, ivtmp.50, _24,
 ; benchmarks/stringsearch/pbmsrch.c:62:       for (init_i = 0; init_i < len; init_i++)
	MOVX.A	#0, &init_i	 ;, init_i
.L6:
 ; benchmarks/stringsearch/pbmsrch.c:62:       for (init_i = 0; init_i < len; init_i++)
	MOVA	&init_i, R10	 ; init_i, init_i.8_10
 ; benchmarks/stringsearch/pbmsrch.c:62:       for (init_i = 0; init_i < len; init_i++)
	CMPA	R14, R10 { JLO	.L7	 ;, pretmp_23, init_i.8_10,
 ; benchmarks/stringsearch/pbmsrch.c:64:       findme = (char *)string;
	MOVA	R12, &findme	 ; string, findme
 ; benchmarks/stringsearch/pbmsrch.c:65: }
	; start of epilogue
	POPM.A	#1, r6	 ;,,
	POPM.A	#1, r8	 ;,,
	POPM.A	#1, r10	 ;,,
	RETA	
.L3:
 ; benchmarks/stringsearch/pbmsrch.c:27:         length++;
	ADDA	#1, R14	 ;, pretmp_23
	MOVA	R14, &length	 ; pretmp_23, length
	BRA	#.L2	 ;
.L5:
 ; benchmarks/stringsearch/pbmsrch.c:61:             table[init_i] = len;
	MOVA	R14, @R10	 ; pretmp_23, MEM[base: _41, offset: 0B]
	ADDA	#4, R10	 ;, ivtmp.50
	BRA	#.L4	 ;
.L7:
 ; benchmarks/stringsearch/pbmsrch.c:63:             table[(unsigned char)string[init_i]] = len - init_i - 1;
	MOVA	R12, R8	 ; string, tmp40
	ADDA	R10, R8	 ; init_i.8_10, tmp40
 ; benchmarks/stringsearch/pbmsrch.c:63:             table[(unsigned char)string[init_i]] = len - init_i - 1;
	MOVX.B @R8, R8 { RLAM.W #2, R8	 ; *_5, tmp43,
 ; benchmarks/stringsearch/pbmsrch.c:63:             table[(unsigned char)string[init_i]] = len - init_i - 1;
	MOVA	R10, R6	 ; init_i.8_10, tmp45
	INVX.A	R6	 ; tmp45
	ADDA	R14, R6	 ; pretmp_23, tmp45
	MOVX.A	R6, table(R8)	 ; tmp45, table
 ; benchmarks/stringsearch/pbmsrch.c:62:       for (init_i = 0; init_i < len; init_i++)
	ADDA	#1, R10	 ;, init_i.8_10
	MOVA	R10, &init_i	 ; init_i.8_10, init_i
	BRA	#.L6	 ;
	.size	init_search, .-init_search
	.balign 2
	.global	strsearch
	.type	strsearch, @function
strsearch:
; start of function
; attributes: 
; framesize_regs:     24
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          24
; elim ap -> fp       28
; elim fp -> sp       0
; saved regs: R4 R6 R7 R8 R9 R10
	; start of prologue
	PUSHM.A	#5, R10	 ;,
	PUSHM.A	#1, R4	 ;,
	; end of prologue
	MOVA	R12, R4	 ; tmp59, string
 ; benchmarks/stringsearch/pbmsrch.c:79:       pos = len - 1;
	MOVA	&len, R11	 ; len, len.11_1
	MOVA	R11, R12	 ; len.11_1,
	ADDA	#-1, R12	 ;,
	MOVA	R12, &pos	 ;, pos
 ; benchmarks/stringsearch/pbmsrch.c:25:     length = 0;
	MOVX.A	#0, &length	 ;, length
	MOVA	R4, R12	 ; string, ivtmp.91
.L9:
 ; benchmarks/stringsearch/pbmsrch.c:26:     while (*str != '\0') {
	MOV.B	@R12+, R13	 ; MEM[base: _65, offset: 0B], _41
	MOVA	&length, R6	 ; length, pretmp_70
 ; benchmarks/stringsearch/pbmsrch.c:26:     while (*str != '\0') {
	CMP.W	#0, R13 { JNE	.L10	 ;, _41,,
 ; benchmarks/stringsearch/pbmsrch.c:80:       limit=custom_strlen(string);
	MOVA	R6, &limit	 ; pretmp_70, limit
 ; benchmarks/stringsearch/pbmsrch.c:91:                   if (0 == custom_strncmp(findme,
	MOVA	&findme, R7	 ; findme, findme.19_14
.L16:
 ; benchmarks/stringsearch/pbmsrch.c:82:       while (pos < limit)
	CMPX.A	R6, &pos { JLO	.L19	 ; pretmp_70, pos,,
 ; benchmarks/stringsearch/pbmsrch.c:99:       return NULL;
	MOV.B	#0, R12	 ;, <retval>
.L8:
 ; benchmarks/stringsearch/pbmsrch.c:100: }
	; start of epilogue
	POPM.A	#1, r4	 ;,,
	POPM.A	#5, r10	 ;,,
	RETA	
.L10:
 ; benchmarks/stringsearch/pbmsrch.c:27:         length++;
	ADDA	#1, R6	 ;, pretmp_70
	MOVA	R6, &length	 ; pretmp_70, length
	BRA	#.L9	 ;
.L13:
 ; benchmarks/stringsearch/pbmsrch.c:87:                   pos += shift;
	ADDA	R14, R12	 ; _11, pos.14_5
	MOVA	R12, &pos	 ; pos.14_5, pos
.L19:
 ; benchmarks/stringsearch/pbmsrch.c:84:             while( pos < limit &&
	MOVA	&pos, R12	 ; pos, pos.14_5
 ; benchmarks/stringsearch/pbmsrch.c:84:             while( pos < limit &&
	CMPA	R6, R12 { JHS	.L12	 ;, pretmp_70, pos.14_5,
 ; benchmarks/stringsearch/pbmsrch.c:85:                   (shift = table[(unsigned char)string[pos]]) > 0)
	MOVA	R4, R14	 ; string, tmp49
	ADDA	R12, R14	 ; pos.14_5, tmp49
 ; benchmarks/stringsearch/pbmsrch.c:85:                   (shift = table[(unsigned char)string[pos]]) > 0)
	MOVX.B @R14, R14 { RLAM.W #2, R14	 ; *_8, tmp52,
	MOVX.A	table(R14), R14	 ; table, _11
 ; benchmarks/stringsearch/pbmsrch.c:85:                   (shift = table[(unsigned char)string[pos]]) > 0)
	MOVA	R14, &shift	 ; _11, shift
 ; benchmarks/stringsearch/pbmsrch.c:84:             while( pos < limit &&
	CMPA	#0, R14 { JNE	.L13	 ;,, _11,
.L15:
	MOVA	R12, R9	 ; pos.14_5, _68
	ADDA	#1, R9	 ;, _68
 ; benchmarks/stringsearch/pbmsrch.c:92:                         here = (char *)&string[pos-len+1], len))
	MOVX.A	R9, R12 { SUBX.A	R11, R12	 ; _68, tmp54, len.11_1
 ; benchmarks/stringsearch/pbmsrch.c:92:                         here = (char *)&string[pos-len+1], len))
	ADDA	R4, R12	 ; string, <retval>
 ; benchmarks/stringsearch/pbmsrch.c:92:                         here = (char *)&string[pos-len+1], len))
	MOVA	R12, &here	 ; <retval>, here
 ; benchmarks/stringsearch/pbmsrch.c:35:     while ( n && *s1 && ( *s1 == *s2 ) )
	MOV.B	#0, R14	 ;, ivtmp.67
.L14:
	CMPA	R14, R11 { JEQ	.L8	 ;, ivtmp.67, len.11_1,
 ; benchmarks/stringsearch/pbmsrch.c:35:     while ( n && *s1 && ( *s1 == *s2 ) )
	MOVA	R7, R10	 ; findme.19_14, tmp55
	ADDA	R14, R10	 ; ivtmp.67, tmp55
	MOV.B	@R10, R13	 ; MEM[base: _55, offset: 0B], _49
	MOVA	R12, R8	 ; <retval>, tmp56
	ADDA	R14, R8	 ; ivtmp.67, tmp56
	MOV.B	@R8, R15	 ; MEM[base: _62, offset: 0B], pretmp_25
 ; benchmarks/stringsearch/pbmsrch.c:35:     while ( n && *s1 && ( *s1 == *s2 ) )
	CMP.B	#0, @R10 { JEQ	.L18	 ;, MEM[base: _55, offset: 0B],,
	ADDA	#1, R14	 ;, ivtmp.67
 ; benchmarks/stringsearch/pbmsrch.c:35:     while ( n && *s1 && ( *s1 == *s2 ) )
	CMP.W	R13, R15 { JEQ	.L14	 ; _49, pretmp_25,,
.L20:
 ; benchmarks/stringsearch/pbmsrch.c:96:                   else  pos++;
	MOVA	R9, &pos	 ; _68, pos
	BRA	#.L16	 ;
.L12:
 ; benchmarks/stringsearch/pbmsrch.c:89:             if (0 == shift)
	CMPX.A	#0, &shift { JNE	.L16	 ;, shift,,
	BRA	#.L15	 ;
.L18:
 ; benchmarks/stringsearch/pbmsrch.c:91:                   if (0 == custom_strncmp(findme,
	CMP.W	#0, R15 { JNE	.L20	 ;, pretmp_25,,
	BRA	#.L8	 ;
	.size	strsearch, .-strsearch
	.balign 2
	.global	pbmsrch
	.type	pbmsrch, @function
pbmsrch:
; start of function
; attributes: 
; framesize_regs:     4
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          4
; elim ap -> fp       8
; elim fp -> sp       0
; saved regs: R10
	; start of prologue
	PUSHM.A	#1, R10	 ;,
	; end of prologue
	MOV.W	R13, R10	 ; tmp40, i
 ; benchmarks/stringsearch/pbmsrch.c:104:     init_search(string);
	CALLA	#init_search	 ;
 ; benchmarks/stringsearch/pbmsrch.c:105:     here = strsearch(search_strings[i]);
	RLAM.A #4, R10 { RRAM.A #4, R10	 ; i
	MOVA	R10, R12	 ; i, tmp32
	RLAM.A	#3, R12	 ; tmp32,
	ADDA	R10, R12	 ; i, tmp33
	RLAM.A	#2, R12	 ; tmp34,
	SUBA	R10, R12	 ; i, tmp35
	RLAM.A	#1, R12	 ; tmp36,
 ; benchmarks/stringsearch/pbmsrch.c:105:     here = strsearch(search_strings[i]);
	ADDA	#search_strings, R12	 ;,
	CALLA	#strsearch	 ;,
 ; benchmarks/stringsearch/pbmsrch.c:105:     here = strsearch(search_strings[i]);
	MOVA	R12, &here	 ; tmp41, here
 ; benchmarks/stringsearch/pbmsrch.c:107: }
	; start of epilogue
	POPM.A	#1, r10	 ;,,
	RETA	
	.size	pbmsrch, .-pbmsrch
	.global	limit
	.section	.secure_vars,"aw"
	.balign 2
	.type	limit, @object
	.size	limit, 4
limit:
	.zero	4
	.global	here
	.balign 2
	.type	here, @object
	.size	here, 4
here:
	.zero	4
	.global	pos
	.balign 2
	.type	pos, @object
	.size	pos, 4
pos:
	.zero	4
	.global	shift
	.balign 2
	.type	shift, @object
	.size	shift, 4
shift:
	.zero	4
	.global	init_i
	.balign 2
	.type	init_i, @object
	.size	init_i, 4
init_i:
	.zero	4
	.global	length
	.balign 2
	.type	length, @object
	.size	length, 4
length:
	.zero	4
	.balign 2
	.type	findme, @object
	.size	findme, 4
findme:
	.zero	4
	.balign 2
	.type	len, @object
	.size	len, 4
len:
	.zero	4
	.balign 2
	.type	table, @object
	.size	table, 1024
table:
	.zero	1024
	.global	search_strings
	.type	search_strings, @object
	.size	search_strings, 35000
search_strings:
	.string	"Kurt Vonneguts Commencement Address at"
	.zero	31
	.string	"MIT Ladies and gentlemen of"
	.zero	42
	.string	"the class of 97 Wear"
	.zero	49
	.string	"sunscreen If I could offer"
	.zero	43
	.string	"you only one tip for"
	.zero	49
	.string	"the future sunscreen would be"
	.zero	40
	.string	"it The longterm benefits of"
	.zero	42
	.string	"sunscreen have been proved by"
	.zero	40
	.string	"scientists whereas the rest of"
	.zero	39
	.string	"my advice has no basis"
	.zero	47
	.string	"more reliable than my own meandering experience"
	.zero	22
	.string	"I will dispense this advice"
	.zero	42
	.string	"now Enjoy the power and beauty"
	.zero	39
	.string	"of your youth Oh never mind"
	.zero	42
	.string	"You will not understand the power"
	.zero	36
	.string	"and beauty of your youth until theyve"
	.zero	32
	.string	"faded But trust me in"
	.zero	48
	.string	"20 years"
	.zero	61
	.string	"youll look"
	.zero	59
	.string	"back at photos of yourself"
	.zero	43
	.string	"and recall in a"
	.zero	54
	.string	"way you cant grasp now how much"
	.zero	38
	.string	"possibility lay before you"
	.zero	43
	.string	"and how fabulous you really looked You"
	.zero	31
	.string	"are not as fat"
	.zero	55
	.string	"as you imagine Dont worry about"
	.zero	38
	.string	"the future Or"
	.zero	56
	.string	"worry but know that worrying is as effective"
	.zero	25
	.string	"as trying to solve an algebra equation"
	.zero	31
	.string	"by chewing bubble gum The real troubles in"
	.zero	27
	.string	"your life are apt to"
	.zero	49
	.string	"be things that never crossed your"
	.zero	36
	.string	"worried mind the"
	.zero	53
	.string	"kind that blindside you at"
	.zero	43
	.string	"4 pm on some"
	.zero	57
	.string	"idle Tuesday"
	.zero	57
	.string	"Do one thing every day that"
	.zero	42
	.string	"scares you Sing Dont be reckless with other"
	.zero	26
	.string	"peoples hearts Dont put up"
	.zero	43
	.string	"with people who are reckless"
	.zero	41
	.string	"with yours Floss Dont waste your time"
	.zero	32
	.string	"on jealousy Sometimes youre ahead sometimes youre behind"
	.zero	13
	.string	"The race is long and in"
	.zero	46
	.string	"the end its only with"
	.zero	48
	.string	"yourself Remember compliments you receive"
	.zero	28
	.string	"Forget the insults If you"
	.zero	44
	.string	"succeed in doing this tell me how"
	.zero	36
	.string	"Keep your old"
	.zero	56
	.string	"love letters Throw away"
	.zero	46
	.string	"your old bank statements"
	.zero	45
	.string	"Stretch Dont feel guilty if you dont know"
	.zero	28
	.string	"what you want to do with your"
	.zero	40
	.string	"life The most interesting people I"
	.zero	35
	.string	"know didnt know at 22"
	.zero	48
	.string	"what they wanted"
	.zero	53
	.string	"to do with their lives Some of"
	.zero	39
	.string	"the most interesting"
	.zero	49
	.string	"40yearolds I know still dont"
	.zero	41
	.string	"Get plenty of calcium"
	.zero	48
	.string	"Be kind to your knees Youll miss"
	.zero	37
	.string	"them when theyre gone"
	.zero	48
	.string	"Maybe youll marry"
	.zero	52
	.string	"maybe you wont Maybe youll have children maybe"
	.zero	23
	.string	"you wont Maybe youll divorce at 40 maybe youll dance"
	.zero	17
	.string	"the funky chicken on"
	.zero	49
	.string	"your 75th wedding anniversary Whatever"
	.zero	31
	.string	"you do dont congratulate yourself too"
	.zero	32
	.string	"much or berate yourself"
	.zero	46
	.string	"either Your choices are half chance So"
	.zero	31
	.string	"are everybody elses"
	.zero	50
	.string	"Enjoy your body Use"
	.zero	50
	.string	"it every way you can Dont"
	.zero	44
	.string	"be afraid of it or of what"
	.zero	43
	.string	"other people think of"
	.zero	48
	.string	"it Its"
	.zero	63
	.string	"the"
	.zero	66
	.string	"greatest instrument youll ever"
	.zero	39
	.string	"own Dance even if you have"
	.zero	43
	.string	"nowhere to do it but your living"
	.zero	37
	.string	"room Read the directions even if"
	.zero	37
	.string	"you dont follow them Do not read"
	.zero	37
	.string	"beauty magazines They will only make you"
	.zero	29
	.string	"feel ugly Get to know your parents You never"
	.zero	25
	.string	"know when theyll be gone for good Be"
	.zero	33
	.string	"nice to your siblings Theyre your"
	.zero	36
	.string	"best link to your"
	.zero	52
	.string	"past and the people most likely"
	.zero	38
	.string	"to stick with you"
	.zero	52
	.string	"in the future Understand that"
	.zero	40
	.string	"friends come and go but"
	.zero	46
	.string	"with a precious few you should hold"
	.zero	34
	.string	"on Work hard to bridge"
	.zero	47
	.string	"the gaps in geography and lifestyle"
	.zero	34
	.string	"because the older"
	.zero	52
	.string	"you get the more you need the"
	.zero	40
	.string	"people who knew you when you"
	.zero	41
	.string	"were young Live"
	.zero	54
	.string	"in New York City once but leave before"
	.zero	31
	.string	"it makes you hard Live in"
	.zero	44
	.string	"Northern California once but leave"
	.zero	35
	.string	"before it makes you soft Travel"
	.zero	38
	.string	"Accept certain inalienable truths Prices will rise"
	.zero	19
	.string	"Politicians will philander You too will"
	.zero	30
	.string	"get old And when you do youll"
	.zero	40
	.string	"fantasize that when you were young prices were"
	.zero	23
	.string	"reasonable politicians were noble and children respected"
	.zero	13
	.string	"their elders Respect your elders"
	.zero	37
	.string	"Dont expect anyone else to"
	.zero	43
	.string	"support you Maybe you have a"
	.zero	41
	.string	"trust fund Maybe youll have a wealthy"
	.zero	32
	.string	"spouse But you never know when either"
	.zero	32
	.string	"one might run out Dont mess"
	.zero	42
	.string	"too much with your hair or by the"
	.zero	36
	.string	"time youre 40 it will look 85 Be"
	.zero	37
	.string	"careful whose advice you buy but be patient"
	.zero	26
	.string	"with those who supply it Advice is a"
	.zero	33
	.string	"form of nostalgia Dispensing it is"
	.zero	35
	.string	"a way of fishing the past from"
	.zero	39
	.string	"the disposal wiping it off painting"
	.zero	34
	.string	"over the ugly parts"
	.zero	50
	.string	"and recycling it for more than its"
	.zero	35
	.string	"worth But trust me on the sunscreen"
	.zero	34
	.string	"MIT Ladies and gentlemen of"
	.zero	42
	.string	"the class of 97 Wear"
	.zero	49
	.string	"sunscreen If I could offer"
	.zero	43
	.string	"you only one tip for"
	.zero	49
	.string	"the future sunscreen would be"
	.zero	40
	.string	"it The longterm benefits of"
	.zero	42
	.string	"sunscreen have been proved by"
	.zero	40
	.string	"scientists whereas the rest of"
	.zero	39
	.string	"my advice has no basis"
	.zero	47
	.string	"more reliable than my own meandering experience"
	.zero	22
	.string	"I will dispense this advice"
	.zero	42
	.string	"now Enjoy the power and beauty"
	.zero	39
	.string	"of your youth Oh never mind"
	.zero	42
	.string	"You will not understand the power"
	.zero	36
	.string	"and beauty of your youth until theyve"
	.zero	32
	.string	"faded But trust me in"
	.zero	48
	.string	"20 years"
	.zero	61
	.string	"youll look"
	.zero	59
	.string	"back at photos of yourself"
	.zero	43
	.string	"and recall in a"
	.zero	54
	.string	"way you cant grasp now how much"
	.zero	38
	.string	"possibility lay before you"
	.zero	43
	.string	"and how fabulous you really looked You"
	.zero	31
	.string	"are not as fat"
	.zero	55
	.string	"as you imagine Dont worry about"
	.zero	38
	.string	"the future Or"
	.zero	56
	.string	"worry but know that worrying is as effective"
	.zero	25
	.string	"as trying to solve an algebra equation"
	.zero	31
	.string	"by chewing bubble gum The real troubles in"
	.zero	27
	.string	"your life are apt to"
	.zero	49
	.string	"be things that never crossed your"
	.zero	36
	.string	"worried mind the"
	.zero	53
	.string	"kind that blindside you at"
	.zero	43
	.string	"4 pm on some"
	.zero	57
	.string	"idle Tuesday"
	.zero	57
	.string	"Do one thing every day that"
	.zero	42
	.string	"scares you Sing Dont be reckless with other"
	.zero	26
	.string	"peoples hearts Dont put up"
	.zero	43
	.string	"with people who are reckless"
	.zero	41
	.string	"with yours Floss Dont waste your time"
	.zero	32
	.string	"on jealousy Sometimes youre ahead sometimes youre behind"
	.zero	13
	.string	"The race is long and in"
	.zero	46
	.string	"the end its only with"
	.zero	48
	.string	"yourself Remember compliments you receive"
	.zero	28
	.string	"Forget the insults If you"
	.zero	44
	.string	"succeed in doing this tell me how"
	.zero	36
	.string	"Keep your old"
	.zero	56
	.string	"love letters Throw away"
	.zero	46
	.string	"your old bank statements"
	.zero	45
	.string	"Stretch Dont feel guilty if you dont know"
	.zero	28
	.string	"what you want to do with your"
	.zero	40
	.string	"life The most interesting people I"
	.zero	35
	.string	"know didnt know at 22"
	.zero	48
	.string	"what they wanted"
	.zero	53
	.string	"to do with their lives Some of"
	.zero	39
	.string	"the most interesting"
	.zero	49
	.string	"40yearolds I know still dont"
	.zero	41
	.string	"Get plenty of calcium"
	.zero	48
	.string	"Be kind to your knees Youll miss"
	.zero	37
	.string	"them when theyre gone"
	.zero	48
	.string	"Maybe youll marry"
	.zero	52
	.string	"maybe you wont Maybe youll have children maybe"
	.zero	23
	.string	"you wont Maybe youll divorce at 40 maybe youll dance"
	.zero	17
	.string	"the funky chicken on"
	.zero	49
	.string	"your 75th wedding anniversary Whatever"
	.zero	31
	.string	"you do dont congratulate yourself too"
	.zero	32
	.string	"much or berate yourself"
	.zero	46
	.string	"either Your choices are half chance So"
	.zero	31
	.string	"are everybody elses"
	.zero	50
	.string	"Enjoy your body Use"
	.zero	50
	.string	"it every way you can Dont"
	.zero	44
	.string	"be afraid of it or of what"
	.zero	43
	.string	"other people think of"
	.zero	48
	.string	"it Its"
	.zero	63
	.string	"the"
	.zero	66
	.string	"greatest instrument youll ever"
	.zero	39
	.string	"own Dance even if you have"
	.zero	43
	.string	"nowhere to do it but your living"
	.zero	37
	.string	"room Read the directions even if"
	.zero	37
	.string	"you dont follow them Do not read"
	.zero	37
	.string	"beauty magazines They will only make you"
	.zero	29
	.string	"feel ugly Get to know your parents You never"
	.zero	25
	.string	"know when theyll be gone for good Be"
	.zero	33
	.string	"nice to your siblings Theyre your"
	.zero	36
	.string	"best link to your"
	.zero	52
	.string	"past and the people most likely"
	.zero	38
	.string	"to stick with you"
	.zero	52
	.string	"in the future Understand that"
	.zero	40
	.string	"friends come and go but"
	.zero	46
	.string	"with a precious few you should hold"
	.zero	34
	.string	"on Work hard to bridge"
	.zero	47
	.string	"the gaps in geography and lifestyle"
	.zero	34
	.string	"because the older"
	.zero	52
	.string	"you get the more you need the"
	.zero	40
	.string	"people who knew you when you"
	.zero	41
	.string	"were young Live"
	.zero	54
	.string	"in New York City once but leave before"
	.zero	31
	.string	"it makes you hard Live in"
	.zero	44
	.string	"Northern California once but leave"
	.zero	35
	.string	"before it makes you soft Travel"
	.zero	38
	.string	"Accept certain inalienable truths Prices will rise"
	.zero	19
	.string	"Politicians will philander You too will"
	.zero	30
	.string	"get old And when you do youll"
	.zero	40
	.string	"fantasize that when you were young prices were"
	.zero	23
	.string	"reasonable politicians were noble and children respected"
	.zero	13
	.string	"their elders Respect your elders"
	.zero	37
	.string	"Dont expect anyone else to"
	.zero	43
	.string	"support you Maybe you have a"
	.zero	41
	.string	"trust fund Maybe youll have a wealthy"
	.zero	32
	.string	"spouse But you never know when either"
	.zero	32
	.string	"one might run out Dont mess"
	.zero	42
	.string	"too much with your hair or by the"
	.zero	36
	.string	"time youre 40 it will look 85 Be"
	.zero	37
	.string	"careful whose advice you buy but be patient"
	.zero	26
	.string	"with those who supply it Advice is a"
	.zero	33
	.string	"form of nostalgia Dispensing it is"
	.zero	35
	.string	"a way of fishing the past from"
	.zero	39
	.string	"the disposal wiping it off painting"
	.zero	34
	.string	"over the ugly parts"
	.zero	50
	.string	"and recycling it for more than its"
	.zero	35
	.string	"worth But trust me on the sunscreen"
	.zero	34
	.string	"MIT Ladies and gentlemen of"
	.zero	42
	.string	"the class of 97 Wear"
	.zero	49
	.string	"sunscreen If I could offer"
	.zero	43
	.string	"you only one tip for"
	.zero	49
	.string	"the future sunscreen would be"
	.zero	40
	.string	"it The longterm benefits of"
	.zero	42
	.string	"sunscreen have been proved by"
	.zero	40
	.string	"scientists whereas the rest of"
	.zero	39
	.string	"my advice has no basis"
	.zero	47
	.string	"more reliable than my own meandering experience"
	.zero	22
	.string	"I will dispense this advice"
	.zero	42
	.string	"now Enjoy the power and beauty"
	.zero	39
	.string	"of your youth Oh never mind"
	.zero	42
	.string	"You will not understand the power"
	.zero	36
	.string	"and beauty of your youth until theyve"
	.zero	32
	.string	"faded But trust me in"
	.zero	48
	.string	"20 years"
	.zero	61
	.string	"youll look"
	.zero	59
	.string	"back at photos of yourself"
	.zero	43
	.string	"and recall in a"
	.zero	54
	.string	"way you cant grasp now how much"
	.zero	38
	.string	"possibility lay before you"
	.zero	43
	.string	"and how fabulous you really looked You"
	.zero	31
	.string	"are not as fat"
	.zero	55
	.string	"as you imagine Dont worry about"
	.zero	38
	.string	"the future Or"
	.zero	56
	.string	"worry but know that worrying is as effective"
	.zero	25
	.string	"as trying to solve an algebra equation"
	.zero	31
	.string	"by chewing bubble gum The real troubles in"
	.zero	27
	.string	"your life are apt to"
	.zero	49
	.string	"be things that never crossed your"
	.zero	36
	.string	"worried mind the"
	.zero	53
	.string	"kind that blindside you at"
	.zero	43
	.string	"4 pm on some"
	.zero	57
	.string	"idle Tuesday"
	.zero	57
	.string	"Do one thing every day that"
	.zero	42
	.string	"scares you Sing Dont be reckless with other"
	.zero	26
	.string	"peoples hearts Dont put up"
	.zero	43
	.string	"with people who are reckless"
	.zero	41
	.string	"with yours Floss Dont waste your time"
	.zero	32
	.string	"on jealousy Sometimes youre ahead sometimes youre behind"
	.zero	13
	.string	"The race is long and in"
	.zero	46
	.string	"the end its only with"
	.zero	48
	.string	"yourself Remember compliments you receive"
	.zero	28
	.string	"Forget the insults If you"
	.zero	44
	.string	"succeed in doing this tell me how"
	.zero	36
	.string	"Keep your old"
	.zero	56
	.string	"love letters Throw away"
	.zero	46
	.string	"your old bank statements"
	.zero	45
	.string	"Stretch Dont feel guilty if you dont know"
	.zero	28
	.string	"what you want to do with your"
	.zero	40
	.string	"life The most interesting people I"
	.zero	35
	.string	"know didnt know at 22"
	.zero	48
	.string	"what they wanted"
	.zero	53
	.string	"to do with their lives Some of"
	.zero	39
	.string	"the most interesting"
	.zero	49
	.string	"40yearolds I know still dont"
	.zero	41
	.string	"Get plenty of calcium"
	.zero	48
	.string	"Be kind to your knees Youll miss"
	.zero	37
	.string	"them when theyre gone"
	.zero	48
	.string	"Maybe youll marry"
	.zero	52
	.string	"maybe you wont Maybe youll have children maybe"
	.zero	23
	.string	"you wont Maybe youll divorce at 40 maybe youll dance"
	.zero	17
	.string	"the funky chicken on"
	.zero	49
	.string	"your 75th wedding anniversary Whatever"
	.zero	31
	.string	"you do dont congratulate yourself too"
	.zero	32
	.string	"much or berate yourself"
	.zero	46
	.string	"either Your choices are half chance So"
	.zero	31
	.string	"are everybody elses"
	.zero	50
	.string	"Enjoy your body Use"
	.zero	50
	.string	"it every way you can Dont"
	.zero	44
	.string	"be afraid of it or of what"
	.zero	43
	.string	"other people think of"
	.zero	48
	.string	"it Its"
	.zero	63
	.string	"the"
	.zero	66
	.string	"greatest instrument youll ever"
	.zero	39
	.string	"own Dance even if you have"
	.zero	43
	.string	"nowhere to do it but your living"
	.zero	37
	.string	"room Read the directions even if"
	.zero	37
	.string	"you dont follow them Do not read"
	.zero	37
	.string	"beauty magazines They will only make you"
	.zero	29
	.string	"feel ugly Get to know your parents You never"
	.zero	25
	.string	"know when theyll be gone for good Be"
	.zero	33
	.string	"nice to your siblings Theyre your"
	.zero	36
	.string	"best link to your"
	.zero	52
	.string	"past and the people most likely"
	.zero	38
	.string	"to stick with you"
	.zero	52
	.string	"in the future Understand that"
	.zero	40
	.string	"friends come and go but"
	.zero	46
	.string	"with a precious few you should hold"
	.zero	34
	.string	"on Work hard to bridge"
	.zero	47
	.string	"the gaps in geography and lifestyle"
	.zero	34
	.string	"because the older"
	.zero	52
	.string	"you get the more you need the"
	.zero	40
	.string	"people who knew you when you"
	.zero	41
	.string	"were young Live"
	.zero	54
	.string	"in New York City once but leave before"
	.zero	31
	.string	"it makes you hard Live in"
	.zero	44
	.string	"Northern California once but leave"
	.zero	35
	.string	"before it makes you soft Travel"
	.zero	38
	.string	"Accept certain inalienable truths Prices will rise"
	.zero	19
	.string	"Politicians will philander You too will"
	.zero	30
	.string	"get old And when you do youll"
	.zero	40
	.string	"fantasize that when you were young prices were"
	.zero	23
	.string	"reasonable politicians were noble and children respected"
	.zero	13
	.string	"their elders Respect your elders"
	.zero	37
	.string	"Dont expect anyone else to"
	.zero	43
	.string	"support you Maybe you have a"
	.zero	41
	.string	"trust fund Maybe youll have a wealthy"
	.zero	32
	.string	"spouse But you never know when either"
	.zero	32
	.string	"one might run out Dont mess"
	.zero	42
	.string	"too much with your hair or by the"
	.zero	36
	.string	"time youre 40 it will look 85 Be"
	.zero	37
	.string	"careful whose advice you buy but be patient"
	.zero	26
	.string	"with those who supply it Advice is a"
	.zero	33
	.string	"form of nostalgia Dispensing it is"
	.zero	35
	.string	"a way of fishing the past from"
	.zero	39
	.string	"the disposal wiping it off painting"
	.zero	34
	.string	"over the ugly parts"
	.zero	50
	.string	"and recycling it for more than its"
	.zero	35
	.string	"worth But trust me on the sunscreen"
	.zero	34
	.string	"MIT Ladies and gentlemen of"
	.zero	42
	.string	"the class of 97 Wear"
	.zero	49
	.string	"sunscreen If I could offer"
	.zero	43
	.string	"you only one tip for"
	.zero	49
	.string	"the future sunscreen would be"
	.zero	40
	.string	"it The longterm benefits of"
	.zero	42
	.string	"sunscreen have been proved by"
	.zero	40
	.string	"scientists whereas the rest of"
	.zero	39
	.string	"my advice has no basis"
	.zero	47
	.string	"more reliable than my own meandering experience"
	.zero	22
	.string	"I will dispense this advice"
	.zero	42
	.string	"now Enjoy the power and beauty"
	.zero	39
	.string	"of your youth Oh never mind"
	.zero	42
	.string	"You will not understand the power"
	.zero	36
	.string	"and beauty of your youth until theyve"
	.zero	32
	.string	"faded But trust me in"
	.zero	48
	.string	"20 years"
	.zero	61
	.string	"youll look"
	.zero	59
	.string	"back at photos of yourself"
	.zero	43
	.string	"and recall in a"
	.zero	54
	.string	"way you cant grasp now how much"
	.zero	38
	.string	"possibility lay before you"
	.zero	43
	.string	"and how fabulous you really looked You"
	.zero	31
	.string	"are not as fat"
	.zero	55
	.string	"as you imagine Dont worry about"
	.zero	38
	.string	"the future Or"
	.zero	56
	.string	"worry but know that worrying is as effective"
	.zero	25
	.string	"as trying to solve an algebra equation"
	.zero	31
	.string	"by chewing bubble gum The real troubles in"
	.zero	27
	.string	"your life are apt to"
	.zero	49
	.string	"be things that never crossed your"
	.zero	36
	.string	"worried mind the"
	.zero	53
	.string	"kind that blindside you at"
	.zero	43
	.string	"4 pm on some"
	.zero	57
	.string	"idle Tuesday"
	.zero	57
	.string	"Do one thing every day that"
	.zero	42
	.string	"scares you Sing Dont be reckless with other"
	.zero	26
	.string	"peoples hearts Dont put up"
	.zero	43
	.string	"with people who are reckless"
	.zero	41
	.string	"with yours Floss Dont waste your time"
	.zero	32
	.string	"on jealousy Sometimes youre ahead sometimes youre behind"
	.zero	13
	.string	"The race is long and in"
	.zero	46
	.string	"the end its only with"
	.zero	48
	.string	"yourself Remember compliments you receive"
	.zero	28
	.string	"Forget the insults If you"
	.zero	44
	.string	"succeed in doing this tell me how"
	.zero	36
	.string	"Keep your old"
	.zero	56
	.string	"love letters Throw away"
	.zero	46
	.string	"your old bank statements"
	.zero	45
	.string	"Stretch Dont feel guilty if you dont know"
	.zero	28
	.string	"what you want to do with your"
	.zero	40
	.string	"life The most interesting people I"
	.zero	35
	.string	"know didnt know at 22"
	.zero	48
	.string	"what they wanted"
	.zero	53
	.string	"to do with their lives Some of"
	.zero	39
	.string	"the most interesting"
	.zero	49
	.string	"40yearolds I know still dont"
	.zero	41
	.string	"Get plenty of calcium"
	.zero	48
	.string	"Be kind to your knees Youll miss"
	.zero	37
	.string	"them when theyre gone"
	.zero	48
	.string	"Maybe youll marry"
	.zero	52
	.string	"maybe you wont Maybe youll have children maybe"
	.zero	23
	.string	"you wont Maybe youll divorce at 40 maybe youll dance"
	.zero	17
	.string	"the funky chicken on"
	.zero	49
	.string	"your 75th wedding anniversary Whatever"
	.zero	31
	.string	"you do dont congratulate yourself too"
	.zero	32
	.string	"much or berate yourself"
	.zero	46
	.string	"either Your choices are half chance So"
	.zero	31
	.string	"are everybody elses"
	.zero	50
	.string	"Enjoy your body Use"
	.zero	50
	.string	"it every way you can Dont"
	.zero	44
	.string	"be afraid of it or of what"
	.zero	43
	.string	"other people think of"
	.zero	48
	.string	"it Its"
	.zero	63
	.string	"the"
	.zero	66
	.string	"greatest instrument youll ever"
	.zero	39
	.string	"own Dance even if you have"
	.zero	43
	.string	"nowhere to do it but your living"
	.zero	37
	.string	"room Read the directions even if"
	.zero	37
	.string	"you dont follow them Do not read"
	.zero	37
	.string	"beauty magazines They will only make you"
	.zero	29
	.string	"feel ugly Get to know your parents You never"
	.zero	25
	.string	"know when theyll be gone for good Be"
	.zero	33
	.string	"nice to your siblings Theyre your"
	.zero	36
	.string	"best link to your"
	.zero	52
	.string	"past and the people most likely"
	.zero	38
	.string	"to stick with you"
	.zero	52
	.string	"in the future Understand that"
	.zero	40
	.string	"friends come and go but"
	.zero	46
	.string	"with a precious few you should hold"
	.zero	34
	.string	"on Work hard to bridge"
	.zero	47
	.string	"the gaps in geography and lifestyle"
	.zero	34
	.string	"because the older"
	.zero	52
	.string	"you get the more you need the"
	.zero	40
	.string	"people who knew you when you"
	.zero	41
	.string	"were young Live"
	.zero	54
	.string	"in New York City once but leave before"
	.zero	31
	.string	"it makes you hard Live in"
	.zero	44
	.string	"Northern California once but leave"
	.zero	35
	.string	"before it makes you soft Travel"
	.zero	38
	.string	"Accept certain inalienable truths Prices will rise"
	.zero	19
	.string	"Politicians will philander You too will"
	.zero	30
	.string	"get old And when you do youll"
	.zero	40
	.string	"fantasize that when you were young prices were"
	.zero	23
	.string	"reasonable politicians were noble and children respected"
	.zero	13
	.string	"their elders Respect your elders"
	.zero	37
	.string	"Dont expect anyone else to"
	.zero	43
	.string	"support you Maybe you have a"
	.zero	41
	.string	"trust fund Maybe youll have a wealthy"
	.zero	32
	.string	"spouse But you never know when either"
	.zero	32
	.string	"one might run out Dont mess"
	.zero	42
	.string	"too much with your hair or by the"
	.zero	36
	.string	"time youre 40 it will look 85 Be"
	.zero	37
	.string	"careful whose advice you buy but be patient"
	.zero	26
	.string	"with those who supply it Advice is a"
	.zero	33
	.string	"form of nostalgia Dispensing it is"
	.zero	35
	.string	"a way of fishing the past from"
	.zero	39
	.string	"the disposal wiping it off painting"
	.zero	34
	.string	"over the ugly parts"
	.zero	50
	.string	"and recycling it for more than its"
	.zero	35
	.string	"worth But trust me on the sunscreen"
	.zero	34
	.string	"MIT Ladies and gentlemen of"
	.zero	42
	.string	"the class of 97 Wear"
	.zero	49
	.string	"sunscreen If I could offer"
	.zero	43
	.string	"you only one tip for"
	.zero	49
	.string	"the future sunscreen would be"
	.zero	40
	.string	"it The longterm benefits of"
	.zero	42
	.string	"sunscreen have been proved by"
	.zero	40
	.string	"scientists whereas the rest of"
	.zero	39
	.string	"my advice has no basis"
	.zero	47
	.string	"more reliable than my own meandering experience"
	.zero	22
	.string	"I will dispense this advice"
	.zero	42
	.string	"now Enjoy the power and beauty"
	.zero	39
	.string	"of your youth Oh never mind"
	.zero	42
	.string	"You will not understand the power"
	.zero	36
	.string	"and beauty of your youth until theyve"
	.zero	32
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 9.3.1.11) 9.3.1"
	.mspabi_attribute 4, 2
	.mspabi_attribute 6, 2
	.mspabi_attribute 8, 2
	.gnu_attribute 4, 1
