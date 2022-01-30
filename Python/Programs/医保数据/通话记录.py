from matplotlib import pyplot
import copy

file=open("通话记录.csv","r",encoding="utf-8")

call_day={}; receive_day={} #保存每日呼叫频数和接听频数（不含26日数据）
call_hour={}; receive_hour={} #保存每个时段呼叫频数和接听平均频数（不含周末和26日数据）
call={}; receive={}  #保存每日8点-16点内每小时呼叫与接听频数（不含周末和26日数据）
queue_hour={}; duration_hour={}  #保存每个时段呼叫等待和通话平均时长（不含周末和26日数据）
queue={}; duration={}  #保存每日8点-16点内每小时呼叫等待和通话平均时长（不含周末和26日数据）

line=file.readline()
while True:
    line=file.readline()
    if not line: break
    line=(line.strip()).split(",")

    # 利用字典计数
    call_day[line[1]]=call_day.get(line[1],0)+1   #计数1
    if line[4]:
        receive_day[line[1]]=receive_day.get(line[1],0)+1

    if int(line[1]) not in [6,7,13,14,20,21]:  #计数2
        call_hour[line[2]]=call_hour.get(line[2],0)+1
    if (int(line[1]) not in [6,7,13,14,20,21]) and line[4]:
        receive_hour[line[2]]=receive_hour.get(line[2],0)+1

    t=[0,1,2,3,4,5,6,7,17,18,19,20,21,22,23]  
    if (int(line[1]) not in [6,7,13,14,20,21]) and (int(line[2]) not in t): #计数3
        if line[1] in call:
            call[line[1]][line[2]]=call[line[1]].get(line[2],0)+1
        else:
            call[line[1]]={}
    if (int(line[1]) not in [6,7,13,14,20,21]) and (int(line[2]) not in t) and line[4]:
        if line[1] in receive:
            receive[line[1]][line[2]]=receive[line[1]].get(line[2],0)+1
        else:
            receive[line[1]]={}

    if int(line[1]) not in [6,7,13,14,20,21]:  #计数4
        queue_hour[line[2]]=queue_hour.get(line[2],0)+int(line[3])
    if (int(line[1]) not in [6,7,13,14,20,21]) and line[4]:
        duration_hour[line[2]]=duration_hour.get(line[2],0)+int(line[5])

    t=[0,1,2,3,4,5,6,7,17,18,19,20,21,22,23]  
    if (int(line[1]) not in [6,7,13,14,20,21]) and (int(line[2]) not in t): #计数5
        if line[1] in queue:
            queue[line[1]][line[2]]=queue[line[1]].get(line[2],0)+int(line[3])
        else:
            queue[line[1]]={}
    if (int(line[1]) not in [6,7,13,14,20,21]) and (int(line[2]) not in t) and line[4]:
        if line[1] in duration:
            duration[line[1]][line[2]]=duration[line[1]].get(line[2],0)+int(line[5])
        else:
            duration[line[1]]={}


# 呼叫与接听频数（按天）
for i in range(1,25+1):
    if str(i) not in call_day: call_day[str(i)]=0 
    if str(i) not in receive_day: receive_day[str(i)]=0

X=range(1,25+1)
Y1=[]; Y2=[]
for i in range(1,25+1): # 呼叫与接听频数
    Y1.append(call_day[str(i)])
    Y2.append(receive_day[str(i)])
N=copy.deepcopy(Y2)
N.sort(); print(N[len(N)-1])

pyplot.bar(X,Y1,label='call')
pyplot.bar(X,Y2,label='receive')
pyplot.xlabel("call & receive by day")
pyplot.ylabel("frequency")
pyplot.xticks(range(1,25+1))
pyplot.legend()
pyplot.show()

#呼叫与接听平均频数（按时段）
for i in range(0,23+1):
    if str(i) not in call_hour: call_hour[str(i)]=0 
    if str(i) not in receive_hour: receive_hour[str(i)]=0

X=range(0,23+1)
Y1=[]; Y2=[]
for i in range(0,23+1): # 呼叫与接听平均频数
    Y1.append(call_hour[str(i)]/19)
    Y2.append(receive_hour[str(i)]/19)
N=copy.deepcopy(Y2)
N.sort(); print(N[len(N)-1])

pyplot.bar(X,Y1,label='call')
pyplot.bar(X,Y2,label='receive')
pyplot.xlabel("call & receive by hour")
pyplot.ylabel("frequency")
pyplot.xticks(range(0,23+1))
pyplot.legend()
pyplot.show()

#每小时内呼叫与接听频数分布（按8点-16点上班时间核算）
Y1=[]; Y2=[]

for day in call:
    for hour in call[day]:
        Y1.append(call[day][hour])
        Y2.append(receive[day][hour])
Y1.sort(); Y2.sort()

pyplot.hist(Y1,label='call')
pyplot.hist(Y2,label='receive')
pyplot.xlabel("call & receive")
pyplot.ylabel("frequency")
pyplot.legend()
pyplot.show()

#呼叫等待与通话平均时长（按时段）
for i in range(0,23+1):
    if str(i) not in queue_hour: queue_hour[str(i)]=0 
    if str(i) not in duration_hour: duration_hour[str(i)]=0

X=range(0,23+1)
Y1=[]; Y2=[]
for i in range(0,23+1): # 呼叫等待与通话平均时长
    if call_hour[str(i)]==0:
        Y1.append(0)
    else:
        Y1.append(queue_hour[str(i)]/call_hour[str(i)])
    if receive_hour[str(i)]==0:
        Y2.append(0)
    else:
        Y2.append(duration_hour[str(i)]/receive_hour[str(i)])
N=copy.deepcopy(Y2)
N.sort(); print(N[len(N)-1])

pyplot.bar(X,Y2,label='duration')
pyplot.bar(X,Y1,label='queue')
pyplot.xlabel("queue & duration by hour")
pyplot.ylabel("secend")
pyplot.xticks(range(0,23+1))
pyplot.legend()
pyplot.show()

#每小时内呼叫等待与通话平均时长（按8点-16点上班时间核算）
Y1=[]; Y2=[]

for day in queue:
    for hour in queue[day]:
        Y1.append(queue[day][hour]/call[day][hour])
        Y2.append(duration[day][hour]/receive[day][hour])
Y1.sort(); Y2.sort()

pyplot.hist(Y2,label='duration')
pyplot.hist(Y1,label='queue')
pyplot.xlabel("queue & duration")
pyplot.ylabel("frequency")
pyplot.legend()
pyplot.show()

file.close()