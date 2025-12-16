  .file "my_make_dp.c"

.text
  .global my_make_dp
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_make_dp
  .type my_make_dp, @function
my_make_dp:
SUBA	#14,	R1	;0X0000E
.DL0:
MOV	R12,	0(R1)	;
.DL1:
MOV	R13,	2(R1)	;
.DL2:
MOV	R14,	4(R1)	;
.DL3:
MOV	18(R1),	6(R1)	;0X00012
MOV	20(R1),	8(R1)	;0X00014
MOV	22(R1),	10(R1)	;0X00016, 0X000A
MOV	24(R1),	12(R1)	;0X00018, 0X000C
.DL4:
MOVA	R1,	R12	;
.DL5:
CALLA	#my_pack_d ;0X0E858
.DL6:
ADDA	#14,	R1	;0X0000E
.DL7:
RETA			;
.size my_make_dp, .-my_make_dp
