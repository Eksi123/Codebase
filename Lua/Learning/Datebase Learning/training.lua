A={}
for i=1,10 do
    A[i]={}
    for j=1,10 do
        A[i][j]=i*j
    end
end

for i=1,#A do
    print(table.concat(A[i],"\t"))
end