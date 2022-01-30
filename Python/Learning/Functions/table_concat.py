def concat(Table,s1):
    s=str(Table[0])
    for i in range(1,len(Table)):
        s=s+s1+str(Table[i])
    return s
