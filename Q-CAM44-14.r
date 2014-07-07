##### CAM44-14 yafei.xu@hu-berlin.de

mvdc(copula, margins, paramMargins, marginsIdentical = FALSE,
check = TRUE, fixupNames = TRUE)
rMvdc(n, mvdc)


c12 <- mvdc(gumbelCopula(param = 10, dim = 2), c("norm", "t"),
list(list(mean = 0, sd =1), list(df = 2)))

dc12=function(x)dMvdc(x, c12)
pc12=function(x)pMvdc(x, c12)
sampleC12=rMvdc(10000, c12)
pSampleC12=pMvdc(sampleC12, c12)
dataC12=data.frame(sampleC12, pSampleC12)
dataC12[order(dataC12[,3]),]
#需要c12的quantile函数qc12

c123= mvdc(gumbelCopula(param = 2, dim = 2), c("c12", "norm"), 
list(list(param = 10, dim=2),list(mean = 0, sd =1)))

plot(rMvdc(10000, c12))

