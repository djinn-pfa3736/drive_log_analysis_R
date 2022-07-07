#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void calc_kernel_mat(int *len_data, int *kernel_row, int *kernel_col, int *template,
                     double *lat_vec, double *lon_vec, double *lat_seq, double *lon_seq,
                     double *kernel_mat, double *unit)
{
  int data_len = len_data[0];
  int k_row = kernel_row[0];
  int k_col = kernel_col[0];
  int temp = template[0];

  printf("%d\n", data_len);
  for(int i = 0; i < data_len; i++) {
    printf("*** Calculating %d-th row / %d ***\n", i, data_len);
    double lat = lat_vec[i];
    double lon = lon_vec[i];

    int j = 0;
    while(1) {
      // printf("HIHIHIHI\n");
      if(lat < lat_seq[j]) break;
      j++;
    }
    int idx_lat = j;

    j = 0;
    while(1) {
      // printf("HOHOHO\n");
      if(lon < lon_seq[j]) break;
      j++;
    }
    int idx_lon = j;
    // printf("(%d, %d)\n", idx_lat, idx_lon);
    int x;
    int y;
    double u = unit[0];

    // printf("HIHIHI\n");
    for(int l = temp; 0 < l; l--) {
      for(j = -l; j < l; j++) {
        for(int k = -l; k < l; k++) {
          x = idx_lat + j;
          y = idx_lon + k;
          kernel_mat[y*k_col + x] = u*(temp - l);
        }
      }
    }
    kernel_mat[idx_lon*k_col + idx_lat] = u*temp;
      /* Other kernel */
      /*
      for(int k = 0; k < j; k++) {
        x = idx_lat - (j - k);
        y = idx_lon + k;
        kernel_mat[y*k_col + x] = u*(temp - j);

        x = idx_lat - (j - k);
        y = idx_lon - k;
        kernel_mat[y*k_col + x] = u*(temp - j);

        x = idx_lat + (j - k);
        y = idx_lon - k;
        kernel_mat[y*k_col + x] = u*(temp - j);

        x = idx_lat + (j - k);
        y = idx_lon + k;
        kernel_mat[y*k_col + x] = u*(temp - j);
      }
      kernel_mat[idx_lon*k_col + idx_lat] = u*temp;
      */

  }
}
