##### CAM3kdehist yafei.xu@hu-berlin.de

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
r=DAXreturn[-which(DAXreturn>=6.5|DAXreturn<=-6.5)]
# do plot
plot(density(r))
#plot(seq(-6.5,6.5,length.out=10),seq(min(r),max(r),length.out=10),xlab="",ylab="", main=expression("DAX ("*P[t]*")"),col="White",axes=FALSE, xaxt="n", yaxt="n")
hist(r, prob=TRUE, 12,main="Histogram of DAX Return",col="cadetblue3",freq=F,breaks = 24,add=T) 
lines(density(r,kernel = c("gaussian")),col="Red",lwd=5)
lines(density(r,kernel = c("epanechnikov")),col="Blue",lwd=5)
lines(density(r,kernel = c("rectangular")),col="Green",lwd=5)
				   
				   				   
				   				   
				   
				   
				   
				   
				   
				   
#box()


b = 0:0002113130; b2 = 0:0002001865



kernel = c("gaussian", "epanechnikov", "rectangular",
                   "triangular", "biweight",
                   "cosine", "optcosine")