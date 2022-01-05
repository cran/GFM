## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  library("GFM")
#  #load("D:\\Dropbox\\MixImpute\\Rcode\\RealData\\BrainSTdata\\Brain76.Rdata")
#  #ls() # check the variables

## ----eval=FALSE---------------------------------------------------------------
#  q <- 15
#  gfm1 <- gfm(X, group, type, q= q, output = FALSE)
#  

## ----eval=FALSE---------------------------------------------------------------
#  hH <- gfm1$hH
#  library(mclust)
#  set.seed(1)
#  gmm1 <- Mclust(hH, G=7)
#  ARI_gfm <- adjustedRandIndex(gmm1$classification, y)
#  

## ----eval=FALSE---------------------------------------------------------------
#  fac <- Factorm(X, q=15)
#  hH_lfm <- fac$hH
#  set.seed(1)
#  gmm2 <- Mclust(hH_lfm, G=7)
#  ARI_lfm <- adjustedRandIndex(gmm2$classification, y)
#  

## ----eval=FALSE---------------------------------------------------------------
#  library(ggplot2)
#  df1 <- data.frame(ARI= c(ARI_gfm,ARI_lfm),
#                      Method =factor(c('GFM', "LFM")))
#    ggplot(data=df1, aes(x=Method, y=ARI, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

