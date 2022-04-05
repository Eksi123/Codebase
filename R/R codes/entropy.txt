#三类型熵的变化图
library(rgl)

X=runif(10000,0,1)
Y=runif(10000,0,1)
sp=1; z=c()
for(i in 1:10000){
  if(X[i]+Y[i]<1){
    x[sp]=X[i]
    y[sp]=Y[i]
    z[sp]=1-X[i]-Y[i]
    sp=sp+1
  }
}
sp
H=-(x*log(x,2)+y*log(y,2)+z*log(z,2))

plot3d(x,y,H)


