n={} number=1
for i=1,1000 do
    n[i]=(number-number%9801)/9801
    number=(number%9801)*10
end
print(table.concat(n))