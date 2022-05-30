import pandas as pd
from geopy.distance import geodesic

for i in range(8):
    data=pd.DataFrame(pd.read_csv(str(i+1)+".csv",header=0,encoding="utf8")) # 读入数据

    All=[] # 所有农场经纬度
    for t in range(len(data)):
        All.append([data["Latitude"][t], data["Longitude"][t]])


    print(len(data))

    Weight=[]# 空间权重矩阵
    for s1 in range(len(data)):
        Weight.append([])
        for s2 in range(len(data)):
            Weight[s1].append(0)


    # 输入的格式：纬度，经度
    for j in range(len(data)):
        for k in range(len(data)):
            dis=geodesic((All[j][0],All[j][1])  ,  (All[k][0],All[k][1])).km
            if dis==0:
                Weight[j][k]=0
            else:
                Weight[j][k]=round(1/(dis*dis),4)
                
    df=pd.DataFrame(Weight) # 导出空间权重矩阵
    df.to_csv("w"+str(i+1)+".csv",index=False, header=False)


