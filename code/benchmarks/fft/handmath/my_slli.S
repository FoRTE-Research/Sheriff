  .file "my_slli.c"

.text
  .global my_slli
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_slli
  .type my_slli, @function
.DL0:
DG0:
ADD	#-1,	R13	;R3 AS==11
RLA	R12		;
my_slli:
CMP	#0,	R13	;R3 AS==00
JNZ	.DL0      	;ABS 0XF974
RETA			;
.size my_slli, .-DG0
