--例如 1——22，按列输出，一共四列，且除最后一行外不允许有空行
--[[
    1 7 13 18
    2 8 14 19
    3 9 15 20
    4 10 16 21
    5 11 17 22
    6 12    
]]


function printf(N,ncol)
    if N%ncol~=0 then flag=N%ncol; nrow=((N-N%ncol)/ncol)+1 else nrow=(N-N%ncol)/ncol flag=0 end
    x={};y={}
    for i=1,ncol do 
        if i>flag then x[i]=(nrow-1)*(i-1)+flag; y[i]=x[i] else x[i]=nrow*(i-1);y[i]=x[i]  end
    end
    p=nrow
    while p>0 do
        for i=1,ncol-1 do
            if x[i]<y[i+1] then x[i]=x[i]+1; io.write(x[i],"\t") end
        end
        if x[ncol]<N then x[ncol]=x[ncol]+1; io.write(x[ncol],"\t") end
        io.write("\n"); p=p-1
    end
end
printf(2354,14)