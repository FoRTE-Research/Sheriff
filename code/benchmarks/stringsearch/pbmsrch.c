/* +++Date last modified: 05-Jul-1997 */

/*
**        A Pratt-Boyer-Moore string search, written by Jerry Coffin
**  sometime or other in 1991.  Removed from original program, and
**  (incorrectly) rewritten for separate, generic use in early 1992.
**  Corrected with help from Thad Smith, late March and early
**  April 1992...hopefully it's correct this time. Revised by Bob Stout.
**
**  This is hereby placed in the Public Domain by its author.
**
**  10/21/93 rdg  Fixed bug found by Jeff Dunlop
*/

#include "pbmsrch.h"
#include "secure_stringset.h"

static size_t table[256] __attribute__((section(".secure_vars")));
static size_t len __attribute__((section(".secure_vars")));
static char *findme __attribute__((section(".secure_vars")));

size_t length __attribute__((section(".secure_vars")));

static size_t custom_strlen(const char* str) {
    length = 0;
    while (*str != '\0') {
        length++;
        str++;
    }
    return length;
}

static int custom_strncmp( const char * s1, const char * s2, size_t n )
{
    while ( n && *s1 && ( *s1 == *s2 ) )
    {
        ++s1;
        ++s2;
        --n;
    }
    if ( n == 0 )
    {
        return 0;
    }
    else
    {
        return ( *(unsigned char *)s1 - *(unsigned char *)s2 );
    }
}

/*
**  Call this with the string to locate to initialize the table
*/

size_t init_i __attribute__((section(".secure_vars")));

void init_search(const char *string)
{
      len = custom_strlen(string);
      for (init_i = 0; init_i <= 255; init_i++)              
            table[init_i] = len;
      for (init_i = 0; init_i < len; init_i++)
            table[(unsigned char)string[init_i]] = len - init_i - 1;
      findme = (char *)string;
}

/*
**  Call this with a buffer to search
*/

size_t shift __attribute__((section(".secure_vars")));
size_t pos __attribute__((section(".secure_vars")));
char *here __attribute__((section(".secure_vars")));
size_t limit __attribute__((section(".secure_vars")));

char *strsearch(const char *string)
{
      
      pos = len - 1;
      limit=custom_strlen(string);

      while (pos < limit)
      {
            while( pos < limit &&
                  (shift = table[(unsigned char)string[pos]]) > 0)
            {
                  pos += shift;
            }
            if (0 == shift)
            {
                  if (0 == custom_strncmp(findme,
                        here = (char *)&string[pos-len+1], len))
                  {
                        return(here);
                  }
                  else  pos++;
            }
      }
      return NULL;
}

char *pbmsrch(const char *string, int i)
{
    init_search(string);
    here = strsearch(search_strings[i]);
    return here;
}
