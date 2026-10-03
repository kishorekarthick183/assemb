
.global _start

.section .data

space:
    .ascii " "
space_len = . - space

.section .text

_start:
    // argc
    ldr x19, [sp]

    // argv = sp + 8
    add x20, sp, #8

    // Skip argv[0]
    add x20, x20, #8
    sub x19, x19, #1

next_arg:
    cmp x19, #0
    beq done

    // Load current argument
    ldr x1, [x20]

    // Save original string address
    mov x4, x1

    // Calculate string length
    mov x2, #0

strlen_loop:
    ldrb w3, [x1], #1
    cmp w3, #0
    beq strlen_done

    add x2, x2, #1
    b strlen_loop

strlen_done:
    // write(1, string, length)
    mov x8, #64
    mov x0, #1
    mov x1, x4
    svc #0

    // Advance argv pointer and decrement count
    add x20, x20, #8
    sub x19, x19, #1

    // Print separator only if another argument remains
    cmp x19, #0
    beq next_arg

    mov x8, #64
    mov x0, #1
    ldr x1, =space
    mov x2, #1
    svc #0

    b next_arg

done:
    mov x8, #93
    mov x0, #0
    svc #0