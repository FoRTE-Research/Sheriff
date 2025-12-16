#ifdef BARE_METAL

#include <msp430.h>

int benchmark();
void initLED();
void LED();

#define RUNS 1

// Disable WDT before bss init to ensure
// no timeout before hitting main
static void __attribute__((naked, used, section(".crt_0042")))
disable_watchdog(void){
  WDTCTL = WDTPW | WDTHOLD;
}

// Default GPIO to lowest power
void initPins(){
  // Configure GPIO
  P1OUT = 0;
  P1DIR = 0xFF;

  P2OUT = 0;
  P2DIR = 0xFF;

  P3OUT = 0;
  P3DIR = 0xFF;

  P4OUT = 0;
  P4DIR = 0xFF;

  P5OUT = 0;
  P5DIR = 0xFF;

  P6OUT = 0;
  P6DIR = 0xFF;

  P7OUT = 0;
  P7DIR = 0xFF;

  P8OUT = 0;
  P8DIR = 0xFF;

  PJOUT = 0;
  PJDIR = 0xFFFF;
}

int main(void)
{
  volatile int run;

  initPins();

  // Disable the GPIO power-on default high-impedance mode to activate
  // previously configured port settings
  PM5CTL0 &= ~LOCKLPM5;

  LED(1);
  for(run = RUNS; run > 0; run--)
  {
    benchmark();
  }
  LED(0);

  return 0;
}

#define main(...) benchmark(__VA_ARGS__)

#endif
