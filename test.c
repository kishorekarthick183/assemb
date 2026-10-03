#include <stdio.h>

int fizzbuzz_value(int n);

int main(void) {
    for (int i = 1; i <= 20; i++) {
        int result = fizzbuzz_value(i);

        printf("%d -> %d\n", i, result);
    }

    return 0;
}


void bubble_sort(long *arr, unsigned long n) {
    for (unsigned long i = 0; i < n - 1; i++) {
        for (unsigned long j = 0; j < n - 1 - i; j++) {

            if (arr[j] > arr[j + 1]) {
                long tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
}


long *binary_search(long *arr, unsigned long n, long target) {
    unsigned long left = 0;
    unsigned long right = n;

    while (left < right) {
        unsigned long mid = left + (right - left) / 2;

        if (arr[mid] == target)
            return &arr[mid];

        if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid;
    }

    return NULL;
}
