  .file "my_sral.c"

.text
  .global my_sral
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_sral
  .type my_sral, @function
.DL0:
DG2:
ADD	#-1,	R14	;R3 AS==11
RRA	R13		;
RRC	R12		;
my_sral:
CMP	#0,	R14	;R3 AS==00
JNZ	.DL0      	;abs 0x14e52
RETA			;
.size my_sral, .-DG2
