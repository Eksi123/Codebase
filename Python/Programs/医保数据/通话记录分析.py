"""
分析对象：data中的"通话记录.csv"
        选择特征"callerIdNumber", "createdTime", "day", "hour", "queueWaitTime", "answeredTime", "callDuration"
        构造新特征"call_answer_ratio", "duration_waittime_ratio"
        数据筛选条件为"queueId != 0"

分析目标：平均每天每时每分钟电话接收频数分布，人工等待、通话平均时长分布（剔除周末数据，以及每天正常上班之外的数据）
         重播电话接收时间，，等待与通话时长
         
步骤：
【1】筛选数据及特征处理
【2】分析
【3】绘图
【4】结论及总结
"""
# 导入模块与读取数据
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.signal import savgol_filter

data=pd.DataFrame(pd.read_csv("data/通话记录.csv", header=0, encoding="utf-8"))
data=data[pd.isnull(data["queueId"])==False] # 数据筛选
# print(data.info())
"""
<class 'pandas.core.frame.DataFrame'>
Int64Index: 131705 entries, 1 to 180861
Data columns (total 35 columns):
 #   Column             Non-Null Count   Dtype
---  ------             --------------   -----
 0   id                 131705 non-null  float64
 1   answeredTime       40192 non-null   object
 2   callAccept         131705 non-null  object
 3   callDuration       131705 non-null  float64
 4   callType           131705 non-null  object
 5   callerIdName       131705 non-null  object
 6   callerIdNumber     131705 non-null  float64
 7   createdTime        131705 non-null  object
 8   day                131705 non-null  float64
 9   dealFlag           131705 non-null  float64
 10  destinationNumber  131705 non-null  object
 11  gateWay            131670 non-null  float64
 12  groupId            131705 non-null  float64
 13  hangupSide         129242 non-null  object
 14  hour               131705 non-null  float64
 15  ivrDtmf            129419 non-null  object
 16  loginNo            41491 non-null   object
 17  month              131705 non-null  float64
 18  otherAccept        40546 non-null   object
 19  otherStr           2188 non-null    object
 20  otherlegAnswer     0 non-null       float64
 21  overTime           131705 non-null  object
 22  queueId            131705 non-null  float64
 23  recordUrl          40192 non-null   object
 24  recordingFileName  40192 non-null   object
 25  reday              131705 non-null  float64
 26  status             131705 non-null  float64
 27  waitDuration       131705 non-null  float64
 28  year               131705 non-null  float64
 29  wfId               37225 non-null   object
 30  aiCallDuration     131705 non-null  float64
 31  beginAiTime        2302 non-null    object
 32  callWay            131705 non-null  float64
 33  endAiTime          2302 non-null    object
 34  queueWaitTime      131705 non-null  float64
dtypes: float64(18), object(17)
memory usage: 36.2+ MB
None
"""
# 将DataFrame转为Series以提高数据处理效率, index默认为有序数字
s_callerIdNumber=pd.Series(data["callerIdNumber"].values, name="callerIdNumber") 
s_createdTime=pd.Series(data["createdTime"].values, name="createdTime") 
s_day=pd.Series(data["day"].values, name="day")
s_hour=pd.Series(data["hour"].values, name="hour")
s_queueWaitTime=pd.Series(data["queueWaitTime"].values, name="queueWaitTime")
s_answeredTime=pd.Series(data["answeredTime"].values, name="answeredTime")
s_callDuration=pd.Series(data["callDuration"].values, name="callDuration")

# 【第一部分】
# 获取平均每天每时每分钟电话接收次数，等待与通话平均时长
call_times={}; receive_times={} # 用于保存呼叫次数和接听次数
wait_duration={}; busy_duration={} # 用于保存等待时长与通话时长

length=s_createdTime.shape[0]
for i in range(length):
    if (s_day[i] not in [6,7,13,14,20,21]) and (s_hour[i] in np.arange(8,18)): # 如果不属于周末以及非正常上班时间内

        hour_0=s_createdTime[i][-8:-6]; minute_0=s_createdTime[i][-5:-3]
        if hour_0 in call_times: 
            call_times[hour_0][minute_0]=call_times[hour_0].get(minute_0,0)+1
        else:
            call_times[hour_0]={minute_0:1}
        
        if hour_0 in wait_duration:
            wait_duration[hour_0][minute_0]=wait_duration[hour_0].get(minute_0,0)+s_queueWaitTime[i]
        else:
            wait_duration[hour_0]={minute_0:s_queueWaitTime[i]}

        if pd.isnull(s_answeredTime[i])==False: # 如果电话接通
            hour_1=s_answeredTime[i][-8:-6];  minute_1=s_answeredTime[i][-5:-3]
            if hour_1 in receive_times:
                receive_times[hour_1][minute_1]=receive_times[hour_1].get(minute_1,0)+1
            else:
                receive_times[hour_1]={minute_1:1}
            
            if hour_1 in busy_duration:
                busy_duration[hour_1][minute_1]=busy_duration[hour_1].get(minute_1,0)+s_callDuration[i]
            else:
                busy_duration[hour_1]={minute_1:s_callDuration[i]}

times_0=np.array([]); times_1=np.array([]); # 根据call_times和receive_times的数据，来统计平均每天每时每分钟接收次数
duration_0=np.array([]); duration_1=np.array([]); # 根据wait_duration和busy_duration的数据，来统计平均每天每时每分钟等待与通话时长
for hour in range(8,17+1):
    hour=("0"+str(hour))[-2:]
    for minute in range(0,59+1):
        minute=("0"+str(minute))[-2:]
        times_0=np.append(times_0, call_times[hour].get(minute,0)/20)
        times_1=np.append(times_1, receive_times[hour].get(minute,0)/20)
        duration_0=np.append(duration_0, wait_duration[hour].get(minute,0)/20)
        duration_1=np.append(duration_1, busy_duration[hour].get(minute,0)/20)

duration_0=duration_0/times_0 # 求等待平均时长，单位（秒）
duration_1=duration_1/(times_1+np.full(600,0.001)) # 求通话平均时长，单位（秒），为避免零除问题，times_1中各项加上0.001
 
times_00=savgol_filter(times_0,59,3,mode="nearest") # 对原数据作平滑处理
times_11=savgol_filter(times_1,59,3,mode="nearest")
duration_00=savgol_filter(duration_0,59,3,mode="nearest")
duration_11=savgol_filter(duration_1,59,2,mode="nearest")
call_receive=times_11/times_00 # 求接收频数之比
wait_busy=duration_11/duration_00 # 求等待与通话时长之比


fig1=plt.figure()
axes1=fig1.add_subplot(2,1,1)
axes2=fig1.add_subplot(2,1,2)

X=np.arange(1,600+1)

axes1.bar(X,times_0,label='call')
axes1.bar(X,times_1,label='receive')
axes1.plot(X,times_00,color="blue")
axes1.plot(X,times_11,color="red")
axes1.set_xlabel("call & receive by minute")
axes1.set_ylabel("frequency")
axes1.set_yticks(range(0,18+1,2))
axes1.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
axes1.legend(loc="upper right")

axes2.bar(X,duration_1,label='busy')
axes2.bar(X,duration_0,label='wait')
axes2.plot(X,duration_00,color="red")
axes2.plot(X,duration_11,color="blue")
axes2.set_xlabel("wait & busy by minute")
axes2.set_ylabel("secend")
axes2.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
axes2.legend(loc="upper right")

fig2=plt.figure()
axes1=fig2.add_subplot(2,1,1)
axes2=fig2.add_subplot(2,1,2)

X=np.arange(1,600+1)

axes1.plot(X,call_receive,label="ratio")
axes1.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
axes1.set_xlabel("receive / call")
axes1.set_ylabel("ratio")

axes2.plot(X,wait_busy,label="ratio")
axes2.set_xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
axes2.set_xlabel("busy / wait")
axes2.set_ylabel("ratio")

# plt.show()

# 【第二部分】
file=open("电话重播情况.csv","w",encoding="utf-8")
call_number={} # 保存重播电话接收时间，等待与通话时长

length=s_createdTime.shape[0]
for i in range(length):
    number=int(s_callerIdNumber[i])

    if number in call_number:
        call_number[number].append(str(s_createdTime[i])+"&"+str(s_answeredTime[i])+"&"+str(s_queueWaitTime[i])+"&"+str(s_callDuration[i]))
    else:
        call_number[number]=[str(s_createdTime[i])+"&"+str(s_answeredTime[i])+"&"+str(s_queueWaitTime[i])+"&"+str(s_callDuration[i])]

for key in call_number:
    if len(call_number[key])>1:
        file.write(str(key)+":"+"\n")
        for i in range(len(call_number[key])):
            file.write(call_number[key][i]+"\n")
        file.write("----------------------"+"\n")
