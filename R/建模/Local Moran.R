# 导入数据
data1=read.csv("DEI_JCJS.csv",header=F)
data2=read.csv("DEI_JSTR.csv",header=F)
data3=read.csv("DEI_CYFZ.csv",header=F)
W=read.csv("Weight.csv",header=F)

# 计算并检验局部Moran指数-JCJS
#2017
list1_2017=c() # 2017年JCJS局部Moran指数
test1_2017=c() # 2017年JCJS局部Moran指数检验结果
data=data1[,1]-mean(data1[,1]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母

for(i in 1:length(data)){ 
  list1_2017[i]=(data[i]*(t(W[i])%*%data))/S # 计算
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31) # 重排列空间权重列表
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list1_2017[i]) || dei< -abs(list1_2017[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list1_2017[i]>0){
      test1_2017[i]=1 # HH型
    }else if(data[i]>0 && list1_2017[i]<0){
      test1_2017[i]=2 # HL型
    }else if(data[i]<0 && list1_2017[i]<0){
      test1_2017[i]=3 # LH型
    }else if(data[i]<0 && list1_2017[i]>0){
      test1_2017[i]=4 # LL型
    }
  }else{
    test1_2017[i]=0 # 不存在聚集现象
    }
}
list1_2017
test1_2017


#----------------------------------------------------#
# 2018
list1_2018=c() # 2018年JCJS局部Moran指数
test1_2018=c() # 2018年JCJS局部Moran指数检验结果
data=data1[,2]-mean(data1[,2]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list1_2018[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list1_2018[i]) || dei< -abs(list1_2018[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list1_2018[i]>0){
      test1_2018[i]=1 # HH型
    }else if(data[i]>0 && list1_2018[i]<0){
      test1_2018[i]=2 # HL型
    }else if(data[i]<0 && list1_2018[i]<0){
      test1_2018[i]=3 # LH型
    }else if(data[i]<0 && list1_2018[i]>0){
      test1_2018[i]=4 # LL型
    }
  }else{
    test1_2018[i]=0 # 不存在聚集现象
  }
}
list1_2018
test1_2018

#---------------------------------------------------#
#2019
list1_2019=c() # 2019年JCJS局部Moran指数
test1_2019=c() # 2019年JCJS局部Moran指数检验结果
data=data1[,3]-mean(data1[,3]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list1_2019[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list1_2019[i]) || dei< -abs(list1_2019[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list1_2019[i]>0){
      test1_2019[i]=1 # HH型
    }else if(data[i]>0 && list1_2019[i]<0){
      test1_2019[i]=2 # HL型
    }else if(data[i]<0 && list1_2019[i]<0){
      test1_2019[i]=3 # LH型
    }else if(data[i]<0 && list1_2019[i]>0){
      test1_2019[i]=4 # LL型
    }
  }else{
    test1_2019[i]=0 # 不存在聚集现象
  }
}
list1_2019
test1_2019

#-------------------------------------------------#
# 2020
list1_2020=c() # 2020年JCJS局部Moran指数
test1_2020=c() # 2020年JCJS局部Moran指数检验结果
data=data1[,4]-mean(data1[,4]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list1_2020[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list1_2020[i]) || dei< -abs(list1_2020[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list1_2020[i]>0){
      test1_2020[i]=1 # HH型
    }else if(data[i]>0 && list1_2020[i]<0){
      test1_2020[i]=2 # HL型
    }else if(data[i]<0 && list1_2020[i]<0){
      test1_2020[i]=3 # LH型
    }else if(data[i]<0 && list1_2020[i]>0){
      test1_2020[i]=4 # LL型
    }
  }else{
    test1_2020[i]=0 # 不存在聚集现象
  }
}
list1_2020
test1_2020

data_JCJS=data.frame(list1_2017,list1_2018,list1_2019,list1_2020)
write.csv(data_JCJS,file="Moran_JCJS.csv") # 导出局部Moran指数
test_JCJS=data.frame(test1_2017,test1_2018,test1_2019,test1_2020)
write.csv(test_JCJS,file="Test_JCJS.csv") # 导出局部Moran指数检验结果


#-------------------------------------------------------------------------#

# 2017
# 计算并检验局部Moran指数-JSTR
list2_2017=c() # 2017年JSTR局部Moran指数
test2_2017=c() # 2017年JSTR局部Moran指数检验结果
data=data2[,1]-mean(data2[,1]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list2_2017[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list2_2017[i]) || dei< -abs(list2_2017[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list2_2017[i]>0){
      test2_2017[i]=1 # HH型
    }else if(data[i]>0 && list2_2017[i]<0){
      test2_2017[i]=2 # HL型
    }else if(data[i]<0 && list2_2017[i]<0){
      test2_2017[i]=3 # LH型
    }else if(data[i]<0 && list2_2017[i]>0){
      test2_2017[i]=4 # LL型
    }
  }else{
    test2_2017[i]=0 # 不存在聚集现象
  }
}
test2_2017

#---------------------------------------------------#
# 2018
list2_2018=c() # 2018年JSTR局部Moran指数
test2_2018=c() # 2018年JSTR局部Moran指数检验结果
data=data2[,2]-mean(data2[,2]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list2_2018[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list2_2018[i]) || dei< -abs(list2_2018[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list2_2018[i]>0){
      test2_2018[i]=1 # HH型
    }else if(data[i]>0 && list2_2018[i]<0){
      test2_2018[i]=2 # HL型
    }else if(data[i]<0 && list2_2018[i]<0){
      test2_2018[i]=3 # LH型
    }else if(data[i]<0 && list2_2018[i]>0){
      test2_2018[i]=4 # LL型
    }
  }else{
    test2_2018[i]=0 # 不存在聚集现象
  }
}
test2_2018



data2[1]
#-------------------------------------------------#
# 2019
list2_2019=c() # 2019年JSTR局部Moran指数
test2_2019=c() # 2019年JSTR局部Moran指数检验结果
data=data2[,3]-mean(data2[,3]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list2_2019[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list2_2019[i]) || dei< -abs(list2_2019[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list2_2019[i]>0){
      test2_2019[i]=1 # HH型
    }else if(data[i]>0 && list2_2019[i]<0){
      test2_2019[i]=2 # HL型
    }else if(data[i]<0 && list2_2019[i]<0){
      test2_2019[i]=3 # LH型
    }else if(data[i]<0 && list2_2019[i]>0){
      test2_2019[i]=4 # LL型
    }
  }else{
    test2_2019[i]=0 # 不存在聚集现象
  }
}
test2_2019

#--------------------------------------------#
# 2020
list2_2020=c() # 2020年JSTR局部Moran指数
test2_2020=c() # 2020年JSTR局部Moran指数检验结果
data=data2[,4]-mean(data2[,4]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list2_2020[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list2_2020[i]) || dei< -abs(list2_2020[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list2_2020[i]>0){
      test2_2020[i]=1 # HH型
    }else if(data[i]>0 && list2_2020[i]<0){
      test2_2020[i]=2 # HL型
    }else if(data[i]<0 && list2_2020[i]<0){
      test2_2020[i]=3 # LH型
    }else if(data[i]<0 && list2_2020[i]>0){
      test2_2020[i]=4 # LL型
    }
  }else{
    test2_2020[i]=0 # 不存在聚集现象
  }
}
test2_2020

data_JSTR=data.frame(list2_2017,list2_2018,list2_2019,list2_2020)
write.csv(data_JSTR,file="Moran_JSTR.csv") # 导出局部Moran指数
test_JSTR=data.frame(test2_2017,test2_2018,test2_2019,test2_2020)
write.csv(test_JSTR,file="Test_JSTR.csv") # 导出局部Moran指数检验结果


#---------------------------------------------------------------------#

# 2017
# 计算并检验局部Moran指数-CYFZ
list3_2017=c() # 2017年CYFZ局部Moran指数
test3_2017=c() # 2017年CYFZ局部Moran指数检验结果
data=data3[,1]-mean(data3[,1]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list3_2017[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list3_2017[i]) || dei< -abs(list3_2017[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list3_2017[i]>0){
      test3_2017[i]=1 # HH型
    }else if(data[i]>0 && list3_2017[i]<0){
      test3_2017[i]=2 # HL型
    }else if(data[i]<0 && list3_2017[i]<0){
      test3_2017[i]=3 # LH型
    }else if(data[i]<0 && list3_2017[i]>0){
      test3_2017[i]=4 # LL型
    }
  }else{
    test3_2017[i]=0 # 不存在聚集现象
  }
}
test3_2017

#-------------------------------------------#
# 2018
list3_2018=c() # 2018年CYFZ局部Moran指数
test3_2018=c() # 2017年CYFZ局部Moran指数检验结果
data=data3[,2]-mean(data3[,2]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list3_2018[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list3_2018[i]) || dei< -abs(list3_2018[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list3_2018[i]>0){
      test3_2018[i]=1 # HH型
    }else if(data[i]>0 && list3_2018[i]<0){
      test3_2018[i]=2 # HL型
    }else if(data[i]<0 && list3_2018[i]<0){
      test3_2018[i]=3 # LH型
    }else if(data[i]<0 && list3_2018[i]>0){
      test3_2018[i]=4 # LL型
    }
  }else{
    test3_2018[i]=0 # 不存在聚集现象
  }
}
test3_2018

#---------------------------------------------------#
# 2019
list3_2019=c() # 2019年CYFZ局部Moran指数
test3_2019=c() # 2019年CYFZ局部Moran指数检验结果
data=data3[,3]-mean(data3[,3]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list3_2019[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list3_2019[i]) || dei< -abs(list3_2019[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list3_2019[i]>0){
      test3_2019[i]=1 # HH型
    }else if(data[i]>0 && list3_2019[i]<0){
      test3_2019[i]=2 # HL型
    }else if(data[i]<0 && list3_2019[i]<0){
      test3_2019[i]=3 # LH型
    }else if(data[i]<0 && list3_2019[i]>0){
      test3_2019[i]=4 # LL型
    }
  }else{
    test3_2019[i]=0 # 不存在聚集现象
  }
}
test3_2019

#-----------------------------------------#
# 2020
list3_2020=c() # 2020年CYFZ局部Moran指数
test3_2020=c() # 2020年CYFZ局部Moran指数检验结果
data=data3[,4]-mean(data3[,4]) # 中心化
S=(t(data)%*%data)*(1/length(data)) # 分母
for(i in 1:length(data)){
  list3_2020[i]=(data[i]*(t(W[i])%*%data))/S
  
  sum=0 # 检验
  for(k in 1:49){
    WW=sample(t(W[i]),31)
    dei=(data[i]*(t(WW)%*%data))/S
    if(dei > abs(list3_2020[i]) || dei< -abs(list3_2020[i])){
      sum=sum+1
    }
  }
  p=sum/100
  print(p)
  if (p<=0.1){
    if (data[i]>0 && list3_2020[i]>0){
      test3_2020[i]=1 # HH型
    }else if(data[i]>0 && list3_2020[i]<0){
      test3_2020[i]=2 # HL型
    }else if(data[i]<0 && list3_2020[i]<0){
      test3_2020[i]=3 # LH型
    }else if(data[i]<0 && list3_2020[i]>0){
      test3_2020[i]=4 # LL型
    }
  }else{
    test3_2020[i]=0 # 不存在聚集现象
  }
}
test3_2020

data_CYFZ=data.frame(list3_2017,list3_2018,list3_2019,list3_2020)
write.csv(data_CYFZ,file="Moran_CYFZ.csv") # 导出局部Moran指数
test_JSTR=data.frame(test3_2017,test3_2018,test3_2019,test3_2020)
write.csv(test_JSTR,file="Test_CYFZ.csv") # 导出局部Moran指数检验结果

