.global my_memcpy
.text

my_memcpy:
    mov x3, x0              // x3 = moving destination pointer

copy_loop:
    cbz x2, done            // if n == 0, we're finished

    ldrb w4, [x1], #1       // load byte from src, src++
    strb w4, [x3], #1       // store byte to dst, dst++

    sub x2, x2, #1          // n--
    b copy_loop

done:
    ret                     // x0 still contains original dst