.global my_strlen
.text

my_strlen:
    mov   x1, x0            // x1 = cursor, x0 stays as the start
1:  ldrb  w2, [x1], #1      // load one byte, then advance x1 by 1
    cbnz  w2, 1b            // if byte != 0, loop back to label 1
    sub   x0, x1, x0        // cursor - start
    sub   x0, x0, #1        // we advanced past the NUL, so subtract it
    ret