from matplotlib import pyplot
from scipy.signal import savgol_filter
import copy

file=open("通话记录.csv","r",encoding="utf-8")

call_minute={}; receive_minute={} #保存每个分钟段呼叫频数和接听平均频数（不含周末和26日数据）

line=file.readline()
while True:
    line=file.readline()
    if not line: break
    line=(line.strip()).split(",")

    hour1=line[0][-8:-6]; hour2=line[4][-8:-6]
    minute1=line[0][-5:-3]; minute2=line[4][-5:-3]
    if int(line[1]) not in [6,7,13,14,20,21]:  
        if hour1 in call_minute:
            call_minute[hour1][minute1]=call_minute[hour1].get(minute1,0)+1
        else:
            call_minute[hour1]={}
    if (int(line[1]) not in [6,7,13,14,20,21]) and line[4]:
        if hour2 in receive_minute:
            receive_minute[hour2][minute2]=receive_minute[hour2].get(minute2,0)+1
        else:
            receive_minute[hour2]={}

Y1=[]; Y2=[]; Ratio=[]
for hour in range(8,17+1):
    hour=("0"+str(hour))[-2:]
    for minute in range(0,59+1):
        minute=("0"+str(minute))[-2:]
        Y1.append(call_minute[hour].get(minute,0))
        Y2.append(receive_minute[hour].get(minute,0))
Y11=savgol_filter(Y1,59,3,mode="nearest")
Y22=savgol_filter(Y2,59,3,mode="nearest")
for k in range(0,600):
    if Y22[k]/Y11[k]>=0:
        Ratio.append((Y22[k]/Y11[k]))
    else:
        Ratio.append(0)
 
X=range(1,600+1) 
pyplot.subplot(2,1,1)
pyplot.bar(X,Y1,label='call')
pyplot.bar(X,Y2,label='receive')
pyplot.xlabel("call & receive by minute")
pyplot.ylabel("frequency")
pyplot.xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
pyplot.legend()

pyplot.subplot(2,1,2)
pyplot.plot(X,Y11,label='call')
pyplot.plot(X,Y22,label='receive')
pyplot.xlabel("call & receive by minute")
pyplot.ylabel("frequency")
pyplot.xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
pyplot.legend()

pyplot.show()

pyplot.plot(X,Ratio,label="ratio")
pyplot.xticks(range(1,600+1,60),labels=[8,9,10,11,12,13,14,15,16,17])
pyplot.xlabel("receive / call")
pyplot.ylabel("ratio")
pyplot.show()