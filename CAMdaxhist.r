##### CAMdaxhist yafei.xu@hu-berlin.de

# read data dax140624.csv from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/DAX19902014.csv
# replace the path of the working directory if necessary
setwd("C:/R")
d=read.csv("dax140624.csv")
DateInput=as.Date(d[,1])
numOfDate=as.numeric(as.Date(c(DateInput)))
newDF=data.frame(d,numOfDate)
sortNewDF=newDF[order(newDF[,3]),]
newDF2=data.frame(sortNewDF,seq(1,length(newDF[,3]),length.out=length(newDF[,3]))) 
P=newDF2[,2]
# plot histogram
hist(P, prob=TRUE, 12,main="Histogram of DAX",col="Blue",freq=F,breaks = 37) 
box() 
