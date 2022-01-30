A={["a"]=1,["b"]=2}
A["c"]=3
A["c"]=nil

for k,v in pairs(A) do
    print(k,v)
end