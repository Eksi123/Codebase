def f():
    string1 = input()
    string2 = input()
    List1 = string1.split(" ")[:-1]
    List2 = string2.split(" ")[:-1]
    List = []
    if (not List1) or (not List2) :
        print("NULL")
    else:
        sp1,sp2 = 0,0
        while sp1<len(List1) and sp2<len(List2):
            if List1[sp1]==List2[sp2]:
                List.append(List1[sp1])
                sp1 = sp1+1
                sp2 = sp2+1
            elif List1[sp1]<List2[sp2]:
                sp1 =sp1+1
            else:
                sp2 =sp2+1

    n = len(List)
    for i in range(n):
        if i <n-1:
            print(List[i],end=" ")
        else:
            print(List[i])

f()