--变量声明
number1="123"
number2="987465765876985945476574687"
n1={} n2={} n3={} m1=#number1 m2=#number2
--截取单个字符并重组
for i=1,m1 do
    n1[m1+1-i]=number1:sub(i,i)
end
for j=1,m2 do
    n2[m2+1-j]=number2:sub(j,j)
end
--字符串相加与十进制调整
for k=1,math.max(m1,m2) do
   n3[k]=(n1[k] or 0)+(n2[k] or 0)
end
for k=1,#n3 do
    if n3[k]>=10 then           
        n3[k]=n3[k]-10
        n3[k+1]=(n3[k+1] or 0)+1 --if语句的作用：（1)十进制调整 （2）避免了k+1位为0
    end
end

print(string.reverse(table.concat(n3)))
