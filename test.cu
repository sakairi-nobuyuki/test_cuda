#include <stdio.h>
#include <stdlib.h>


#define NN 200

__global__
void sum_array (double *array_1, double *array_2, double *array_3, int n_array) {
    int i, j, n;
    i = blockIdx.x * blockDim.x + threadIdx.x;

    n = 10;

    for (j = 0; j < n; j++) {
        if (i < NN)  array_3[i] = array_1[i] + array_3[i];        
    }
    
}

void initialize_array (double *array, int size) {
    int i;

//    for (i = 0; i < NN; i++)  array[i] = (double) rand ();
    for (i = 0; i < NN; i++)  array[i] = 1.0;

}

void print_result (double *array, int n) {
    int i;


    for (i = 0; i < n; i++)  printf ("%.0lf ", array[i]);
    printf ("\n");

}

int main () {
    double *array_1, *array_2, *array_3;
    double *d_array_1, *d_array_2, *d_array_3;
    size_t n_bytes = NN * sizeof (double);
    dim3 Grid, Block;

    Grid.x = NN / 196 + 1;
    Block.x = 196;

    printf ("hoge\n");

    array_1 = (double *) malloc (n_bytes);
    array_2 = (double *) malloc (n_bytes);
    array_3 = (double *) malloc (n_bytes);

    printf ("memory allocation finished\n");

    initialize_array (array_1, n_bytes);
    initialize_array (array_2, n_bytes);
    initialize_array (array_3, n_bytes);

    printf ("initialize memory\n");


    printf ("cuda memory allocation\n");

    cudaMalloc ((void**)&d_array_1, n_bytes);
    cudaMalloc ((void**)&d_array_2, n_bytes);
    cudaMalloc ((void**)&d_array_3, n_bytes);

    printf ("cuda memory allocation finished\n");


    printf ("cuda memory copy\n");

    cudaMemcpy (d_array_1, array_1, n_bytes, cudaMemcpyHostToDevice);
    cudaMemcpy (d_array_2, array_2, n_bytes, cudaMemcpyHostToDevice);
    cudaMemcpy (d_array_3, array_3, n_bytes, cudaMemcpyHostToDevice);

    printf ("cuda memory copy finished\n");

    printf ("inp array1\n");
    print_result (array_1, NN);
    printf ("inp array2\n");
    print_result (array_2, NN);
    printf ("inp array3\n");
    print_result (array_3, NN);

    printf ("start kernel function\n");

    sum_array<<<Grid, Block>>> (d_array_1, d_array_2, d_array_3, n_bytes);

    cudaDeviceSynchronize();
    printf ("end kernel function\n");

    cudaMemcpy (array_3, d_array_3, n_bytes, cudaMemcpyDeviceToHost);

    printf ("res array3\n");
    print_result (array_3, NN);

    return 0;
}