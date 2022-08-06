# R语言基础语法及函数

# 1 数据类型
X=1.23456  # 数字
Y=round(X,3)  # 四舍五入保留三位小数

A="1.23456"  # 字符串
B="abc"
XX=as.character(X)  # 数字转字符串
AA=as.numeric(A)  # 字符串转数字
nchar(B)  # 求字符串长度
class(B)  # 求数据类型，或者str(B)
strsplit(B,"b")  # 按字符拆分字符串
paste(A,B,sep="-")  # 按字符拼接字符串
substr(A,start=2,stop=4)  # 按字节2-4切分字符串
grepl("3",A)  # 判断字符串中是否存在指定字符

## TRUE  FALSE  布尔值
## NA  空值
exists("c")  # 判断某一对象是否存在


# 2 数据结构
Arr1=c("a","b","c")  # 向量（可包含字符串）
Arr2=c(1,2,3)
Arr3=seq(1,6,by=2)  # 产生1：6的向量，步长为2
Arr4=rep(1,times=3)  # 产生3个同为元素1的向量
length(Arr1)  # 向量长度
c(Arr1,Arr2)  # 向量拼接
sort(Arr2,decreasing=T)  # 向量排序并输出排序后元素值，decreasing=T表示逆序，为F表示为正序
order(Arr2,decreasing=T)  # 向量排序并输出排序后索引号
## R中向量元素在内存中是连续储存的，不能随意插入，尤其在向量内部插入，替代方法如下
Arr1=append(Arr1,"d")  # 向量元素入栈
Arr1=Arr1[-length(Arr1)]  # 向量元素出栈
Arr1[1]="f"  # 向量元素修改
Arr11=Arr1[2:3]  # 向量元素按索引号切分
("a" %in% Arr1)  # 判断向量中存在某元素

Mtr1=matrix(1:6,2,3,byrow=T)  # 矩阵（可包含字符串）byrow=T表示按行填充
Mtr2=matrix(2:7,2,3)
Mtr1[1,2]  # 选中Mtr1中1行2列的元素
Mtr3=array(1:24,c(2,3,4))  # 多维矩阵
Mtr11=Mtr1*2 # 矩阵内元素运算（倍乘，类似可作加减除等运算）
Mtr1_2=Mtr1+Mtr2 # 矩阵相加
t_Mtr2=t(Mtr2) # 矩阵转置
Mtr12=Mtr1%*%t_Mtr2 # 矩阵相乘
solve(Mtr1) # 矩阵求逆
Df1=as.data.frame(Mtr1)  # 矩阵转数据框
Mtr1=as.matrix(Df1)  # 数据框转矩阵
# 后继篇章中将介绍R中最常见--数据框dataframe的应用规则


# 3 基础语句及运算符
# 注释，赋值，输入输出语句
# 注释
x=1  # 赋值，也写作x<-1
x=readline()  # 用户输入，输入结果均为字符串
cat("x=",x,"\t","y=",x+3)  # 输出到显示器，print只能输出单字符

# 控制语句-条件语句
if(3<5){
  print("yes")
}else if(3==5){
  print("!")
}else{
  print("no")
}

# 控制语句-循环语句
for(i in 1:10){
  print(1)
}

x=10
while(TRUE){
  x=x-1
  if(x<1){
    break
  }
}

# 运算符-算术运算符
# +、-、*、/、^
# 模余数: a%%b、模商: (a-a%%b)/b 、向上取整:ceiling 、向下取整:floor

# 运算符-关系运算符
# >、>=、<、<=、==、!=

# 运算符-逻辑运算符
# &&（与）, ||（或）, !（非）


# 4 数据框I/O操作及函数
# 数据框读入与导出（一般只对csv数据集操作）
DF=read.csv("xxx",header=T) # header=T表示将csv数据集首行作为标题
write.csv(DF,file="1.csv") 
attach(DF)  # 将数据框DF加入变量搜索路径
detach(DF)

# 函数定义
f<-function(x){
  return(x^2)
}

# 常见数学统计函数
abs(-1) # 绝对值函数
sqrt(4) # 平方根函数
exp(2) # 自然数e的幂
log(2) # 自然数e为底的对数
log(2,base=3) # 底为3的对数
cos(pi/3); sin(pi/3); tan(pi/3) # 三角函数

X=c(1,2,3,4,5)
sum(X) # 求和
diff(X) # 差分
mean(X) # 平均数
median(X) # 中位数
var(X) # 方差
sd(X) # 标准差
min(X); max(X) # 最小最大值
XX=scale(X,center=TRUE) # 数据标准化

dnorm(0.1, mean=0, sd=1) # 给出分位数0.6的标准正态概率密度
pnorm(0.1, mean=0, sd=1) # 给出分位数0.6的标准正态概率值
qnorm(0.5, mean=0, sd=1) # 给出概率0.5的标准正态分位数
rnorm(100, mean=0, sd=1) # 产生100个满足分布的标准正态随机数
runif(100, min=0, max=1) # 产生100个范围在0和1之间的均匀随机数

