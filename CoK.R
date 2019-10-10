library(sp)
library(gstat)
library(raster)

smc<-read.csv('data.csv')
coordinates(smc)=~x+y

# cokriging of the two variables
g <- gstat(NULL, id = "data", form = data ~ 1,data=smc)
g <- gstat(g, id = "auxilary", form = auxilary ~ 1, data=smc)

#Compute the two direct variograms and one cross-variogram.
v.cross <- variogram(g)
str(v.cross)
plot(v.cross, pl=T)

#Compute and display the two direct variograms and one cross-variogram.
g <- gstat(g, id=c("data","auxilary"),model=vgm(0.02, "Gau", 900, 0.02), fill.all=T)
g <- fit.lmc(v.cross, g, fit.method=6, correct.diagonal=1.01)
plot(variogram(g), model=g$model)

#Generate spatial prediction locations
auxilary_data <- as.data.frame(rasterToPoints(raster(read.asciigrid("auxilary.asc", as.image=FALSE))))
colnames(auxilary_data)<-c('x','y','auxilary')
coordinates(auxilary_data)=~x+y

k.c <- predict(g, auxilary_data)
str(k.c)
spplot(k.c['data.pred'], main = "regression kriging predictions")