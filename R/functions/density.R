library(np)
data(oecdpanel)
nrow(oecdpanel)
attach(oecdpanel)
popgro
inv
summary(popgro)
par(mar=c(3,3,2,1),mpg=c(2,7,0),mfrow=c(2,2))
hist(popgro,prob=T)
hist(inv,prob=T)
hist(popgro, prob=T, breaks=seq(-3.45, -2.4, 0.05))
hist(inv, prob=T, breaks=seq(-4.6, -0.8, 0.2))
plot(density(popgro))
plot(density(inv))
popgro.bw = bw.SJ(popgro, method="dpi") # "direct plug-in"
inv.bw = bw.SJ(inv, method="dpi")
plot(density(popgro, bw=popgro.bw))
plot(density(inv, bw=inv.bw))


popinv = npudens(~popgro+inv) # Note: takes a while
par(mfrow=c(1,1))
plot(popinv)
