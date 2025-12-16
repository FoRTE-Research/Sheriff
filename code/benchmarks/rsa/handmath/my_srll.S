  .file "my_srll.c"

.text
  .global my_srll
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_srll
  .type my_srll, @function
.DL0:
DG0:
ADD	#-1,	R14	;R3 AS==11
CLRC			
RRC	R13		;
RRC	R12		;
my_srll:
CMP	#0,	R14	;R3 AS==00
JNZ	.DL0      	;
RETA			;
.size my_srll, .-DG0
