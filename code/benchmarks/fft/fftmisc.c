/*============================================================================

    fftmisc.c  -  Don Cross <dcross@intersrv.com>

    http://www.intersrv.com/~dcross/fft.html

    Helper routines for Fast Fourier Transform implementation.
    Contains common code for fft_float() and fft_double().

    See also:
        fourierf.c
        fourierd.c
        ..\include\fourier.h

    Revision history:

1998 September 19 [Don Cross]
    Improved the efficiency of IsPowerOfTwo().
    Updated coding standards.

============================================================================*/

#include <stdlib.h>
#include <math.h>

#include "fourier.h"

#define TRUE  1
#define FALSE 0

#define BITS_PER_WORD   (sizeof(unsigned) * 8)


int IsPowerOfTwo ( unsigned x )
{
    if ( x < 2 )
        return FALSE;

    if ( x & (x-1) )        // Thanks to 'byang' for this cute trick!
        return FALSE;

    return TRUE;
}

unsigned iOne __attribute__((section(".secure_vars")));

unsigned NumberOfBitsNeeded ( unsigned PowerOfTwo )
{

    if ( PowerOfTwo < 2 )
    {
        //fprintf (
            //stderr,
            //">>> Error in fftmisc.c: argument %d to NumberOfBitsNeeded is too small.\n",
            //PowerOfTwo );

        while(1);            //was exit(1)
    }

    for ( iOne=0; ; iOne++ )
    {
        if ( PowerOfTwo & (1 << iOne) )
            return iOne;
    }
}


unsigned iTwo __attribute__((section(".secure_vars")));
unsigned rev __attribute__((section(".secure_vars")));

unsigned ReverseBits ( unsigned index, unsigned NumBits )
{
    for ( iTwo=rev=0; iTwo < NumBits; iTwo++ )
    {
        rev = (rev << 1) | (index & 1);
        index >>= 1;
    }

    return rev;
}


double Index_to_frequency ( unsigned NumSamples, unsigned Index )
{
    if ( Index >= NumSamples )
        return 0.0;
    else if ( Index <= NumSamples/2 )
        return (double)Index / (double)NumSamples;

    return -(double)(NumSamples-Index) / (double)NumSamples;
}


/*--- end of file fftmisc.c---*/
