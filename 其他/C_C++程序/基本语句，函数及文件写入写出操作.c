// 通用函数库（头文件）
# include "stdio.h" // 标准输入输出语句的集合库
# include "stdlib.h" // 其他杂七杂八语句的集合库
// 专用函数库（头文件）
# include "ctype.h" // 判断字符类型库
# include "string.h" // 字符串处理库
# include "math.h" // 数学运算库
# include "time.h" // 日期时间处理库


// 【1】条件语句，循环语句和常见运算符
void main() {
    int x = 10;
    // 条件语句
    if(x>5){  
        printf("ture");
    }
    else if(x==5){
        printf("bingo");
    }
    else{
        print("false");
    }

    switch(x) // switch语句不常用
    {
        case 1: printf("x = 1"); break; // case语句并不具备分支选择功能，一般需搭配break食用
        case 2: printf("x = 2"); break;
        default: printf("x > 2");
    }

    // 循环语句
    for(int i = 1; i<10; i++){ // i++表示 i1=i0+1, return i0; ++i表示 i1=i0+1, return i1。在for循环语句中一般用i++
        if(i==5){
            break; // break用于终止整个循环语句
            continue; // continue用于终止当前子循环
        }
        printf("%d",i);
    }

    while(x>1){
        printf("%d",x);
        x = x-1;
    }

    do{
        printf("%d",x);
        x = x-1;
    }while(x>1);

    // 算术运算符：+、-、*、/、%（取模运算后的余数）没有指数运算符，需调用函数
    // 关系运算符：==、！=、>、>=、<、<=
    // 逻辑运算符：&&（与） ||（或） ！（非）
    // 三目运算符：c=(a>b)?a:b 表示 if(a>b){c=a;} else{c=b;}
}

// 【2】函数定义，调用与文件IO操作
// 【2.1】函数定义与调用
int add(int x, int y){  //int限定了返回值类型，没有返回值就用void。add为函数名，输入变量x,y也需要声明类型
    return(x+y);
}

void main(){
    int x0 = 5;
    int y0 = 8;
    int sum = add(x0,y0); // 调用自定义的函数。如果函数写在.h头文件里，那就在最开头加上 # include "xxx.h"
    printf("%d",sum);
}
// 【2.2】常用库函数
void main(){
    // ctype.h
    printf("%d",isalnum('a')); // 判断某字符是否为字母或数字
    printf("%d",isalpha('a')); // 判断某字符是否为字母
    printf("%d",isdigit('a')); // 判断某字符是否为数字
    printf("%d",isblank('a')); // 判断某字符是否为空格或tab
    // math.h
    printf("%f",sin(0)); // 正弦函数，同理余弦正切函数为cos,tan
    printf("%f",asin(0.5)); // 反正弦函数，同理反余弦反正切函数为acos,atan
    printf("%f",pow(2,3)); // 指数函数
    printf("%f",exp(1)); // e的指数函数
    printf("%f",log(2)); // 自然对数函数
    printf("%f",log10(10)); // 10为底的对数函数
    printf("%f",sqrt(100)); // 平方根函数
    printf("%f",fabs(-0.5)); // 绝对值函数
    printf("%f",ceil(1.46)); // 向上取整函数
    printf("%f",floor(1.46)); // 向下取整函数
}
// 【2.3】文件IO操作
void main()
{
    FILE *fp1,*fp2;    
    fp1 = fopen("file1.txt","w");
    fp2 = fopen("file2.txt","r");

    char str[10]; scanf("%s",str);
    if(fp1!=NULL){  //检验文件创建是否成功
        while(strlen(str)>0){
            fputs(strcat(str,"\n"),fp1);
            scanf("%s",str);
        }
    }
    fclose(fp1); //写文件结束，关闭文件

    if(fp2!=NULL){
        while(fgets(str,5,fp2)!=0){  //从文件中读取出字符串并存放到字符数组str中，检验是否已读完（注意：文件中内容会逐渐被读取出）
            printf("%s\n",str);       
        }
    }
    fclose(fp2); //读文件结束，关闭文件
}

