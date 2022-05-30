def list_concat(List):
    string=str(List[0])
    for i in range(1,len(List)):
        string=string+"\t"+str(List[i])
    return string

def check(x,y): # 检查当下“马”的位置是否在棋盘上，以及是否重复走位
    if (x<0 or x>=m) or (y<0 or y>=n) or P[x][y]!=0:
        return False
    return True

def run(x,y,step): # 择选下一步“走马”出口并执行
    for i in range(8):
        if check(x+f1[i], y+f2[i]):
            P[x+f1[i]][y+f2[i]]=step
            if step==n*m:
                for i in range(m):
                    print(list_concat(P[i]))
                break
            else:
                step=step+1
                run(x+f1[i],y+f2[i],step)
                step=step-1
                P[x+f1[i]][y+f2[i]]=0  # 如果未完成遍历且当下"无路可走”，则退回上一层函数，重置次序为0，步数退一

f1=[-2,-2,2,2,1,-1,1,-1] # 定义(f1[i],f2[i])为马的方向
f2=[1,-1,1,-1,-2,-2,2,2]
print("棋盘尺寸大小:"+"长n宽m") # 定义棋盘尺寸大小
n=int(input()); m=int(input())

print("马在棋盘上的初始坐标:"+"(x,y)") # 输入马在棋盘上的初始坐标
x=int(input()); y=int(input())
print("---- 结果如下 ----"+"\n")

P=[] # 用二维数组生成棋盘，以便保存每一步的走马“次序”
for i in range(m):
    P.append([])
    for j in range(n):
        P[i].append(0)
P[x][y]=1

run(x,y,2) # “走马”并输出“次序”结果





