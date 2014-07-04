##### CAM7epakde yafei.xu@hu-berlin.de

# read data dax140624.csv from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/DAX19902014.csv
# replace the path of the working directory if necessary
d=read.csv("C:/Users/up2mike/Documents/GitHub/CAMquantlet/dax140624.csv") # 此处需要替换
DateInput=as.Date(d[,1])
numOfDate=as.numeric(as.Date(c(DateInput)))
newDF=data.frame(d,numOfDate)
Pt=newDF[,2]
P1=Pt[-length(Pt)]
P2=Pt[-1]
DAXreturn=log(P1/P2)
DAXreturn=data.frame(DAXreturn,length(DAXreturn):1)
DAXreturn=DAXreturn[order(DAXreturn[,2]),]
DAXreturn=DAXreturn[,1]*100

# Epanechnikov kernel function
kF=function(u){
.75*(1-u^2)*ifelse(abs(u)<=1,1,0) 
}

# Epanechnikov kernel density estimator

n=length(DAXreturn)
fhat=function(x,h){
1/(n*h)*(kF((x+.475)/h)+kF((x+1.553)/h)+kF((x+.434)/h)+kF((x+1.019)/h)+kF((x-.395)/h))
}
fhatOnDaxReturn=sort(fhat(DAXreturn,.7))

# do plot
plot(fhatOnDaxReturn,type="l")

				   
#box()
