r={1,0}
function Rand()
    r[2]=r[2]*45221+r[1]*4793
    r[1]=r[1]*45221+453806245
    r[2]=r[2]+(r[1]-r[1]%65536)/65536
    r[2]=r[2]%32768;  r[1]=r[1]%65536
    return (r[2]*65536+r[1])/2147483648
end

for i=1,10000 do
    x1=Rand(); x2=1-x1
    x10=Rand()*x1; x20=Rand()*x2
    x11=x1-x10; x21=x2-x20
    
    px1=x10+x11; px2=x20+x21
    py1=x10+x20; py2=x11+x21

    H1=-math.log(px1,2)
    h1=-math.log(((x10/py1)^(x10/px1))*((x11/py2)^(x11/px1)),2)
    H2=-math.log(px2,2)
    h2=-math.log(((x20/py1)^(x20/px2))*((x21/py2)^(x21/px2)),2)

    print(H1-h1,H2-h2)
    print(px1*(H1-h1)+px2*(H2-h2))
end

