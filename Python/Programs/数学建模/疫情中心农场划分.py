import pandas as pd
from geopy.distance import geodesic

Infected=[[15.171018,120.782812],[15.00655,120.63105],[15.01691,120.848123],[15.344648,120.901337],
[15.297225,120.881392],[14.93444135,120.5876095],[14.984448,120.70649],[15.043417,120.861155],
[15.049328,120.882955],[15.041179,120.886513],[15.041438,120.873477],[15.063062,120.897258],
[15.004561,120.712326],[14.952857,120.730892],[15.42152,120.2831],[15.030082,120.647853],
[15.42152,120.2831],[15.171547,120.782528],[15.01341,120.6241233],[15.214125,120.841305],
[14.984448,120.70649],[15.258837,120.86061],[15.215493,120.840103]] # 感染农场经纬度

data1=pd.DataFrame(pd.read_csv("f.csv",header=0,encoding="utf8")) # 读入数据
data2=pd.DataFrame(pd.read_csv("Probability.csv",header=0,encoding="utf8")) # 读入数据

Radius=[1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
Farm={1.5:[], 2:[], 2.5:[], 3:[], 3.5:[], 4:[], 4.5:[], 5:[]} # 离感染农场1.5-5公里范围内全部农场


All=[] # 所有农场经纬度
for i in range(len(data1)):
    All.append([data1["Latitude"][i], data1["Longitude"][i]])

Prob=[] # 所有农场预测概率
for i in range(len(data2)):
    Prob.append(data2["Prob"][i])

for i in range(8):
    for j in range(len(data1)):
        for k in range(len(Infected)): 
            dis=geodesic((All[j][0],All[j][1]),(Infected[k][0],Infected[k][1])).km
            if dis<=Radius[i]:
                Farm[Radius[i]].append([Prob[j], All[j][1], All[j][0]])
                break

for i in range(8):
    df=pd.DataFrame(Farm[Radius[i]],columns=[["prob","Longitude","Latitude"]])
    df.to_csv(str(i+1)+".csv")

