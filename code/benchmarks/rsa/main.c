#include <msp430.h>
#include <stdint.h>
#include "rsa.h"
#include "../bareBench.h"
#include "../../secure-gateway/gateway.h"

uint64_t plaintext = 54321;
uint64_t cipher = 351159;
uint64_t rsaDecrypted, rsaEncrypted;

int main (void) {

    /** test rsa **/
    rsaEncrypt(plaintext, &rsaEncrypted);
    rsaDecrypt(cipher, &rsaDecrypted);

    return 0;
}
