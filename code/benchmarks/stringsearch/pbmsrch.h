#ifndef PBMSRCH_H
#define PBMSRCH_H

#include <msp430.h>
#include <stdlib.h>

__attribute__((section(".secure_code"))) static int custom_strncmp( const char * s1, const char * s2, size_t n );
__attribute__((section(".secure_code"))) static size_t custom_strlen(const char* str);
__attribute__((section(".secure_code"))) void init_search(const char *string);
__attribute__((section(".secure_code"))) char *strsearch(const char *string);   
__attribute__((section(".secure_code"))) char *pbmsrch(const char *string, int i);            

#endif
