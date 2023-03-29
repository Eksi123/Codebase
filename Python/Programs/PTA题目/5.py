def f():
    string = input()
    ID = string.split(" ")[1:]
    n = int(string.split(" ")[0])
    List1 = []
    List2 = []
    for i in range(n):
        if int(ID[i])%2==1:
            List1.append(ID[i])
        else:
            List2.append(ID[i])
    
    List = []
    if not List1:
        List = List+List2
    elif not List2:
        List = List+List1
    else:
        sp1,sp2 = 0,0
        flag = 0
        while True:
            if sp1>=len(List1):
                List = List+List2[sp2:]
                break
            elif sp2>=len(List2):
                List = List+List1[sp1:]
                break
            else:
                flag = flag+1
                List.append(List1[sp1])
                sp1 = sp1+1
                if flag%2==0:
                    List.append(List2[sp2])
                    sp2 = sp2+1

    if n==0:
        print("NULL")
    else:
        for i in range(n):
            if i <n-1:
                print(List[i],end=" ")
            else:
                print(List[i])

f()