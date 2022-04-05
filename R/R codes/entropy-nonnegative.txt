#熵的非负性
delta=c()
A1=c(); A2=c()
for(i in 1:10000){
  x1=runif(1); x2=1-x1
  x10=runif(1)*x1; x20=runif(1)*x2
  x11=x1-x10; x21=x2-x20
  
  px1=x10+x11; px2=x20+x21
  py1=x10+x20; py2=x11+x21
  H1=-log(px1,2)
  h1=-log(((x10/py1)^(x10/px1))*((x11/py2)^(x11/px1)),2)
  H2=-log(px2,2)
  h2=-log(((x20/py1)^(x20/px2))*((x21/py2)^(x21/px2)),2)
  
  delta[i]=px1*(H1-h1)+px2*(H2-h2)
  A1[i]=H1-h1; A2[i]=H2-h2
}
A1
A2