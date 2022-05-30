import pandas as pd
from geopy.distance import geodesic

Infected=[[15.171018,120.782812],[15.00655,120.63105],[15.01691,120.848123],[15.344648,120.901337],
[15.297225,120.881392],[14.93444135,120.5876095],[14.984448,120.70649],[15.043417,120.861155],
[15.049328,120.882955],[15.041179,120.886513],[15.041438,120.873477],[15.063062,120.897258],
[15.004561,120.712326],[14.952857,120.730892],[15.42152,120.2831],[15.030082,120.647853],
[15.42152,120.2831],[15.171547,120.782528],[15.01341,120.6241233],[15.214125,120.841305],
[14.984448,120.70649],[15.258837,120.86061],[15.215493,120.840103]] # 感染农场经纬度

data=pd.DataFrame(pd.read_csv("f.csv",header=0,encoding="utf8")) # 读入数据


All=[] # 所有农场经纬度
for i in range(len(data)):
    All.append([data["Latitude"][i], data["Longitude"][i]])

for i in range(len(data)):
    # 给感染的赋权1，未感染赋权0
    data["Infected"].values[i]=0
    for j in range(len(Infected)): 
        if(data["Latitude"].values[i]==Infected[j][0] and data["Longitude"].values[i]==Infected[j][1]):
            data["Infected"].values[i]=1
            break

    # 计算每个农场1，3，5，10公里范围内其他农场数
    sum_1km=0; sum_3km=0; sum_5km=0; sum_10km=0 # 1，3，5，10公里范围内农场数
    for k in range(len(data)): 
        dis=geodesic((All[i][0],All[i][1]),(All[k][0],All[k][1])).km
        if dis<=1:
            sum_1km=sum_1km+1
        elif dis<=3:
            sum_3km=sum_3km+1
        elif dis<=5:
            sum_5km=sum_5km+1
        elif dis<=10:
            sum_10km=sum_10km+1

    data["1km"].values[i]=sum_1km-1
    data["3km"].values[i]=sum_3km
    data["5km"].values[i]=sum_5km
    data["10km"].values[i]=sum_10km

data.to_csv("data.csv")
