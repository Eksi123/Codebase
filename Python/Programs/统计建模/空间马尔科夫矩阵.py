# 求某一年份某省/直辖市/自治区数字经济的level（由五分位数区分）
import pandas as pd
import numpy as np

# 基础建设指数
data1=pd.DataFrame(pd.read_csv("DEI_JCJS.csv",header=0,encoding="utf8")) # 读取指数至数据框
data2=pd.DataFrame(columns=["2017","2018","2019","2020"]) # 创建空level数据框

for i in range(4):
    list=[]
    dei=np.array(data1[str(2017+i)].values) # 将指数导入列表中
    for j in range(len(dei)):
        if dei[j]<=np.percentile(dei,20): # 20%分位数
            list.append(1)
        elif dei[j]<=np.percentile(dei,40):
            list.append(2)
        elif dei[j]<=np.percentile(dei,60):
            list.append(3)
        elif dei[j]<=np.percentile(dei,80):
            list.append(4)
        else:
            list.append(5)
    data2[str(2017+i)]=list

data2.to_csv("LEVEL_JCJS.csv",index=False) # 导出level至csv文件


# 技术投入指数
data1=pd.DataFrame(pd.read_csv("DEI_JSTR.csv",header=0,encoding="utf8")) # 读取指数至数据框
data2=pd.DataFrame(columns=["2017","2018","2019","2020"]) # 创建空level数据框

for i in range(4):
    list=[]
    dei=np.array(data1[str(2017+i)].values) # 将指数导入列表中
    for j in range(len(dei)):
        if dei[j]<=np.percentile(dei,20):
            list.append(1)
        elif dei[j]<=np.percentile(dei,40):
            list.append(2)
        elif dei[j]<=np.percentile(dei,60):
            list.append(3)
        elif dei[j]<=np.percentile(dei,80):
            list.append(4)
        else:
            list.append(5)
    data2[str(2017+i)]=list

data2.to_csv("LEVEL_JSTR.csv",index=False) # 导出level至csv文件
    
# 产业发展指数
data1=pd.DataFrame(pd.read_csv("DEI_CYFZ.csv",header=0,encoding="utf8")) # 读取指数至数据框
data2=pd.DataFrame(columns=["2017","2018","2019","2020"]) # 创建空level数据框

for i in range(4):
    list=[]
    dei=np.array(data1[str(2017+i)].values) # 将指数导入列表中
    for j in range(len(dei)):
        if dei[j]<=np.percentile(dei,20):
            list.append(1)
        elif dei[j]<=np.percentile(dei,40):
            list.append(2)
        elif dei[j]<=np.percentile(dei,60):
            list.append(3)
        elif dei[j]<=np.percentile(dei,80):
            list.append(4)
        else:
            list.append(5)
    data2[str(2017+i)]=list

data2.to_csv("LEVEL_CYFZ.csv",index=False) # 导出level至csv文件

#---------------------------------------------------------------#

# 综合三类数字经济水平来看，以某些地区为代表来展示空间马尔科夫矩阵
"""
HH型：江苏、浙江
HL型：四川
LH型：江西、海南
LL型：内蒙古、甘肃、青海
"""
# 利用图反映各省市的邻接情况
import numpy as np
import math
class Graph:  # 图的表示
    def __init__(self,n):
        self.List_vertex=[] 
        self.num_vertex=n 
        self.matrix=np.full((n ,n),0) 

    def add_vertex(self,new_vertex): # 载入顶点
        self.List_vertex.append(new_vertex)
        return self.List_vertex

    def add_edge(self,index1,index2,weight=1): # 载入边（输入两个顶点在列表中的索引号，本例中情况为索引号减一）
        if index1==index2:
            print("error!")
        else:
            self.matrix[index1][index2]=weight
            self.matrix[index2][index1]=weight
            return self.matrix

    def neighbor_vertex(self,index): # 由某一顶点得到其邻接顶点
        List=[]
        for j in range(graph.num_vertex):
            if graph.matrix[index][j]==1:
                List.append(j)
        return List

List=[] # 省、直辖市编号(编号所对应省市如下依序对应，与真实数据表中序号依次减一)
for i in range(31):
    List.append(str(i))

Neighbor=[ # 邻接表
    [2,3], # 北京
    [3,1], # 天津
    [16,6,15,2,4,1,5], # 河北
    [16,27,3,5], # 山西
    [30,27,4,3,28,6,7,8], # 内蒙古
    [3,5,7], # 辽宁
    [8,6,5], # 吉林
    [7,5], # 黑龙江
    [10,11], # 上海
    [9,12,11,15], # 江苏
    [9,10,12,13,14], # 浙江
    [14,11,15,17,10,16], # 安徽
    [11,14,19], # 福建
    [18,12,11,13,19,17], # 江西
    [10,3,12,16], # 山东
    [17,12,15,27,3,4], # 河南
    [14,18,22,12,27,16], # 湖北
    [19,14,17,20,24,22], # 湖南
    [18,20,13,14,21], # 广东
    [19,24,18,25], # 广西
    [19], # 海南
    [27,17,24,18,23], # 重庆
    [25,22,24,27,28,29,26], # 四川
    [20,18,22,23,25], # 贵州
    [23,26,20,24], # 云南
    [25,23,29,31], # 西藏
    [22,17,23,16,30,4,5,28], # 陕西
    [23,29,30,27,5,31], # 甘肃
    [23,26,28,31], # 青海
    [27,5,8], # 宁夏
    [28,29,26] # 新疆
] 

graph=Graph(len(List)) # 图的实例化
for i in range(len(List)): # 载入顶点
    graph.add_vertex(List[i])

for i in range(len(Neighbor)):
    for j in range(len(Neighbor[i])):
        graph.add_edge(i,Neighbor[i][j]-1)


data1=pd.DataFrame(pd.read_csv("LEVEL_JCJS.csv",header=0,encoding="utf8"))
data2=pd.DataFrame(pd.read_csv("LEVEL_JSTR.csv",header=0,encoding="utf8"))
data3=pd.DataFrame(pd.read_csv("LEVEL_CYFZ.csv",header=0,encoding="utf8"))

# HH型邻接地区数字经济发展马尔科夫矩阵

HH=[9,10]
HH_neighbor=[]
for i in range(len(HH)):
    for j in range(len(graph.neighbor_vertex(HH[i]))):
        if graph.neighbor_vertex(HH[i])[j] not in HH_neighbor and graph.neighbor_vertex(HH[i])[j] not in HH:
            HH_neighbor.append(graph.neighbor_vertex(HH[i])[j])

print(data1["2017"][HH_neighbor])




# HL型邻接地区数字经济发展马尔科夫矩阵
HL=[22]
HL_neighbor=[]
for i in range(len(HL)):
    for j in range(len(graph.neighbor_vertex(HL[i]))):
        if graph.neighbor_vertex(HL[i])[j] not in HL_neighbor and graph.neighbor_vertex(HL[i])[j] not in HL:
            HL_neighbor.append(graph.neighbor_vertex(HL[i])[j])

# LH型邻接地区数字经济发展马尔科夫矩阵
LH=[13,20]
LH_neighbor=[]
for i in range(len(LH)):
    for j in range(len(graph.neighbor_vertex(LH[i]))):
        if graph.neighbor_vertex(LH[i])[j] not in LH_neighbor and graph.neighbor_vertex(LH[i])[j] not in LH:
            LH_neighbor.append(graph.neighbor_vertex(LH[i])[j])

# LL型邻接地区数字经济发展马尔科夫矩阵
LL=[4,27,28]
LL_neighbor=[]
for i in range(len(LL)):
    for j in range(len(graph.neighbor_vertex(LL[i]))):
        if graph.neighbor_vertex(LL[i])[j] not in LL_neighbor and graph.neighbor_vertex(LL[i])[j] not in LL:
            LL_neighbor.append(graph.neighbor_vertex(LL[i])[j])

