m=20
Goods_Value=[[1,3],[2,4],[3,5],[5,6],[6,8],[8,10],[12,15],[13,20]]
def f(m,Goods_Value):
    A=[]; length=len(Goods_Value)+1
    for i in range(length):
        A.append([])
        for j in range(m+1):
            A[i].append(0)

    for i in range(1,length):
        for j in range(1,m+1):
            if Goods_Value[i-1][0]<=j:
                A[i][j]=max(A[i-1][j], Goods_Value[i-1][1]+A[i-1][j-Goods_Value[i-1][0]])
            else:
                A[i][j]=A[i-1][j]
    
    return A[1:][1:]

B=f(m,Goods_Value)
for i in range(len(B)):
    print("\t".join(B[i]))