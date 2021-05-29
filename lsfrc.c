#include <stdint.h>
unsigned lsfrc(unsigned seed) {
uint16_t newvl = (uint16_t)seed;
do{
    if (newvl==0) {
        newvl = 0x1;
    }
    uint16_t b;
    b = newvl^(newvl>>2)^(newvl>>3)^(newvl>>5);
    newvl = ((b<<15) | (newvl>>1));
    newvl = (unsigned)newvl;
}while (newvl > 26);
    return newvl;
}

