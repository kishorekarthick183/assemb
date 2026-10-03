#include <stdio.h>
#include <string.h>

// Assembly functions
int my_strcmp(const char *, const char *);
void *my_memcpy(void *, const void *, unsigned long);
void *my_memset(void *, int, unsigned long);
unsigned long my_strlen(const char *);
void my_iota(long *, long *, long);
long my_atoi(const char *);

int main(void) {

    // --------------------------------------------------
    // strcmp
    // --------------------------------------------------

    printf("strcmp equal: %d\n",
           my_strcmp("hello", "hello"));

    printf("strcmp less: %d\n",
           my_strcmp("abc", "abd"));

    printf("strcmp greater: %d\n",
           my_strcmp("abd", "abc"));

    printf("strcmp empty: %d\n",
           my_strcmp("", ""));

    printf("strcmp last char: %d\n",
           my_strcmp("hella", "hello"));


    // --------------------------------------------------
    // memcpy
    // --------------------------------------------------

    char src[] = "hello";
    char dst[10] = {0};

    my_memcpy(dst, src, 6);

    printf("memcpy: %s\n", dst);


    // n == 0
    char untouched[10] = "hello";

    my_memcpy(untouched, "xxxxx", 0);

    printf("memcpy n=0: %s\n", untouched);


    // --------------------------------------------------
    // memset
    // --------------------------------------------------

    char buffer[10];

    my_memset(buffer, 'A', 5);
    buffer[5] = '\0';

    printf("memset: %s\n", buffer);


    // --------------------------------------------------
    // strlen
    // --------------------------------------------------

    printf("strlen hello: %lu\n",
           my_strlen("hello"));

    printf("strlen empty: %lu\n",
           my_strlen(""));

    printf("strlen assembly: %lu\n",
           my_strlen("assembly"));


    // --------------------------------------------------
    // iota
    // --------------------------------------------------

    long arr[5];

    my_iota(arr, arr + 5, 10);

    printf("iota: ");

    for (int i = 0; i < 5; i++) {
        printf("%ld ", arr[i]);
    }

    printf("\n");


    // --------------------------------------------------
    // atoi
    // --------------------------------------------------

    printf("atoi 1234: %ld\n",
           my_atoi("1234"));

    printf("atoi -1234: %ld\n",
           my_atoi("-1234"));

    printf("atoi +567: %ld\n",
           my_atoi("+567"));

    printf("atoi spaces: %ld\n",
           my_atoi(" 42"));

    printf("atoi trailing chars: %ld\n",
           my_atoi("123abc"));

    printf("atoi zero: %ld\n",
           my_atoi("0"));


    return 0;
}