#include<stdio.h>
#include<stdlib.h>
#include<malloc.h>
//注：v为标准差
int *data_generate_process(int n1,int n2,double u1,double u2,double v){
    double train[20][20],train1[2][n1],train2[2][n2];
    int num=1,train_1[n1],train_2[n2],*train_last;
    train_last=(int *)malloc((n1+n2)*sizeof(int));
    //产生两组训练集，各1000数
    for (int i = 0; i < n1; i++){
        train1[0][i]=Normal(u1,v);
        train1[1][i]=Normal(u2,v);
        while (train1[0][i]>1 || train1[1][i]>1 || train1[0][i]<0 || train1[1][i]<0){
            if (train1[0][i]>1 || train1[0][i]<0){train1[0][i]=Normal(u1,v);}
            if (train1[1][i]>1 || train1[1][i]<0){train1[1][i]=Normal(u2,v);}
        }
    }
    for (int i = 0; i < n2; i++){
        train2[0][i]=Normal(u2,v);
        train2[1][i]=Normal(u1,v);
        while (train2[0][i]>1 || train2[1][i]>1 || train2[0][i]<0 || train2[1][i]<0){
            if (train2[0][i]>1 || train2[0][i]<0){train2[0][i]=Normal(u2,v);}
            if (train2[1][i]>1 || train2[1][i]<0){train2[1][i]=Normal(u1,v);}
        }
    }
    //输出训练集，确认数据在0-1之间
    for (int i = 0; i < n1; i++){
        printf("%lf\t",train1[0][i]);
        printf("%lf\t",train1[1][i]);
        printf("\n");
    }
    printf("NEXT----------------------------------------->\n");
    for (int i = 0; i < n2; i++){
        printf("%lf\t",train2[0][i]);
        printf("%lf\t",train2[1][i]);
        printf("\n");
    }
    //分别将数据行、列与表格序号对应，行列均为1-20
    for (int i = 0; i < 2; i++){
        for (int j = 0; j < n1; j++){
            for (int k = 0; k < 20; k++)
                if (0.05*k<train1[i][j] && train1[i][j]<=0.05*(k+1)){train1[i][j]=k;break;}
        }    
    }
    for (int i = 0; i < 2; i++){
        for (int j = 0; j < n2; j++){
            for (int k = 0; k < 20; k++)
                if (0.05*k<train2[i][j] && train2[i][j]<=0.05*(k+1)){train2[i][j]=k;break;}
        }    
    }
    //分别将train1、train2数据对应表格序号，共400格
    for (int i = 0; i < 20; i++){
        for (int j = 0; j < 20; j++){
            train[i][j]=num;
            num++;
        } 
    }
    for (int j = 0; j < n1; j++){train_1[j]=train[(int)train1[1][j]][(int)train1[0][j]];}
    for (int j = 0; j < n2; j++){train_2[j]=train[(int)train2[1][j]][(int)train2[0][j]];}
    //确认每对数据均与表格号对应
 /*   for (int i = 0; i < N; i++){
        printf("%d,%d\n",train_1[i],train_2[i]);
    } */
    for (int i = 0; i < n1; i++){*(train_last+i)=train_1[i];}
    for (int i = 0; i < n2; i++){*(train_last+n1+i)=train_2[i];}
    return train_last; 
    system("pause");    
}