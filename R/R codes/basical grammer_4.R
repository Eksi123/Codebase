# qplot快速绘图。qplot是ggplot2绘图的一个简易版本，用法与传统的plot系列差不多，此处不作细讲
df=data.frame( # 生成数据集
  type=as.character(sample(c(1,2,3),size=100,replace=T, prob=c(0.2,0.3,0.5))),
  level=runif(100,0,1),
  value=rnorm(100,1,4)
)

library(ggplot2)
qplot(x=level , y=value , data=df, # x轴y轴数据和数据集df
     geom=c("point","smooth"), # 绘图模式point(散点图)+smooth(平滑曲线)
     method="loess", span=0.8, # 平滑方法（其余lm线性回归）与平滑度
     facets=type~., # 是否根据分类变量来将图形分面，默认为NULL
     margins=TRUE, # 是否对分类面汇总，默认为FALSE
     shape=type, # 点的形状参数，此处根据分类变量自行调整
     colour=type, # 点的颜色参数，此处根据分类变量自行调整
     xlim=c(0,1), ylim=c(-10,10), # x轴y轴取值范围
     xlab="level", ylab="value", # x轴y轴名称
     main="graph", # 图表标题
     alpha=I(0.8) # 背景透明度
)
# geom还可选择绘图模型如line(曲线图)、boxplot(箱线图)、jitter(另一种散点图)
# histogram(直方图)、density(密度图)、bar(条形图)


# ggplot2常用绘图方法
# ggplot函数为qplot函数的进阶版，兼具代码的简洁和图形的美观，其基本架构为“数据data"+
# "映射关系aes”+“几何对象geom”，此外还有"标度scale（主要用于坐标轴）”+“标签labs"等

df=data.frame( # 生成数据集
  type=as.character(sample(c(1,2,3),size=100,replace=T, prob=c(0.2,0.3,0.5))),
  level=runif(100,0,1),
  value=rnorm(100,1,4)
)

library(ggplot2) #导入ggplot2包
ggplot(data=df,aes(x=level,y=value))+   # data指数据集，aes指映射关系
  geom_point(pch=17,size=2)+  # geom_point指散点图，可以自定义内部参数
  geom_smooth(method="loess",color="blue",linetype=2)+  # geom_smooth指平滑曲线，用于图层叠加
  scale_y_continuous(limits=c(-8,8),breaks=c(-10,0,10),labels=c(-1,0,1))+  # 自定义y轴值域和刻度
  labs(title="graph",x="level",y="value") # labs指各类标签
  

ggplot(data=df,aes(x=level,y=value))+  # color函数用于区分不同type的数据
  geom_point(pch=17,size=2)+  
  facet_grid(type~.)+
  labs(title="graph",x="level",y="value") 


#  
