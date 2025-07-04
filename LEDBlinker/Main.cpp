extern "C" {
    #include "HL_gio.h"  // From HALCoGen
}

int main() {
    gioInit();  // Init HAL GPIO module
    // Set GIOB6 as output (LED)
    gioSetDirection(gioPORTB, (1 << 6));

    while (1) {
        gioSetBit(gioPORTB, 6, 1);  // Set pin high
        for (volatile int i = 0; i < 1000000; ++i);  // crude delay
        gioSetBit(gioPORTB, 6, 0);  // Set pin low
        for (volatile int i = 0; i < 1000000; ++i);  // crude delay
    }

    return 0;
}
