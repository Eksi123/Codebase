#用[0,1]上均匀分布的随机数产生其他分布的随机变量值（逆变换法）
#rgeom(n,p) 产生几何分布随机数
#rbinom(n,p) 产生二项分布随机数
#rpois(n,lmbda) 产生泊松分布随机数


#离散随机变量

x<-runif(10000,0,1) #产生均匀分布随机数
hist(x,breaks=100)
plot(1:10000,sort(x))
p<-x

#普通离散分布
# F(1)=0.1; F(2)=0.3: F(3)=0.45; F(4)=0.7; F(5)=0.85; F(6)=0.95; F(7)=1
X<-c()
for( i in 1:10000){ #产生离散分布随机变量值
  if(p[i]<=0.1){
    X[i]<-1
  }else if(p[i]<=0.3){
    X[i]<-2
  }else if(p[i]<=0.45){
    X[i]<-3
  }else if(p[i]<=0.7){
    X[i]<-4
  }else if(p[i]<=0.85){
    X[i]<-5
  }else if(p[i]<=0.95){
    X[i]<-6
  }else{
    X[i]<-7
  }
}


P<-c(0,0,0,0,0,0,0)
for( i in 1:10000){ #产生离散分布随机变量频率值
  if(X[i]==1){
    P[1]<-P[1]+1/10000
  }else if(X[i]==2){
    P[2]<-P[2]+1/10000
  }else if(X[i]==3){
    P[3]<-P[3]+1/10000
  }else if(X[i]==4){
    P[4]<-P[4]+1/10000
  }else if(X[i]==5){
    P[5]<-P[5]+1/10000
  }else if(X[i]==6){
    P[6]<-P[6]+1/10000
  }else{
    P[7]<-P[7]+1/10000
  }
}

plot(1:7,P,type="S") #查看频率图(概率函数)

for(i in 1:7){
  if(i-1==0){
    P[i]=P[i]+ 0
  }else{
    P[i]=P[i]+ P[i-1]
  }
}

plot(1:7,P,type="S") #查看累积频率图（概率分布函数）

#几何分布
#P=0.4  F(x)=1-(1-P)^n
#x=floor(log(p)/log(1-P))+1 or x=ceiling(log(p)/log(1-P))
P=0.4
X<-floor(log(p)/log(1-P))+1
f<-P(1-P)^X
F<-1-(1-P)^X

plot(X,f,type="h") #查看概率函数图

plot(X,F,type="h") #查看概率分布函数图


#--------------------------------------------------#

#用[0,1]上均匀分布的随机数产生其他分布的随机变量值（逆变换法）
#runif(n,min,max) 产生均匀分布随机数
#rnorm(n,mu,sd) 产生正态分布随机数
#rexp(n,lmbda) 产生指数分布随机数
#rchisq(n,df) 产生卡方分布随机数
#rf(n,df1,df2) 产生F分布随机数

#连续随机变量

x<-runif(10000,0,1) #产生均匀分布随机数
hist(x,breaks=100)
plot(1:10000,sort(x))
p<-x

# F(x)=P=x^2  f(x)=2x
X<-sqrt(p)
sort(X)
f=X*2
F=X^2


plot(X,f,type="h") #查看概率密度图

plot(X,F,type="h") #查看概率分布图
