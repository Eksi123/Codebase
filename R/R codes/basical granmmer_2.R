# R语言数据框的运用

# 1. 数据框的创建
df=data.frame(  # 自定义数据框
  Id=c(1,2,3,4,5),
  Name=c("Tom","Rose","Mary","Su","Lisa"),
  Sex=c("M","F","F","M","F"),
  Grades=c(89,92,85,90,88)
)
str(df)  # 查看数据框信息
nrow(df); length(df)  # 数据框行数和列数
head(df)  # 查看数据框前十行数据，反之tail(df)表示查看后十行数据
summary(df)  # 查看数据框基本统计信息（不包括字符型变量）
df[c("Name","Sex")]  # 查看某几列数据
df[1,2:4]  # 查看第1条观测第2-4列的数据
df[df$Sex=="F" & df$Grades>=88,]  # 根据指定条件筛选数据

# 2. 数据框预处理
names(df)[4]="Grade"  # 变量重命名（Grades->Grade）
df$Grade=as.numeric(df$Grade)  # 修改变量类型
df$Sex[df$Sex=="M"]=0  # 变量重编码
df$Sex[df$Sex=="F"]=1
df=df[order(df$Grade, decreasing = T),]  # 变量排序，注意是order而非sort
df[-1,]; df[,-1]  # 删除第一行与第一列
is.na(df)  # 数据框缺失值情况
sum(is.na(df))  # 缺失值个数
na.omit(df)  # 剔除含缺失值的观测
df$Grade[is.na(df$Grade)]=80  # 用指定数值填补缺失值（也可用函数或算法填补）

# 3. 数据框操作
df[6,]=c(6,"Bob",0,94)  # 添加新行
df$level=c(1,1,3,2,3,1)  # 添加新列
new_df=cbind(df1,df2)  # 数据框列拼接
new_df=merge(df1,df2,by="Id")  # 数据框根据标志“Id"的契合情况进行列合并
new_df=rbind(df1,df2)  # 数据框行拼接
apply(df[,c(4,5)], MARGIN=2, mean)  # 求数据框Grade和level列的均值（MARGIN=2表示列，=1表示行，mean表示操作函数）
aggregate(df$Grade, by=list(df$Sex), mean)  # 分类汇总，by=list(x)表示汇总标识
