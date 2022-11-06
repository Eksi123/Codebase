# include "stdio.h"
# include "stdlib.h"
# include "string.h"

void main(){
    int arr[5] = {1,2,3,4,5};

    int (*p) = arr;
    
    printf("%d,%d,%d",p[0],p[1],p[2]);



    


}

// #include<stdio.h>

// int main(void)
// {
//         int Shuzu[3][4] = { 0,1,2,3,4,5,6,7,8,9,0,0 };
//         int(*arr)[4] = Shuzu;
//         for (int i = 0;i < 3;i++)
//         {
//                for (int j = 0;j < 4;j++)
//                {
//                        printf("arr[%d][%d]=%d  ", i,j,arr[i][j] );
//                }
//                printf("\n");
//         }

//         return 0;
// }
