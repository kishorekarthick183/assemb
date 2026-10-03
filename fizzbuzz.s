.global fizzbuzz_value

.text

fizzbuzz_value:

    // --------------------------------
    // if (n % 15 == 0)
    // --------------------------------

    mov x1, #15
    udiv x2, x0, x1
    mul x2, x2, x1
    sub x2, x0, x2

    cbz x2, fizzbuzz


    // --------------------------------
    // if (n % 3 == 0)
    // --------------------------------

    mov x1, #3
    udiv x2, x0, x1
    mul x2, x2, x1
    sub x2, x0, x2

    cbz x2, fizz


    // --------------------------------
    // if (n % 5 == 0)
    // --------------------------------

    mov x1, #5
    udiv x2, x0, x1
    mul x2, x2, x1
    sub x2, x0, x2

    cbz x2, buzz


    // --------------------------------
    // return 0
    // --------------------------------

    mov x0, #0
    ret


fizzbuzz:
    mov x0, #3
    ret


fizz:
    mov x0, #1
    ret


buzz:
    mov x0, #2
    ret