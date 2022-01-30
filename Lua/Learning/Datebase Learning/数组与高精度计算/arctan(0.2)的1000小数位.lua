m={}; n={5}; k=1; p=1 --变量声明
for i=1,math.huge,2 do
    for j=k,1010 do
        n[j+1]=(n[j+1] or 0)+(n[j]%(5*5*i))*10 --数组除法与数组相加
        n[j]=(n[j]-n[j]%(5*5*i))/(5*5*i)
        n[j]=n[j]*((i-2)>0 and (i-2) or 1)
        m[j]=(m[j] or 0)+n[j]*p
    end
    p=-p
    while n[k]==0 do  --计算零位节点
        k=k+1
    end
    if k>1000 then --限定小数零位不超过1000
        break
    end
end
for j=1010,1,-1 do
    m[j-1]=(m[j-1] or 0)+(m[j]-m[j]%10)/10 --十进制调整
    m[j]=m[j]%10
end
print(table.concat(m,nil,1,1000))
