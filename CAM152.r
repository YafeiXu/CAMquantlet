##### CAM152 yafei.xu@hu-berlin.de

# data set is in the pool https://github.com/YafeiXu/CAMquantlet
# replace the path of the working directory if necessary
setwd("C:/R")
d = read.csv("bacSanCit.csv") # pls download the pertinent data set
par(mfrow=c(3, 1)) 
d = data.frame(d)
plot(d[, 2]~as.Date(d[, 1]), type = "l", xlab = "", ylab = "Bank of America (Price)")
plot(d[, 4]~as.Date(d[, 1]), type = "l", xlab = "", ylab = "Citigroup (Price)")
plot(d[, 3]~as.Date(d[, 1]), type = "l", xlab = "Date", ylab = "Santander Bancorp (Price)")