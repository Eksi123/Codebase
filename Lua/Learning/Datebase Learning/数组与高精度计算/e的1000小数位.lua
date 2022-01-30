m={1}; n={1}; k=1 --变量声明
for i=1,math.huge do 
  for j=k,1010 do         
    n[j+1]=(n[j+1] or 0) + (n[j]%i)*10   --余数与相应指针下的数组值相加
    n[j]=(n[j]-n[j]%i)/i  --求整数
    m[j]=(m[j] or 0) + n[j]
  end
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


