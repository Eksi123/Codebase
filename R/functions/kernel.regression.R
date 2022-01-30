#kernel regression with best bandwidth
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


kernel.fitted = function(x,y,h) # fitted values and diaginal of smoothing matrix
{
  n = length(x)
  m.hat = rep(0,n)
  S = rep(0,n)
  for(i in 1:n){
    w = dnorm(x[i],x,h)
    w = w/sum(w)
    m.hat[i] = sum(y*w)
    S[i] = w[i]
  }
  return(list(fitted=m.hat,S=S))
}

CV = function(x,y,H)#H is a vector of h
{
  n = length(x)
  k = length(H)
  cv = rep(0,k)
  nu = rep(0,k)
  gcv = rep(0,k)
  for(i in 1:k){
    tmp = kernel.fitted(x,y,H[i])
    cv[i] = mean(((y - tmp$fitted)/(1-tmp$S))^2)
    nu[i] = sum(tmp$S)
    gcv[i] = mean((y - tmp$fitted)^2)/(1-nu[i]/n)^2
  }
  return(list(cv=cv,gcv=gcv,nu=nu))
}#output the cv and generalized cv

#generate H (the vector of h)
kernel.regression<-function(x,y,H)
{
  out = CV(x,y,H)
  plot(H,out$cv,type="l",lwd=3,xlab="Bandwidth",ylab="Cross-
validation Score")
  lines(H,out$gcv,lty=2,col="red",lwd=3)
  
  plot(out$nu,out$cv,type="l",lwd=3,xlab="Effective Degrees
of Freedom",ylab="Cross-validation")
  lines(out$nu,out$gcv,lty=2,col="red",lwd=3)
  
  j = which.min(out$cv)
  h = H[j]
  
  grid<-seq(min(x),max(x),length=length(x))
  m.hat = kernel(x,y,grid,h)
  
  plot(x,y)
  lines(grid,m.hat,lwd=3,col="blue")
}