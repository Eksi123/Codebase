#分层重要性抽样
g<-function(x){
  return(exp(-x-log(1+x*x)))
}

T<-numeric(5)
estimates<-matrix(0,50,2)

for(i in 1:50){
  u<-runif(10000,0,1)
  estimates[i,1]<-mean(g(u))
  
  for(j in 1:5){
    uu<-runif(2000,(j-1)/5,j/5)
    x<--log(1-uu*(1-exp(-1)))
    fx<-exp(-x)/(1-exp(-1))
    fg<-g(x)/fx
   T[j]=mean(fg)
  }
  estimates[i,2]<-mean(T)
}

apply(estimates,2,mean)
apply(estimates,2,var)
