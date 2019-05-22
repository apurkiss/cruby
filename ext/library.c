#include <stdlib.h>
#include <stdio.h>

unsigned long long int add_from_library(unsigned long long int count) {
    unsigned long long int j = 0;

    for(volatile unsigned long long int i=0; i<count; i++) {
        j = j + 1;
    }

    return (unsigned long long int) j;
}

unsigned long long int add_optimized_from_library(unsigned long long int count) {
    unsigned long long int j = 0;

    for(unsigned long long int i=0; i<count; i++) {
        j = j + 1;
    }

    return (unsigned long long int) j;
}

unsigned long long int divide_from_library(unsigned long long int count) {
    unsigned long long int j = 0;
    float k = (float) count;

    for(volatile unsigned long long int i=0; i<count; i++) {
        j = j + 1;
        k = k / j;
    }

    return (unsigned long long int) j;
}

unsigned long long int divide_optimized_from_library(unsigned long long int count) {
    unsigned long long int j = 0;
    float k = (float) count;

    for(unsigned long long int i=0; i<count; i++) {
        j = j + 1;
        k = k / j;
    }

    return (unsigned long long int) j;
}

unsigned long long int multiply_from_library(unsigned long long int count) {
    unsigned long long int j = 0;
    float k = 10;

    for(volatile unsigned long long int i=0; i<count; i++) {
        j = j + 1;
        k = k * 2;
    }

    return (unsigned long long int) j;
}

unsigned long long int multiply_optimized_from_library(unsigned long long int count) {
    unsigned long long int j = 0;
    float k = 10;

    for(unsigned long long int i=0; i<count; i++) {
        j = j + 1;
        k = k * 2;
    }

    return (unsigned long long int) j;
}
