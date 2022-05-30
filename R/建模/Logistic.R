data=read.csv("data.csv",header=T) # 导入数据
attach(data)

# 求变量均值和标准差
Mean=c()
Std=c()
for( i in c(4,6,7,8,9,10,11)){
  Mean[i]=mean(data[,i])
  Std[i]=sd(data[,i]) 
}

df=data.frame(Mean,Std)
write.csv(df,"1.csv")

# 构建Logistic模型，求原数据拟合概率值
# 平衡采样
library(ROSE) 
balance_data <- ovun.sample(Infected~.,data = data,
                            p=0.5,seed=1,method = "over")$data

# 构建模型
fit=glm(Infected~Population+Species+Road+River+X1KM+X3KM+X5KM
        +X10KM,family = binomial(link = logit), data = balance_data)
summary(fit)

# 求原数据集预测概率
data1=data[,c(4,5,6,7,8,9,11)]
Prob=predict(fit, newdata = data1, type="response")

# 模型预测能力检验
pre_outcome=c()
for(i in 1:length(Prob)){
  if(Prob[i]>0.5){
    pre_outcome[i]=1
  }else{
    pre_outcome[i]=0
  }
}
real_outcome=data[,3]

sum=0
for(i in 1:length(real_outcome)){
  if(pre_outcome[i]==real_outcome[i]){
    sum=sum+1
  }
}

accuracy=sum/length(real_outcome)
accuracy

df=data.frame(Prob,real_outcome)
write.csv(df,"Probability.csv")


