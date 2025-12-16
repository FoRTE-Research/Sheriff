/**********************************************************************
 *
 * Filename:    crc.c
 * 
 * Description: Slow and fast implementations of the CRC standards.
 *
 * Notes:       The parameters for each supported CRC standard are
 *				defined in the header file crc.h.  The implementations
 *				here should stand up to further additions to that list.
 *
 * 
 * Copyright (c) 2000 by Michael Barr.  This software is placed into
 * the public domain and may be used for any purpose.  However, this
 * notice must not be changed or removed and no warranty is either
 * expressed or implied by its publication or distribution.
 **********************************************************************/
 
#include "crc.h"

/*
 * Derive parameters from the standard-specific parameters in crc.h.
 */
#define WIDTH    (8 * sizeof(crc))
#define TOPBIT   (1 << (WIDTH - 1))

#if (REFLECT_DATA == TRUE)
#undef  REFLECT_DATA
#define REFLECT_DATA(X)			((unsigned char) reflect((X), 8))
#else
#undef  REFLECT_DATA
#define REFLECT_DATA(X)			(X)
#endif

#if (REFLECT_REMAINDER == TRUE)
#undef  REFLECT_REMAINDER
#define REFLECT_REMAINDER(X)	((crc) reflect((X), WIDTH))
#else
#undef  REFLECT_REMAINDER
#define REFLECT_REMAINDER(X)	(X)
#endif


/*********************************************************************
 *
 * Function:    reflect()
 * 
 * Description: Reorder the bits of a binary sequence, by reflecting
 *				them about the middle position.
 *
 * Notes:		No checking is done that nBits <= 32.
 *
 * Returns:		The reflection of the original data.
 *
 *********************************************************************/
unsigned long  reflection0 __attribute__((section(".secure_vars")));
unsigned char  bit0 __attribute__((section(".secure_vars")));

static unsigned long
reflect(unsigned long data, unsigned char nBits)
{
	reflection0 = 0x00000000;

	/*
	 * Reflect the data about the center bit.
	 */
	for (bit0 = 0; bit0 < nBits; ++bit0)
	{
		/*
		 * If the LSB bit is set, set the reflection of it.
		 */
		if (data & 0x01)
		{
			reflection0 |= (1 << ((nBits - 1) - bit0));
		}

		data = (data >> 1);
	}

	return (reflection0);

}	/* reflect() */


/*********************************************************************
 *
 * Function:    crcSlow()
 * 
 * Description: Compute the CRC of a given message.
 *
 * Notes:		
 *
 * Returns:		The CRC of the message.
 *
 *********************************************************************/
crc            remainder1 __attribute__((section(".secure_vars")));
int            byte1 __attribute__((section(".secure_vars")));
unsigned char  bit1 __attribute__((section(".secure_vars")));
	
crc
crcSlow(unsigned char const message[], int nBytes)
{
    remainder1 = INITIAL_REMAINDER;

    /*
     * Perform modulo-2 division, a byte at a time.
     */
    for (byte1 = 0; byte1 < nBytes; ++byte1)
    {
        /*
         * Bring the next byte into the remainder.
         */
        remainder1 ^= (REFLECT_DATA(message[byte1]) << (WIDTH - 8));

        /*
         * Perform modulo-2 division, a bit at a time.
         */
        for (bit1 = 8; bit1 > 0; --bit1)
        {
            /*
             * Try to divide the current data bit.
             */
            if (remainder1 & TOPBIT)
            {
                remainder1 = (remainder1 << 1) ^ POLYNOMIAL;
            }
            else
            {
                remainder1 = (remainder1 << 1);
            }
        }
    }

    /*
     * The final remainder is the CRC result.
     */
    return (REFLECT_REMAINDER(remainder1) ^ FINAL_XOR_VALUE);

}   /* crcSlow() */


crc  crcTable[256] __attribute__((section(".secure_vars")));


/*********************************************************************
 *
 * Function:    crcInit()
 * 
 * Description: Populate the partial CRC lookup table.
 *
 * Notes:		This function must be rerun any time the CRC standard
 *				is changed.  If desired, it can be run "offline" and
 *				the table results stored in an embedded system's ROM.
 *
 * Returns:		None defined.
 *
 *********************************************************************/
crc			   remainder2 __attribute__((section(".secure_vars")));
int			   dividend2 __attribute__((section(".secure_vars")));
unsigned char  bit2 __attribute__((section(".secure_vars")));
	
void
crcInit(void)
{
    /*
     * Compute the remainder of each possible dividend.
     */
    for (dividend2 = 0; dividend2 < 256; ++dividend2)
    {
        /*
         * Start with the dividend followed by zeros.
         */
        remainder2 = dividend2 << (WIDTH - 8);

        /*
         * Perform modulo-2 division, a bit at a time.
         */
        for (bit2 = 8; bit2 > 0; --bit2)
        {
            /*
             * Try to divide the current data bit.
             */			
            if (remainder2 & TOPBIT)
            {
                remainder2 = (remainder2 << 1) ^ POLYNOMIAL;
            }
            else
            {
                remainder2 = (remainder2 << 1);
            }
        }

        /*
         * Store the result into the table.
         */
        crcTable[dividend2] = remainder2;
    }

}   /* crcInit() */


/*********************************************************************
 *
 * Function:    crcFast()
 * 
 * Description: Compute the CRC of a given message.
 *
 * Notes:		crcInit() must be called first.
 *
 * Returns:		The CRC of the message.
 *
 *********************************************************************/
crc	           remainder3 __attribute__((section(".secure_vars")));
unsigned char  data3 __attribute__((section(".secure_vars")));
int            byte3 __attribute__((section(".secure_vars")));

crc
crcFast(unsigned char const message[], int nBytes)
{
    remainder3 = INITIAL_REMAINDER;

    /*
     * Divide the message by the polynomial, a byte at a time.
     */
    for (byte3 = 0; byte3 < nBytes; ++byte3)
    {
        data3 = REFLECT_DATA(message[byte3]) ^ (remainder3 >> (WIDTH - 8));
  		remainder3 = crcTable[data3] ^ (remainder3 << 8);
    }

    /*
     * The final remainder is the CRC.
     */
    return (REFLECT_REMAINDER(remainder3) ^ FINAL_XOR_VALUE);

}   /* crcFast() */
