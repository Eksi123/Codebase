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
    
    def show_matrix(self): # 展示整个邻接矩阵
        for index in range(self.num_vertex):
            print(self.List_vertex[index]+":", end="")
            print(self.matrix[index])

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

# graph.show_matrix() # 邻接矩阵

#---------------------------------------------------------------------------# 

def Bfs_Path(graph, start_vertex): # 广度优先遍历求最短距离，输入图，起始顶点

    def neighbor_vertex(vertex): # 由某一顶点得到其邻接顶点
        List1=[]; List2=[]; index=None
        for i in range(graph.num_vertex):
            if graph.List_vertex[i]==vertex:
                index=i
                break

        for j in range(graph.num_vertex):
            if graph.matrix[index][j]==1:
                List1.append(j)

        for index in List1:
            List2.append(graph.List_vertex[index])

        return List2

    Visited=[start_vertex] # 保存已经遍历的顶点
    Distance={start_vertex:0} # 保存起始顶点到所有顶点的最短距离（边总数）
    Queue=[[start_vertex]] # 保存从起始顶点开始，逐层的邻接顶点，其所在层的层数就等于该顶点到起始顶点的距离
    count=0 # 计算距离
    while Queue:
        Sub_Queue=Queue.pop(0) # 获取某一层的顶点列表
        sub_queue=[] # 用于保存下一层的顶点
        count=count+1 
        for i in range(len(Sub_Queue)): # 遍历某一层的所有顶点，求出它们全部的邻接顶点并放入sub_queue中
            cur_vertex=Sub_Queue[i]
            for vertex in neighbor_vertex(cur_vertex):
                if vertex not in Visited:
                    Visited.append(vertex)
                    Distance[vertex]=count
                    sub_queue.append(vertex)
        if sub_queue:
            Queue.append(sub_queue) # 若下一层顶点列表不为空，则进入队列
        else:
            break # 若下一层顶点列表为空，说明所有顶点都已经遍历，则停止循环
    
    distance=[] # 从首编号（北京）开始依次保存最短距离
    for i in range(len(List)):
        distance.append(Distance[str(i)])
    return distance

D=[] # 距离矩阵
for i in range(31):
    D.append(Bfs_Path(graph,str(i)))

file=open("空间权重矩阵.csv","w",encoding="utf-8")   # 计算并保留空间权重矩阵（反距离准则：1/d^2）（两位有效数字）
for i in range(31):
    for j in range(31):
        if i==j:
            file.write(str(0)+",")
        else:
            file.write(str(round(1/(D[i][j]**2),2))+",")
    file.write("\n")

file.close()

