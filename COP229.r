##### COP229 yafei.xu@hu-berlin.de

library(copula)
par(mfrow = c(1, 3))

# Normal copula
mv.NE1  =  mvdc(normalCopula(0.4), c("norm", "norm"), 
list(list(mean = 0, sd  = 1), list(mean = 0, sd  = 1)))
mv.NE1 # using its print() / show() method
x.samp1  =  rMvdc(900, mv.NE1)
plot(x.samp1, xlim = c(-4, 4), ylim = c(-4, 4), ylab = "", xlab = "", main = "Gaussian", pch = 20, cex = 2)
abline(h = -4:4, v = -4:4, col = "#11111150", lty = 2)
points(-2.5, -2.5, pch = 1, cex = 33, col = "Red", lwd = 2)
points(2.5, 2.5, pch = 1, cex = 33, col = "Red", lwd = 2)

# t copula
mv.NE3  =  mvdc(tCopula(0.4, df = 1), c("norm", "norm"), 
list(list(mean = 0, sd  = 1), list(mean = 0, sd  = 1)))
mv.NE3 # using its print() / show() method
x.samp3  =  rMvdc(900, mv.NE3)
plot(x.samp3, xlim = c(-4, 4), ylim = c(-4, 4), ylab = "", xlab = "", main = "t", pch = 20, cex = 2)
abline(h = -4:4, v = -4:4, col = "#11111150", lty = 2)
points(-2.5, -2.5, pch = 1, cex = 33, col = "Red", lwd = 2)
points(2.5, 2.5, pch = 1, cex = 33, col = "Red", lwd = 2)

# Gumbel copula
mv.NE2  =  mvdc(gumbelCopula( iTau(gumbelCopula(), 0.4)), c("norm", "norm"), 
list(list(mean = 0, sd  = 1), list(mean = 0, sd  = 1)))
mv.NE2 # using its print() / show() method
x.samp2  =  rMvdc(900, mv.NE2)
plot(x.samp2, xlim = c(-4, 4), ylim = c(-4, 4), ylab = "", xlab = "", main = "Gumbel", pch = 20, cex = 2)
abline(h = -4:4, v = -4:4, col = "#11111150", lty = 2)
points(-2.5, -2.5, pch = 1, cex = 33, col = "Red", lwd = 2)
points(2.5, 2.5, pch = 1, cex = 33, col = "Red", lwd = 2)

