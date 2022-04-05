#点估计：产生一定量的正态分布随机数，并用其来模拟点估计流程
#正态分布:N(2,4)
#误差限：|mean(X)-mu|< E = U(0.975)*(S/sqrt(n)) = 0.05  ..U(0.975)=1.96

E=0.05
n=100
X<-rnorm(n,2,4)
while(TRUE){
  S<-var(X)
  e<-1.96*(sqrt(S/n))
  if(e>=E){
    x<-rnorm(1,2,4)
    X=c(X,x)
    n=n+1
  }else{
    break
  }
}

n #取样个数
mean(X) #点估计
mean(X)-e; mean(X)+e  #区间估计



