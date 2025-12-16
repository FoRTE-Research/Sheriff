  .file "my_slll.c"

.text
  .global my_slll
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_slll
  .type my_slll, @function
.DL0:
DG1:
ADD	#-1,	R14	;R3 AS==11
RLA	R12		;
RLC	R13		;
.DL1:
my_slll:
CMP	#0,	R14	;R3 AS==00
JNZ	.DL0      	;ABS 0XF97E
RETA			;
.size my_slll, .-DG1
