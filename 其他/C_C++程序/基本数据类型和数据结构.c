// 【1】常见类型数据的输入与输出
# include "stdio.h"
# include "stdlib.h"

void main() {  // 主函数（void表示不定义返回值类型）
    int x1; // 10位精度整数定义（貌似long型长整数与int差不多，都是4字节存储）
    long long x2; // 19位精度长长整数定义（8字节存储）
    float x3; // 7位单精度浮点数定义（4字节存储）
    double x4; // 16位双精度浮点数定义（8字节存储）
    char str[4] = {}; // 字符串数组定义（单个字符1字节存储）
    int arr1[4] = {}; // 整型数组定义（单个数字4字节存储）
    float arr2[4] = {}; // 浮点型数组定义（单个数字4字节存储）

    // scanf输入变量时，采用的是变量地址输入法
    scanf("%d",&x1);  // 整型  
    printf("%d",x1); 
    printf("%d",sizeof(x1)); // sizeof函数用于求变量字节长度，输出结果为4

    scanf("%lld",&x2); // 长长整型
    printf("%lld",x2);

    scanf("%f",&x3); // 单精度浮点型
    printf("%f",x3);
    printf("%9.4f",x3); 
    /* 其中".4"表示输出4位小数，"9"表示输出占9个空格。以输入1.235为例，默认输出右对齐，则输出为"   1.2346" */

    scanf("%lf",&x4); // 双精度浮点型
    printf("%lf",x4);
    // printf("%.8lf",x4); // 输入1.123456789，输出1.12345679 */

    scanf("%d, %f",&x1,&x3); // 还可以多输入多输出
    printf("%d, %f",x1,x3);

    scanf("%s",str); // 字符串本身就代表了字符串数组的地址，故不用取地址函数&
    printf("%s",str);

    int i =0;
    for (i = 0; i < 4; i++)
	{
		scanf("%d",&arr1[i]); // 整型数组的输入，浮点型数组输入类似
        // 还可采用 scanf("%d",arr+i)的方式，【2】会解释原因
        printf("%d",arr1[i]);
	}
}
/* 
1 不同数据类型在计算机中的单位存储字长不同，如int型数据单位存储字长为2byte，float型数据单位存储字长为4byte，char型数据单位存储字长为1byte

2 浮点数float和double是以科学计数法的形式存储的，即 数值 = 尾数 x 底数^指数（加符号位）* 以4字节float为例，其中位数占23bit（有效位7位，且默认为1.xx），指数占8bit（2^8=216)，
符号位占1bit。那么理论上float可表示的数字范围为 +-1.xx*10^216。另外，由于尾数部分有效位为7位，因此在实际输出时，前7位有效数字被完整保留而后续部分会出现混乱，但数值整体差距不大，
double型同理，有效位数位16位。最后，浮点数float和double默认只能输出6位小数，要想输出更多位小数，可自行设定，但同时要考虑有效位数的问题。

3 C语言中没有字符串类型数据，只有字符串数组数据，因此字符串的定义只能依靠数组实现。
*/


// 【2】不同类型数据运算（含指针运算）
# include "stdio.h"
# include "stdlib.h"
# include "string.h" //用于实现字符串基本功能

void main(){
    int x1 = 5;
    float x2 = 2.5;
    double x3 = 1.5;
    char str[4] = "abcd"; // 满足字符个数不大于数组长度
    // 还可以采用数组的方式定义：char str[4] = {'a','b'.'c',''d} 但一般不用
    char arr[4] = {1,2,3,4}; // 一维数组
    char arr2[2][2] = {{1,2},{3,4}}; // 二维数组，同理可定义多维数组

    /*数字*/ 
    printf("%d\t%d\t%d\t%d\t%d",x1+5, x1-5, x1*5, x1/5, x1%5, -x1);
    // 加，减，乘，除，取余运算，取负运算，结果为10，0，2，1，0，-5
    printf("%f\t%.8lf",x1/x2,x2/x3);
    // 整数与浮点小数的运算结果为浮点小数，单精度浮点数与双精度浮点数运算结果为双精度，输出结果为2.000000，1.66666667
    float x11 = x1; printf("%f",x11);
    int x22 =x2; printf("%d",x22);
    // 还可强制转换数据类型，如上整型与单精度浮点型互换，输出结果为5.000000，2
    printf("%d\t%d", ++x1, x1++);
    // 自增运算符（自减同理），分别表示x1=x1+1, xx=x1+1, 因而输出结果为6，5


    /*字符串*/ 
    printf("%s\t%c",str,str[0]);
    // %s用于输出整个字符串，%c用于输出单个字符
    char str1[10]; sprintf(str1,"%d",x1);
    int x11; x11 = atoi(str1);
    // 数字与字符串类型互换，类似还有atof（字符串转浮点数）
    printf("%d",strlen(str));
    // 求字符串长度
    char str1[10] = "efg";
    strcat(str1,str);
    // 字符串的拼接,str接到str1后面
    char str1[10];
    strcpy(str1,str); // 整体复制
    strncpy(str1,str+1,2); // 截取字符串str的第2-3个字符（数组指针）
    // 字符串的复制与截取
    int n = strcmp(str,str1);
    printf("%d",n);
    // 判断两字符串是否相同，相同则n为0
    char* ret = strstr(str,str1);
    printf("%s",ret);
    // 子字符串str1在主字符str串中的匹配，若匹配上，则返回str中对应子串，否则返回(null)
    char str2[3][5] = {"abc","def","ghi"};
    printf("%s",str[0]); // 输出结果为abc
    // 字符串数组定义与读取


    /*数组*/ 
    printf("%d,%d",sizeof(arr),sizeof(arr2));
    // 求数组内部所有元素个数，输出结果均为4
    printf("%d",sizeof(arr2)/sizeof(arr2[0]));
    // 求二位数组arr2第一阶张量的元素个数（长度），多维数组同理


    /*指针*/ 
    int *p_x1 = &x1; // 指针变量的定义，含义为把整数变量x1的地址赋给指针变量p1，浮点数类似
    int *p_arr = arr; // 特别的，数组名代表数组首地址，同样可写 int *p_arr = &arr[0]
    int *p_str = "abcd"; // 更特别的，字符串代表了字符串数组首地址，同样也可以先定义字符串数组，然后操作同上，如int *p_str = str。
    printf("%d\t%d\t%d",p_x1,p_arr,p_str);
    // 指针变量输出，结果分别为x1,arr,str的存储地址
    printf("%d\t%d\t%c",*p_x1,*p_arr,*p_str);
    // 根据指针反向求得变量值，结果分别为5, 1, a
    p_arr = p_arr+2;
    p_str = p_str+2;
    printf("%d\t%c",*p_arr, *p_str);
    // 数组（字符串）指针的移动，结果为3, c
    int (*p) = arr; 
    print("%d",p[0]);
    // 数组指针，即把数组arr赋给指针p，输出结果为arr首元素1
 

}
/*
1 C语言中共有如下32个关键字，这就要求我们在定义变量或函数时，不能与关键字形式相同（避免冲突）：
void、char、short、int、long、float、double、enum、unsigned、signed、struct、union、const、auto
do、while、for、if、else、switch、case、continue、break、default、goto、sizeof、volatile、static
register、typedef、extern、return
另外定义变量或函数，只允许使用字母，数字，下划线。这与其他编程语言是类似的。

2 常用的转义字符还是"\t"（TAB键空格）和"\n"（换行）。
*/


// 【3】结构体及链表，树，图的定义
