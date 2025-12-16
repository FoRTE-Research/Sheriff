#include <stdlib.h>
#include <msp430.h>
#include "rc4.h"

//-------------------------------------------------------------------
//-------------------------------------------------------------------

/*        This code illustrates a sample implementation
*                 of the Arcfour algorithm
*         Copyright (c) April 29, 1997 Kalle Kaukonen.
*                    All Rights Reserved.
*
* Redistribution and use in source and binary forms, with or
* without modification, are permitted provided that this copyright
* notice and disclaimer are retained.
*
* THIS SOFTWARE IS PROVIDED BY KALLE KAUKONEN AND CONTRIBUTORS ``AS
* IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
* FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL KALLE
* KAUKONEN OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
* INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
* OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
* INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
* THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

unsigned char mykey[] __attribute__((section(".secure_const"))) =
{
    0x29, 0x04, 0x19, 0x72,
    0xfb, 0x42, 0xba, 0x5f,
    0xc7, 0x12, 0x77, 0x12,
    0xf1, 0x38, 0x29, 0xc9
};
unsigned int mykey_len __attribute__((section(".secure_vars"))) = 16;

unsigned int t, u __attribute__((section(".secure_vars")));
unsigned int keyindex __attribute__((section(".secure_vars")));
unsigned int stateindex __attribute__((section(".secure_vars")));
unsigned char *state __attribute__((section(".secure_vars")));
unsigned int counter __attribute__((section(".secure_vars")));
void arcfour_init(ArcfourContext *ctx)
{
    state = ctx->state;
    ctx->x = 0;
    ctx->y = 0;
    for (counter = 0; counter < 256; counter++) state[counter] = counter;
    keyindex = 0;
    stateindex = 0;
    for (counter = 0; counter < 256; counter++)
    {
        t = state[counter];
        stateindex = (stateindex + mykey[keyindex] + t) & 0xff;
        u = state[stateindex];
        state[stateindex] = t;
        state[counter] = u;
        if (++keyindex >= mykey_len) keyindex = 0;
    }
}

unsigned int x __attribute__((section(".secure_vars")));
unsigned int y __attribute__((section(".secure_vars")));
unsigned int sx, sy __attribute__((section(".secure_vars")));
unsigned char *sstate __attribute__((section(".secure_vars")));
unsigned int arcfour_byte(ArcfourContext *ctx)
{
    sstate = ctx->state;
    x = (ctx->x + 1) & 0xff;
    sx = sstate[x];
    y = (sx + ctx->y) & 0xff;
    sy = sstate[y];
    ctx->x = x;
    ctx->y = y;
    sstate[y] = sx;
    sstate[x] = sy;
    return sstate[(sx + sy) & 0xff];
}

unsigned int ii __attribute__((section(".secure_vars")));
void arcfour_encrypt(ArcfourContext *ctx, unsigned char *dest, const unsigned char *src, unsigned int len)
{
    for (ii = 0; ii < len; ii++) dest[ii] = src[ii] ^ arcfour_byte(ctx);
}
