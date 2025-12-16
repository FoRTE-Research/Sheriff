  .file "my_clzsi2.c"

.text
  .global my_clzsi2
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_clzsi2
  .type my_clzsi2, @function
my_clzsi2:
PUSHM.A	#3,	R10	;20-BIT WORDS
.DL0:
SUBA	#4,	R1	;
.DL1:
CMP	#0,	R13	;R3 AS==00
JNZ	.DL2     	;ABS 0X14F7C
MOV.B	#8,	R14	;R2 AS==11
CLR.B	R15		;
MOV.B	#255,	R10	;#0X00FF
CMP	R12,	R10	;
JNC	.DL4     	;ABS 0X14F90
CLR.B	R14		;
JMP .DL3
.DL2:
MOV.B	#24,	R14	;#0X0018
CLR.B	R15		;
MOV.B	#255,	R10	;#0X00FF
CMP	R13,	R10	;
JNC	.DL4      	;ABS 0X14F90
MOV.B	#16,	R14	;#0X0010
.DL3:
CLR.B	R15		;
.DL4:
MOV.B	#32,	R8	;#0X0020
CLR.B	R9		;
SUB	R14,	R8	;
SUBC	R15,	R9	;
CALLA	#my_srll		;0X14F3A
.DL5:
MOV	R12,	0(R1)	;
MOV	R13,	2(R1)	;
MOVA	@R1,	R12	;
.DL6:
MOV	R8,	R13	;
MOVX.B	61800(R12),R12	;0X0F168
SUB	R12,	R13	;
MOV	R13,	R12	;
ADDA	#4,	R1	;
.DL7:
POPM.A	#3,	R10	;20-BIT WORDS
.DL8:
RETA			;
.size my_clzsi2, .-my_clzsi2
