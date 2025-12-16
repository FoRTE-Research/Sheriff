#include <msp430.h>
#include "rc4.h"
#include "testdata.h"
#include "../bareBench.h"
#include "../../secure-gateway/gateway.h"

unsigned char edata[TESTDATALEN] __attribute__((section(".extravars")));
unsigned char udata[TESTDATALEN] __attribute__((section(".extravars")));

int main ( void )
{
    unsigned int errors;
    int ra;

    ArcfourContext mycontext;

    errors=0;

    /* Initialize the algoritm */
    arcfour_init(&mycontext);

    /* Encrypt 13 bytes of the src string */

    arcfour_encrypt(&mycontext, edata, testdata, TESTDATALEN);

    /* Now "edata" contains the encrypted string. Do whatever
       you please with it... */

    arcfour_init(&mycontext);

    arcfour_encrypt(&mycontext, udata, edata, TESTDATALEN);

    for(ra=0;ra<TESTDATALEN;ra++)
    {
        if(udata[ra]!=testdata[ra])
        {
            errors++;
        }
        if(errors>20) break;
    }
    if(errors)
    {
        return(1);
    }

    return(0);
}
