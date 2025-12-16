  .file "my_memcpy.c"

.text
  .global my_memcpy
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_memcpy
  .type my_memcpy, @function
my_memcpy:
PUSHM.A	#1,	R10	;20-BIT WORDS
.DL0:
PUSHM.A	#1,	R8	;20-BIT WORDS
.DL1:
MOVA	R13,	R10	;
.DL2:
MOVA	R12,	R8	;
ADDA	R13,	R14	;
.DL3:
CMPA	R14,	R10	;
JNZ	.DL7      	;ABS 0X156CA
.DL4:
POPM.A	#1,	R8	;20-BIT WORDS
.DL5:
POPM.A	#1,	R10	;20-BIT WORDS
.DL6:
RETA			;
.DL7:
MOV.B	@R10+,	0(R8)	;
.DL8:
ADDA	#1,	R8	;
JMP .DL3;
.size my_memcpy, .-my_memcpy
