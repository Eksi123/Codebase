kernel = function(x,y,grid,h)#h represent the best bandwidth through CV
{
  n = length(x)
  k = length(y)
  m.hat = rep(0,k)
  for(i in 1:k){
    w = dnorm(grid[i],x,h)
    m.hat[i] = sum(y*w)/sum(w)
  }
  return(m.hat)
}

boot = function(x,y,grid,h,B)# pointwise standard error for kernel regression  using the bootstrap
{
  k = length(grid)
  n = length(x)
  M = matrix(0,k,B)
  for(j in 1:B){
    I = sample(1:n,size=n,replace=TRUE)
    xx = x[I]
    yy = y[I]
    M[,j] = kernel(xx,yy,grid,h)
  }
  s = sqrt(apply(M,1,var))
  return(s)
}

sd.kernel.estimator<-function(x,y,h,B)
{
  grid<-seq(min(x),max(x),length=length(x))
  plot(x,y)
  se = boot(x,y,grid,h,B)
  mhat <- kernel(x,y,grid,h)
  lines(grid,mhat,lwd=3,col="blue")
  lines(grid,mhat+2*se,lwd=3,lty=2,col="red")
  lines(grid,mhat-2*se,lwd=3,lty=2,col="red")
}
