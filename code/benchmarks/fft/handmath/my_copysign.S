  .file "my_copysign.c"

.text
  .global my_copysign
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_copysign
  .type my_copysign, @function
my_copysign:
MOV	R14,	R11	;
.DL0:
AND	#32767,	R15	;#0X7FFF
MOV	10(R1),	R14	;0X0000A
AND	#-32768,R14	;#0X8000
BIS	R14,	R15	;
MOV	R11,	R14	;
.DL1:
RETA			;
.size my_copysign, .-my_copysign
