library(sp)
library(gstat)
library(raster)

# Read point data
smc<-read.csv('data.csv')
coordinates(smc)=~x+y

#Calculate semivariogram and fit a semivariogram model
exp.vgm<- variogram(data~1, smc)
init.vgm<-vgm(var(smc$data), "Sph", 2500, nugget=0)
fitted.vgm<-fit.variogram(exp.vgm, init.vgm)

plot(exp.vgm,fitted.vgm)

#Generate spatial prediction locations
grids <- raster(extent(matrix(c(min(smc$x), min(smc$y), max(smc$x), max(smc$y)), nrow=2)), nrow=100, ncol=100)
pred.points<-as.data.frame(rasterToPoints(grids))
coordinates(pred.points)=~x+y


#Simple kriging:
sm.SK <- krige(data~1, smc, pred.points, model = fitted.vgm, beta = mean(smc$data))
spplot(sm.SK["var1.pred"], main = "simple kriging predictions")
