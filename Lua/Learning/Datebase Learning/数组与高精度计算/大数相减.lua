--变量声明
number1="1234554"
number2="12337"
n1={} n2={} n3={} m1=#number1 m2=#number2
--截取单个字符并重组
for i=1,m1 do
    n1[m1+1-i]=number1:sub(i,i)
end
for j=1,m2 do
    n2[m2+1-j]=number2:sub(j,j)
end
--字符串相减与十进制调整
for k=1,math.max(m1,m2) do
    if(tonumber(number1)>=tonumber(number2)) then
        n3[k]=(n1[k] or 0)-(n2[k] or 0)
    else
        n3[k]=(n2[k] or 0)-(n1[k] or 0)
    end
end 
for k=1,#n3 do
    if n3[k]<0 then
        n3[k]=n3[k]+10
        n3[k+1]=n3[k+1]-1
    end
end
print(string.reverse(table.concat(n3)))--此法未消除多余位数上的0