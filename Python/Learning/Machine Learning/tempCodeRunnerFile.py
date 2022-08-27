from sklearn import datasets
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score # sklearn监督学习交叉验证技术
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import make_scorer # 设定评价指标

iris=datasets.load_iris() # 载入鸢尾花数据集
iris_x=iris.data; iris_y=iris.target
kfold=StratifiedKFold(n_splits=10, random_state=1, shuffle=True) # 10折交叉划分法（用于划分训练集和测试集）
cv_results=cross_val_score(LogisticRegression(), iris_x, iris_y, cv=kfold, scoring=make_scorer(accuracy)) # 交叉测试，模型评价指标为分类准确率
print(cv_results.mean()) # 10次测试的均值作为预测准确率