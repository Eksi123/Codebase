import numpy as np
import pandas as pd
from geographiclib.geodesic import Geodesic
from geopy.distance import geodesic
from scipy.interpolate import interp1d
import math

# 1.坐标系转换
"""
国际上通用的经纬度坐标系为WGS84（地球坐标系）,而我国采用的坐标系为GCJ-02（火星坐标系），因此在调用如高德、
腾讯地图时，需要先将WGS84坐标系下的经纬度转为GCJ-02坐标系下的经纬度
"""
def wgs84_to_gcj02(lng, lat):
    x_pi = 3.14159265358979324 * 3000.0 / 180.0
    pi = 3.1415926535897932384626  # π
    a = 6378245.0  # 长半轴
    ee = 0.00669342162296594323  # 偏心率平方

    def _transformlat(lng, lat):
        ret = -100.0 + 2.0 * lng + 3.0 * lat + 0.2 * lat * lat + 0.1 * lng * lat + 0.2 * math.sqrt(math.fabs(lng))
        ret += (20.0 * math.sin(6.0 * lng * pi) + 20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0
        ret += (20.0 * math.sin(lat * pi) + 40.0 * math.sin(lat / 3.0 * pi)) * 2.0 / 3.0
        ret += (160.0 * math.sin(lat / 12.0 * pi) + 320 * math.sin(lat * pi / 30.0)) * 2.0 / 3.0
        return ret

    def _transformlng(lng, lat):
        ret = 300.0 + lng + 2.0 * lat + 0.1 * lng * lng + 0.1 * lng * lat + 0.1 * math.sqrt(math.fabs(lng))
        ret += (20.0 * math.sin(6.0 * lng * pi) + 20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0
        ret += (20.0 * math.sin(lng * pi) + 40.0 * math.sin(lng / 3.0 * pi)) * 2.0 / 3.0
        ret += (150.0 * math.sin(lng / 12.0 * pi) + 300.0 * math.sin(lng / 30.0 * pi)) * 2.0 / 3.0
        return ret

    dlat = _transformlat(lng - 105.0, lat - 35.0)
    dlng = _transformlng(lng - 105.0, lat - 35.0)
    radlat = lat / 180.0 * pi
    magic = math.sin(radlat)
    magic = 1 - ee * magic * magic
    sqrtmagic = math.sqrt(magic)
    dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi)
    dlng = (dlng * 180.0) / (a / sqrtmagic * math.cos(radlat) * pi)
    mglat = lat + dlat
    mglng = lng + dlng
    return(mglng, mglat)


def gcj02_to_wgs84(lng, lat):
    x_pi = 3.14159265358979324 * 3000.0 / 180.0
    pi = 3.1415926535897932384626  # π
    a = 6378245.0  # 长半轴
    ee = 0.00669342162296594323  # 偏心率平方

    def _transformlat(lng, lat):
        ret = -100.0 + 2.0 * lng + 3.0 * lat + 0.2 * lat * lat + 0.1 * lng * lat + 0.2 * math.sqrt(math.fabs(lng))
        ret += (20.0 * math.sin(6.0 * lng * pi) + 20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0
        ret += (20.0 * math.sin(lat * pi) + 40.0 * math.sin(lat / 3.0 * pi)) * 2.0 / 3.0
        ret += (160.0 * math.sin(lat / 12.0 * pi) + 320 * math.sin(lat * pi / 30.0)) * 2.0 / 3.0
        return ret

    def _transformlng(lng, lat):
        ret = 300.0 + lng + 2.0 * lat + 0.1 * lng * lng + 0.1 * lng * lat + 0.1 * math.sqrt(math.fabs(lng))
        ret += (20.0 * math.sin(6.0 * lng * pi) + 20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0
        ret += (20.0 * math.sin(lng * pi) + 40.0 * math.sin(lng / 3.0 * pi)) * 2.0 / 3.0
        ret += (150.0 * math.sin(lng / 12.0 * pi) + 300.0 * math.sin(lng / 30.0 * pi)) * 2.0 / 3.0
        return ret

    dlat = _transformlat(lng - 105.0, lat - 35.0)
    dlng = _transformlng(lng - 105.0, lat - 35.0)
    radlat = lat / 180.0 * pi
    magic = math.sin(radlat)
    magic = 1 - ee * magic * magic
    sqrtmagic = math.sqrt(magic)
    dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi)
    dlng = (dlng * 180.0) / (a / sqrtmagic * math.cos(radlat) * pi)
    mglat = lat + dlat
    mglng = lng + dlng
    return [lng * 2 - mglng, lat * 2 - mglat]


# 2.轨迹去噪
"""
轨迹去噪分为两部分同时进行：噪声点识别+噪声点的替换

噪声点识别：噪声点简单理解即是与正常轨迹点相异的点，表现为前一轨迹点与噪声点的距离大于或者小于它与正常轨迹点的距离。显然我们并不知道正常轨迹点
的位置，因此只能利用间接的方法识别噪声点，具体如下：结合车速、时间间隔估算前一轨迹点与后一“正常轨迹点”的距离，将该距离与计算的前后两轨迹点
直线距离作比较，若计算距离与估算距离差值不大于某个阈值（5米），则认为后一轨迹点是正常的，反之则为噪声点。

噪声点识别：采用噪声点前后两组轨迹点作三次样条插值数据，分别就经度和纬度对噪声点位置进行插值

注：考虑到插值计算的需要，故轨迹数据前两项和最后两项不判定为噪声点
"""
def denoise(df):
    length = df.shape[0]
    i = 2
    while i<length-2:
        dis = geodesic((df["latitude"][i], df["longitude"][i]), (df["latitude"][i-1], df["longitude"][i-1])).km
        time_gap = (df["datetime"][i]-df["datetime"][i-1]).seconds/3600
        speed_max = np.max([df["veh_speed"][i],df["veh_speed"][i-1]])
        dis_max = speed_max*time_gap
        if dis-dis_max>0.005: 
            lati = [df["latitude"][i-2], df["latitude"][i-1], df["latitude"][i+1], df["latitude"][i+2]]
            long = [df["longitude"][i-2], df["longitude"][i-1], df["longitude"][i+1], df["longitude"][i+2]]
            X0 = [1,2,4,5]
            fun_lati = interp1d(X0,lati, kind="cubic")
            fun_long = interp1d(X0,long, kind="cubic")
            dis1 = geodesic((fun_lati(3), fun_long(3)), (df["latitude"][i-1], df["longitude"][i-1])).km
            if dis1<1:
                df["latitude"][i] = fun_lati(3)
                df["longitude"][i] = fun_long(3)
                i = i+1
            else:
                df = pd.DataFrame(df.drop(labels=i).values,columns=df.columns)
                length = length-1
        else:
            i = i+1
    return(df)


# 3.停留点识别与提取
"""
对停留点的理解：在某个很小的区域范围内行动时间很长，最极端的即在某个点呆着一动不动很长时间。

针对车辆轨迹数据停留点的识别，我们采取的是依据前后两轨迹点时差规则判定停留点的方法，这种方法简单且效率高，用于识别出汽车停止行驶时的停留位置。
此处我们设定时差阈值为20分钟

输出结果为一数据框，包含停留点id、stay_time、latitude、longitude、stay_duration、date_notes（日期备注）六个特征
"""
def stay_points(df,vin):
    df_s = pd.DataFrame(columns=["vin","datetime","latitude","longitude","stay_duration"])
    length = df.shape[0]
    sp = 0 # 数据框行索引号
    for i in range(length-1): 
        stay_duration =  (df["datetime"][i+1]-df["datetime"][i]).seconds/60
        if stay_duration>=20:
            sp = sp+1
            df_s.loc[str(sp)] = [vin, df["datetime"][i], df["latitude"][i], df["longitude"][i], stay_duration]
    return df_s


# 4.停留点聚类
"""
DBSCAN聚类算法:
优点: 最重要的优点在于不需要预设聚类簇数目，且能过滤掉孤立的噪声点（理解为不经常去的“停留点”）
缺点: 算法自身的缺陷在于需要给定领域半径radius和最少点数目minpoints，但在停留点聚类这一现实背景下，
我们或许可以结合生活经验给出一个比较合理的参数（如radius=0.1km, minpoints=10)

鉴于停留点相似性度量采取的是经纬度距离，与一般的欧几里得距离不同，因此建议修改现成的DBSCAN聚类算法
"""
def DBSCAN(df,eps,min_pts):
    """
    寻找邻居:遍历每个样本，如果两两距离不超过eps，则认为它们是邻居，最后返回包含每个样本所有邻居的字典
    """
    neighbor_list = {}
    length = df.shape[0]
    for i in range(length):
        neighbor_list[i] = []
        for j in range(length):
            dis = geodesic((df["latitude"][i], df["longitude"][i]), (df["latitude"][j], df["longitude"][j])).km # 计算经纬坐标距离
            if dis <= eps:
                neighbor_list[i].append(j)
    
    """
    聚类工作：遍历每个样本，首先判断其是否为核心对象，然后对未扩展过的核心对象进行扩展，形成不同聚类簇
    """
    cluster_list = np.array([-1]*len(neighbor_list)) # 默认所有样本初始均为非簇内点（用-1表示）
    clu_name = 0 # 簇的名称（0、1、2、3……）
    for i in neighbor_list: 
        if len(neighbor_list[i])>=min_pts and cluster_list[i]==-1:
            """
            如果样本i邻居数不小于min_pts，则它为核心对象，从它开始
            递归地扩展所有密度直达，可达及相连样本到同一簇内
            """
            member = [i]
            while len(member)>0:
                cur = member.pop(0)
                if cluster_list[cur]==-1:
                    member = member+neighbor_list[cur]
                    cluster_list[cur] = clu_name
            clu_name = clu_name+1
    return cluster_list


# 5.子轨迹提取（轨迹压缩+分段）
"""
算法思路：
1 求中间点到两端点连线的垂直欧式距离，这里可以考虑用海伦公式先求出三角形面积X2，然后除以两端点连线长度，从而求得中间点的垂直欧氏距离
2 找出最大垂直欧氏距离所对应的那个中间点，若该距离大于给定阈值，则从这个点开始将轨迹点一分为二，其作为上一段连线的终点以及下一段连线的起点；
若该距离小于给定阈值，则拟用首尾连线代替所有中间点的轨迹，中间点全部剔除。
3 用两个栈分别保存轨迹起点和终点，若起点至某中间点的轨迹已经是最简压缩，则将该中间点从终点栈转移至起点栈，否则继续深入寻找中间点，最终
起点栈（加上轨迹终点）即包含了所有最简压缩的中间点。
4 从第一段压缩后的轨迹线开始，计算累积转向角，若转向角超过某阈值，则作分割，两分割点间的轨迹则为我们所需的子轨迹
5 可新建某一特征，位于同一子轨迹上的点特征值相同，用这种方法可保存子轨迹
"""
def sub_trajectory(df,eps,angle):
    """
    计算垂直欧氏距离（海伦公式）
    """
    def ver_dis(start,end,midpoint):
        edge1 = geodesic((start["latitude"], start["longitude"]), (end["latitude"], end["longitude"])).km  
        edge2 = geodesic((start["latitude"], start["longitude"]), (midpoint["latitude"], midpoint["longitude"])).km 
        edge3 = geodesic((midpoint["latitude"], midpoint["longitude"]),(end["latitude"], end["longitude"])).km
        p = (edge1+edge2+edge3)/2
        try:
            s =  math.sqrt(p*(p-edge1)*(p-edge2)*(p-edge3))
        except Exception:
            s = 0 
        h = (2*s)/edge1
        return h

    """
    压缩轨迹，返回压缩后的轨迹点数据(Douglas-Peucker算法)
    """     
    Start = [0]; End = [df.shape[0]-1] # 轨迹起点栈与终点栈
    while len(End)>0:
        start_sp = Start[len(Start)-1]; end_sp = End[len(End)-1] # 取出栈顶起点和终点的索引
        start = df.iloc[start_sp,:]; end = df.iloc[end_sp,:]
        max_dis = 0; max_sp = 0
        for sp in range(start_sp+1,end_sp): # 返回起点与终点间最大中间点垂直距离，及其对应索引
            midpoint = df.iloc[sp,:]
            dis = ver_dis(start,end,midpoint)
            if dis>max_dis:
                max_dis = dis
                max_sp = sp
        if max_dis>eps: # 如果最大距离大于阈值，则终点栈添加新索引；反之将当前终点索引转移至起点栈，直至最后压缩完毕，终点栈为空
            End.append(max_sp)
        else:
            Start.append(End.pop())

    """
    轨迹分段，返回分段后轨迹点数据框，新特征用于表示压缩后各轨迹点属于哪一段子轨迹
    """
    length = len(Start)
    Sp = [Start[0],Start[1]] # 用于保存压缩分段后的轨迹点索引
    Trajectory = [0,0] # 用于表示轨迹点属于哪一段子轨迹
    """
    flag1用于表示分割起点，flag2用于表示当前分割点，若两直线轨迹夹角小于阈值，则flag2前移；反之flag2为分割终点，
    根据flag1和flag2的位置来分割子轨迹
    注意：前一段子轨迹的终点与后一段子轨迹的起点为同一轨迹点，即首尾轨迹点重复。
    """
    sub_name = 0 # 子轨迹名称
    flag1 = 0; flag2 = 1 
    while flag2<length-1:
        theta1 = Geodesic.WGS84.Inverse(df["latitude"][Start[flag1]],df["longitude"][Start[flag1]],
        df["latitude"][Start[flag1+1]],df["longitude"][Start[flag1+1]])["azi1"]
        theta2 = Geodesic.WGS84.Inverse(df["latitude"][Start[flag2]],df["longitude"][Start[flag2]],
        df["latitude"][Start[flag2+1]],df["longitude"][Start[flag2+1]])["azi1"]
        if abs(theta1-theta2)>180: # 计算夹角值
            theta = 360-abs(theta1-theta2)
        else:
            theta = abs(theta1-theta2)

        if theta<angle: # 如果flag2所在位置不为子轨迹终点，则flag2前移
            flag2 = flag2+1
            Trajectory.append(sub_name)
            Sp.append(Start[flag2])
        else: # 如果flag2所在位置为子轨迹终点，则flag2前移并且flag1定位到原flag2位置
            flag1 = flag2
            flag2 = flag2+1
            sub_name = sub_name+1
            Trajectory = Trajectory+[sub_name,sub_name]  
            Sp = Sp+[Start[flag1],Start[flag2]]  
    data = np.append(df.iloc[Sp,2:].values.T, np.array([Trajectory]),axis=0).T                                                                                                                              
    column = np.append(df.iloc[Sp,2:].columns,np.array(["trajectory_name"]))
    df = pd.DataFrame(data,columns=column)
    return df
        

# 6.1 轨迹相似性度量(思路一：计算量太大)
"""
轨迹相似性度量的基本原则：长度不同的两条轨迹，整体上越“共线”，相似性越高。特别的，当一条轨迹与另一条轨迹处在同一直线时，相似性最高
算法思路：
1 计算轨迹外一点到某轨迹所有线段上（两轨迹点组成线段）的垂直距离，选出其中最小值作为该点到轨迹的距离
2 在1的基础上，计算一条轨迹上所有轨迹点到另一条轨迹的平均距离，作为前一条轨迹到后一条轨迹的距离
3 在2的基础上，求两条轨迹分别到另一条轨迹的距离，计算平均值作为两轨迹的距离，也即相似度（距离越小，相似度越高）

优点：与传统的通过衡量两轨迹的接近程度来计算相似度相比，还考虑了两轨迹近似处在同一直线的情况（不接近），这表示同一
路段上的两轨迹，不管接近与否，相似性都很高。
缺点：计算量较大，许多次计算垂直距离，算法时间复杂度远高于最基础的欧氏距离度量法
"""
def simularity1(tr1,tr2):
    """
    计算垂直欧氏距离（海伦公式）
    """
    def ver_dis(start,end,midpoint):
        edge1 = geodesic((start["latitude"], start["longitude"]), (end["latitude"], end["longitude"])).km  
        edge2 = geodesic((start["latitude"], start["longitude"]), (midpoint["latitude"], midpoint["longitude"])).km 
        edge3 = geodesic((midpoint["latitude"], midpoint["longitude"]),(end["latitude"], end["longitude"])).km
        p = (edge1+edge2+edge3)/2
        try:
            s =  math.sqrt(p*(p-edge1)*(p-edge2)*(p-edge3))
        except Exception:
            s = 0 
        h = (2*s)/edge1
        return h

    """
    计算轨迹外一点到轨迹的距离
    """
    def min_dis(midpoint,tr):
        length = tr.shape[0]-1
        Dis = np.array([])
        for i in range(length):
            Dis = np.append(Dis,ver_dis(tr.loc[i] ,tr.loc[i+1], midpoint))
        return np.min(Dis)
    
    """
    计算两轨迹相似度
    """
    Dis1_2 = np.array([])
    length1 = tr1.shape[0]; length2 = tr2.shape[0]
    for i in range(length1):
        Dis1_2 = np.append(Dis1_2, min_dis(tr1.loc[i], tr2))
    for j in range(length2):
        Dis1_2 = np.append(Dis1_2, min_dis(tr2.loc[j], tr1))
    return np.mean(Dis1_2)

# 6.2 轨迹相似性度量(思路二：精度差一些)
def simularity2(tr1,tr2):
    """
    计算垂直欧氏距离（海伦公式）
    """
    def ver_dis(start,end,midpoint):
        edge1 = geodesic((start["latitude"], start["longitude"]), (end["latitude"], end["longitude"])).km  
        edge2 = geodesic((start["latitude"], start["longitude"]), (midpoint[0], midpoint[1])).km 
        edge3 = geodesic((midpoint[0], midpoint[1]),(end["latitude"], end["longitude"])).km
        p = (edge1+edge2+edge3)/2
        try:
            s =  math.sqrt(p*(p-edge1)*(p-edge2)*(p-edge3))
        except Exception:
            s = 0 
        h = (2*s)/edge1
        return h

    """
    求两轨迹重心
    """
    core1 = [np.mean(tr1["latitude"].values), np.mean(tr1["longitude"].values)]
    core2 = [np.mean(tr2["latitude"].values), np.mean(tr2["longitude"].values)]
    """
    """
    dis1_2 = ver_dis(tr2.loc[0],tr2.loc[tr2.shape[0]-1],core1)
    dis2_1 = ver_dis(tr1.loc[0],tr1.loc[tr1.shape[0]-1],core2)
    return (dis1_2+dis2_1)/2


# 7 子轨迹聚类
"""
DBSCAN聚类算法:
优点: 最重要的优点在于不需要预设聚类簇数目，且能过滤掉孤立的子轨迹（理解为不经常走的“路段”）
缺点: 算法自身的缺陷在于需要给定领域半径radius和最少点数目minpoints，但在停留点聚类这一现实背景下，
我们或许可以结合生活经验给出一个比较合理的参数（如radius=0.02km, minpoints=20)
"""
def DBSCAN_trajectory(list,eps,min_pts):
    """
    寻找邻居:遍历每个样本，如果两两距离不超过eps，则认为它们是邻居，最后返回包含每个样本所有邻居的字典
    """
    neighbor_list = {}
    length = len(list)
    for i in range(length):
        neighbor_list[i] = []
        for j in range(length):
            dis = simularity2(list[i],list[j]) # 计算两轨迹距离
            if dis <= eps:
                neighbor_list[i].append(j)
    
    """
    聚类工作：遍历每个样本，首先判断其是否为核心对象，然后对未扩展过的核心对象进行扩展，形成不同聚类簇
    """
    cluster_list = np.array([-1]*len(neighbor_list)) # 默认所有样本初始均为非簇内点（用-1表示）
    clu_name = 0 # 簇的名称（0、1、2、3……）
    for i in neighbor_list: 
        if len(neighbor_list[i])>=min_pts and cluster_list[i]==-1:
            """
            如果样本i邻居数不小于min_pts，则它为核心对象，从它开始
            递归地扩展所有密度直达，可达及相连样本到同一簇内
            """
            member = [i]
            while len(member)>0:
                cur = member.pop(0)
                if cluster_list[cur]==-1:
                    member = member+neighbor_list[cur]
                    cluster_list[cur] = clu_name
            clu_name = clu_name+1
    return cluster_list

