  .file "my_cvtdf.c"

.text
  .global my_cvtdf
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_cvtdf
  .type my_cvtdf, @function
my_cvtdf:
PUSHM.A	#3,	R10	;20-BIT WORDS
.DL0:
SUBA	#24,	R1	;0X00018
.DL1:
MOV	R12,	2(R1)	;
MOV	R13,	4(R1)	;
MOV	R14,	6(R1)	;
MOV	R15,	8(R1)	;
.DL2:
MOVA	R1,	R13	;
ADDA	#10,	R13	;0X0000A
MOVA	R1,	R12	;
.DL3:
ADDA	#2,	R12	;
CALLA	#my_unpack_d ;0X0EACC
.DL4:
MOV	16(R1),	R8	;0X00010
MOV	18(R1),	R9	;0X00012
MOV	20(R1),	R10	;0X00014
MOV	22(R1),	R11	;0X00016
MOV.B	#30,	R12	;#0X001E
CALLA	#my_srlll ;0X0CAD4
.DL5:
MOV	R12,	R15	;
.DL6:
MOV	R9,	R12	;
.DL7:
AND	#16383,	R12	;#0X3FFF
.DL8:
BIS	R8,	R12	;
CMP	#0,	R12	;R3 AS==00
JZ	.DL10      	;ABS 0XF85C
.DL9:
BIS	#1,	R15	;R3 AS==01
.DL10:
MOV	R13,	0(R1)	;
MOV	14(R1),	R14	;0X0000E
MOV	12(R1),	R13	;0X0000C
.DL11:
MOV	10(R1),	R12	;0X0000A
CALLA	#my_make_fp ;0X0FC3C
.DL12:
ADDA	#24,	R1	;0X00018
.DL13:
POPM.A	#3,	R10	;20-BIT WORDS
.DL14:
RETA			;
.size my_cvtdf, .-my_cvtdf
