import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from geopy.distance import geodesic

data1=pd.DataFrame(pd.read_csv("f1.csv",header=0,encoding="utf8"))
data2=pd.DataFrame(pd.read_csv("f2.csv",header=0,encoding="utf8"))

X1=data1["Latitude"].values
Y1=data1["Longitude"].values
X2=data2["Latitude"].values
Y2=data2["Longitude"].values

plt.scatter(Y1,X1,color="grey")
plt.scatter(Y2,X2,color="red")
plt.show()


# 输入的格式：纬度，经度
for i in range(23):
    for j in range(23):
        dis=round(geodesic((X2[i],Y2[i]),(X2[j],Y2[j])).km,2) #计算两个坐标直线距离
        print(dis)

