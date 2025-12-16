  .file "my_cvtfd.c"

.text
  .global my_cvtfd
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_cvtfd
  .type my_cvtfd, @function
my_cvtfd:
PUSHM.A	#3,	R10	;20-BIT WORDS
.DL0:
SUBA	#22,	R1	;0X00016
.DL1:
MOV	R12,	8(R1)	;
MOV	R13,	10(R1)	; 0X000A
.DL2:
MOVA	R1,	R13	;
ADDA	#12,	R13	;0X0000C
MOVA	R1,	R12	;
.DL3:
ADDA	#8,	R12	;
CALLA	#my_unpack_f ;0X0FB60
.DL4:
MOV	20(R1),	R9	;0X00014
.DL5:
MOV	18(R1),	R8	;0X00012
CLR.B	R10		;
CLR.B	R11		;
MOV.B	#30,	R12	;#0X001E
CALLA	#my_sllll ;0X0F98A
MOV	R12,	0(R1)	;
MOV	R13,	2(R1)	;
MOV	R14,	4(R1)	;
MOV	R15,	6(R1)	;
MOV	16(R1),	R14	;0X00010
MOV	14(R1),	R13	;0X0000E
MOV	12(R1),	R12	;0X0000C
CALLA	#my_make_dp ;0X0F7DA
.DL6:
ADDA	#22,	R1	;0X00016
.DL7:
POPM.A	#3,	R10	;20-BIT WORDS
.DL8:
RETA			;
.size my_cvtfd, .-my_cvtfd
