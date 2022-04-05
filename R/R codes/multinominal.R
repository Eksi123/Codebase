#编写产生多项分布随机数的函数，参数为：n（每轮试验次数），size（结果总数），prob（对应结果的发生概率）
rmultinominal<-function (n,size,prob){
  value<-c()
  
  p<-numeric(length(prob)) #生成概率分布函数值（多点分布）
  p[1]=prob[1]
  for(i in 2:length(prob)){
    p[i]<-prob[i]+p[i-1]
  }
  
  for(i in 1:n){ #生成多项分布随机数
    u<-runif(n,0,1); y<-numeric(length(prob))
    for(j in 1:n){
      for(k in 1:length(p)){
        if(u[j]<=p[k]){
          y[k]<-y[k]+1
          break
        }
      }
    }
    value<-c(value,y)
  }
  
  x<-t(matrix(value,length(prob),n))#返回随机数矩阵
  return(x) 
}

#为比较经验分布与理论分布是否拟合，我们可将多项分布看作多个二项分布，逐一比较每个二项分布拟合情况
X<-c() #产生多项分布1000组样本值，并合并为一个大样本
prob=c(0.1,0.2,0.2,0.2,0.3)
for(i in 1:1000){
  x<-rmultinominal(10,5,prob)
  X<-rbind(X,x)
}

value<-numeric(5*11) #计算累积频率值
p1<-matrix(value,11,5)
for(i in 1:10000){
  for(j in 1:5){
    for(k in 1:11){
      if(X[i,j]<=k-1) p1[k,j]=p1[k,j]+1/10000
    }
  }
}

p2<-matrix(value,11,5) #计算概率分布函数值（多个二项分布）
for(k in 1:11){
  p2[k,]=pbinom(k-1,10,prob)
}

dev.new() #经验分布与理论分布比较
par(mfrow=c(3,2))
for(j in 1:5){
  plot(0:10,p1[,j],type="s",col="red")
  lines(0:10,p2[,j],type="s",col="blue")
}

