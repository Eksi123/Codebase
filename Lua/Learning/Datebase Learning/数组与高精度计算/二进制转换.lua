--定义十进制数值
number=1234567

--二进制排位数 1 2 4 8 16 32……
i=1 n={}

--得出最高位数i
while number>(2^i-1) do
    i=i+1
end

k=i

--二进制转换
for j=1,k do
    if (number<=(2^i-1))and(number>(2^(i-1)-1)) then
        n[j]=1
        number=number-2^(i-1)
    else
        n[j]=0
    end
    i=i-1
end

print(table.concat(n))
