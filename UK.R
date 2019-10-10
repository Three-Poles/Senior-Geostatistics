library(sp)
library(gstat)
library(raster)
library(lattice)

# Read point data
smc<-read.csv('data.csv')
coordinates(smc)=~x+y

#Generate spatial prediction locations
auxilary_data <- as.data.frame(rasterToPoints(raster(read.asciigrid("auxilary.asc", as.image=FALSE))))
colnames(auxilary_data)<-c('x','y','auxilary')
coordinates(auxilary_data)=~x+y

#Calculate residual semivariogram and fit a residual semivariogram model
exp.vgm<- variogram(data~auxilary, smc)
init.vgm<-vgm(var(smc$data), "Sph", 2500, nugget=0)
fitted.vgm<-fit.variogram(exp.vgm, init.vgm)

plot(exp.vgm,fitted.vgm)

# universal kriging:
sm.UK <- krige(data~auxilary, smc, auxilary_data, model = fitted.vgm)
spplot(sm.UK["var1.pred"], main = "universal kriging predictions")
