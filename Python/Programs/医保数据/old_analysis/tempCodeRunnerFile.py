A=["a","b","a","c","b","a"]
count={}
for i in range(len(A)):
    if A[i] in count:
        count[A[i]]=count[A[i]]+1
    else:
        count[A[i]]=1

print(count)