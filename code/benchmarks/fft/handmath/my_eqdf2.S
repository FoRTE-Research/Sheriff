  .file "my_eqdf2.c"

.text
  .global my_eqdf2
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_eqdf2
  .type my_eqdf2, @function
my_eqdf2:
PUSHM.A	#1,	R10	;20-BIT WORDS
.DL0:
SUBA	#44,	R1	;0X0002C
.DL1:
MOV	R12,	0(R1)	;
MOV	R13,	2(R1)	;
MOV	R14,	4(R1)	;
MOV	R15,	6(R1)	;
.DL2:
MOV	52(R1),	8(R1)	;0X00034
MOV	54(R1),	10(R1)	;0X00036, 0X000A
MOV	56(R1),	12(R1)	;0X00038, 0X000C
MOV	58(R1),	14(R1)	;0X0003A, 0X000E
.DL3:
MOVA	#my_unpack_d,	R10	;0X1549E
MOVA	R1,	R13	;
ADDA	#16,	R13	;0X00010
MOVA	R1,	R12	;
.DL4:
CALLA	R10		;
.DL5:
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#8,	R12	;
CALLA	R10		;
.DL6:
MOV.B	#1,	R12	;R3 AS==01
.DL7:
CMP	16(R1),	R12	;0X00010
JC	.DL10     	;ABS 0X14974
.DL8:
CMP	30(R1),	R12	;0X0001E
JC	.DL10     	;ABS 0X14974
.DL9:
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#16,	R12	;0X00010
CALLA	#my_fpcmp_parts_d		;0X155DA
.DL10:
ADDA	#44,	R1	;0X0002C
.DL11:
POPM.A	#1,	R10	;20-BIT WORDS
.DL12:
RETA			;
.size my_eqdf2, .-my_eqdf2
