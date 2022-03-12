"""
分析对象：data中的"通话记录.csv"
        选择特征"callerIdNumber", "createdTime", "day", "hour", "queueWaitTime", "answeredTime", "callDuration"
        构造新特征"call_answer_ratio", "duration_waittime_ratio"
        数据筛选条件为"queueId != 0"

分析目标：平均每天每时每分钟电话接收次数分布，人工等待时长分布，人工通话时长分布
         平均每天每时相同电话重播次数分布，当天内重播电话接收情况等细节
         
步骤：
【1】筛选数据及特征处理
【2】分析
【3】绘图
【4】结论及总结
"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

data=pd.DataFrame(pd.read_csv("data/通话记录.csv", header=0, encoding="utf-8"))
data=data[np.isnan(data["queueId"])==False] # 数据筛选
print(data.info())
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

s_callerIdNumber=pd.Series(data["callerIdNumber"].values, name="callerIdNumber") # DataFrame转为Series, index默认为有序数字
s_createdTime=pd.Series(data["createdTime"].values, name="createdTime") 
s_day=pd.Series(data["day"].values, name="day")
s_hour=pd.Series(data["hour"].values, name="hour")
s_queueWaitTime=pd.Series(data["queueWaitTime"].values, name="queueWaitTime")
s_answeredTime=pd.Series(data["answeredTime"].values, name="answeredTime")
s_callDuration=pd.Series(data["callDuration"].values, name="callDuration")