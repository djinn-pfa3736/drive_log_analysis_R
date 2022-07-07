#include <stdio.h>
#include <math.h>

void pack_rens(int *len_a, double *a, double *b, double *res_a, double *res_b)
{
  // int tmp[*len_a];
  // res = tmp;
  int len = (int) len_a[0];
  // res[0] = val;
  int count = 0;

  double a_val;
  double b_val;
  double curr_a = a[0];
  double curr_b = b[0];
  for(int i = 1;i < len; i++)
  {
    printf("*** Calculating %d-th / %d ***\n", i, len);
    a_val = a[i];
    b_val = b[i];
    if(fabs(a_val - curr_a) > 1e-8 || fabs(b_val - curr_b) > 1e-8) {
      res_a[count] = curr_a;
      res_b[count] = curr_b;
      curr_a = a_val;
      curr_b = b_val;
      count++;
    }
  }

}
