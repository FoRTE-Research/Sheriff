#include <msp430.h>
#include <stdint.h>
#include <stdarg.h>
#include "gateway.h"

#if defined (CRC)
#include "../benchmarks/crc/crc.h"
#elif defined (DIJKSTRA)
#include "../benchmarks/dijkstra/dijkstra.h"
#elif defined (STRINGSEARCH)
#include "../benchmarks/stringsearch/pbmsrch.h"
#elif defined (FFT)
#include "../benchmarks/fft/fourier.h"
#elif defined (AES)
#include "../benchmarks/aes/aes.h"
#elif defined (CHACHA20)
#include "../benchmarks/chacha20/chacha20.h"
#elif defined (RC4)
#include "../benchmarks/rc4/rc4.h"
#elif defined (RSA)
#include "../benchmarks/rsa/rsa.h"
#endif

uint16_t SECZONE_INIT_STRUCT __attribute__((section(".ipestruct"))) = 0xBEEF;                             //contains password for secure zone activation 
//uint16_t TOP_OF_STACK __attribute__((section(".globalvars"))) = 0xEF7E;                               //default value set to top of secure stack
//uint16_t TOP_OF_STACK_DOWN __attribute__((section(".globalvars"))) = 0xEF80;                                    //default value set to normal world
uint32_t EXIT_RET_PC __attribute__((section(".globalvars"))) = 0xEF80;                                    //default value set to normal world
uint16_t EXIT_RET_SP __attribute__((section(".globalvars"))) = 0x2BFC;                                    //default value set to top of SRAM 
uint16_t INTERRUPT_RET_SP __attribute__((section(".globalvars"))) = 0xEF7E;                               //default value set to top of secure stack
uint16_t ISR_SP __attribute__((section(".globalvars"))) = 0;
uint16_t ISR_ADDRESS __attribute__((section(".globalvars"))) = 0xEF80;                                    //default value set to normal world
uint8_t RET_REG_COUNT __attribute__((section(".globalvars"))) = 0;

void entry_call(void)
{    
    
    /*** Store normal world return address in EXIT_RET_PC ***/

    __asm(" popx.a &EXIT_RET_PC");
    
    /*** Save callee-saved registers R4-R10 on normal stack ***/
    
    __asm(" pushm.a #7, R10"); 
    
    /*** Store NW return SP in EXIT_RET_SP and set SP to top of secure stack ***/

    __asm(" mov.w SP, &EXIT_RET_SP");
    __asm(" mov.w SP, R10");
    __asm(" mov.w #0xEF7E, SP");
    
    /*** Check system call ID and go to fault trap if invalid ***/
    
    __asm(" add.w #28, R10");
    __asm(" mov.w @R10+, R9");

    #if defined (CRC)
    __asm(" cmp.w #0, R9");
    __asm(" jeq crcSlow0");
    __asm(" cmp.w #1, R9");
    __asm(" jeq crcInit1");
    __asm(" cmp.w #2, R9");
    __asm(" jeq crcFast2");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** crcSlow0: Save the return register count and call secure function ***/
    
    __asm(" crcSlow0: mov.b #1, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #crcSlow");
    
    /*** crcInit1: Save the return register count and call secure function ***/
    
    __asm(" crcInit1: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #crcInit");
    
    /*** crcFast2: Save the return register count and call secure function ***/
    
    __asm(" crcFast2: mov.b #1, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #crcFast");
    
    #elif defined (DIJKSTRA)
    __asm(" cmp.w #0, R9");
    __asm(" jeq dijkstraFunc0");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** dijkstraFunc0: Save the return register count and call secure function ***/
    
    __asm(" dijkstraFunc0: mov.b #1, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #dijkstraFunc");
    
    #elif defined (STRINGSEARCH)
    __asm(" cmp.w #0, R9");
    __asm(" jeq pbmsrch0");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** pbmsrch0: Save the return register count and call secure function ***/
    
    __asm(" pbmsrch0: mov.b #1, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #pbmsrch");
    
    #elif defined (FFT)
    __asm(" cmp.w #0, R9");
    __asm(" jeq fft_float0");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** fft_float0: Routine for populating extra arguments ***/
    
    __asm(" fft_float0: mov.b #8, R9");
    __asm(" add.w R9, R10");
    __asm(" decd.w R10");
    __asm(" check_args: cmp.w #0, R9");
    __asm(" jz call_fft_float");
    __asm(" push @R10");
    __asm(" decd.w R10");
    __asm(" decd.w R9");
    __asm(" jmp check_args");
    
    /*** call_fft_float: Save the return register count and call secure function ***/
    
    __asm(" call_fft_float: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #fft_float");
    
    #elif defined (AES)
    __asm(" cmp.w #0, R9");
    __asm(" jeq AES_init_ctx0");
    __asm(" cmp.w #1, R9");
    __asm(" jeq AES_encrypt1");
    __asm(" cmp.w #2, R9");
    __asm(" jeq AES_decrypt2");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** AES_init_ctx0: Save the return register count and call secure function ***/
    
    __asm(" AES_init_ctx0: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #AES_init_ctx");
    
    /*** AES_encrypt1: Save the return register count and call secure function ***/
    
    __asm(" AES_encrypt1: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #AES_encrypt");
    
    /*** AES_decrypt2: Save the return register count and call secure function ***/
    
    __asm(" AES_decrypt2: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #AES_decrypt");
    
    #elif defined (CHACHA20)
    __asm(" cmp.w #0, R9");
    __asm(" jeq ChaCha20_xor0");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** ChaCha20_xor0: Save the return register count and call secure function ***/
    
    __asm(" ChaCha20_xor0: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #ChaCha20_xor");
    
    #elif defined (RC4)
    __asm(" cmp.w #0, R9");
    __asm(" jeq arcfour_init0");
    __asm(" cmp.w #1, R9");
    __asm(" jeq arcfour_byte1");
    __asm(" cmp.w #2, R9");
    __asm(" jeq arcfour_encrypt2");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** arcfour_init0: Save the return register count and call secure function ***/
    
    __asm(" arcfour_init0: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #arcfour_init");
    
    /*** arcfour_byte1: Save the return register count and call secure function ***/
    
    __asm(" arcfour_byte1: mov.b #1, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #arcfour_byte");
    
    /*** arcfour_encrypt2: Save the return register count and call secure function ***/
    
    __asm(" arcfour_encrypt2: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #arcfour_encrypt");
    
    #elif defined (RSA)
    __asm(" cmp.w #0, R9");
    __asm(" jeq rsaEncrypt0");
    __asm(" cmp.w #1, R9");
    __asm(" jeq rsaDecrypt1");
    __asm(" jmp fault_trap");                             //jump to fault_trap if no match
    
    /*** rsaEncrypt0: Routine for populating extra arguments ***/
    
    __asm(" rsaEncrypt0: mov.b #4, R9");
    __asm(" add.w R9, R10");
    __asm(" decd.w R10");
    __asm(" check_args_rsaEncrypt: cmp.w #0, R9");
    __asm(" jz call_rsaEncrypt");
    __asm(" push @R10");
    __asm(" decd.w R10");
    __asm(" decd.w R9");
    __asm(" jmp check_args_rsaEncrypt");
    
    /*** call_rsaEncrypt: Save the return register count and call secure function ***/
    
    __asm(" call_rsaEncrypt: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #rsaEncrypt");
    
    /*** rsaDecrypt1: Routine for populating extra arguments ***/
    
    __asm(" rsaDecrypt1: mov.b #4, R9");
    __asm(" add.w R9, R10");
    __asm(" decd.w R10");
    __asm(" check_args_rsaDecrypt: cmp.w #0, R9");
    __asm(" jz call_rsaDecrypt");
    __asm(" push @R10");
    __asm(" decd.w R10");
    __asm(" decd.w R9");
    __asm(" jmp check_args_rsaDecrypt");
    
    /*** call_rsaDecrypt: Save the return register count and call secure function ***/
    
    __asm(" call_rsaDecrypt: mov.b #0, &RET_REG_COUNT");
    __asm(" pushx.a #exit_ret");
    __asm(" br #rsaDecrypt");
    #endif

}

void exit_ret(void)
{

    /*** Check which GPRs to clear based on return value ***/
    
    //__asm(" mov.w SP, &TOP_OF_STACK");
    __asm(" mov.b &RET_REG_COUNT, R10");
    __asm(" cmp.w #1, R10");
    __asm(" jeq return_one");
    __asm(" cmp.w #2, R10");
    __asm(" jeq return_two");
    __asm(" cmp.w #4, R10");
    __asm(" jeq return_four");

    __asm(" return_none: clr R12");
    __asm(" return_one: clr R13");
    __asm(" return_two: clr R14");
    __asm(" clr R15");
    __asm(" return_four: clr R3");
    __asm(" clr R11");
    
    /*** Clear V,N,Z,C bits of SR ***/
    
    __asm(" and.w #0xFEF8, SR");

    /*** Restore normal world SP and callee-saved registers R4-R10 ***/

    __asm(" mov.w &EXIT_RET_SP, SP");
    __asm(" popm.a #7, R10");
    
    /*** Return to normal world ***/
    __asm(" mova &EXIT_RET_PC, PC");   
    
    /*** Routine for invalid system call ***/
    
    __asm(" fault_trap: jmp fault_trap");              

}

//exit_irq is atomic to general interrupts as they are disabled by hardware when an interrupt request is accepted
void exit_irq(void)
{

    /*** Copy ISR from Interrupt Vector Table ***/
    __asm(" irq0: mov.w &0xFFE0, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq1: mov.w &0xFFE2, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq2: mov.w &0xFFE4, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq3: mov.w &0xFFE6, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq4: mov.w &0xFFE8, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq5: mov.w &0xFFEA, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq6: mov.w &0xFFEC, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq7: mov.w &0xFFEE, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq8: mov.w &0xFFF0, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq9: mov.w &0xFFF2, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq10: mov.w &0xFFF4, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq11: mov.w &0xFFF6, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq12: mov.w &0xFFF8, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    __asm(" irq13: mov.w &0xFFFA, &ISR_ADDRESS");
    __asm(" jmp interrupt_handler_routine");
    
    /*** Since NMIs are largely non-recoverable, our secure interrupt handler
     *** resets the CPU registers, siwtches back to the normal stack before
     *** branching to the NMI ISR ***/
     
    __asm(" irq14: clr R3");
    __asm(" clr R4");
    __asm(" clr R5");
    __asm(" clr R6");
    __asm(" clr R7");
    __asm(" clr R8");
    __asm(" clr R9");
    __asm(" clr R10");
    __asm(" clr R11");
    __asm(" clr R12");
    __asm(" clr R13");
    __asm(" clr R14");
    __asm(" clr R15");    
    __asm(" and.w #0xFEF8, SR");
    __asm(" mov.w &EXIT_RET_SP, SP");
    __asm(" mov.w &0xFFFC, PC");
   
    /*** Push return SP on the return stack ***/
    
    __asm(" interrupt_handler_routine: add.w #4, SP");
    __asm(" mov.w SP, &ISR_SP");
    __asm(" sub.w #4, SP");
    //__asm(" mov.w SP, &TOP_OF_STACK");
    __asm(" push &ISR_SP");
    
    __asm(" mov.w &EXIT_RET_SP, &ISR_SP");
    
    __asm(" cmp.w #0x4000, SP");
    __asm(" jnc nw_routine");           //jump to nw_routine if SP < 0x4000
    __asm(" cmp.w #0xEF80, SP");                
    __asm(" jnc regular_routine");      //jump to regular_routine if SP < 0xEF80
    
    /*** Extra routine for switching to secure stack and populating it in case SP in normal world ***/ 
    
    __asm(" nw_routine: pushx.a R10");
    __asm(" mov.w &INTERRUPT_RET_SP, R10");
    //__asm(" mov.w R10, &TOP_OF_STACK");
    __asm(" add.w #4, SP");
    __asm(" pop -6(R10)");                     //store return SP on secure stack
    __asm(" clr -2(SP)");
    __asm(" pop -4(R10)");                     //store return SR on secure stack
    __asm(" clr -2(SP)");
    __asm(" pop -2(R10)");                     //store return PC on secure stack
    __asm(" clr -2(SP)");
    __asm(" mov.w SP, &ISR_SP");
    __asm(" movx.a -10(SP), R10");             //restore original R10
    __asm(" clrx.a -10(SP)");
    __asm(" mov.w &INTERRUPT_RET_SP, SP");     //switch to secure stack
    __asm(" sub.w #6, SP");
    
    /*** regular_routine: Store CPU registers R3-R15 in secure stack ***/

    __asm(" regular_routine: pushm.a #13, R15");
    
    /*** Clear CPU registers R3-R15 ***/

    __asm(" clr R3");
    __asm(" clr R4");
    __asm(" clr R5");
    __asm(" clr R6");
    __asm(" clr R7");
    __asm(" clr R8");
    __asm(" clr R9");
    __asm(" clr R10");
    __asm(" clr R11");
    __asm(" clr R12");
    __asm(" clr R13");
    __asm(" clr R14");
    __asm(" clr R15");
    
    /*** Clear V,N,Z,C bits of SR ***/
    
    __asm(" and.w #0xFEF8, SR");
    
    /*** Store secure world SP in secure global variable INTERRUPT_RET_SP ***/

    __asm(" push &INTERRUPT_RET_SP");                        //store a copy of INTERRUPT_RET_SP on secure stack before 
                                                             //changing it, to account for nested secure interrupts
    __asm(" mov.w SP, &INTERRUPT_RET_SP");

    /*** Switch to normal stack ***/

    __asm(" mov.w &ISR_SP, SP");

    /*** Jump to normal world ISR ***/
    
    __asm(" mov.w &ISR_ADDRESS, PC");
    
    /*** Switch stack to normal world in case of reset inside secure zone ***/
    
    __asm(" irqRESET: mov.w &EXIT_RET_SP, SP");
    __asm(" mov.w &0xFFFE, PC");

}

//not all atomic since interrupts can be re-enabled inside ISR
void entry_reti(void)
{

    /*** Disable general interrupts ***/
    __asm(" dint");                  
    __asm(" nop");                    //rest of the function after this is atomic

    /*** Switch to secure stack before invoking entry_reti ***/

    __asm(" mov.w &INTERRUPT_RET_SP, SP");   
    //__asm(" mov.w SP, &TOP_OF_STACK_DOWN");
    
    /*** Restore old value of INTERRUPT_RET_SP from secure stack ***/
    
    __asm(" pop &INTERRUPT_RET_SP");

    /*** Restore R3-R15 from secure stack ***/

    __asm(" popm.a #13, R15");
    
    /*** Switch to return stack (secure or normal) from secure stack ***/
    __asm(" pushx.a R10");
    __asm(" mov.w SP, R10");
    __asm(" mov.w 4(R10), SP");         //switch to return stack
    //__asm(" mov.w SP, &TOP_OF_STACK");
    __asm(" push 8(R10)");              //copy return PC to return stack
    __asm(" push 6(R10)");              //copy return SR to return stack
    __asm(" mova @R10, R10");           //restore original R10

    /*** Hardware restores SR and PC from return stack ***/

    __asm(" reti");

}

