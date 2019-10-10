library(sp)
library(gstat)
library(raster)

# Read point data
smc<-read.csv('data.csv')
coordinates(smc)=~x+y
# Regression
lm.smc.aux <- lm(data~auxilary, smc)
smc$residuals<-residuals(lm.smc.aux)

#Generate spatial prediction locations
auxilary_data <- as.data.frame(rasterToPoints(raster(read.asciigrid("auxilary.asc", as.image=FALSE))))
colnames(auxilary_data)<-c('x','y','auxilary')
coordinates(auxilary_data)=~x+y
# trend.pre<-predict(lm.smc.aux, data.frame(auxilary = auxilary_data$auxilary))
# auxilary_data$trend.pre<-trend.pre

#Calculate residual semivariogram and fit a residual semivariogram model
exp.vgm<- variogram(data~auxilary, smc)
init.vgm<-vgm(var(smc$data), "Sph", 2500, nugget=0)
fitted.vgm<-fit.variogram(exp.vgm, init.vgm)

plot(exp.vgm,fitted.vgm)

# regression kriging:
sm.rk <- krige(data~auxilary, smc, auxilary_data)#predict trend part
sm.res<- krige(residuals~1, smc, auxilary_data,model = fitted.vgm)#predict trend part
sm.rk$rk<-sm.trend$var1.pred+sm.res$var1.pred
str(sm.rk)
spplot(sm.rk['rk'], main = "regression kriging predictions")
