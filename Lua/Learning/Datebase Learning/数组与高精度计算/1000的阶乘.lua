t={1} --数组声明
for i=1,1000 do
    for j=1,#t do 
        t[j]=t[j]*i --数组累积
    end
    local k=1
    while k<=#t do
        if t[k]>=10 then
            t[k+1]=(t[k+1] or 0)+(t[k]-t[k]%10)/10 --十进制调整
            t[k]=t[k]%10
        end
        k=k+1
    end
end
print(string.reverse(table.concat(t))) --输出

--[[十进制调整那一块将两个循环化为了一个循环，原代码如下
for j=1,#t do
    t[j]=t[j]*i
end
while t[#t]>=10 do
    m=#t
    t[m+1]=(t[m]-t[m]%10)/10
    t[m]=t[m]%10
end
]]