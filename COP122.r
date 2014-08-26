##### COP122 yafei.xu@hu - berlin.de

# data set is in the pool https://github.com/YafeiXu/CAMquantlet
# replace the path of the working directory if necessary
setwd("C:/R")
d = read.csv("dax140624.csv") # pls download the pertinent data set.
DateInput = as.Date(d[, 1])
numOfDate = as.numeric(as.Date(c(DateInput)))
newDF = data.frame(d, numOfDate)
sortNewDF = newDF[order(newDF[, 3]), ]
newDF2 = data.frame(sortNewDF, seq(1, length(newDF[, 3]), length.out = length(newDF[, 3])))
Pt = newDF[, 2]
P1 = Pt[ - length(Pt)]
P2 = Pt[ - 1]
DAXreturn = log(P1/P2)
DAXreturn = data.frame(DAXreturn, length(DAXreturn):1)
DAXreturn = DAXreturn[order(DAXreturn[, 2]), ]
DAXreturn = DAXreturn[, 1] * 100
r = DAXreturn[ - which(DAXreturn >= 6.5|DAXreturn <=  - 6.5)]

# kernel density,  normal samples and t samples
epaDensity = density(r,  bw  =  "nrd0",  adjust  =  1, 
                     kernel  =  c("epanechnikov"))
dNorm = dnorm(seq( - 6.5, 6.5, length.out = length(r)),  sd = 1.4)
dT = dt(seq( - 6.5, 6.5, length.out = length(r)),  df = .6)		

# do plot
hist1 = hist(r,  prob = TRUE,  12, main = "Histogram of DAX Return", col = "lightblue", freq = F, breaks  =  24) 

# kernel density estimation
plot(epaDensity,  col = "Blue",  lwd = 2, xlab = "R", ylab = "Density",  main = "The estimated density of DAX returns")
plot(hist1,  col = rgb(0, 0, 1, 1/4),  xlim = c( - 6, 6), freq = F,  add = T) 
lines(seq( - 6.5, 6.5, length.out = length(r)), dNorm,  col = "Red",  lwd = 2)
lines(seq( - 6.5, 6.5, length.out = length(r)), dT,  col = "Green",  lwd = 2)
box()

##