## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  library("GFM")
#  set.seed(1) # set a random seed for reproducibility.

## ----eval=FALSE---------------------------------------------------------------
#  ## Homogeneous  normal variables
#    dat <- gendata(q = 2, n=100, p=100, rho=3)

## ----eval=FALSE---------------------------------------------------------------
#  # Obtain the observed data
#    XList <- dat$XList # this is the data in the form of matrix list.
#    str(XList)
#    X <- dat$X # this is the data in form of matrix
#  # set variables' type, 'gaussian' means there is  continous variable type.
#    types <- 'gaussian'

## ----eval=FALSE---------------------------------------------------------------
#  # specify q=2
#    gfm1 <- gfm(XList, types, algorithm="AM", q=2, verbose = FALSE)
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    measurefun(gfm1$hH, dat$H0, type='ccor')
#    measurefun(gfm1$hB, dat$B0, type='ccor')

## ----eval=FALSE---------------------------------------------------------------
#  # select q automatically
#    hq <- chooseFacNumber(XList, types, select_method='IC', q_set = 1:6, verbose = FALSE, parallelList=list(parallel=TRUE))
#    hq

## ----eval=FALSE---------------------------------------------------------------
#    dat <- gendata(seed=1, n=100, p=100, type='heternorm', q=2, rho=1)
#   # Obtain the observed data
#    XList <- dat$XList # this is the data in the form of matrix list.
#    str(XList)
#    X <- dat$X # this is the data in form of matrix
#  # set variables' type, 'gaussian' means there is  continous variable type.
#    types <- 'gaussian'

## ----eval=FALSE---------------------------------------------------------------
#  # specify q=2
#    gfm1 <- gfm(XList, types,  algorithm="AM", q=2, verbose = FALSE)
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm1$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm1$hB, dat$B0, type='ccor')
#  
#    lfm1 <- Factorm(X, q=2)
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
#    hq <- chooseFacNumber(XList, types, select_method='IC', q_set = 1:6, verbose = FALSE, parallelList=list(parallel=TRUE))

## ----eval=FALSE---------------------------------------------------------------
#    q <- 3; p <- 200
#    dat <- gendata(seed=1, n=200, p=p, type='pois', q=q, rho=4)
#    # Obtain the observed data
#    XList <- dat$XList # this is the data in the form of matrix list.
#    str(XList)
#    X <- dat$X # this is the data in form of matrix
#  # set variables' type, 'gaussian' means there is  continous variable type.
#    types <- 'poisson'

## ----eval=FALSE---------------------------------------------------------------
#    system.time(
#     gfm1 <- gfm(XList, types,  algorithm="AM", q=3, verbose = FALSE)
#    )

## ----eval=FALSE---------------------------------------------------------------
#  system.time(
#    hq <- chooseFacNumber(XList, types, q_set=1:6, select_method = "IC", parallelList=list(parallel=TRUE))
#  )
#  

## ----eval=FALSE---------------------------------------------------------------
#  
#    # measure the performance of GFM estimators in terms of canonical correlations
#    corH_gfm <- measurefun(gfm1$hH, dat$H0, type='ccor')
#    corB_gfm <- measurefun(gfm1$hB, dat$B0, type='ccor')
#  
#    lfm1 <- Factorm(X, q=3)
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
#    # Obtain the observed data
#    XList <- dat$XList # this is the data in the form of matrix list.
#    str(XList)
#    X <- dat$X # this is the data in form of matrix
#    # set variables' type, 'gaussian' means there is  continous variable type.
#    types <- dat$types
#    table(dat$X[,1])
#    table(dat$X[, 200])
#    # user-specified q=2
#    gfm2 <- gfm(XList, types,  algorithm="AM", q=2, verbose = FALSE)
#    measurefun(gfm2$hH, dat$H0, type='ccor')
#    measurefun(gfm2$hB, dat$B0, type='ccor')

## ----eval=FALSE---------------------------------------------------------------
#    #  select q automatically
#    hq <- chooseFacNumber(XList, types, select_method='IC', q_set = 1:4, verbose = FALSE, parallelList=list(parallel=TRUE))
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

