def f():
    n = int(input())
    List = [] # 构建顺序表
    string = input()
    for i in range(n):
        List.append(string.split(" ")[i])
    
    for i in range(n):
        if i <n-1:
            print(List[i],end=" ")
        else:
            print(List[i])
            
f()