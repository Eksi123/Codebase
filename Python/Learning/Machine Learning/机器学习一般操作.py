import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import cross_val_score # sklearn监督学习交叉验证技术
from sklearn.model_selection import StratifiedKFold
from sklearn.linear_model import LogisticRegression # sklearn监督学习模型算法模块
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.cluster import KMeans # sklearn无监督学习模型算法模块
from sklearn.cluster import AgglomerativeClustering
from sklearn.cluster import DBSCAN
from sklearn.metrics import silhouette_score # 聚类轮廓系数

# 1 导入数据
iris_df=pd.DataFrame(pd.read_csv("data/iris.csv", header=0, encoding="utf-8"))  # 导入鸢尾花数据集
print(iris_df["variety"].value_counts())


# 2 观察数据
print(iris_df.head(20)) # 查看数据集前20行
print(iris_df.info()) # 查看数据集基本信息
"""
鸢尾花数据集(iris.csv)
样本：150（无缺失值）
特征：5
    sepal.length 数值型
    sepal.width 数值型
    petal.length 数值型
    petal.width 数值型
    variety 分类型
"""
print(iris_df.describe()) # 查看数据集统计信息
"""
       sepal.length  sepal.width  petal.length  petal.width
count    150.000000   150.000000    150.000000   150.000000
mean       5.843333     3.057333      3.758000     1.199333
std        0.828066     0.435866      1.765298     0.762238
min        4.300000     2.000000      1.000000     0.100000
25%        5.100000     2.800000      1.600000     0.300000
50%        5.800000     3.000000      4.350000     1.300000
75%        6.400000     3.300000      5.100000     1.800000
max        7.900000     4.400000      6.900000     2.500000
"""
plt.subplot(2,3,1) # 可视化查看数据（也可用pandas自带的绘图函数，更简单）
plt.hist(iris_df["sepal.length"], bins=10, density=True) 
plt.title("sepal.length")

plt.subplot(2,3,2)
plt.hist(iris_df["sepal.width"], bins=10, density=True) 
plt.title("sepal.width")

plt.subplot(2,3,3)
plt.hist(iris_df["petal.length"], bins=10, density=True) 
plt.title("petal.length")

plt.subplot(2,3,4)
plt.hist(iris_df["petal.width"], bins=10, density=True) 
plt.title("petal.width")

plt.subplot(2,3,5)
plt.bar(["Setosa","Versicolor","Virginica"],[50,50,50])
plt.title("variety")

plt.subplots_adjust(wspace=0.2,hspace=0.2)
# plt.show()

cor=iris_df.iloc[:,0:4].corr() # 相关系数热力图
sns.heatmap(cor)
# plt.show()


# 3 监督学习--分类
"""
暂不考虑超参数调整这一步

一般来讲，我们需要按照一定比例划分出训练集和测试集，如0.8:0.2，一次测试即可得模型评价结果，根据结果来选择模型。
但考虑到本例中样本数过少，因此为了保证模型评价和选择的稳定可靠，可多次随机划分训练集和测试集，从而得到多个评价结果，取其均值
作为某一模型最终评价结果，再来选择模型。

上面这种多次随机划分训练集和测试集的思路，也可以用交叉验证技术来实现（或许此时应该称“交叉测试”）。尽管交叉验证技术一般用于
超参数调整，但其不过是数据集划分的一种方法，并不影响具体使用场景。无论交叉“验证”还是“测试”，本质上都是用于模型评价，前者是通过
评价来得到最优超参数。

理论上，在监督学习中模型是用于作决策的“工具”，而算法是用于求解模型中具体参数，起到将“工具”组装的作用
实际中，模型和算法多数时候是紧密联系的，抛开算法，很难单独给出模型的具体形式（少数如线性回归，logisitc回归等统计模型可给出形式）
因此，我们一般只关注算法本身，或者某种意义上算法既代表了模型。
"""
Models=[] # 用于保存不同分类模型
Models.append(LogisticRegression()) # 导入logistic“回归”模型
Models.append(KNeighborsClassifier()) # 导入k近邻分类模型
Models.append(DecisionTreeClassifier()) # 导入决策树分类模型
Test_result=[] # 用于保存不同模型测试性能

X_data=iris_df.iloc[:,0:4] # 数据集-输入特征X
Y_data=iris_df.iloc[:,4]  # 数据集-输出标签Y

for model in Models:
    kfold=StratifiedKFold(n_splits=10, random_state=1, shuffle=True) # 10折交叉划分法（划分训练集和测试集）
    cv_results=cross_val_score(model, X_data, Y_data, cv=kfold, scoring='accuracy') # 交叉测试，评价指标为分类准确率
    Test_result.append(cv_results.mean()) # 保存各模型评价结果均值

print("accuracy for models:"+"\n"+  # 打印不同模型测试结果
"LogisticRegression: "+str(Test_result[0])+"\n"+
"KNeighborsClassifier: "+str(Test_result[1])+"\n"+
"DecisionTreeClassifier: "+str(Test_result[2])
)

"""
accuracy for models:
LogisticRegression: 0.9600000000000002
KNeighborsClassifier: 0.9666666666666668
DecisionTreeClassifier: 0.9466666666666667
由测试结果（还可以多次使用交叉划分技术来进一步获取稳定的评价值）可知K近邻分类模型分类效果最好。
"""


# 3 无监督学习--聚类
"""
同样，暂不考虑超参数调整这一步（注意无监督学习也是可以调参的）

由于【1】缺乏可供对照的标签，无法对损失作直接的衡量。【2】无监督学习的目的在于探索数据内部模式结构。
因此无监督学习并不需要划分训练集和测试集，而直接调用原数据集进行算法学习就可以

无监督学习所得到的“模式”没有直接的评价指标（比如实际聚类与可能的真实聚类作对照）。但有间接的评价指标，如：轮廓系数
用于评价簇内的稠密程度（簇内差异小）和簇间的离散程度（簇外差异大）
"""
data=iris_df.iloc[:,0:4] # 聚类数据集（排除了标签变量 variety）

Models=[] # 用于保存不同聚类模型
Models.append(KMeans()) # 导入Kmeans聚类算法
Models.append(AgglomerativeClustering()) # 导入层次聚类算法
Models.append(DBSCAN()) # 导入密度聚类算法
Test_result=[] # 用于保存不同算法聚类性能

for model in Models:
    pattern=model.fit(data) # 直接用聚类算法来探索数据（暂不考虑如聚类个数，迭代次数等参数）
    print(pattern.labels_) # 输出聚类
    score_sil=silhouette_score(data, pattern.labels_, metric='euclidean') # 计算轮廓系数
    Test_result.append(score_sil)

print("silhouette_score for algorithms:"+"\n"+  # 打印不同算法聚类性能
"KMeans: "+str(Test_result[0])+"\n"+
"AgglomerativeClustering: "+str(Test_result[1])+"\n"+
"DBSCAN: "+str(Test_result[2])
)
"""
Kmeans聚类结果：
[0 0 0 0 0 7 0 0 0 0 7 0 0 0 7 7 7 0 7 7 7 7 0 0 0 0 0 7 0 0 0 7 7 7 0 0 7
 0 0 0 0 0 0 0 7 0 7 0 7 0 6 6 6 2 6 2 6 4 6 2 4 2 2 6 2 6 2 2 1 2 1 2 1 6
 6 6 6 6 6 2 2 2 2 1 2 6 6 6 2 2 2 6 2 4 2 2 2 6 4 2 5 1 3 5 5 3 2 3 5 3 5
 1 5 1 1 5 5 3 3 1 5 1 3 1 5 3 1 1 5 3 3 3 5 1 1 3 5 5 1 5 5 5 1 5 5 5 1 5
 5 1]
 
silhouette_score for algorithms:
KMeans: 0.3519340715228022
AgglomerativeClustering: 0.6867350732769781
DBSCAN: 0.4860341970345691
根据轮廓系数越接近1聚类越好的准则，可见层次聚类算法AgglomerativeClustering聚类效果最好。
"""