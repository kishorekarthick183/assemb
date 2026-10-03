.global factorial

.text

factorial:
    // if (n <= 1)
    cmp x0, #1
    ble base_case

    // Save n
    stp x29, x30, [sp, -16]!
    mov x29, sp

    mov x1, x0
    sub x0, x0, #1
j
    // factorial(n - 1)
    bl factorial

    // x0 = factorial(n - 1)
    mul x0, x0, x1

    // Restore stack
    ldp x29, x30, [sp], 16

    ret


base_case:
    mov x0, #1
    ret