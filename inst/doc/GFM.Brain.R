## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  githubURL <- "https://github.com/feiyoung/GFM/blob/main/vignettes_data/Brain76.Rdata?raw=true"
#  download.file(githubURL,"Brain76.Rdata",mode='wb')

## ----eval=FALSE---------------------------------------------------------------
#  load("Brain76.Rdata")
#  XList <- list(X[,group==1], X[,group==2])
#  types <- type
#  str(XList)

## ----eval=FALSE---------------------------------------------------------------
#  
#  library("GFM")
#  #load("vignettes_data\\Brain76.Rdata")
#  #ls() # check the variables
#  set.seed(2023) # set a random seed for reproducibility.

## ----eval=FALSE---------------------------------------------------------------
#  q <- 15
#  system.time(
#    gfm1 <- gfm(XList, types, q= q, verbose = TRUE)
#  )
#  
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
#  ggplot(data=df1, aes(x=Method, y=ARI, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

