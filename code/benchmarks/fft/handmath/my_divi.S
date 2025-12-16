  .file "my_divi.c"

.text
  .global my_divi
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_divi
  .type my_divi, @function
my_divi:
PUSHM.A	#1,	R10	;20-BIT WORDS
.DL0:
CLR.B	R10		;
.DL1:
CMP	#0,	R12	;R3 AS==00
JGE	.DL4     	;ABS 0X14CE0
.DL2:
CLR.B	R14		;
SUB	R12,	R14	;
MOV	R14,	R12	;
.DL3:
MOV.B	#1,	R10	;R3 AS==01
.DL4:
CMP	#0,	R13	;R3 AS==00
JGE	.DL7     	;ABS 0X14CEC
.DL5:
CLR.B	R14		;
SUB	R13,	R14	;
MOV	R14,	R13	;
.DL6:
XOR	#1,	R10	;R3 AS==01
.DL7:
CLR.B	R14		;
CALLA	#my_udivmodhi4		;0X14C94
.DL8:
CMP	#0,	R10	;R3 AS==00
JZ	.DL10      	;ABS 0X14CFC
.DL9:
CLR.B	R13		;
SUB	R12,	R13	;
MOV	R13,	R12	;
.DL10:
POPM.A	#1,	R10	;20-BIT WORDS
.DL11:
RETA			;
.size my_divi, .-my_divi
