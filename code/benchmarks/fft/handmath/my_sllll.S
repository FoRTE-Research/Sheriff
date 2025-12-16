  .file "my_sllll.c"

.text
  .global my_sllll
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_sllll
  .type my_sllll, @function
my_sllll:
.DL0:
MOV	R11,	R15	;
MOV	R12,	R11	;
MOV	R10,	R14	;
MOV	R9,	R13	;
MOV	R8,	R12	;
CMP	#0,	R11	;R3 AS==00
JNZ	.DL1      	;ABS 0XF99A
RETA			;
.DL1:
RLA	R12		;
RLC	R13		;
RLC	R14		;
RLC	R15		;
ADD	#-1,	R11	;R3 AS==11
JNZ	.DL1     	;ABS 0XF99A
RETA			;
.size my_sllll, .-my_sllll
