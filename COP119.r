##### COP119 yafei.xu@hu - berlin.de

# data set is in the pool https://github.com/YafeiXu/CAMquantlet
# replace the path of the working directory if necessary
setwd("C:/R")
d = read.csv("dax140624.csv") # pls download the pertinent data set.
DateInput = as.Date(d[, 1])
numOfDate = as.numeric(as.Date(c(DateInput)))
newDF = data.frame(d, numOfDate)
Pt = newDF[, 2]
P1 = Pt[ - length(Pt)]
P2 = Pt[ - 1]
DAXreturn = log(P1) - log(P2)
DAXreturn = DAXreturn * 100
r = DAXreturn

# Uniform kernel function
kF = function(u){
.5 * ifelse(abs(u) <= 1, 1, 0) 
}

# Epanechnikov kernel density estimator
fhat = function(x, h){
(1 / (5 * h)) * (kF((x + .475) / h) + kF((x + 1.553) / h) + kF((x + .434) / h) + kF((x + 1.019) / h) + kF((x - .395) / h))
}
fhatOnDaxReturn = fhat(sort(r), .53)

# 5 uniform
n1 = kF((seq( - 2.5,  1,  length.out = length(r)) + 1.019) / .7) - .8
n2 = kF((seq( - 2.5,  1,  length.out = length(r)) + .475) / .7) - .8
n3 = kF((seq( - 2.5,  1,  length.out = length(r)) + 1.553) / .7) - .8
n4 = kF((seq( - 2.5,  1,  length.out = length(r)) + .434) / .7) - .8
n5 = kF((seq( - 2.5,  1,  length.out = length(r)) - 0.395) / .7) - .8

# do plot
plot(seq( - 2.5,  1,  length.out = length(r)),  seq( - .8,  .7,  length.out = length(r)),  col = "White", xlab = "", ylab = "")
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  n1,  col = 1)
lines(seq( - 2.5,  1,  length.out = length(r)),  n2,  col = 2)
lines(seq( - 2.5,  1,  length.out = length(r)),  n3,  col = 3)
lines(seq( - 2.5,  1,  length.out = length(r)),  n4,  col = 4)
lines(seq( - 2.5,  1,  length.out = length(r)),  n5,  col = 5)
