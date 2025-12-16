#include <msp430.h>

void initLED(){
  P1OUT &= ~BIT0;
  P1DIR |= BIT0;
}

void LED(int a){
  if(a){
    P1OUT |= BIT0;
  }else{
    P1OUT &= ~BIT0;
  }
}
