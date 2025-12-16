  .file "my_muldi3.c"

.text
  .global my_muldi3
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_muldi3
  .type my_muldi3, @function
my_muldi3:
PUSH	R2		;
DINT			
NOP			
PUSHM.A	#5,	R10	;20-BIT WORDS
MOV	R8,	&0X04D0	;
MOV	R9,	&0X04D2	;
MOV	R14,	&0X04E0	;
MOV	R15,	&0X04E2	;
MOV	&0X04E4,R6	;0X04E4
MOV	&0X04E6,R7	;0X04E6
MOV	R10,	&0X04D0	;
MOV	R11,	&0X04D2	;
MOV	R12,	&0X04E0	;
MOV	R13,	&0X04E2	;
ADD	&0X04E4,R6	;0X04E4
ADDC	&0X04E6,R7	;0X04E6
MOV	R8,	&0X04D0	;
MOV	R9,	&0X04D2	;
MOV	R12,	&0X04E0	;
MOV	R13,	&0X04E2	;
MOV	&0X04E4,R12	;0X04E4
MOV	&0X04E6,R13	;0X04E6
MOV	&0X04E8,R14	;0X04E8
MOV	&0X04EA,R15	;0X04EA
ADD	R6,	R14	;
ADDC	R7,	R15	;
POPM.A	#5,	R10	;20-BIT WORDS
POP	R2		;
RETA			;
.size my_muldi3, .-my_muldi3

