##### CAM152 yafei.xu@hu-berlin.de

install.packages("xts")
library(xts)

# read data from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/bacSanCit.csv
# replace the path of the working directory if necessary
d=read.csv("C:/Users/up2mike/Documents/GitHub/CAMquantlet/bacSanCit.csv") # 此处需要替换

dxts=xts(data.frame(d[,2],d[,4],d[,3]), as.Date(d[,1]))


plot.xts(dxts,major.ticks='weeks',main="Figure 15: Stock prices for Bank of America, Citigroup and Santander
(from top to bottom).",col=1)

