  .file "my_fltlid.c"

.text
  .global my_fltlid
  .section .secure_code,"ax",@progbits
  .balign 2
  .global my_fltlid
  .type my_fltlid, @function
my_fltlid:
PUSHM.A	#4,	R10	;20-BIT WORDS
.DL0:
SUBA	#14,	R1	;0X0000E
.DL1:
MOV	#3,	0(R1)	;
.DL2:
MOV	R13,	R14	;
RPT #15 { RRUX.W	R14		;
MOV	R14,	2(R1)	;
.DL3:
MOV	R12,	R14	;
BIS	R13,	R14	;
CMP	#0,	R14	;R3 AS==00
JNZ	.DL9     	;ABS 0X14A90
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
CMP	#0,	R13	;R3 AS==00
JGE	.DL17     	;ABS 0X14ADC
.DL10:
CMP	#0,	R12	;R3 AS==00
JNZ	.DL11      	;ABS 0X14A9E
CMP	#-32768,R13	;#0X8000
JZ	.DL19     	;ABS 0X14AE4
.DL11:
CLR.B	R8		;
CLR.B	R9		;
SUB	R12,	R8	;
SUBC	R13,	R9	;
.DL12:
MOV	R8,	R12	;
.DL13:
MOV	R9,	R13	;
CALLA	#my_clzsi2		;0X14F60
.DL14:
MOV	R12,	R7	;
ADD	#29,	R7	;#0X001D
.DL15:
CLR.B	R10		;
CLR.B	R11		;
MOV	R7,	R12	;
CALLA	#my_sllll		;0X14DBE
MOV	R12,	6(R1)	;
MOV	R13,	8(R1)	;
MOV	R14,	10(R1)	; 0X000A
MOV	R15,	12(R1)	; 0X000C
.DL16:
MOV.B	#60,	R12	;#0X003C
SUB	R7,	R12	;
MOV	R12,	4(R1)	;
JMP .DL5
.DL17:
MOV	R12,	R8	;
MOV	R13,	R9	;
.DL18:
JMP .DL12
.DL19:
CLR.B	R12		;
.DL20:
CLR.B	R13		;
CLR.B	R14		;
MOV	#-15904,R15	;#0XC1E0
JMP .DL6;
.size my_fltlid, .-my_fltlid
