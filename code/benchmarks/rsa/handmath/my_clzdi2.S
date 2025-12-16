  .file "my_clzdi2.c"

.text
  .global my_clzdi2
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_clzdi2
  .type my_clzdi2, @function
my_clzdi2:
PUSHM.A	#3,	R10	;20-BIT WORDS
.DL0:
SUBA	#4,	R1	;
.DL1:
MOV	R12,	R10	;
.DL2:
MOV	R14,	R12	;
.DL3:
BIS	R15,	R14	;
CMP	#0,	R14	;R3 AS==00
JZ	.DL7     	;ABS 0XF66C
.DL4:
MOV	R15,	R13	;
.DL5:
CLR.B	R10		;
.DL6:
CMP	#0,	R13	;R3 AS==00
JNZ	.DL9     	;ABS 0XF676
MOV.B	#8,	R14	;R2 AS==11
CLR.B	R15		;
MOV.B	#255,	R9	;#0X00FF
CMP	R12,	R9	;
JNC	.DL11     	;ABS 0XF68A
CLR.B	R14		;
JMP .DL10
.DL7:
MOV	R10,	R12	;
.DL8:
MOV.B	#32,	R10	;#0X0020
JMP .DL6
.DL9:
MOV.B	#24,	R14	;#0X0018
CLR.B	R15		;
MOV.B	#255,	R9	;#0X00FF
CMP	R13,	R9	;
JNC	.DL11      	;ABS 0XF68A
MOV.B	#16,	R14	;#0X0010
.DL10:
CLR.B	R15		;
.DL11:
MOV.B	#32,	R8	;#0X0020
CLR.B	R9		;
SUB	R14,	R8	;
SUBC	R15,	R9	;
CALLA	#my_srll		;0X0F61C
.DL12:
MOV	R12,	0(R1)	;
MOV	R13,	2(R1)	;
MOVA	@R1,	R12	;
MOVX.B	__clz_tab(R12),R12	;0X0EF80
SUB	R12,	R10	;
MOV	R10,	R12	;
.DL13:
ADD	R8,	R12	;
ADDA	#4,	R1	;
.DL14:
POPM.A	#3,	R10	;20-BIT WORDS
.DL15:
RETA			;
.size my_clzdi2, .-my_clzdi2
