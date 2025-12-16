  .file "my_fltuld.c"

.text
  .global my_fltuld
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_fltuld
  .type my_fltuld, @function
my_fltuld:
PUSHM.A	#4,	R10	;20-BIT WORDS
.DL0:
SUBA	#14,	R1	;0X0000E
.DL1:
MOV	R12,	R10	;
MOV	R13,	R9	;
.DL2:
MOV	#0,	2(R1)	;R3 AS==00
.DL3:
MOV	R12,	R14	;
BIS	R13,	R14	;
CMP	#0,	R14	;R3 AS==00
JNZ	.DL9     	;ABS 0X14C5A
.DL4:
MOV	#2,	0(R1)	;R3 AS==10
.DL5:
MOVA	R1,	R12	;
CALLA	#my_pack_d		;0X1522A
.DL6:
ADDA	#14,	R1	;0X0000E
.DL7:
POPM.A	#4,	R10	;20-BIT WORDS
.DL8:
RETA			;
.DL9:
MOV	#3,	0(R1)	;
.DL10:
CALLA	#my_clzsi2		;0X14F60
.DL11:
MOV	R12,	R7	;
ADD	#29,	R7	;#0X001D
.DL12:
MOV	R10,	R8	;
.DL13:
CLR.B	R10		;
CLR.B	R11		;
MOV	R7,	R12	;
CALLA	#my_sllll		;0X14DBE
MOV	R12,	6(R1)	;
MOV	R13,	8(R1)	;
MOV	R14,	10(R1)	; 0X000A
MOV	R15,	12(R1)	; 0X000C
.DL14:
MOV.B	#60,	R12	;#0X003C
SUB	R7,	R12	;
MOV	R12,	4(R1)	;
JMP .DL5;
.size my_fltuld, .-my_fltuld
