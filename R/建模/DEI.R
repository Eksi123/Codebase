# 导入数据
data1=read.csv("JCJS.csv",header=T) 
data2=read.csv("JSTR.csv",header=T)
data3=read.csv("CYFZ.csv",header=T)

data1=data1[-c(125:129),] # 删除空行
data2=data2[-c(125:129),]
data3=data3[-c(125:129),]

# 数据标准化
for(i in 1:7){
  data1[i]=scale(data1[i], center=T)
  data2[i]=scale(data2[i], center=T)
  data3[i]=scale(data3[i], center=T)
}


# 主成分分析赋权
library(psych) # 导入主成分分析函数包
pc1=principal(data1,nfactors=7) # 提取全部成分
pc2=principal(data2,nfactors=7)
pc3=principal(data3,nfactors=7)

weight1=pc1$weights[1:7,1:7] # 获取各指标在各成分中的系数矩阵
weight2=pc2$weights[1:7,1:7]
weight3=pc3$weights[1:7,1:7]

variance1=pc1$Vaccounted[2,1:7] # 获取各成分的方差贡献情况
variance2=pc2$Vaccounted[2,1:7] 
variance3=pc3$Vaccounted[2,1:7] 

W1=weight1%*%variance1; W1=W1/sum(W1) # 获取各指标的权重矩阵
W2=weight2%*%variance2; W2=W2/sum(W2)
W3=weight3%*%variance3; W3=W3/sum(W3)


# 求数字经济综合指数
DEI1=as.matrix(data1)%*%W1
DEI2=as.matrix(data2)%*%W2
DEI3=as.matrix(data3)%*%W3


# 导出数据
data_DEI1=data.frame(DEI1[1:31],DEI1[32:62],DEI1[63:93],DEI1[94:124])
data_DEI2=data.frame(DEI2[1:31],DEI2[32:62],DEI2[63:93],DEI2[94:124])
data_DEI3=data.frame(DEI3[1:31],DEI3[32:62],DEI3[63:93],DEI3[94:124])


write.csv(data_DEI1,file="DEI_JCJS.csv")
write.csv(data_DEI2,file="DEI_JSTR.csv")
write.csv(data_DEI3,file="DEI_CYFZ.csv")


# 数字化基础建设指数可视化
dev.new() #创建新画布
x=c(1:31) 
label=c("北京","天津","河北","山西","内蒙古","辽宁","吉林","黑龙江",
        "上海","江苏","浙江","安徽","福建","江西","山东","河南","湖北",
        "湖南","广东","广西","海南","重庆","四川","贵州","云南","西藏",
        "陕西","甘肃","青海","宁夏","新疆")
length(label)
plot(x,DEI2[1:31],ylim=c(-1,2),type="b",col="green",xlab="地区",ylab="数字化基础建设指数",xaxt="n")
lines(x,DEI2[32:62],ylim=c(-1,2),type="b",col="blue",xaxt="n")
lines(x,DEI2[63:93],ylim=c(-1,2),type="b",col="orange",xaxt="n")
lines(x,DEI2[94:124],ylim=c(-1,2),type="b",col="red",xaxt="n")
axis(1,at=x,labels = label)

