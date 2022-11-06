#include<stdio.h>
#include<stdlib.h>
#include<malloc.h>
int **classify(int N1,int N2,int n,int n1,int n2,int *data,int *test){
    int **result=NULL;
    result=(int**)malloc(n*sizeof(int *));
    if (result==NULL){
        return NULL;
    }
    for (int i = 0; i < n; i++){
        result[i]=(int *)malloc(n*sizeof(int));
        if (result[i]==NULL){
            return NULL;
        }
        for (int j = 0; j < n; j++){
            result[i][j]=0;
        }
    }
    for (int i = 0; i < n; i++){
        double t1=0,t2=0,p1=0,p2=0;
        result[i][0]=test[i];
        //测试集所属真实类别
        if (i<N1){
            result[i][1]=1;
        }
        else if (i<n){
            result[i][1]=2;
        }
        //求概率
        for (int j = 0; j < n1; j++){
            if (test[i]==data[j]){
                t1++;
                continue;
            } 
        }
        for (int j = 0; j < n2; j++){
            if (test[i]==data[n1+j]){
                t2++;
                continue;
            } 
        }
        p1=t1/n1;p2=t2/n2;
        if (p1>p2){
            result[i][2]=1;
        }else if(p1<p2){
            result[i][2]=2;
        }
        else {result[i][2]=0;}        //为零时即找不到类别
    }
    return result;
    system("pause");
}