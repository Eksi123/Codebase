max=20
Goods_Value=[[1,3],[2,4],[3,5],[5,6],[6,8],[8,10],[12,15],[13,20]]
def f(max,Goods_Value):
    A=[]; length=len(Goods_Value)
    for i in range(length+1):
        A.append([])
        for j in range(max+1):
            A[i].append(0)

    for i in range(1,length+1):
        for j in range(1,max+1):
            A[i][j]=A[i-1][j]
            if Goods_Value[i-1][0]<=j and A[i-1][j]<Goods_Value[i-1][1]+A[i-1][j-Goods_Value[i-1][0]]:
                A[i][j]=Goods_Value[i-1][1]+A[i-1][j-Goods_Value[i-1][0]]
    
    for i in range(length,-1,-1): # 根据动态规划矩阵A的结果，我们从A[length][max]一直回溯至A[1][1]，判断G[i-1]是否被偷取
        if A[i][max]==Goods_Value[i-1][1]+A[i-1][j-Goods_Value[i-1][0]]:
            max=max-Goods_Value[i-1][0]
            print(Goods_Value[i-1])

f(max,Goods_Value)