#生成二维正态分布随机数，并画出其密度函数图像
#目标：X=(X1,X2) E(X)=(2,3) COV(X)=((1,0.9),(0.9,1))
#生成标准正态分布随机数U=(U1,U2) 然后X=C*U+mu

rmvn.eigen<-function(number,mu,sigma){
  dimension<-length(mu) #计算随机向量维数
  ev<-eigen(sigma,symmetric=TRUE)
  lambda<-ev$values #计算协方差阵特征根
  P<-ev$vectors #计算谱分解后的正交矩阵
  C<-P%*%diag(sqrt(lambda))%*% t(P) #计算矩阵C
  U<-matrix(rnorm(number*dimension,0,1),nrow=number,ncol=dimension) #生成标准正态随机向量
  X<-U%*%C+matrix(mu,number,dimension,byrow=TRUE) #计算随机向量X
  X
}

mu<-c(2,3) 
sigma<-matrix(c(1,0.9,0.9,1),nrow=2,ncol=2)

X<-rmvn.eigen(10000,mu,sigma) #生成二维正态分布随机数
              
#通过绘制其边缘分布图像做检验
x1<-X[,1];  x2<-X[,2]
f1<-((sqrt(2*pi)*1)^(-1))*exp((x1-2)^2/-2)
plot(x1,f1,type="h") #查看边缘概率密度图

f2<-((sqrt(2*pi)*1)^(-1))*exp((x2-3)^2/-2)
plot(x2,f2,type="h") #查看边缘概率密度图



