  .file "my_fabs.c"

.text
  .global my_fabs
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_fabs
  .type my_fabs, @function
my_fabs:
AND	#32767,	R15	;#0X7FFF
.DL0:
RETA	
.size my_fabs, .-my_fabs
