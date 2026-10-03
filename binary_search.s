.global binary_search

.text

binary_search:
    // x0 = arr
    // x1 = n
    // x2 = target

    // left = 0
    mov x3, #0

    // right = n
    mov x4, x1


loop:

    // --------------------------------
    // while (left < right)
    // --------------------------------

    cmp x3, x4
    bge not_found


    // --------------------------------
    // mid = left + (right - left) / 2
    // --------------------------------

    sub x5, x4, x3
    lsr x5, x5, #1
    add x5, x3, x5


    // --------------------------------
    // x6 = arr[mid]
    // --------------------------------

    lsl x6, x5, #3
    add x6, x0, x6
    ldr x6, [x6]


    // --------------------------------
    // if arr[mid] == target
    // --------------------------------

    cmp x6, x2
    beq found


    // --------------------------------
    // if arr[mid] < target
    // --------------------------------

    cmp x6, x2
    blt search_right


    // --------------------------------
    // arr[mid] > target
    // right = mid
    // --------------------------------

    mov x4, x5

    b loop


search_right:

    // left = mid + 1
    add x3, x5, #1

    b loop


found:

    // return &arr[mid]
    lsl x5, x5, #3
    add x0, x0, x5
    ret


not_found:

    // return NULL
    mov x0, #0
    ret