library(bootstrap)
str(patch)
theta <- function(ind){
  Y <- patch[ind,"y"]
  Z <- patch[ind,"z"]
  mean(Y)/mean(Z) }
patch.boot <- bootstrap(1:8, 2000, theta)
names(patch.boot)
hist(patch.boot$thetastar)
abline(v=c(-0.2, 0.2), col="red2") #add straight lines
(thresholds for bioequvalence) to the plot
theta(1:8) #sample plug-in estimator
abline(v=theta(1:8) , col="blue")
# The bootstrap bias estimate:
mean(patch.boot$thetastar) - theta(1:8)
sd(patch.boot$thetastar) # bootstrapped standard error
quantile(patch.boot$thetastar,0.025)
quantile(patch.boot$thetastar,0.975)
library(MASS)
fit = fitdistr(rgamma(50,shape=2,rate=3), "gamma")
curve(dgamma(x,2,3), from=0, to=3, ylab="Density")
view(fit)
