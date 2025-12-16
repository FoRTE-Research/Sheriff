#include <stdio.h>
#include "hardware.h"
#include "gateway.h"
#include "secure.h"

//--------------------- Main ------------------//
int main(void)
{    
    WDTCTL = WDTPW + WDTHOLD;                 // Stop watchdog timer
    
    /* Unit Test to understand RETI flow */
    __asm(" reti_loop: push #reti_loop");
    __asm(" push #0");
    __asm(" reti");
    
    /* Unit Test to check correct secure function call */
    //__asm(" push #0");
    //__asm(" call #secGW_call");
    //__asm(" incd R1");
    
    /* Unit Test to check incorrect secure function call */
    //secure_fn();
    
    P3DIR |= 0x01;                          // Set P3.0 to output direction

    for (;;)
    {
    P3OUT ^= 0x01;                          // Toggle P3.0 using exclusive-OR

    volatile unsigned int i;
    i = 50000;                              // Delay
    do (i--);
    while (i != 0);
    }
    
    return 0;
}

unsigned int j __attribute__((section(".secure_vars")));
void secure_fn()
{
    P3DIR |= 0x02;                          // Set P3.1 to output direction

    for (;;)
    {
    P3OUT ^= 0x02;                          // Toggle P3.1 using exclusive-OR

    j = 50000;                              // Delay
    do (j--);
    while (j != 0);
    }
}

//unsigned int k __attribute__((section(".secure_handler_vars")));
void secure_error_handler()
{
    P3DIR |= 0x04;                          // Set P3.2 to output direction

    for (;;)
    {
    P3OUT ^= 0x04;                          // Toggle P3.2 using exclusive-OR

    volatile unsigned int k;
    k = 50000;                              // Delay
    do (k--);
    while (k != 0);
    }
}
