# R语言绘图

# 绘图基础（以折线图为例）
df=data.frame( # 创建一数据集用于绘图
  type=c(1,2,1,3,2,1,3,2,1,2),
  width=c(0.32,0.45,0.28,0.53,0.38,0.26,0.52,0.40,0.34,0.42),
  heigth=c(8,12,9,18,14,10,17,12,7,11)
)

dev.new() # 开启副窗口用于图表展示
par( # 全局设置，一般仅用于以下功能
  mfrow=c(1,1), # 子图摆放的行数与列数
  pin=c(3,2), # 子图的宽度和高度（以英寸为单位）
  mai=c(0.8, 0.9, 0.4, 1.0) # 子图距边界距离，顺序分别为下、左、上、右
)

plot( # 折线图函数及常用参数
  1:10, df$width, # x轴与y轴数据
  type="b", # 点线结构参数，指点连线。其余还有"p"(仅点)、"l"(仅线)、"h"(悬垂线)、"s"(阶梯线)
  lty=2, # 线条类型参数，其余类型还有1-6，可自行尝试
  pch=20, # 点类型参数，指实心圆。常用还有"1"(空心圆)、"2"(空心三角)、"17"(实心三角)等等
  col="red", # 点线颜色，常见如"blue","green","orange"等等
  xlim=c(0,10), ylim=c(0.2,0.6), # x轴y轴取值范围
  xlab="order", ylab="width", # x轴y轴名称
  main="my graph"
)

# 以上是绘制图形的基本操作，当涉及到坐标刻度修改，添加辅助线和图例时，可作如下操作：
dev.new()
plot( 
  1:10, df$width, 
  type="b", 
  lty=2, 
  pch=20, 
  col="red",
  xlim=c(0,10), ylim=c(0,0.8), 
  xlab="type", ylab="width",
  xaxt="n", # 抹去原x坐标轴刻度
  main="my graph"
)
lines( # 辅助线函数，其余还有points(辅助点)，abline(参考线)等
  1:10, df$heigth/30, 
  type="b", 
  lty=3, 
  pch=1, 
  col="blue",
)
axis( # x坐标轴绘制
  side=1, # 坐标轴绘制位置，分别为"1"(下)、"2"(左)、"3"(上)、"4"(右)
  at=1:10, # 刻度绘制位置,其个数需与原x轴数据个数等同
  labels=c(1,2,1,3,2,1,3,2,1,2), # 修改后刻度
  las=2 # 为0表示刻度标签平行于坐标轴，为2表示垂直
)
axis( # 辅助线y坐标轴绘制
  side=4, 
  at=c(2,4,6,8,10,12,14,16,18,20)/30,
  labels=c(2,4,6,8,10,12,14,16,18,20)
)
legend(
  x="topleft", # 图例位置，类似还有"topright","top"等
  title="variables", # 图例名称
  legend=c("width","heigth"), # 图例标签名称
  lty=c(2,3), # 示例点线及颜色
  pch=c(20,1),
  col=c("red","blue") 
)

# 绘图类型
# 散点图
data=rnorm(100,0,1)
plot(data,pch=20,cex=0.8,main="scatter") #cex参数用于控制点的大小 

# 条形图
data1=c("high","low","high","median","median","high","median","low","high","high")
data2=c("F","M","M","F","F","F","M","F","M","F")
data=table(data1,data2) # 分类汇总
barplot(data,
        horiz=F, # horiz参数用于设置条形图方向
        beside = T, # besides用于设置交叉条形图是否堆叠
        legend=row.names(data),
        main="bar") 

# 饼图
data=c("high","low","high","median","median","high","median","low","high")
pie(table(data),main="pie")

# 箱线图
data1=rnorm(100,0,1)
data2=rnorm(50,1,4)
data3=rbinom(30,10,0.6)
boxplot(data1,data2,data3,
        names=c("data1","data2","data3"), 
        col=c("red","blue","green"),
        notch = T,
        main="bpxplot") # notch参数用于设置凹槽

# 直方图
data=rnorm(100,0,1)+runif(100,0,1)
hist(data,breaks=10,freq = F,main="hist") # breaks参数用于设置组数，freq=F表示为频率图而非频数图

# 核密度图
data=rnorm(100,0,1)+runif(100,0,1)
den=density(data)
plot(den,main="kernel density")
polygon(den,col="orange",border ="blue") # 曲线下填充

# 散点矩阵及相关矩阵图
data1=rnorm(100,0,1)
data2=rnorm(100,1,4)
data3=rbinom(100,10,0.6)
data=data.frame(data1,data2,data3)
data

library(corrgram)
corrgram(data,
         lower.panel = panel.pts, 
         upper.panel = panel.ellipse,
         diag.panel = panel.density,
         main="corrgram"
)
# 非主对角线可选参数如panel.pts(散点图)、panel.ellipse(置信椭圆及平滑曲线)、panel.shade(相关度阴影图)等
# 主对角线可选参数如panel.density(核密度曲线)、panel.minmax(最小最大值)
# 其余函数包如corrplot，pairs等也可绘制相关矩阵图
