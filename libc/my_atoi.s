.global my_atoi
.text

my_atoi:
    mov x1, x0              // x1 = current character pointer
    mov x2, #0              // x2 = result
    mov x3, #1              // x3 = sign (+1)

skip_spaces:
    ldrb w4, [x1]

    cmp w4, #' '
    bne check_sign

    add x1, x1, #1
    b skip_spaces

check_sign:
    cmp w4, #'-'
    bne check_plus

    mov x3, #-1
    add x1, x1, #1
    b parse_digits

check_plus:
    cmp w4, #'+'
    bne parse_digits

    add x1, x1, #1

parse_digits:
    ldrb w4, [x1]

    // Is character < '0'?
    cmp w4, #'0'
    blo done

    // Is character > '9'?
    cmp w4, #'9'
    bhi done

    // result = result * 10
    mov x5, #10
    mul x2, x2, x5

    // digit = character - '0'
    sub w4, w4, #'0'

    // result += digit
    add x2, x2, x4

    add x1, x1, #1
    b parse_digits

done:
    // result *= sign
    mul x0, x2, x3

    ret