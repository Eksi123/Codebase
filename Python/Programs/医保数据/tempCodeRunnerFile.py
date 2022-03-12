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
131705
"""