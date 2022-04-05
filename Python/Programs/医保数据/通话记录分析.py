# 0 数据预处理

# 导入模块与读取数据
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.signal import savgol_filter

data=pd.DataFrame(pd.read_csv("data/通话记录.csv", header=0, encoding="utf-8", low_memory=False)) # 读取为数据表
data=data[pd.isnull(data["queueId"])==False] # 数据筛选[只考虑人工渠道]

# print(data.info()) # 查看数据表信息
"""
<class 'pandas.core.frame.DataFrame'>
Int64Index: 131705 entries, 1 to 180861
Data columns (total 35 columns):
 #   Column             Non-Null Count   Dtype
---  ------             --------------   -----
 0   id                 131705 non-null  int64
 1   answeredTime       40192 non-null   object
 2   callAccept         131705 non-null  object
 3   callDuration       131705 non-null  int64
 4   callType           131705 non-null  object
 5   callerIdName       131705 non-null  object
 6   callerIdNumber     131705 non-null  float64
 7   createdTime        131705 non-null  object
 8   day                131705 non-null  int64
 9   dealFlag           131705 non-null  int64
 10  destinationNumber  131705 non-null  object
 11  gateWay            131670 non-null  float64
 12  groupId            131705 non-null  float64
 13  hangupSide         129242 non-null  object
 14  hour               131705 non-null  int64
 15  ivrDtmf            129419 non-null  object
 16  loginNo            41491 non-null   object
 17  month              131705 non-null  int64
 18  otherAccept        40546 non-null   object
 19  otherStr           2188 non-null    object
 20  otherlegAnswer     0 non-null       float64
 21  overTime           131705 non-null  object
 22  queueId            131705 non-null  float64
 23  recordUrl          40192 non-null   object
 24  recordingFileName  40192 non-null   object
 25  reday              131705 non-null  int64
 26  status             131705 non-null  int64
 27  waitDuration       131705 non-null  int64
 28  year               131705 non-null  int64
 29  wfId               37225 non-null   object
 30  aiCallDuration     131705 non-null  int64
 31  beginAiTime        2302 non-null    object
 32  callWay            131705 non-null  int64
 33  endAiTime          2302 non-null    object
 34  queueWaitTime      131705 non-null  int64
dtypes: float64(5), int64(13), object(17)
memory usage: 36.2+ MB
"""

# 将DataFrame转为Series以提高数据处理效率, index默认为有序数字
s_callerIdNumber=pd.Series(data["callerIdNumber"].values, name="callerIdNumber") 
s_createdTime=pd.Series(data["createdTime"].values, name="createdTime") 
s_day=pd.Series(data["day"].values, name="day")
s_hour=pd.Series(data["hour"].values, name="hour")
s_queueWaitTime=pd.Series(data["queueWaitTime"].values, name="queueWaitTime")
s_answeredTime=pd.Series(data["answeredTime"].values, name="answeredTime")
s_callDuration=pd.Series(data["callDuration"].values, name="callDuration")

#-----------------------------------------------------------------------------------------#

# 1 考察每时刻（精确到分钟）电话平均呼叫接听情况（不考虑周末和下班时间）
call_times={}; receive_times={} # 用于保存呼叫次数和接听次数

length=s_createdTime.shape[0]
for i in range(length):
    if (s_day[i] not in [6,7,13,14,20,21]) and (s_hour[i] in np.arange(8,17+1)): # 如果不属于周末以及下班时间内

        hour_0=s_createdTime[i][-8:-6]; minute_0=s_createdTime[i][-5:-3]
        if hour_0 in call_times: 
            call_times[hour_0][minute_0]=call_times[hour_0].get(minute_0,0)+1
        else:
            call_times[hour_0]={minute_0:1}
        

        if pd.isnull(s_answeredTime[i])==False: # 进一步，如果电话接通
            hour_1=s_answeredTime[i][-8:-6];  minute_1=s_answeredTime[i][-5:-3]
            if hour_1 in receive_times:
                receive_times[hour_1][minute_1]=receive_times[hour_1].get(minute_1,0)+1
            else:
                receive_times[hour_1]={minute_1:1}
            

times_0=np.array([]); times_1=np.array([]); # 根据call_times和receive_times的数据，来统计每时刻平均呼叫接听次数
for hour in range(8,17+1):
    hour=("0"+str(hour))[-2:]
    for minute in range(0,59+1):
        minute=("0"+str(minute))[-2:]
        times_0=np.append(times_0, call_times[hour].get(minute,0)/20)
        times_1=np.append(times_1, receive_times[hour].get(minute,0)/20)


times_00=savgol_filter(times_0,59,3,mode="nearest") # 对原数据作平滑处理
times_11=savgol_filter(times_1,59,3,mode="nearest")
call_receive=times_11/times_00 # 求接收频数之比


fig=plt.figure() # 绘制matplotlib画布
axes1=fig.add_subplot(2,1,1) # 子画布1
axes2=fig.add_subplot(2,1,2) # 子画布2

X=np.arange(1,600+1) # X轴数据

axes1.bar(X,times_0,label='call')
axes1.bar(X,times_1,label='receive')
axes1.plot(X,times_00,color="blue")
axes1.plot(X,times_11,color="red")
axes1.set_xlabel("call & receive by minute") # X轴标签
axes1.set_ylabel("frequency") # Y轴标签
axes1.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17]) # X轴刻度
axes1.set_yticks(range(0,18+1,2)) # Y轴刻度
axes1.legend(loc="upper right") # 图例

axes2.plot(X,call_receive,label="ratio")
axes2.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
axes2.set_xlabel("receive / call")
axes2.set_ylabel("ratio")

plt.show()

#-----------------------------------------------------------------------------------------#
data1=pd.DataFrame(pd.read_csv("data/工单列表.csv", header=0, encoding="gbk",low_memory=False))

s_callerNumber=pd.Series(data1["callerNumber"].values, name="callerNumber") 
s_appealType=pd.Series(data1["appealType"].values, name="appealType") 

Type={}
length1=s_callerNumber.shape[0]
for i in range(length1):
    Type[s_callerNumber[i]]=s_appealType[i]


# 2 考察重播电话情况（号码、来源、日期和次数）
file=open("data/重播情况.csv","w",encoding="utf-8")
recall={} # 保存重播电话,日期和对应次数

length=s_createdTime.shape[0]
for i in range(length):
    number=int(s_callerIdNumber[i])
    if number>10000000 and pd.isnull(s_answeredTime[i])==False: # 电话号码长度少于8位数的可能是测试号不管，未接通的不管。
        date=s_answeredTime[i].split("/")[0] # 取日期
        if number in recall:
            recall[number][date]=recall[number].get(date,0)+1 # 根据日期计数
        else:
            recall[number]={date:1}

def fun(x): # 函数：汇总重播次数
    sum=0
    for key in x:
        sum=sum+x[key]
    return sum

recall=sorted(recall.items(), key=lambda x: fun(x[1]), reverse=True)  # 根据重播次数排序（从大到小）

for i in range(len(recall)): # 写入文件
    file.write(str(recall[i][0])+"/"+Type.get(str(recall[i][0]),"NA")+":"+"\t")
    for key in recall[i][1]:
        file.write(str(key)+"->"+str(recall[i][1][key])+"s"+"\t")
    file.write("\n")

file.close()

#-----------------------------------------------------------------------------------------#
# 3 考察电话等待与通话的队列规律-随机过程 构建概率模型以合理安排不同时段最少服务人员，节省人力并提高接听效率


