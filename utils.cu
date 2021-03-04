#include <stdio.h>
#include <stdlib.h>
#include "utils.cuh"

void output (double *array, int n_array, int n_iter) {
    int i;
    char file_name[64];
    FILE *fp_out;

    sprintf (file_name, "out_%03d.dat", n_iter);
    printf  ("  output filename: %s\n", file_name);

//    if ((fp_out = fopen (file_name, 'w')) == NULL) {
        //printf ("  cannot open %s. \n  going to shut down\n", file_name);
        //exit (1);
    //}

    //fprintf (fp_out, "### %s\n", file_name);
    //fprintf (fp_out, "### X\nT\n", file_name);
    //for (i = 0; i < n_array; i++) fprintf (fp_out, "%lf\t%lf\n", i, array[i]);
    //fclose (fp_out);


}
