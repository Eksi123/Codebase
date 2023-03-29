import numpy as np
import pandas as pd
import math

df = pd.DataFrame(
    {
        "x1": np.random.normal(0,1,100),
        "x2": np.random.uniform(0,1,100),
        "x3": np.random.binomial(10,0.6,100),
        "x4": np.random.exponential(0.2,100),
        "x5": np.random.poisson(8,100)
    }
)
print(df.corr())

# 计算pearson相关系数
def pearson(list1,list2):
    mean1 = np.mean(list1)
    mean2 = np.mean(list2)
    covariance12 = np.sum((list1-mean1)*(list2-mean2))/len(list1)
    variance1 = np.sum((list1-mean1)*(list1-mean1))/len(list1)
    variance2 = np.sum((list2-mean2)*(list2-mean2))/len(list1)
    corr = covariance12/math.sqrt(variance1*variance2)
    return corr


# 以pearson相关系数=0.15为阈值
def pearson_selection(data):
    number_variables = 0
    while data.shape[1]!=number_variables:
        number_variables = data.shape[1]
        label1 = None # 用来寄存相关程度高的两个变量的下标
        label2 = None
        flag = 0
        for i in range(data.shape[1]): # 检测是否存在两变量相关程度高   
            for j in range(i+1,data.shape[1]):
                if math.fabs(pearson(data.iloc[:,i], data.iloc[:,j])) > 0.15:
                    label1 = i
                    label2 = j
                    flag = 1
                    break
            if flag==1:
                break
        
        if flag==1: # 从相关程度高的两变量中剔除一个
            pearson1 = -1
            pearson2 = -1
            for k in range(data.shape[1]):
                pearson1 = pearson1+math.fabs(pearson(data.iloc[:,label1], data.iloc[:,k]))
                pearson2 = pearson2+math.fabs(pearson(data.iloc[:,label2], data.iloc[:,k]))
            if pearson1>=pearson2:
                data.drop(df.columns[label1], axis=1, inplace=True)
            else:
                data.drop(df.columns[label2], axis=1, inplace=True)

    return data

df_new = pearson_selection(df)
print(df_new)
