#ifndef __RC4_H__
#define __RC4_H__

typedef struct
{
    unsigned int x;
    unsigned int y;
    unsigned char state[256];
} ArcfourContext;

__attribute__((section(".secure_code"))) void arcfour_init(ArcfourContext *ctx);
__attribute__((section(".secure_code"))) unsigned int arcfour_byte(ArcfourContext *ctx);
__attribute__((section(".secure_code"))) void arcfour_encrypt(ArcfourContext *ctx, unsigned char *dest, const unsigned char *src, unsigned int len);

#endif // __RC4_H__
