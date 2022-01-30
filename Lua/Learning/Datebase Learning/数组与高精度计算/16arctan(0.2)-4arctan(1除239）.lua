m={}; n={5}; p={239}; k=1; s=1 --变量声明
for i=1,math.huge,2 do
    for j=k,1010 do
        n[j+1]=(n[j+1] or 0)+(n[j]%(25*i))*10;   p[j+1]=(p[j+1] or 0)+(p[j]%(239*239*i))*10   --数组除法与数组相加
        n[j]=(n[j]-n[j]%(25*i))/(25*i);  p[j]=(p[j]-p[j]%(239*239*i))/(239*239*i)
        n[j]=n[j]*((i-2)>0 and (i-2) or 1);  p[j]=p[j]*((i-2)>0 and (i-2) or 1)
        m[j]=(m[j] or 0) +n[j]*s*16 -p[j]*s*4
    end
    s=-s
    while n[k]==0 and p[k]==0 do  --计算零位节点
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