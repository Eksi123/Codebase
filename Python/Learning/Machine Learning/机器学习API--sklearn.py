"""
Sklearn（全称Scikit-Learn）是Python中当之无愧的机器学习第一模块！其内置函数主要有回归、分类、降维、聚类、模型评估、数据预处理
六大块，此外还包括内置数据集、特征选择、模型优化三小块。下面我们将对其一一介绍：

资料参考：
1 https://blog.csdn.net/weixin_41940785/article/details/119010204?spm=1001.2014.3001.5506
2 https://blog.csdn.net/algorithmPro/article/details/103045824?spm=1001.2014.3001.5506
"""

# 1 内置数据集 sklearn.datasets
"""
sklearn.datasets模块内含经典数据集（如鸢尾花数据集、波士顿房价数据集等等）及它们的导入，查看方式。
"""
import pandas as pd
from sklearn import datasets
iris = datasets.load_iris() # 鸢尾花数据集
boston=datasets.load_boston() # 波士顿房价数据集
breast_cancer=datasets.load_breast_cancer() # 乳腺癌数据集
diabetes=datasets.load_diabetes() # 糖尿病数据集


print(iris.DESCR) # 数据集描述
"""
**Data Set Characteristics:**

    :Number of Instances: 150 (50 in each of three classes)
    :Number of Attributes: 4 numeric, predictive attributes and the class
    :Attribute Information:
        - sepal length in cm
        - sepal width in cm
        - petal length in cm
        - petal width in cm
        - class:
                - Iris-Setosa
                - Iris-Versicolour
                - Iris-Virginica

    :Summary Statistics:

    ============== ==== ==== ======= ===== ====================
                    Min  Max   Mean    SD   Class Correlation
    ============== ==== ==== ======= ===== ====================
    sepal length:   4.3  7.9   5.84   0.83    0.7826
    sepal width:    2.0  4.4   3.05   0.43   -0.4194
    petal length:   1.0  6.9   3.76   1.76    0.9490  (high!)
    petal width:    0.1  2.5   1.20   0.76    0.9565  (high!)
    ============== ==== ==== ======= ===== ====================

    :Missing Attribute Values: None
    :Class Distribution: 33.3% for each of 3 classes.
    :Creator: R.A. Fisher
    :Donor: Michael Marshall (MARSHALL%PLU@io.arc.nasa.gov)
    :Date: July, 1988
    ……
"""
print(iris.data) # 查看特征数据
"""
[[5.1 3.5 1.4 0.2]
 [4.9 3.  1.4 0.2]
 [4.7 3.2 1.3 0.2]
 [4.6 3.1 1.5 0.2]
 [5.  3.6 1.4 0.2]
 [5.4 3.9 1.7 0.4]
 [4.6 3.4 1.4 0.3]
 ……
 [6.5 3.  5.2 2. ]
 [6.2 3.4 5.4 2.3]
 [5.9 3.  5.1 1.8]]
"""
print(iris.target, iris.target_names) # 查看实际标签值及编码后标签数据
"""
 ['setosa' 'versicolor' 'virginica']

[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2
 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
 2 2]
"""
df_iris=pd.DataFrame(iris.data, columns=iris.feature_names) # 将特征数据集转为DataFrame数据框格式


# 2 数据预处理 sklearn.preprocessing
"""
在sklearn中数据预处理的流程与建模类似，如在建模中求原数据集的标签拟合值（预测值）可分为：建模（fit) + 预测（predict）
而若要对数据进行标准化、二值化等处理，则分为：建模（fit） + 转换（transform)。这样做有利于统一所有数据预处理流程。

另外需要注意的是，在sklearn中，如论是数据预处理还是建模，基本都要求数据集（标签数据除外）“维度不小于2”，
表现为不低于一个样例，如下：
[[1]
 [2]
 [3]
 [4]
 [5]]，列向量代表了5个单特征的样例，这是允许的。
[1,2,3,4,5]，行向量代表了1个5特征的样例，这是不允许的。
将行向量转为列向量方法为: array.reshape(-1,1)
"""
import pandas as pd
from sklearn import preprocessing
from sklearn.impute import SimpleImputer
df=pd.DataFrame(
    { "x1":[0.38, 0.46, 0.98, 1.25, 1.48],  
      "x2":[13, 20, 35, 52, 88],
      "x3":["a", "b", "b", "c", "a"]},
    columns=["x1", "x2", "x3"]
)

std_scale=preprocessing.StandardScaler() # 标准化函数
x11=std_scale.fit_transform(df["x1"].values.reshape(-1,1)) # 矩阵转置函数仅对numpy中的array有用
# print(x11)
x12=std_scale.fit_transform(df[["x1","x2"]])
# print(x12)
"""
[[-1.22970169]
 [-1.04408634]
 [ 0.16241343]
 [ 0.78886523]
 [ 1.32250936]]

[[-1.22970169 -1.06746146]
 [-1.04408634 -0.80619467]
 [ 0.16241343 -0.24633726]
 [ 0.78886523  0.38816781]
 [ 1.32250936  1.73182559]]
"""

mm_scale=preprocessing.MinMaxScaler() # 归一化函数
x12=mm_scale.fit_transform(df[["x1","x2"]])
# print(x12)
"""
[[0.         0.        ]
 [0.07272727 0.09333333]
 [0.54545455 0.29333333]
 [0.79090909 0.52      ]
 [1.         1.        ]]
"""

nor_scale = preprocessing.Normalizer() # 正则化函数
x12=nor_scale.fit_transform(df[["x1","x2"]])
# print(x12)
"""
[[0.02921829 0.99957305]
 [0.02299392 0.9997356 ]
 [0.02798903 0.99960823]
 [0.02403152 0.9997112 ]
 [0.0168158  0.9998586 ]]
"""

rob_scale = preprocessing.RobustScaler() # 异常值函数：越是离群点，向中位数的压缩程度就越大，直到不含离群点
x12=rob_scale.fit_transform(df[["x1","x2"]])
# print(x12)
"""
[[-0.75949367 -0.6875    ]
 [-0.65822785 -0.46875   ]
 [ 0.          0.        ]
 [ 0.34177215  0.53125   ]
 [ 0.63291139  1.65625   ]]
"""

median_imputer=SimpleImputer(strategy="median") # 缺失值填补函数，默认为均值填补，可修改
x12=median_imputer.fit_transform(df[["x1","x2"]])
# print(x12)


lab_encoder=preprocessing.LabelEncoder() # 标签编码函数，可适用于一维数组
lab_encoder=lab_encoder.fit(["a","c","b"]) # 输入待编码的所有标签值，根据解析编码为0、1 …… n_class-1
x33=lab_encoder.transform(df["x3"])
print(x33)
"""
[0 1 1 2 0]
"""
print(lab_encoder.inverse_transform(x33)) # 反向解码函数
"""
['a' 'b' 'b' 'c' 'a']
"""


# 3 特征选择 sklearn.feature_selection
"""
当数据集特征过多，且显著存在冗余情况时，就需要考虑筛选有效特征了。特征选择方法众多，简单如根据卡方值，熵值，方差等作筛选，复杂如
通过算法来建模筛选，另外还有利用降维思想来筛选特征。这里我们主要介绍下面两类方法：
【1】评分筛选法：对于分类问题，可用chi2(特征非数值型), f_classif(F值-特征数值型), mutual_info_classif(互信息-特征数值型)
               对于回归问题，可用f_regression(基于回归任务表现), mutual_info_regression
【2】模型筛选法：利用机器学习模型(有些模型本身就具有对特征进行打分的机制)
"""
from sklearn import datasets
from sklearn.feature_selection import SelectKBest, chi2
from sklearn.feature_selection import SelectFromModel
from sklearn.linear_model import LogisticRegression

digits=datasets.load_digits() # 载入手写识别数据集（含64个特征）
data_x=digits.data # 特征数据
data_y=digits.target # 标签数据
# 评分筛选法
skb=SelectKBest(chi2, k=20).fit(data_x, data_y) # 建立评分器
print(skb.scores_) # 返回各特征评分（卡方值）
print(skb.get_support(indices=True)) # 返回筛选后特征在原数据集中的序号
print(skb.transform(data_x)) # 返回筛选后的数据集
"""
筛选后特征序号
[ 5  6 13 19 20 21 26 28 30 33 34 41 42 43 44 46 54 58 61 62]
筛选后数据集
[[ 1.  0. 15. ...  6.  0.  0.]
 [ 5.  0.  9. ...  0. 10.  0.]
 [12.  0. 14. ...  0. 16.  9.]
 ...
 [ 1.  0.  2. ...  2.  6.  0.]
 [ 0.  0. 15. ...  5. 12.  0.]
 [ 1.  0.  1. ...  8. 12.  1.]]
"""
# 模型筛选法
sfm=SelectFromModel(LogisticRegression(penalty="l2", C=0.1), max_features=20).fit(data_x, data_y)
print(sfm.get_support(indices=True)) # 返回筛选后特征在原数据集中的序号
print(sfm.transform(data_x)) # 返回筛选后的数据集
"""
筛选后特征序号
[ 4  5 12 19 20 21 26 27 28 30 35 38 42 43 44 46 51 53 54 58]
筛选后数据集
[[ 9.  1. 10. ... 12.  0.  6.]
 [13.  5. 16. ...  6.  0.  0.]
 [15. 12. 15. ... 11.  5.  0.]
 ...
 [15.  1.  8. ... 16.  0.  2.]
 [ 7.  0. 16. ... 16.  2.  5.]
 [ 8.  1.  6. ... 16.  8.  8.]]
"""
# 降维法构造新特征
"""
严格意义上来讲，利用降维算法获取特征算不上特征选择，但鉴于其在数据处理方面的重要性，故特此说明。
"""
from sklearn import datasets
from sklearn.decomposition import PCA, FactorAnalysis

breast_cancer=datasets.load_breast_cancer() # 载入乳腺癌数据（注意降维法不适用于如digits的非数值型数据）
print(breast_cancer.DESCR)
data_x=breast_cancer.data 
pca=PCA(n_components=10).fit(data_x)
data_xx=pca.transform(data_x)
print(data_xx)
"""
[[ 1.16014257e+03 -2.93917544e+02  4.85783976e+01 ...  1.48167035e-01
   7.45463100e-01  5.89359489e-01]
 [ 1.26912244e+03  1.56301818e+01 -3.53945342e+01 ...  2.00803920e-01
  -4.85827948e-01 -8.40347188e-02]
 [ 9.95793889e+02  3.91567432e+01 -1.70975298e+00 ... -2.74025583e-01
  -1.73874273e-01 -1.86993508e-01]
 ...
 [ 3.14501756e+02  4.75535252e+01 -1.04424072e+01 ... -4.42278787e-01
  -9.73984733e-02 -1.44667285e-01]
 [ 1.12485812e+03  3.41292250e+01 -1.97420874e+01 ... -3.59964104e-01
   3.85030186e-01  6.15467490e-01]
 [-7.71527622e+02 -8.86431064e+01  2.38890319e+01 ...  3.00390899e-02
  -4.23451051e-01 -3.01438975e-01]]
"""


# 4 建模与模型评估
"""
（1）估计器 和 预测器/转换器
估计器(estimator)是sklearn中最核心的工具组，用于对给定数据集进行“学习”：
复杂来说，可以是建立一套用于预测的模型，可以是对数据进行模式探索以得出其内部结构。
简单来说，可以是计算一组数据的均值和标准差以进行标准化处理，可以是计算分类数据间的卡方值以进行特征选择。
因而估计器涵盖了监督学习、无监督学习、数据预处理和特征选择四方面的使用

预测器/转换器(predictor/transformer)是估计器后续延申的工具，对“学习”的结果进行运用。对于监督学习，其后续步骤为“预测”，而
无监督学习出于自身的性质则止步于“学习”。数据预处理和特征选择后续步骤即为“处理数据”和“选择特征”

（2）为统一术语，我们将监督学习和无监督学习的“估计过程”均称为建模。机器学习建模的关键在于算法的选择，不同的算法对于同一目标任务
往往有着不同的表现，此处我们仅展示常见算法在sklearn中如何运用，算法的原理介绍则略过，并且不涉及参数的调整。
建模完成后则自然需要对模型进行评估，同样我们仅选取常见的评估指标进行展示。
"""
# 4.1 分类模型
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.model_selection import train_test_split # 训练集测试集分割函数
from sklearn import tree # 树模型（算法）
from sklearn.metrics import accuracy_score # 分类模型准确率函数

breast_cancer=datasets.load_breast_cancer() # 载入乳腺癌数据集
x_train, x_test, y_train, y_test=train_test_split(breast_cancer.data, breast_cancer.target, test_size=0.3) # 将特征和标签数据按0.7:0.3分割为训练集和测试集
dtc=tree.DecisionTreeClassifier().fit(x_train, y_train) # 训练决策树分类模型
tree.plot_tree(dtc) # 决策树可视化
plt.show()
pred_train=dtc.predict(x_train) # 预测训练集x_train中的分类结果，并与训练集y_train比对以得出训练集准确率
acc_train=accuracy_score(pred_train,y_train)
pred_test=dtc.predict(x_test) # 预测测试集x_test中的分类结果，并与测试集y_test比对以得出测试集准确率
acc_test=accuracy_score(pred_test,y_test)
print(acc_train, acc_test) # 输出训练集准确率和测试集准确率
"""
以上就是决策树分类模型的基本运用，最基本的步骤如【1 数据集分割】【2 模型训练】【3 模型预测】【4 模型性能评估】。
这对于其他分类和回归模型同样如此。

类似的分类模型还有：
1 linear_model.LogisticRegression( ) # 逻辑回归模型
2 svm.SVC( ) # 支持向量机分类模型
3 neighbors.KNeighborsClassifier() # k近邻分类模型
4 discriminant_analysis.LinearDiscriminantAnalysis( ) # 线性判别模型
5 naive_bayes.GaussianNB( ) # 朴素贝叶斯模型
6 ensemble.RandomForestClassifier( ) # 随机森林分类模型
类似的分类评价指标还有：
1 precision_score # 精准率
2 recall_score # 召回率
3 f1_score # f1分数
4 metrics.classification_report # 分类评估报告（含准确率，召回率，f1分数）
5 metrics.roc_auc_score # AUC值
其中precision_score，recall_score，f1_score函数若添加参数average=“micro/macro/weighted"则可用于多分类
"""

# 4.2 回归模型
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor # 决策树回归模型
from sklearn.metrics import mean_squared_error # 回归模型均方误差

boston=datasets.load_boston() # 载入波士顿房价数据集
x_train, x_test, y_train, y_test=train_test_split(boston.data, boston.target, test_size=0.3) 
dtr=DecisionTreeRegressor().fit(x_train,y_train)
pred_train=dtr.predict(x_train)
mse_train=mean_squared_error(pred_train, y_train)
pred_test=dtr.predict(x_test)
mse_test=mean_squared_error(pred_test, y_test)
print(mse_train, mse_test)
"""
类似的回归模型还有：
1 linear_model.LinearRegression( ) # 线性回归模型
2 linear_model.Ridge( ) # 岭回归模型
3 linear_model.Lasso( ) # Lasso回归模型
4 svm.SVR( ) # 支持向量机回归模型
5 neighbors.KNeighborsRegressor( ) # k近邻回归模型
6 ensemble.RandomForestRegressor( ) # 随机森林回归模型
类似的回归模型评价指标还有：
1 metrics.median_absolute_error # 中值绝对误差
2 metrics.r2_score # R方系数
"""

# 4.3 聚类模型
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.cluster import KMeans # K均值聚类算法
from sklearn.metrics import silhouette_score # 轮廓系数

iris=datasets.load_iris() # 载入鸢尾花数据集
iris=iris.data[:145] # 聚类数据集（排除了标签变量variety，且取前145个样例）
pred_iris=iris.data[145:] # 取后5个样例用于预测
km=KMeans().fit(iris)
print(km.labels_) # 输出各样例所在簇
print(km.predict(pred_iris)) # 预测新样例所在簇
print(silhouette_score(iris, km.labels_, metric='euclidean')) # 计算轮廓系数（基于欧几里得距离）
"""
聚类基本步骤为：【1 模式探索】【2 簇的输出或预测】【3 算法评价】。
sklearn中聚类算法支持“预测”，这或许与聚类目的不符，但在预测少量样例的情形下，还是允许的。

类似的聚类模型还有：
1 cluster.AgglomerativeClustering( ) # 层次聚类模型
2 cluster.DBSCAN( ) # 基于密度聚类模型
3 cluster.GaussianMixtureModel( ) # 高斯混合聚类模型
类似的聚类模型评价指标还有：
metrics.adjusted_rand_score( ) # 随机兰德调整指数
"""


# 5 模型优化（交叉验证技术）
"""
在sklearn中，模型优化板块用于辅助选择模型，常用的包括两大块，一为交叉验证技术；二为超参数调整。

交叉验证技术的使用有助于降低因随机性所带来的单次测试误差的不确定性，换句话说，交叉验证支持多次随机测试，且一般取多次测试误差的
均值作为最终评估比对的手段，不过可以预见的是，交叉验证的使用将大大提高计算量。

在交叉验证的基础上，结合网格搜索策略（GridSearchCV）或随机搜索策略（RandomizedSearchCV）可用于辅助我们通过验证集来找出最佳的超参数。
【1】何为超参数：超参数即模型外的参数，通常与模型训练所用的算法相关，因为超参数预设于建模之前，故无法通过优化损失函数的方式来直接获取最优值
【2】验证集：验证集的一大作用即在于通过随机搜索策略或网格搜索策略来“人工”获取给定范围下的最优超参数，本质为手动调参
【3】网格搜索为预先设定可选超参数的集合，然后组合出所有可能的超参数并逐一检索；而随机搜索为设定可选超参数的范围，指定搜索组合数并随机取超参数
组合，最后进行检索。总体来说，随机搜索效率更高，网格搜索适用于小范围内超参数的检索
"""
# 交叉测试
from sklearn import datasets
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score # sklearn监督学习交叉验证技术
from sklearn.model_selection import StratifiedKFold

iris=datasets.load_iris() # 载入鸢尾花数据集
iris_x=iris.data; iris_y=iris.target
kfold=StratifiedKFold(n_splits=10, random_state=1, shuffle=True) # 10折交叉划分法（用于划分训练集和测试集）
cv_results=cross_val_score(LogisticRegression(), iris_x, iris_y, cv=kfold, scoring="accuracy") # 交叉测试，模型评价指标为分类准确率
print(cv_results.mean()) # 10次测试的均值作为预测准确率


# 超参数择优
from sklearn import datasets
from scipy.stats import randint as sp_randint # 统计分布
from sklearn.model_selection import RandomizedSearchCV, GridSearchCV # 随机搜索与网格搜索
from sklearn.ensemble import RandomForestClassifier 

digits=datasets.load_digits() # 载入手写识别数据集
digits_x=digits.data; digits_y=digits.target
clf = RandomForestClassifier(n_estimators=20) # 随即森林中决策树数量为20

# RandomizedSearchCV
# 给定超参数max_depth、max_features等的搜索范围
param_dist1 = {"max_depth": [3, None],                    # 给定列表
              "max_features": sp_randint(1, 11),          # 给定均匀离散分布（1到10随机取整数）
              "min_samples_split": sp_randint(2, 11),     # 给定均匀离散分布（2到10随机取整数）
              "bootstrap": [True, False],                 # 给定列表
              "criterion": ["gini", "entropy"]}           # 给定列表（基尼系数或熵）

random_search = RandomizedSearchCV(clf, param_distributions=param_dist1, n_iter=20, cv=5) # n_iter表示随机搜索20组，cv表示5折交叉验证
random_search.fit(digits_x, digits_y)
print('最优分类器:',random_search.best_params_,'最优分数:', random_search.best_score_)

# GridSearchCV
param_dist2 = {"max_depth": [3, None],                    
              "max_features": [1,3,5,7,9],          
              "min_samples_split": [2,4,6,8,10],     
              "bootstrap": [True, False],                 
              "criterion": ["gini", "entropy"]}

grid_search = GridSearchCV(clf, param_grid=param_dist2, cv=5)
grid_search.fit(digits_x, digits_y)
print('最优分类器:',grid_search.best_params_,'最优分数:', grid_search.best_score_)
