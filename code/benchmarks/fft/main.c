#include <stdlib.h>
#include <math.h>
#include "fourier.h"
#include "../bareBench.h"
#include "../../secure-gateway/gateway.h"

int invfft __attribute__ ((section (".extravars"))) = 0;
unsigned MAXSIZE __attribute__ ((section (".extravars"))); // small 4096, 8192 inverse, 512 for memory-limited systems
unsigned MAXWAVES __attribute__ ((section (".extravars"))) = 4; //large has 8
static float realin[256] __attribute__ ((section (".extravars")));
static float imagin[256] __attribute__ ((section (".extravars")));
static float realout[256] __attribute__ ((section (".extravars")));
static float imagout[256] __attribute__ ((section (".extravars")));
static float Coeff[4] __attribute__ ((section (".extravars")));
static float Amp[4] __attribute__ ((section (".extravars")));

int old_main();
    
// main for benchmark purposes that does fft and inverse fft
int main() {
    MAXSIZE = 128;
    old_main();
    invfft = 1;
    MAXSIZE = 256;
    old_main();
    return 0;
}

int old_main() {

    unsigned iMain, jMain;
    float *RealIn;
    float *ImagIn;
    float *RealOut;
    float *ImagOut;
    float *coeff;
    float *amp;

    srand(1);

 //Statically allocate
	RealIn = realin;
	ImagIn = imagin;
	RealOut = realout;
	ImagOut = imagout;
	coeff = Coeff;
	amp = Amp;

 /* Makes MAXWAVES waves of random amplitude and period */
	for(iMain=0;iMain<MAXWAVES;iMain++) 
	{
		coeff[iMain] = rand()%1000;
		amp[iMain] = rand()%1000;
	}
 for(iMain=0;iMain<MAXSIZE;iMain++) 
 {
   /*   RealIn[i]=rand();*/
	 RealIn[iMain]=0;
	 for(jMain=0;jMain<MAXWAVES;jMain++) 
	 {
		 /* randomly select sin or cos */
		 if (rand()%2)
		 {
		 		RealIn[iMain]+=coeff[jMain]*cos(amp[jMain]*iMain);
			}
		 else
		 {
		 	RealIn[iMain]+=coeff[jMain]*sin(amp[jMain]*iMain);
		 }
  	 ImagIn[iMain]=0;
	 }
 }

 /* regular*/
 fft_float (MAXSIZE,invfft,RealIn,ImagIn,RealOut,ImagOut);

 return 0;
}
