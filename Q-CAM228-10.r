##### CAM228-10 yafei.xu@hu-berlin.de

# read data dax140624.csv from https://raw.githubusercontent.com/YafeiXu/CAMquantlet/master/bmwsim20140706
# replace the path of the working directory if necessary
d=read.csv("C:/Users/up2mike/Documents/GitHub/CAMquantlet/bmwsim20140706.csv") # 此处需要替换
PtBMW=d[,2]
P1BMW=PtBMW[-length(PtBMW)]
P2BMW=PtBMW[-1]
DAXreturnBMW=log(P1BMW)-log(P2BMW)

PtSIM=d[,3]
P1SIM=PtSIM[-length(PtSIM)]
P2SIM=PtSIM[-1]
DAXreturnSIM=log(P1SIM)-log(P2SIM)

newDF=data.frame(DAXreturnBMW,DAXreturnSIM)
plot(seq(-.1,.1,length.out=length(newDF[,1])), seq(-.1,.1,length.out=length(newDF[,1])), col="White")
points(newDF[,1], newDF[,2])

