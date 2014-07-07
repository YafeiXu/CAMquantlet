##### CAM239-12 yafei.xu@hu-berlin.de

library(copula)
par(mfrow=c(4,3))

################################################## 1st row plots
### Normal copula
mv.NE1 <- mvdc(normalCopula(0.8), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE1 # using its print() / show() method
persp (mv.NE1, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Normal copula", col="Blue", zlab="z", ylab="y", xlab="x")

### Gumbel copula
mv.NE2 <- mvdc(gumbelCopula(2), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE2 # using its print() / show() method
persp (mv.NE2, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Gumbel copula", col="Red", zlab="z", ylab="y", xlab="x")


### Clayton copula
mv.NE3 <- mvdc(claytonCopula(2), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE3 # using its print() / show() method
persp (mv.NE3, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Clayton Copula", col="Green", zlab="z", ylab="y", xlab="x")
contour(mv.NE1, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), col="Blue", ylab="y", xlab="x")
contour(mv.NE2, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), col="Red", ylab="y", xlab="x")
contour(mv.NE3, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), col="Green", ylab="y", xlab="x")

################################################## 2nd row plots
### Normal copula
mv.NE4 <- mvdc(normalCopula(0.1), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE4 # using its print() / show() method
persp (mv.NE4, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Blue", zlab="z", ylab="y", xlab="x")

### Gumbel copula
mv.NE5 <- mvdc(gumbelCopula(5), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE5 # using its print() / show() method
persp (mv.NE5, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Red", zlab="z", ylab="y", xlab="x")

### Clayton copula
mv.NE6 <- mvdc(claytonCopula(5), c("norm", "norm"),
list(list(mean = 0, sd =2), list(mean = 0, sd =2)))
mv.NE6 # using its print() / show() method
persp (mv.NE6, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Green", zlab="z",ylab="y", xlab="x")
contour(mv.NE4, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Blue", ylab="y", xlab="x")
contour(mv.NE5, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Red", ylab="y", xlab="x")
contour(mv.NE6, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4),  col="Green",  ylab="y", xlab="x")














