#ifndef __GATEWAY__
#define __GATEWAY__

__attribute__((section(".securegateway"),naked)) void exit_irq(void);
__attribute__((section(".securegateway"),naked)) void exit_ret(void);
__attribute__((section(".securegateway"),naked)) void entry_reti(void);
__attribute__((section(".securegateway"),naked)) void entry_call(void);

#endif /*** __GATEWAY__ ***/
