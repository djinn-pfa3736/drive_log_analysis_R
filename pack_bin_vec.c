#include <stdio.h>

void pack_bin_vec(int *len_a, double *a, double *res)
{
  // int tmp[*len_a];
  // res = tmp;
  int val = (int) a[0];
  // res[0] = val;
  int count = 0;
  int tmp = 0;
  for(int i = 1;i < len_a[0]; i++)
  {
    // printf("a: %d\n", a[i]);
    if(a[i] != 0)
    {
      // printf("(i, a) = (%d, %d)\n", i, (int)a[i]);
      tmp++;
    }
    if((int) a[i] != val)
    {
      if(val == 1)
      {
        res[count] = val;
        val = 0;
        count++;
      } else
      {
        res[count] = val;
        val = 1;
        count++;
      }
    }
    // printf("%d: %d\n", i, a[i]);
  }
  printf("length: %d\n", len_a[0]);
  printf("count : %d\n", tmp);
}
