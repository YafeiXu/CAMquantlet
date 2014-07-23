##### CAM45-15 yafei.xu@hu-berlin.de

# install package
install.packages("copula")
library(copula)
install.packages("scatterplot3d")
library(scatterplot3d)
set.seed(12345)

# draw sample from HAC
theta1 = 10
theta2 = 2
C3 = onacopula("G", C(theta2, 2, C(theta1, c(1, 3))))
U = rCopula(1100, C3)
x1 = qt(U[, 1], df = 17)
x2 = qnorm(U[, 2])
x3 = qnorm(U[, 3])
d = data.frame(x1, x2, x3)

# do plot
s3d  =  scatterplot3d(d[, 1], d[, 2], d[, 3], main = "Hierarchical Archimedean Copula", pch = 16, zlab = "", ylab = "", xlab = "")
s3d$points3d(d[, 1], d[, 2], d[, 3], col = "red", pch = 16)
s3d$points3d(d[, 1], d[, 2], seq(min(floor((d[, 3]))), min(floor((d[, 3]))), length.out = length(d[, 3])), col = "lightblue", pch = 16)
s3d$points3d(seq(min(floor((d[, 1]))), min(floor((d[, 1]))), length.out = length(d[, 3])), d[, 2], d[, 3], col = "lightblue", pch = 16)

#