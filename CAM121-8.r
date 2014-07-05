##### CAM121-8 yafei.xu@hu-berlin.de

# read data dax140624.csv from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/DAX19902014.csv
# replace the path of the working directory if necessary
d=read.csv("C:/Users/up2mike/Documents/GitHub/CAMquantlet/dax140624.csv") # 此处需要替换
DateInput=as.Date(d[,1])
numOfDate=as.numeric(as.Date(c(DateInput)))
newDF=data.frame(d,numOfDate)
Pt=newDF[,2]
P1=Pt[-length(Pt)]
P2=Pt[-1]
DAXreturn=log(P1)-log(P2)
DAXreturn=DAXreturn*100

r=DAXreturn

# Gaussian kernel function
kF=function(u){
(1/sqrt(2*pi))*exp(-u^2/2)
}

# Epanechnikov kernel density estimator
fhat=function(x,h){
(1/(5*h))*(kF((x+.475)/h)+kF((x+1.553)/h)+kF((x+.434)/h)+kF((x+1.019)/h)+kF((x-.395)/h))
}
fhatOnDaxReturn=fhat(sort(r),.3)

# 5 normals

# 5 uniform
n1=kF((seq(-2.5, 1, length.out=length(r))+1.019)/.7)-.8
n2=kF((seq(-2.5, 1, length.out=length(r))+.475)/.7)-.8
n3=kF((seq(-2.5, 1, length.out=length(r))+1.553)/.7)-.8
n4=kF((seq(-2.5, 1, length.out=length(r))+.434)/.7)-.8
n5=kF((seq(-2.5, 1, length.out=length(r))-0.395)/.7)-.8

# do plot
plot(seq(-2.5, 1, length.out=length(r)), seq(-.8, .7, length.out=length(r)), col="White")
lines(seq(-2.5, 1, length.out=length(r)), fhatOnDaxReturn,type="l")
lines(seq(-2.5, 1, length.out=length(r)), n1, col=1)
lines(seq(-2.5, 1, length.out=length(r)), n2, col=2)
lines(seq(-2.5, 1, length.out=length(r)), n3, col=3)
lines(seq(-2.5, 1, length.out=length(r)), n4, col=4)
lines(seq(-2.5, 1, length.out=length(r)), n5, col=5)
