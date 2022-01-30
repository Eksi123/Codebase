"""
工单问题大致类型
Type1--异地医保问题
Type2--医保缴费问题
Type3--余额查询问题
Type4--参保停保问题
Type5--医保报销问题
Type6--其他问题
"""
from matplotlib import pyplot

file=open("通话内容.csv","r",encoding="gbk")

Type={"Type1":["异地","外地","外省","其他地方","其他省"],
    "Type2":["缴费","交费","补缴"],
    "Type3":["余额","额度","账户"],
    "Type4":["参保","停保"],
    "Type5":["报销"]}

Count0={} # 核算呼叫群体频数
Count={} # 核算“群体类型-问题类型”频数
line=file.readline()
while True:
    line=file.readline()
    if not line: break
    line=(line.strip()).split(",")

    Count0[line[0]]=Count0.get(line[0],0)+1
    if line[0] not in Count:
        Count[line[0]]={}
    flag=0
    for key in Type:
        for i in range(0,len(Type[key])):
            if line[1].find(Type[key][i])!=(-1): # 找不到返回值-1
                flag=1
                Count[line[0]][key]=Count[line[0]].get(key,0)+1    

    if flag==0:
        Count[line[0]]["Type6"]=Count[line[0]].get("Type6",0)+1

Y,Y1,Y2,Y3,Y4,Y5,Y6=[],[],[],[],[],[],[]
Group=["单位","低保","居民","灵活就业","特困","未参保","学生","药店/医院","职工"]
for j in range(0,len(Group)): # 提取Type1频数
    Y.append(Count0[Group[j]])
    Y1.append(Count[Group[j]].get("Type1",0))
    Y2.append(Count[Group[j]].get("Type2",0))
    Y3.append(Count[Group[j]].get("Type3",0))
    Y4.append(Count[Group[j]].get("Type4",0))
    Y5.append(Count[Group[j]].get("Type5",0))
    Y6.append(Count[Group[j]].get("Type6",0))

pyplot.rcParams['font.sans-serif'] = ['SimHei'] # 显示中文

def make_autopct(values):
    def my_autopct(pct):
        total = sum(values)
        val = int(round(pct*total/100.0))
        # 同时显示数值和占比的饼图
        return '{p:.2f}%  ({v:d})'.format(p=pct,v=val)
    return my_autopct
pyplot.pie(Y,labels=Group,autopct=make_autopct(Y))
pyplot.title("群体占比饼图")
pyplot.show()

pyplot.bar(Group,Y1)
for x,y in zip(Group,Y1):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.ylabel("frequency")
pyplot.title("异地医保问题")
pyplot.show()

pyplot.bar(Group,Y2)
for x,y in zip(Group,Y2):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.title("医保缴费问题")
pyplot.ylabel("frequency")
pyplot.show()

pyplot.bar(Group,Y3)
for x,y in zip(Group,Y3):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.title("余额查询问题")
pyplot.ylabel("frequency")
pyplot.show()

pyplot.bar(Group,Y4)
for x,y in zip(Group,Y4):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.title("参保停保问题")
pyplot.ylabel("frequency")
pyplot.show()

pyplot.bar(Group,Y5)
for x,y in zip(Group,Y5):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.title("医保报销问题")
pyplot.ylabel("frequency")
pyplot.show()

pyplot.bar(Group,Y6)
for x,y in zip(Group,Y6):
    pyplot.text(x,y,"%.f"%y,ha="center",fontsize=10)
pyplot.title("其他问题")
pyplot.ylabel("frequency")
pyplot.show()