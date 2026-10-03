.global my_strcmp
.text

my_strcmp:
loop:
    ldrb w2, [x0], #1       // w2 = *a, a++
    ldrb w3, [x1], #1       // w3 = *b, b++

    cmp w2, w3
    bne different           // characters differ

    cbz w2, equal           // both are '\0'

    b loop

different:
    sub w0, w2, w3          // return a[i] - b[i]
    ret

equal:
    mov w0, #0
    ret