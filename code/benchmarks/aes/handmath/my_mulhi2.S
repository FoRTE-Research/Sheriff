  .file "my_mulhi2.c"

.text
  .global my_mulhi2
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_mulhi2
  .type my_mulhi2, @function
my_mulhi2:
PUSH R2;
DINT;		
NOP;	
MOV	R12, &0x04C0;
MOV	R13, &0x04C8;
MOV	&0x04CA, R12;
POP	R2;
RETA;
.size my_mulhi2, .-my_mulhi2
