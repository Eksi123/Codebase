# 导入数据
setwd("D:/database/Farm")
data11=read.csv("1.csv",header=T)
data12=read.csv("w1.csv",header=F)

data21=read.csv("2.csv",header=T)
data22=read.csv("w2.csv",header=F)

data31=read.csv("3.csv",header=T)
data32=read.csv("w3.csv",header=F)

data41=read.csv("4.csv",header=T)
data42=read.csv("w4.csv",header=F)

data51=read.csv("5.csv",header=T)
data52=read.csv("w5.csv",header=F)

data61=read.csv("6.csv",header=T)
data62=read.csv("w6.csv",header=F)

data71=read.csv("7.csv",header=T)
data72=read.csv("w7.csv",header=F)

data81=read.csv("8.csv",header=T)
data82=read.csv("w8.csv",header=F)

Moran=c()
Test_Moran=c()
#--------------------------------------------------#
# 1.5km
# 计算
data=data11[,2]-mean(data11[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data12)){
  for(j in 1:length(data12)){
    W=W+data12[i,j]
  }
}
Z=t(data)%*%as.matrix(data12)%*%data
moran=Z/(M*W)
Moran[1]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data12)
  order=sample(1:length(data12),length(data12)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1} 
}
p=sum/10000
Test_Moran[1]=p


#---------------------------------------------------------#
# 2km
data=data21[,2]-mean(data21[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data22)){
  for(j in 1:length(data22)){
    W=W+data22[i,j]
  }
}
Z=t(data)%*%as.matrix(data22)%*%data
moran=Z/(M*W)
Moran[2]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data22)
  order=sample(1:length(data22),length(data22)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[2]=p


#-----------------------------------------------#
#计算
# 2.5km
data=data31[,2]-mean(data31[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data32)){
  for(j in 1:length(data32)){
    W=W+data32[i,j]
  }
}
Z=t(data)%*%as.matrix(data32)%*%data
moran=Z/(M*W)
Moran[3]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data32)
  order=sample(1:length(data32),length(data32)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[3]=p

#------------------------------------------#
#计算
# 3km
data=data41[,2]-mean(data41[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data42)){
  for(j in 1:length(data42)){
    W=W+data42[i,j]
  }
}
Z=t(data)%*%as.matrix(data42)%*%data
moran=Z/(M*W)
Moran[4]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data42)
  order=sample(1:length(data42),length(data42)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[4]=p

#---------------------------------------------#
#计算
# 3.5km
data=data51[,2]-mean(data51[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data52)){
  for(j in 1:length(data52)){
    W=W+data52[i,j]
  }
}
Z=t(data)%*%as.matrix(data52)%*%data
moran=Z/(M*W)
Moran[5]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data52)
  order=sample(1:length(data52),length(data52)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[5]=p


#---------------------------------------------#
#计算
# 4km
data=data61[,2]-mean(data61[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data62)){
  for(j in 1:length(data62)){
    W=W+data62[i,j]
  }
}
Z=t(data)%*%as.matrix(data62)%*%data
moran=Z/(M*W)
Moran[6]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data62)
  order=sample(1:length(data62),length(data62)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[6]=p

#------------------------------------#
#计算
# 4.5km
data=data71[,2]-mean(data71[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data72)){
  for(j in 1:length(data72)){
    W=W+data72[i,j]
  }
}
Z=t(data)%*%as.matrix(data72)%*%data
moran=Z/(M*W)
Moran[7]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data72)
  order=sample(1:length(data72),length(data72)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[7]=p

#----------------------------------------#
#计算
# 5km
data=data81[,2]-mean(data81[,2]) # 中心化
M=(t(data)%*%data)*(1/length(data)) # 分母
W=0 # 权重和
for(i in 1:length(data82)){
  for(j in 1:length(data82)){
    W=W+data82[i,j]
  }
}
Z=t(data)%*%as.matrix(data82)%*%data
moran=Z/(M*W)
Moran[8]=moran
#置换检验
sum=0
for(i in 1:10000){
  WW=as.matrix(data82)
  order=sample(1:length(data82),length(data82)) # 随机化邻接邻接次序
  WW=WW[order,] # 保证随机化次序后仍为对称阵
  WW=WW[,order]
  Z=(t(data)%*%WW)%*%data
  m=Z/(M*W) # 新的Moran指数样本
  if(m > abs(moran) || m< -abs(moran)){sum=sum+1}
}
p=sum/10000
Test_Moran[8]=p

Moran
Test_Moran