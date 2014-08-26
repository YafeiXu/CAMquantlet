##### COP121 yafei.xu@hu - berlin.de

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

# bandwidth
bdw = .29

# distance 
dis = .4

# Gaussian kernel function
kF = function(u){
(1 / sqrt(2 * pi)) * exp( - u^2 / 2)
}

# Epanechnikov kernel density estimator
fhat = function(x, h){
(1 / (5 *  h)) * (kF((x + .475) / h) + kF((x + 1.553) / h) + kF((x + .434) / h) + kF((x + 1.019) / h) + kF((x - .395) / h))
}
fhatOnDaxReturn = fhat(sort(r), bdw)

# 5 combinations
combi.lightblue = function(x, h){
(1 /  (5 *  h)) *  (kF((x + .475) /  h))
}
fhatOnDaxReturn.lblue = combi.lightblue(sort(r), bdw)

combi.skin = function(x, h){
(1 / (5 *  h)) * (kF((x + .475) / h) + kF((x + 1.553) / h))
}
fhatOnDaxReturn.skin = combi.skin(sort(r), bdw)

combi.blue = function(x, h){
(1 / (5 *  h)) * (kF((x + .475) / h) + kF((x + 1.553) / h) + kF((x + .434) / h))
}
fhatOnDaxReturn.blue = combi.blue(sort(r), bdw)

combi.pink = function(x, h){
(1 / (5 *  h)) * (kF((x + .475) / h) + kF((x + 1.553) / h) + kF((x + .434) / h) + kF((x + 1.019) / h))
}
fhatOnDaxReturn.pink = combi.pink(sort(r), bdw)



# 5 singles 
single.lightblue = function(x, h){
(kF((x + .475) / h))
}
fhatOnDaxReturn.single.lblue = single.lightblue(sort(r), bdw) - dis

single.blue = function(x, h){
(kF((x + .434) / h))
}
fhatOnDaxReturn.single.blue = single.blue(sort(r), bdw) - dis

single.pink = function(x, h){
(kF((x + 1.019) / h))
}
fhatOnDaxReturn.single.pink = single.pink(sort(r), bdw) - dis

single.skin = function(x, h){
(kF((x + 1.553) / h))
}
fhatOnDaxReturn.single.skin = single.skin(sort(r), bdw) - dis

single.gray = function(x, h){
(kF((x - .395) / h))
}
fhatOnDaxReturn.single.gray = single.gray(sort(r), bdw) - dis

# do plot
plot(seq( - 2.5,  1,  length.out = length(r)),  seq( - dis,  .7,  length.out = length(r)), 
     col = "White", xlab = "", ylab = "", axes = FALSE,  xaxt = "n",  yaxt = "n")
box() 
axis(1, at = c( - 2.5,  - 2.0,  - 1.5,  - 1,  - .5, 0, .5, 1))
axis(2, at = c(0, .2, .4, .6))
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  seq(0,  0,  length.out = length(r)), type = "l")
polygon(c(seq( - 2.5,  1,  length.out = length(r)),  rev(seq( - 2.5,  1,  length.out = length(r)))),  
c(fhatOnDaxReturn,  rev(seq(0,  0,  length.out = length(r)))), 
  col  =  "chocolate",  border  =  "Black")
	 
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.pink, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  seq(0,  0,  length.out = length(r)), type = "l")
polygon(c(seq( - 2.5,  1,  length.out = length(r)),  rev(seq( - 2.5,  1,  length.out = length(r)))),  
c(fhatOnDaxReturn.pink,  rev(seq(0,  0,  length.out = length(r)))), 
  col  =  "deeppink",  border  =  "Black")
	 
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.blue, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  seq(0,  0,  length.out = length(r)), type = "l")
polygon(c(seq( - 2.5,  1,  length.out = length(r)),  rev(seq( - 2.5,  1,  length.out = length(r)))),  
c(fhatOnDaxReturn.blue,  rev(seq(0,  0,  length.out = length(r)))), 
  col  =  "Blue",  border  =  "Black")	 
	 
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.skin, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  seq(0,  0,  length.out = length(r)), type = "l")
polygon(c(seq( - 2.5,  1,  length.out = length(r)),  rev(seq( - 2.5,  1,  length.out = length(r)))),  
c(fhatOnDaxReturn.skin,  rev(seq(0,  0,  length.out = length(r)))), 
  col  =  "sandybrown",  border  =  "Black")

lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.lblue, type = "l")
lines(seq( - 2.5,  1,  length.out = length(r)),  seq(0,  0,  length.out = length(r)), type = "l")
polygon(c(seq( - 2.5,  1,  length.out = length(r)),  rev(seq( - 2.5,  1,  length.out = length(r)))),  
c(fhatOnDaxReturn.lblue,  rev(seq(0,  0,  length.out = length(r)))), 
  col  =  "plum",  border  =  "Black")	
	 	 
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.single.skin,  col = "sandybrown")
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.single.pink,  col = "deeppink")
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.single.lblue,  col = "plum")
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.single.blue,  col = "Blue")
lines(seq( - 2.5,  1,  length.out = length(r)),  fhatOnDaxReturn.single.gray,  col = "chocolate")
