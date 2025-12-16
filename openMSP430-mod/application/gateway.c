#include <msp430.h>
#include <stdint.h>
#include <stdarg.h>
#include "gateway.h"

#include <stdio.h>
#include "hardware.h"
#include "secure.h"

uint16_t ERROR_WORD __attribute__((section(".errorword"))) = 0xF098;
uint8_t MAX_SYS_CALLS __attribute__((section(".globalvars"))) = 0x01;
void (*SYS_CALL_PTR[]) __attribute__((section(".globalvars"))) = {secure_fn};
uint8_t CALL_STACKFRAME_SIZE[] __attribute__((section(".globalvars"))) = {0x00};
uint8_t RET_REG_COUNT_ARRAY[] __attribute__((section(".globalvars"))) = {0x00};

uint16_t SECZONE_INIT_STRUCT __attribute__((section(".ipestruct"))) = 0xF098;                             //contains password for secure zone activation  
uint16_t EXIT_RET_PC __attribute__((section(".globalvars"))) = 0xF456;                                    //default value set to normal world
uint16_t EXIT_RET_SP __attribute__((section(".globalvars"))) = 0x2BFC;                                    //default value set to top of SRAM 
uint16_t INTERRUPT_RET_SP __attribute__((section(".globalvars"))) = 0x61FE;                               //default value set to top of secure stack
uint16_t ISR_SP __attribute__((section(".globalvars"))) = 0;
uint16_t ISR_ADDRESS __attribute__((section(".globalvars"))) = 0xF456;                                    //default value set to normal world
uint8_t RET_REG_COUNT __attribute__((section(".globalvars"))) = 0;

uint16_t SECURE_IVT[] __attribute__((section(".secureivt"))) = {0xF0A2, 0xF0AA, 0xF0B2, 0xF0BA, 
                                                                0xF0C2, 0XF0CA, 0xF0D2, 0xF0DA,
                                                                0xF0E2, 0xF0EA, 0xF0F2, 0xF0FA,
                                                                0xF102, 0xF10A, 0xF112, 0xF1D2};

void secGW_call(void)
{    
    
    /*** Store normal world return address in EXIT_RET_PC ***/

    __asm(" pop &EXIT_RET_PC");
    
    /*** Save callee-saved registers R4-R10 on normal stack ***/
    
    __asm(" push R10");
    __asm(" push R9");
    __asm(" push R8");
    __asm(" push R7");
    __asm(" push R6");
    __asm(" push R5");
    __asm(" push R4");
    
    /*** Store NW return SP in EXIT_RET_SP and set SP to top of secure stack ***/

    __asm(" mov.w R1, &EXIT_RET_SP");
    __asm(" mov.w R1, R10");
    __asm(" mov.w #0x61FE, R1");
    
    /*** Check system call ID and go to fault trap if invalid ***/
    
    __asm(" add.w #16, R10");
    __asm(" mov.w @R10+, R9");
    __asm(" mov.w R9, R8");                                //saving a copy of index for the function pointer
    __asm(" cmp.w &MAX_SYS_CALLS, R9");
    __asm(" jge fault_trap");                              //jump to fault_trap if R9 >= MAX_SYS_CALLS
    __asm(" cmp.w #0, R9");
    __asm(" jl fault_trap");                               //jump to fault_trap if R9 < 0

    /*** Routine for populating extra arguments ***/
    
    __asm(" add.w #CALL_STACKFRAME_SIZE, R9");
    __asm(" mov.b @R9, R9");
    __asm(" add.w R9, R10");
    __asm(" decd.w R10");
    __asm(" check_args: cmp.w #0, R9");
    __asm(" jz call_sec_fn");
    __asm(" push @R10");
    __asm(" decd.w R10");
    __asm(" decd.w R9");
    __asm(" jmp check_args");

    //__asm(" loop_end: pushx.a #exit_ret");                //store exit_ret trampoline address on stack
    
    /*** Save the return register count and call secure function from the function pointer list ***/
    
    __asm(" call_sec_fn: mov.w R8, R9");
    __asm(" add.w #RET_REG_COUNT_ARRAY, R9");
    __asm(" mov.b @R9, &RET_REG_COUNT");
    __asm(" rla R8");
    __asm(" add.w #SYS_CALL_PTR, R8");
    __asm(" call @R8");

//}

//void exit_ret(void)
//{

    /*** Check which GPRs to clear based on return value ***/
    
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
    
    __asm(" and.w #0xFEF8, R2");

    /*** Restore normal world SP and callee-saved registers R4-R10 ***/

    __asm(" mov.w &EXIT_RET_SP, R1");
    __asm(" pop R4");
    __asm(" pop R5");
    __asm(" pop R6");
    __asm(" pop R7");
    __asm(" pop R8");
    __asm(" pop R9");
    __asm(" pop R10");
    
    /*** Return to normal world ***/
    __asm(" mov &EXIT_RET_PC, R0");   
    
    /*** Routine for invalid system call ***/
    
    __asm(" fault_trap: nop");
    __asm(" nop");
    __asm("jmp fault_trap");          

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
     *** resets the CPU registers, switches back to the normal stack before
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
    __asm(" and.w #0xFEF8, R2");
    __asm(" mov.w &EXIT_RET_SP, R1");
    __asm(" mov.w &0xFFFC, R0");
   
    /*** Push return SP on the return stack ***/
    
    __asm(" interrupt_handler_routine: add.w #4, R1");
    __asm(" mov.w R1, &ISR_SP");
    __asm(" sub.w #4, R1");
    __asm(" push &ISR_SP");
    
    __asm(" mov.w &EXIT_RET_SP, &ISR_SP");
    
    __asm(" cmp.w #0x4000, R1");
    __asm(" jge regular_routine");            //jump to regular routine if SP >= 0x4000
    __asm(" cmp.w #0xEF80, R1");                
    __asm(" jl regular_routine");             //jump to regular_routine if SP < 0xEF80 or SP <= 0xEF7F
    
    /*** Extra routine for switching to secure stack and populating it in case SP in normal world ***/ 
    
    __asm(" push R10");
    __asm(" mov.w &INTERRUPT_RET_SP, R10");
    __asm(" add.w #4, R1");
    __asm(" pop -6(R10)");                     //store return SP on secure stack
    __asm(" clr -2(R1)");
    __asm(" pop -4(R10)");                     //store return SR on secure stack
    __asm(" clr -2(R1)");
    __asm(" pop -2(R10)");                     //store return PC on secure stack
    __asm(" clr -2(R1)");
    __asm(" mov.w R1, &ISR_SP");
    __asm(" mov.w -10(R1), R10");             //restore original R10
    __asm(" clr -10(R1)");
    __asm(" mov.w &INTERRUPT_RET_SP, R1");     //switch to secure stack
    __asm(" sub.w #6, R1");      
    
    /*** regular_routine: Store CPU registers R3-R15 in secure stack ***/

    __asm(" regular_routine: push R15");
    __asm(" push R14");
    __asm(" push R13");
    __asm(" push R12");
    __asm(" push R11");
    __asm(" push R10");
    __asm(" push R9");
    __asm(" push R8");
    __asm(" push R7");
    __asm(" push R6");
    __asm(" push R5");
    __asm(" push R4");
    __asm(" push R3");
    
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
    
    __asm(" and.w #0xFEF8, R2");
    
    /*** Store secure world SP in secure global variable INTERRUPT_RET_SP ***/

    __asm(" push &INTERRUPT_RET_SP");                        //store a copy of INTERRUPT_RET_SP on secure stack before 
                                                             //changing it, to account for nested secure interrupts
    __asm(" mov.w R1, &INTERRUPT_RET_SP");

    /*** Switch to normal stack ***/

    __asm(" mov.w &ISR_SP, R1");

    /*** Jump to normal world ISR ***/
    
    __asm(" mov.w &ISR_ADDRESS, R0");
    
    /*** Switch stack to normal world in case of reset inside secure zone ***/
    
    __asm(" irqRESET: mov.w &EXIT_RET_SP, R1");
    __asm(" mov.w &0xFFFE, R0");

}

//not all atomic since interrupts can be re-enabled inside ISR
void entry_reti(void)
{

    /*** Disable general interrupts ***/
    __asm(" dint");                  
    __asm(" nop");                    //rest of the function after this is atomic

    /*** Switch to secure stack before invoking entry_reti ***/

    __asm(" mov.w &INTERRUPT_RET_SP, R1");   
    
    /*** Restore old value of INTERRUPT_RET_SP from secure stack ***/
    
    __asm(" pop &INTERRUPT_RET_SP");

    /*** Restore R3-R15 from secure stack ***/

    __asm(" pop R3");
    __asm(" pop R4");
    __asm(" pop R5");
    __asm(" pop R6");
    __asm(" pop R7");
    __asm(" pop R8");
    __asm(" pop R9");
    __asm(" pop R10");
    __asm(" pop R11");
    __asm(" pop R12");
    __asm(" pop R13");
    __asm(" pop R14");
    __asm(" pop R15");
    
    /*** Switch to return stack (secure or normal) from secure stack ***/
    __asm(" push R10");
    __asm(" mov.w R1, R10");
    __asm(" mov.w 4(R10), R1");        //switch to return stack
    __asm(" push 8(R10)");             //copy return PC to return stack
    __asm(" push 6(R10)");             //copy return SR to return stack
    __asm(" mov @R10, R10");          //restore original R10

    /*** Hardware restores SR and PC from return stack ***/

    __asm(" reti");

}

