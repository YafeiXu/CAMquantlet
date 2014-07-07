##### CAM239-12 yafei.xu@hu-berlin.de

### Clayton copula
ng=10 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)

### 编制函数以供outer()使用
theta=2
fhat=function(x,y){
v=numeric()
v=(ifelse(x^(-theta)+y^(-theta)-1>0, x^(-theta)+y^(-theta)-1, 0))^(-1/theta)
return(v)
}
### 使用outer函数
outer931=outer(x,y,fhat)

### do plot
persp(x, y, outer931,
theta =55, phi = 35,
col="blue")


############################################################# Gumbel
library(rgl)
ng=33 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)
### 编制函数以供outer()使用
theta=2
fhat=function(x,y){
v=numeric()
v=exp(-((-log(x))^(1/theta)+(-log(y))^(1/theta))^theta)
return(v)
}
### 使用outer函数
outer931=outer(x,y,fhat)

### do plot
persp(x, y, outer931,
theta =55, phi = 35,
col="blue")

############################################################# Normal copula
library(mnormt)
mu <- c(0, 0)
Sigma <- matrix(c(1,0,0,1), 2, 2)

ng=133 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)
### 编制函数以供outer()使用
fhat=function(x,y){
v=numeric()
v=dmnorm(cbind(x,y), mu, Sigma)
return(v)
}

### 使用outer函数
outer931=outer(qnorm(x),qnorm(y),fhat)

### do plot
persp(x, y, outer931,
theta =55, phi = 35,
col="blue")














