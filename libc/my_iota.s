.global my_iota
.text

my_iota:
loop:
    // Check whether begin == end
    cmp x0, x1
    beq done

    // *begin = value
    str x2, [x0]

    // begin++
    add x0, x0, #8

    // value++
    add x2, x2, #1

    b loop

done:
    ret