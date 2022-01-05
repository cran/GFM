## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=TRUE----------------------------------------------------------------
library("GFM")

## ----eval=FALSE---------------------------------------------------------------
#  ## Homogeneous  normal variables
#    dat <- gendata(q = 2, n=100, p=100, rho=3)

## ----eval=FALSE---------------------------------------------------------------
#  # full-one vector means there is only one variable type within all variables.
#    group <- rep(1,ncol(dat$X))
#  # set variables' type, 'gaussian' means there is  continous variable type.
#    type <- 'gaussian'

## ----eval=FALSE---------------------------------------------------------------
#  # specify q=2
#    gfm1 <- gfm(dat$X, group, type, q=2, output = FALSE)
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    measurefun(gfm1$hH, dat$H0, type='ccor')
#    measurefun(gfm1$hB, dat$B0, type='ccor')

## ----eval=FALSE---------------------------------------------------------------
#  # select q automatically
#    gfm2 <- gfm(dat$X, group, type, q=NULL, q_set = 1:6, output = FALSE)
#  # measure the performance of GFM estimators in terms of canonical correlations
#    measurefun(gfm2$hH, dat$H0, type='ccor')
#    measurefun(gfm2$hB, dat$B0, type='ccor')

## ----eval=FALSE---------------------------------------------------------------
#    dat <- gendata(seed=1, n=100, p=100, type='heternorm', q=2, rho=1)
#    group <- rep(1,ncol(dat$X))
#    type <- 'gaussian'

## ----eval=FALSE---------------------------------------------------------------
#  # specify q=2
#    gfm1 <- gfm(dat$X, group, type, q=2, output = FALSE)
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm1$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm1$hB, dat$B0, type='ccor')
#  
#    lfm1 <- Factorm(dat$X, q=2)
#    corH_lfm <- measurefun(lfm1$hH, dat$H0, type='ccor')
#    corB_lfm <- measurefun(lfm1$hB, dat$B0, type='ccor')
#  
#    library(ggplot2)
#    df1 <- data.frame(CCor= c(corH_gfm, corH_lfm, corB_gfm, corB_lfm),
#                      Method =factor(rep(c('GFM', "LFM"), times=2)),
#                      Quantity= factor(c(rep('factors',2), rep("loadings", 2))))
#    ggplot(data=df1, aes(x=Quantity, y=CCor, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

## ----eval=FALSE---------------------------------------------------------------
#  # select q automatically
#    gfm2 <- gfm(dat$X, group, type, q=NULL, q_set = 1:4, output = FALSE)
#  # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm2$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm2$hB, dat$B0, type='ccor')
#  
#    library(ggplot2)
#    df1 <- data.frame(CCor= c(corH_gfm, corH_lfm, corB_gfm, corB_lfm),
#                      Method =factor(rep(c('GFM', "LFM"), times=2)),
#                      Quantity= factor(c(rep('factors',2), rep("loadings", 2))))
#    ggplot(data=df1, aes(x=Quantity, y=CCor, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

## ----eval=FALSE---------------------------------------------------------------
#    q <- 3; p <- 200
#    dat <- gendata(seed=1, n=200, p=p, type='pois', q=q, rho=4)
#    group <- rep(1,ncol(dat$X))
#    type <- 'poisson'

## ----eval=FALSE---------------------------------------------------------------
#    system.time(
#      gfm2 <- gfm(dat$X, group, type,parallel = TRUE, q=NULL, q_set = 1:4, output = FALSE, fast_version = TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm2$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm2$hB, dat$B0, type='ccor')
#  
#    lfm1 <- Factorm(dat$X, q=3)
#    corH_lfm <- measurefun(lfm1$hH, dat$H0, type='ccor')
#    corB_lfm <- measurefun(lfm1$hB, dat$B0, type='ccor')
#  
#    library(ggplot2)
#    df1 <- data.frame(CCor= c(corH_gfm, corH_lfm, corB_gfm, corB_lfm),
#                      Method =factor(rep(c('GFM', "LFM"), times=2)),
#                      Quantity= factor(c(rep('factors',2), rep("loadings", 2))))
#    ggplot(data=df1, aes(x=Quantity, y=CCor, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

## ----eval=FALSE---------------------------------------------------------------
#    dat <- gendata(seed=1, n=200, p=200, type='pois_bino', q=2, rho=2)
#    group <- c(rep(1,ncol(dat$X)/2), rep(2,ncol(dat$X)/2))
#    type <- c('poisson','binomial')
#    table(dat$X[,1])
#    table(dat$X[, 200])
#    # user-specified q=2
#    gfm2 <- gfm(dat$X, group, type, dropout = 2, q=2, output = FALSE, maxIter=5)
#    measurefun(gfm2$hH, dat$H0, type='ccor')
#    measurefun(gfm2$hB, dat$B0, type='ccor')

## ----eval=FALSE---------------------------------------------------------------
#    #  select q automatically
#    gfm2 <- gfm(dat$X, group, type, dropout = 2, q=NULL, q_set = 1:4, output = FALSE)
#    # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm2$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm2$hB, dat$B0, type='ccor')
#  

## ----eval=FALSE---------------------------------------------------------------
#    lfm1 <- Factorm(dat$X, q=3)
#    corH_lfm <- measurefun(lfm1$hH, dat$H0, type='ccor')
#    corB_lfm <- measurefun(lfm1$hB, dat$B0, type='ccor')
#  
#    library(ggplot2)
#    df1 <- data.frame(CCor= c(corH_gfm, corH_lfm, corB_gfm, corB_lfm),
#                      Method =factor(rep(c('GFM', "LFM"), times=2)),
#                      Quantity= factor(c(rep('factors',2), rep("loadings", 2))))
#    ggplot(data=df1, aes(x=Quantity, y=CCor, fill=Method)) + geom_bar(position = "dodge", stat="identity",width = 0.5)

## -----------------------------------------------------------------------------
sessionInfo()

