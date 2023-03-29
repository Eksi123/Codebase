def f():
    string1 = input()
    string2 = input()
    List1 = string1.split(" ")[:-1]
    List2 = string2.split(" ")[:-1]
    List = []
    if len(List1)==0:
        List = List+List2
    elif len(List2)==0:
        List = List+List1
    else:
        sp1,sp2 = 0,0
        while True:
            if sp1>=len(List1):
                List = List+List2[sp2:]
                break
            elif sp2>=len(List2):
                List = List+List1[sp1:]
                break
            else:
                if List1[sp1]<=List2[sp2]:
                    List.append(List1[sp1])
                    sp1 =sp1+1
                else:
                    List.append(List2[sp2])
                    sp2 =sp2+1

    n = len(List)
    if n==0:
        print("NULL")
    else:
        for i in range(n):
            if i <n-1:
                print(List[i],end=" ")
            else:
                print(List[i])

f()