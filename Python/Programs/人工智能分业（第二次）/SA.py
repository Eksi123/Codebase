import numpy as np
import pandas as pd
import time
import matplotlib.pyplot as plt

# 读取距离矩阵数据文件，导出距离矩阵
def dis_matrix(file_name,sep):
    Dis_matrix = pd.read_csv(file_name, sep=sep, header=None) # sep为txt文件数据分割方式
    Dis_matrix = Dis_matrix.dropna(axis=1) # 清除末尾可能的空列
    return Dis_matrix


# 通过两城市间最大距离、城市规模来估计初始温度
def init_T(Dis_matrix):
    dis_max = np.min(np.max(Dis_matrix))
    N = Dis_matrix.shape[0]
    T_max = dis_max*N 
    return T_max

# 贪婪算法初始化路线（贪婪算法可以很快得到一个不错的初始结果，这样可以大大减少收敛时间）
def init_route(Dis_matrix):
    N = Dis_matrix.shape[0]
    Route = np.array([np.random.randint(N)]) # 起点城市为0号城市
    for i in range(N-1):
        now_city = Route[len(Route)-1]
        next_city = None
        for j in np.delete(np.arange(N),Route):
            if next_city==None or (Dis_matrix[now_city][j]<=Dis_matrix[now_city][next_city]):
                next_city = j
        Route = np.append(Route, next_city)
    return(Route)

# 计算路线总长度
def length_route(Dis_matrix,Route):
    N = len(Route)
    length = 0
    for i in range(N-1):
        length = length+Dis_matrix[Route[i]][Route[i+1]]
    return length

# 产生新解，变换程度越大，以该方式产生新解的概率就越小，这样就保证了搜索的稳定性，又不至于缩减搜索空间
def create_new_route(Route):
    # 方式1：交换邻近的两个城市（变化最小）
    def new_route1(Route):
        N = len(Route)
        sp = np.random.randint(N-1)
        Route[sp],Route[sp+1] = Route[sp+1],Route[sp]
        return Route

    # 方式2：交换任意两个城市（变化适中）
    def new_route2(Route):
        N = len(Route)
        sp = np.random.randint(N,size=2)
        Route[sp[0]],Route[sp[1]] = Route[sp[1]],Route[sp[0]]
        return Route

    # 方式3：将任意两城市中间的城市逆序（变化最大）
    def new_route3(Route):
        N = len(Route)
        sp = np.random.randint(N,size=2)
        min = np.min(sp); max = np.max(sp)
        route_part = np.array([])
        for i in range(max,min-1,-1):
            route_part = np.append(route_part,Route[i])
        Route = np.append(np.append(Route[:min],route_part),Route[max+1:])
        return Route

    p = np.random.rand()
    if p<=0.5:
        return new_route1(Route)
    elif p<=0.8:
        return new_route2(Route)
    else:
        return new_route3(Route)

def TSP(file_name,sep):
    Dis_matrix = dis_matrix(file_name,sep) # 读取距离矩阵
    run_time = 0 # 程序执行时间
    T_max = init_T(Dis_matrix) # 初始温度
    T_min = 1 # 最低温度
    T = T_max # 当前温度
    alpha = 0.99 # 退火系数
    L = 2000; # 当前温度下内循环次数
    best_route = init_route(Dis_matrix) # 全局最优解
    cur_route = init_route(Dis_matrix) # 当前解

    Length = [] # 记录最优解路线长度
    times = 0 # 退火次数（降温次数）

    while T>T_min and run_time<3600:
        start_time =time.time()
        for i in range(L):
            new_route = create_new_route(cur_route)
            dis0 = length_route(Dis_matrix,cur_route)
            dis1 = length_route(Dis_matrix,new_route)
            dis2 = length_route(Dis_matrix,best_route)
            df = dis1-dis0
            if df>=0: 
                p = np.random.rand()
                if p < 1/(np.exp(df / T)):
                    cur_route = new_route.copy()
            else:
                cur_route = new_route.copy()
            
            if dis1<dis2:
                best_route = new_route.copy()

        cur_route = best_route.copy() 
        T = T*alpha
        times = times+1
        Length.append(length_route(Dis_matrix,cur_route))
        end_time = time.time()
        run_time = run_time + end_time-start_time
        print(T,length_route(Dis_matrix,best_route))
    print("best_route : ",best_route,"\n"+"length : ",length_route(Dis_matrix,best_route))
    plt.plot(np.arange(times),Length)
    plt.xlabel("times")
    plt.ylabel("length_route")
    plt.show()