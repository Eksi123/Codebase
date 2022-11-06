#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<malloc.h>
#include"classify.h"
double hrand(){
    static unsigned long xx=0;
    xx=(xx*314159269L+453806245L)%2147483648L;
    return (double)xx/2147483648.0;
}
// min+(max-min)*rand()
double Normal(double u,double v){
    double x,y;
    for ( ; ; ){
        x=hrand()*2*v+u-v;y=hrand();
        if (y<exp(-x*x/2.0)) return(x);
    }  
}
int main(){
    //输出训练集data_set
    int n1,n2,*data_set;
    double v=1;                //v为标准差，是函数data_generate_process的参数
    printf("Please input the numbers of train1 and train2!\n");
    scanf("%d,%d",&n1,&n2);
    data_set=data_generate_process(n1,n2,0.3,0.7,v);
    for (int i = 0; i < n1; i++){printf("%d  1\n",*(data_set+i));}
    for (int i = 0; i < n2; i++){printf("%d  2\n",*(data_set+n1+i));}
    //输出测试集test_set
    int N1,N2,*test_set,**result;
    printf("Please input the numbers of test1 and test2!\n");
    scanf("%d,%d",&N1,&N2);
    test_set=data_generate_process(N1,N2,0.3,0.7,v);
    //分类
    result=classify(N1,N2,N1+N2,n1,n2,data_set,test_set);
    for (int i = 0; i < N1+N2; i++){
        printf("%d   %d   %d\n",result[i][0],result[i][1],result[i][2]);   
    }
    //计算分类器正确率
    double right=0,rate=0;
    for (int i = 0; i < N1+N2; i++){
        if (result[i][2]==result[i][1]){
            right++;
        }
    }
    rate=right/(N1+N2);
    printf("The classification accuracy of this classifier is %lf\n",rate);
    printf("According to the test, under the condition that the sample size of each training set is 1000 and the sample size of each test set is 1000, the accuracy of the classifier is 0.42, 0.65 and 1 when the standard deviation is 1, 0.5 and 0.1 respectively!!!\n");
    system("pause");
}
#include"classify.c"
#include"data_generate_process.c"