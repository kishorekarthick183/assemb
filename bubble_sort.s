.global bubble_sort

.text

bubble_sort:
    // x0 = arr
    // x1 = n

    // If n <= 1, already sorted
    cmp x1, #1
    ble done

    // i = 0
    mov x2, #0


outer_loop:

    // ----------------------------------------
    // if i >= n - 1 -> done
    // ----------------------------------------

    sub x7, x1, #1
    cmp x2, x7
    bge done

    // j = 0
    mov x3, #0


inner_loop:

    // ----------------------------------------
    // if j >= n - 1 - i
    // ----------------------------------------

    sub x7, x1, #1
    sub x7, x7, x2

    cmp x3, x7
    bge end_inner


    // ----------------------------------------
    // Load arr[j]
    // ----------------------------------------

    lsl x6, x3, #3          // x6 = j * 8
    add x6, x0, x6          // x6 = &arr[j]

    ldr x4, [x6]            // x4 = arr[j]
    ldr x5, [x6, #8]        // x5 = arr[j + 1]


    // ----------------------------------------
    // if arr[j] <= arr[j+1]
    //     no swap
    // ----------------------------------------

    cmp x4, x5
    ble no_swap


    // ----------------------------------------
    // swap
    //
    // arr[j]     = arr[j+1]
    // arr[j + 1] = arr[j]
    // ----------------------------------------

    str x5, [x6]
    str x4, [x6, #8]


no_swap:

    // j++
    add x3, x3, #1

    b inner_loop


end_inner:

    // i++
    add x2, x2, #1

    b outer_loop


done:
    ret