#code from Fabre at al 2020 for calculating and plotting per-landmark rates and variance for 3d geometric morphometric data

library(tidyverse)
library(geomorph)
############
#a function for calculating per-landmark rates
############

per_lm_rates <- function(shape.data, phy){
data.2d <- two.d.array(shape.data)
phy.parts <- geomorph:::phylo.mat(data.2d, phy)
invC <- geomorph:::phy.parts$invC
D.mat <- geomorph:::phy.parts$D.mat
C <- geomorph:::phy.parts$C

global<-sig.calc(data.2d,invC,D.mat,Subset=TRUE)
###have to get the dim of shape data to replace this ppppppp
global.array1<-arrayspecs(global$R,p=dim(shape.data)[1],k=3)
rates.vector<-colSums(matrix(diag(global$R), nrow=3))


cols1<-colorRampPalette(c("#6e016b","#0c2c84","#225ea8","#005a32","#ffff00","#fe9929","#fc4e2a","red"))

cols<-cols1(100)

#calculate log rates:
x=(log10(rates.vector))
xlims<-NULL
tol <- 1e-06
xlims <- range(x) + c(-tol, tol)
nbin=100
breaks <- 0:nbin/nbin * (xlims[2] - xlims[1]) + xlims[1]
whichColor <- function(p, cols, breaks) {
  i <- 1
  while (p >= breaks[i] && p > breaks[i + 1]) i <- i +
      1
  cols[i]
}
ratecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)



rate_table <- tibble("Per_Lm_Rates" = rates.vector, "Log_Rates" = x, "Rate_Colors" = ratecolors)
return(rate_table)
}

############
#a function for calculating per-landmark variance
############
per_lm_variance <- function(shape.data){

  variances<-rowSums(apply(shape.data ,c(1,2),var))


  cols1<-colorRampPalette(c("#6e016b","#0c2c84","#225ea8","#005a32","#ffff00","#fe9929","#fc4e2a","red"))

  cols<-cols1(100)

  #calculate log rates:
  x=(log10(variances))
  xlims<-NULL
  tol <- 1e-06
  xlims <- range(x) + c(-tol, tol)
  nbin=100
  breaks <- 0:nbin/nbin * (xlims[2] - xlims[1]) + xlims[1]
  whichColor <- function(p, cols, breaks) {
    i <- 1
    while (p >= breaks[i] && p > breaks[i + 1]) i <- i +
        1
    cols[i]
  }
  variancecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)



  variance_table <- tibble("Per_Lm_Variance" = variances, "Log_Variance" = x, "Variance_Colors" = variancecolors)
  return(variance_table)
}

#################
#Plotting example
#################


library(rgl)

my.shapes <- read.csv("Coordinates_superimposed_entire_dataset.csv",row.names = 1)
my.shapes <- array.specs(my.shapes,p =  (ncol(my.shapes)/3), k = 3)
# Import the phylogeny
phy1 <- read.nexus("scaled_tree.nexus")
#calculate per landmark rates and variance
my.rates <- per_lm_rates(shape.data = my.shapes, phy = phy1)
my.variances <- per_lm_variance(shape.data = my.shapes)

spheres3d(my.shapes[,,1], col = my.rates$Rate_Colors)
title3d("Per Landmark Rates")

open3d()
spheres3d(my.shapes[,,1], col = my.variances$Variance_Colors)
title3d("Per Landmark Disparity")