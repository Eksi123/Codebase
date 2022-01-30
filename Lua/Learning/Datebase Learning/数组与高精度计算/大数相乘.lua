--变量声明
number1="123456789123456789" 
number2="123456789123456789123456789" 
n1={} n2={} n3={} m1=#number1 m2=#number2
--提取单个字符并重组
for i=1,m1 do
    n1[m1+1-i]=number1:sub(i,i)
end
for j=1,m2 do
    n2[m2+1-j]=number2:sub(j,j)
end
--字符串相乘与十进制调整
for i=1,m1 do
    for j=1,m2 do
       n3[i+j-1]=(n3[i+j-1] or 0)+n1[i]*n2[j]
    end
end
for k=1,#n3 do
    if n3[k]>=10 then
        n3[k+1]=(n3[k+1] or 0)+(n3[k]-n3[k]%10)/10
        n3[k]=n3[k]%10
    end
end

print(string.reverse(table.concat(n3)))