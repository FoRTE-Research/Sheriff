/**********************************************************************
 *
 * Filename:    main.c
 * 
 * Description: A simple test program for the CRC implementations.
 *
 * Notes:       To test a different CRC standard, modify crc.h.
 *
 * 
 * Copyright (c) 2000 by Michael Barr.  This software is placed into
 * the public domain and may be used for any purpose.  However, this
 * notice must not be changed or removed and no warranty is either
 * expressed or implied by its publication or distribution.
 **********************************************************************/
#include "../bareBench.h"
#include <string.h>

#include "crc.h"
#include "../../secure-gateway/gateway.h"

crc slow_result;
crc fast_result;
unsigned char test[] = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789";

int
main(void)
{
    /*
     * Compute the CRC of the test message, slowly.
     */
    slow_result = crcSlow(test,100);

    /*
     * Compute the CRC of the test message, more efficiently.
     */
    crcInit();
    fast_result = crcFast(test,100);

    return 0;
}   /* main() */
