  .file "my_srlll.c"

.text
  .global my_srlll
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_srlll
  .type my_srlll, @function
my_srlll:
MOV	R11,	R15	;
MOV	R12,	R11	;
MOV	R10,	R14	;
MOV	R9,	R13	;
MOV	R8,	R12	;
CMP	#0,	R11	;R3 AS==00
JNZ	.DL0      	;ABS 0XF8EC
RETA			;
.DL0:
CLRC			
RRC	R15		;
RRC	R14		;
RRC	R13		;
RRC	R12		;
ADD	#-1,	R11	;R3 AS==11
JNZ	.DL0     	;ABS 0XF8EC
RETA			;
.size my_srlll, .-my_srlll
