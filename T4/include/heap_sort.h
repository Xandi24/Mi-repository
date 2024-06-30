#ifndef HEAP_H
#define HEAP_H

#include "aux.h"

void heap_sort(data *A, int size);
void organize_heap(data *A, int i, int size);
void controy_heap(data *A, int size);

#endif