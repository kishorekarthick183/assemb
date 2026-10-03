.global my_memset
.text

my_memset:
    mov x3, x0              // x3 = moving destination pointer

loop:
    cbz x2, done            // n == 0?

    strb w1, [x3], #1       // *dst = (unsigned char)byte; dst++
    sub  x2, x2, #1         // n--

    b loop

done:
    ret                     // x0 = original dst