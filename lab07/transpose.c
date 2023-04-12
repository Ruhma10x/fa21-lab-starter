#include "transpose.h"

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    // YOUR CODE HERE
    for (int x= 0; x < n; x+=blocksize) {
        for (int y = 0; y < n; y+=blocksize) {
            for (int xx = x; xx < x+blocksize; xx++) {
                for (int yy = y; yy < y+blocksize; yy++) {
                    
                    if(xx<n && yy<n){
                    dst[(yy) + (xx) * n] = src[(xx) + (yy) * n];
                    }
                }
            }
        }
    }
}
