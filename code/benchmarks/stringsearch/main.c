#include <msp430.h>
#include <stdlib.h>
#include "../bareBench.h"

#include "input.h"
#include "pbmsrch.h"
#include "../../secure-gateway/gateway.h"

char* location[128];

int main()
{
    int i;
         
    for (i = 0; find_strings[i]; i++)
    {
        location[i] = pbmsrch(find_strings[i], i);
    }
    
    return 0;
}
