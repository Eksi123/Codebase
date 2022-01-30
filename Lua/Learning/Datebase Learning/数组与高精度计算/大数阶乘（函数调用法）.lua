--把大数相乘包装为函数
function production(number1,number2) 
number1=tostring(number1)  number2=tostring(number2)
n1={} n2={} n3={} l1=#number1 l2=#number2

--提取单个字符并重组
for i=1,l1 do
    n1[l1+1-i]=number1:sub(i,i)
end
for j=1,l2 do
    n2[l2+1-j]=number2:sub(j,j)
end

--字符串相乘并重组
for i=1,l1 do
    for j=1,l2 do
       n3[i+j-1]=(n3[i+j-1] or 0)+n1[i]*n2[j]
    end
end

--十进制调整
for k=1,#n3 do
    m=n3[k]
    n3[k]=n3[k]%10
    n3[k+1]=(n3[k+1] or 0)+(m-n3[k])/10
end

--输出
if n3[#n3]==0 then
    n3[#n3]=nil
end
return(string.reverse(table.concat(n3)))
end

--求阶乘
x="1" i=1
while i<=40 do
    y=tonumber(x) x=production(x,i)
    i=i+1
end

print(x)