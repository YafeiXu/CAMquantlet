##### CAM115 yafei.xu@hu-berlin.de

# read data dax140624.csv from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/DAX19902014.csv
# replace the path of the working directory if necessary
setwd("C:/R")
d=read.csv("dax140624.csv")
DateInput=as.Date(d[,1])
numOfDate=as.numeric(as.Date(c(DateInput)))
newDF=data.frame(d,numOfDate)
sortNewDF=newDF[order(newDF[,3]),]
newDF2=data.frame(sortNewDF,seq(1,length(newDF[,3]),length.out=length(newDF[,3])))
Pt=newDF[,2]
P1=Pt[-length(Pt)]
P2=Pt[-1]
DAXreturn=log(P1/P2)
DAXreturn=data.frame(DAXreturn,length(DAXreturn):1)
DAXreturn=DAXreturn[order(DAXreturn[,2]),]
DAXreturn=DAXreturn[,1]*100
r=DAXreturn[-which(DAXreturn>=6.5|DAXreturn<=-6.5)]
# do plot
hist(r, prob=TRUE, 12,main="Histogram of DAX Return",col="Blue",freq=F,breaks = 24) 
box()
