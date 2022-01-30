a={}
for i=2,6 do
    a[i]={}; a[1]={"y1","y2","y3","y4","y5"}
    for j=1,5 do
        a[i][j]=i*j
    end
end

for i=1,6 do
    io.write(table.concat(a[i],"\t"),"\n")
end

--行相加
local row={}
for i=2,6 do
    for j=1,5 do
        row[i-1]=(row[i-1] or 0)+a[i][j]
    end
end
print(table.concat(row,"\t"))

--列相加
local col={}
for i=2,6 do
    for j=1,5 do
        col[j]=(col[j] or 0)+a[i][j]
    end
end
print(table.concat(col,"\t"))