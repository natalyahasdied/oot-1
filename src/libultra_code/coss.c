#include "libultra_internal.h"
#include <global.h>

s16 coss(u16 angle) {
    return sins(angle + 0x4000);
}
