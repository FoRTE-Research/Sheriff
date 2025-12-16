  .file "my_make_fp.c"

.text
  .global my_make_fp
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_make_fp
  .type my_make_fp, @function
my_make_fp:
SUBA	#2,	R1	;
MOVX.A	2(R1),	0(R1)	;
.DL0:
SUBA	#10,	R1	;0X0000A
.DL1:
MOV	R15,	14(R1)	; 0X000E
.DL2:
MOV	R12,	0(R1)	;
.DL3:
MOV	R13,	2(R1)	;
.DL4:
MOV	R14,	4(R1)	;
.DL5:
MOV	14(R1),	6(R1)	;0X0000E
MOV	16(R1),	8(R1)	;0X00010
.DL6:
MOVA	R1,	R12	;
.DL7:
CALLA	#my_pack_f		;0X14FBC
.DL8:
ADDA	#10,	R1	;0X0000A
.DL9:
MOVX.A	@R1,	2(R1)	;
ADDA	#2,	R1	;
RETA			;
.size my_make_fp, .-my_make_fp
