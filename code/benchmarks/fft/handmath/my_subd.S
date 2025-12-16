  .file "my_subd.c"

.text
  .global my_subd
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_subd
  .type my_subd, @function
my_subd:
PUSHM.A	#3,	R10	;20-BIT WORDS
.DL0:
SUBA	#58,	R1	;0X0003A
.DL1:
MOV	R8,	0(R1)	;
MOV	R9,	2(R1)	;
MOV	R10,	4(R1)	;
MOV	R11,	6(R1)	;
.DL2:
MOV	R12,	8(R1)	;
MOV	R13,	10(R1)	; 0X000A
MOV	R14,	12(R1)	; 0X000C
MOV	R15,	14(R1)	; 0X000E
.DL3:
MOVA	#my_unpack_d,	R10	;0X0EACC
MOVA	R1,	R13	;
ADDA	#16,	R13	;0X00010
MOVA	R1,	R12	;
.DL4:
CALLA	R10		;
;CALLA	#my_unpack_d ;
.DL5:
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#8,	R12	;
CALLA	R10		;
;CALLA	#my_unpack_d ;
.DL6:
XOR	#1,	32(R1)	;R3 AS==01, 0X0020
.DL7:
MOVA	R1,	R14	;
ADDA	#44,	R14	;0X0002C
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#16,	R12	;0X00010
CALLA	#my_fpadd_parts ;0X0EC08
.DL8:
CALLA	#my_pack_d ;0X0E858
.DL9:
ADDA	#58,	R1	;0X0003A
.DL10:
POPM.A	#3,	R10	;20-BIT WORDS
.DL11:
RETA			;
.size my_subd, .-my_subd
