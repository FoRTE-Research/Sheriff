/*============================================================================

    fourierf.c  -  Don Cross <dcross@intersrv.com>

    http://www.intersrv.com/~dcross/fft.html

    Contains definitions for doing Fourier transforms
    and inverse Fourier transforms.

    This module performs operations on arrays of 'float'.

    Revision history:

1998 September 19 [Don Cross]
    Updated coding standards.
    Improved efficiency of trig calculations.

============================================================================*/

#include <stdlib.h>
#include <math.h>

#include "fourier.h"
#include "ddcmath.h"

#define CHECKPOINTER(p)  CheckPointer(p,#p)

static void CheckPointer ( void *p, char *name )
{
    if ( p == NULL )
    {
        //fprintf ( stderr, "Error in fft_float():  %s == NULL\n", name );
        while(1);               //was exit(1)
    }
}

unsigned NumBits __attribute__((section(".secure_vars")));    /* Number of bits needed to store indices */
unsigned ii __attribute__((section(".secure_vars")));
unsigned jj __attribute__((section(".secure_vars")));
unsigned kk __attribute__((section(".secure_vars")));
unsigned nn __attribute__((section(".secure_vars")));
unsigned BlockSize __attribute__((section(".secure_vars")));
unsigned BlockEnd __attribute__((section(".secure_vars")));
double tr __attribute__((section(".secure_vars")));     /* temp real */ 
double ti __attribute__((section(".secure_vars")));     /* temp imaginary */
double angle_numerator __attribute__((section(".secure_vars")));

double delta_angle __attribute__((section(".secure_vars")));
double sm2 __attribute__((section(".secure_vars")));
double sm1 __attribute__((section(".secure_vars")));
double cm2 __attribute__((section(".secure_vars")));
double cm1 __attribute__((section(".secure_vars")));
double w __attribute__((section(".secure_vars")));
double ar[3] __attribute__((section(".secure_vars")));
double ai[3] __attribute__((section(".secure_vars")));

double denom __attribute__((section(".secure_vars")));

void fft_float (
    unsigned  NumSamples,
    int       InverseTransform,
    float    *RealIn,
    float    *ImagIn,
    float    *RealOut,
    float    *ImagOut )
{

    angle_numerator = 2.0 * DDC_PI;

    if ( !IsPowerOfTwo(NumSamples) )
    {
        //fprintf (
        //    stderr,
        //    "Error in fft():  NumSamples=%u is not power of two\n",
        //    NumSamples );

        while(1);               //was exit(1)
    }

    if ( InverseTransform )
        angle_numerator = -angle_numerator;

    CHECKPOINTER ( RealIn );
    CHECKPOINTER ( RealOut );
    CHECKPOINTER ( ImagOut );

    NumBits = NumberOfBitsNeeded ( NumSamples );

    /*
    **   Do simultaneous data copy and bit-reversal ordering into outputs...
    */

    for ( ii=0; ii < NumSamples; ii++ )
    {
        jj = ReverseBits ( ii, NumBits );
        RealOut[jj] = RealIn[ii];
        ImagOut[jj] = (ImagIn == NULL) ? 0.0 : ImagIn[ii];
    }

    /*
    **   Do the FFT itself...
    */

    BlockEnd = 1;
    for ( BlockSize = 2; BlockSize <= NumSamples; BlockSize <<= 1 )
    {
        delta_angle = angle_numerator / (double)BlockSize;
        sm2 = sin ( -2 * delta_angle );
        sm1 = sin ( -delta_angle );
        cm2 = cos ( -2 * delta_angle );
        cm1 = cos ( -delta_angle );
        w = 2 * cm1;
        ar[3], ai[3];

        for ( ii=0; ii < NumSamples; ii += BlockSize )
        {
            ar[2] = cm2;
            ar[1] = cm1;

            ai[2] = sm2;
            ai[1] = sm1;

            for ( jj=ii, nn=0; nn < BlockEnd; jj++, nn++ )
            {
                ar[0] = w*ar[1] - ar[2];
                ar[2] = ar[1];
                ar[1] = ar[0];

                ai[0] = w*ai[1] - ai[2];
                ai[2] = ai[1];
                ai[1] = ai[0];

                kk = jj + BlockEnd;
                tr = ar[0]*RealOut[kk] - ai[0]*ImagOut[kk];
                ti = ar[0]*ImagOut[kk] + ai[0]*RealOut[kk];

                RealOut[kk] = RealOut[jj] - tr;
                ImagOut[kk] = ImagOut[jj] - ti;

                RealOut[jj] += tr;
                ImagOut[jj] += ti;
            }
        }

        BlockEnd = BlockSize;
    }

    /*
    **   Need to normalize if inverse transform...
    */

    if ( InverseTransform )
    {
        denom = (double)NumSamples;

        for ( ii=0; ii < NumSamples; ii++ )
        {
            RealOut[ii] /= denom;
            ImagOut[ii] /= denom;
        }
    }
}


/*--- end of file fourierf.c ---*/
