  .file "my_udivmodhi4.c"

.text
  .global my_udivmodhi4
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_udivmodhi4
  .type my_udivmodhi4, @function
my_udivmodhi4:
MOV	R12,	R15	;
.DL0:
MOV.B	#17,	R12	;#0X0011
.DL1:
MOV.B	#1,	R11	;R3 AS==01
.DL2:
CMP	R15,	R13	;
JC	.DL5     	;ABS 0X14CAA
ADD	#-1,	R12	;R3 AS==11
.DL3:
CMP	#0,	R12	;R3 AS==00
JZ	.DL7     	;ABS 0X14CB0
.DL4:
CMP	#0,	R13	;R3 AS==00
JGE	.DL9     	;ABS 0X14CB8
.DL5:
CLR.B	R12		;
.DL6:
CMP	#0,	R11	;R3 AS==00
JNZ	.DL11     	;ABS 0X14CC0
.DL7:
CMP	#0,	R14	;R3 AS==00
JZ	.DL8      	;ABS 0X14CB6
MOV	R15,	R12	;
.DL8:
RETA			;
.DL9:
RLAM	#1,	R13	;
.DL10:
RLAM	#1,	R11	;
JMP .DL2
.DL11:
CMP	R13,	R15	;
JNC	.DL14      	;ABS 0X14CC8
.DL12:
SUB	R13,	R15	;
.DL13:
BIS	R11,	R12	;
.DL14:
RRUM	#1,	R11	;
.DL15:
RRUM	#1,	R13	;
JMP .DL6;
.size my_udivmodhi4, .-my_udivmodhi4
