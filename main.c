#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern unsigned lsfrs(unsigned seed);
extern void decrs(unsigned *arr, int num, int key);
extern void encrs(unsigned *arr, int num, int key);

extern unsigned lsfrc(unsigned seed);
extern void decrc(unsigned *arr, int num, int key);
extern void encrc(unsigned *arr, int num, int key);

int main()
{
    const int num = 5;
    unsigned text[num];
    int secr;
    unsigned text1[num];

    printf("--------------------------\n");
    printf("||*****One-Time-Pad*****||\n");
    printf("--------------------------\n");
    printf("@ One time pas is an encryption method\n");
    printf("@ As we are imitating alphabet, enter 5 numbers in range 0-25\n\n");
    printf(">Enter the numbers you wish to decrypt : \n");

    for (int i = 0; i < num; ++i) {
        scanf("%d", &text[i]);
        text1[i] = text[i];
    }


    printf("\n");
    printf(">Enter the secret key : \n");
    scanf("%d", &secr);
    printf("\n");

    printf("Your numbers:\n");
    for (int j = 0; j < num; ++j) {
        printf("%d  ", text1[j]);
    }
    printf("\n----------------\n");
    decrs(text, 5,secr);
    printf("Decr. in assem.:\n");
    for (int k = 0; k < num; ++k) {
        printf("%u  ", text[k]);
    }

    printf("\n----------------\n");
    encrs(text, 5,secr);
    printf("Encr. in assem.:\n");
    for (int j = 0; j < num; ++j) {
        printf("%u  ", text[j]);
    }
    printf("\n----------------\n");
    printf("----------------\n");


    decrc(text, 5,secr);
    printf("Decr. in C.:\n");
    for (int k = 0; k < num; ++k) {
        printf("%u  ", text[k]);
    }

    printf("\n----------------\n");
    encrc(text, 5,secr);
     printf("Encr. in C.:\n");
    for (int j = 0; j < num; ++j) {
        printf("%u  ", text[j]);
    }
    printf("\n----------------\n");

    return 0;
}
