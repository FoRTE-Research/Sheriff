  .file "my_addd.c"

.text
  .global my_addd
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_addd
  .type my_addd, @function
my_addd:
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
CALLA   R10     ;
.DL5:
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#8,	R12	;
CALLA   R10     ;
.DL6:
MOVA	R1,	R14	;
ADDA	#44,	R14	;0X0002C
MOVA	R1,	R13	;
ADDA	#30,	R13	;0X0001E
MOVA	R1,	R12	;
ADDA	#16,	R12	;0X00010
CALLA	#my_fpadd_parts ;0X0EC08
.DL7:
CALLA	#my_pack_d ;0X0E858
.DL8:
ADDA	#58,	R1	;0X0003A
.DL9:
POPM.A	#3,	R10	;20-BIT WORDS
.DL10:
RETA			;
.size my_addd, .-my_addd
