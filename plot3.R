setwd("E:/E220 BackUp/System/Users/Ethan_Han/Desktop/Coursea/Data_Science_JHU9Courses/Exploratory_Data_Analysis/Week_1_Project")

test <- read.table("household_power_consumption.txt", header = T, nrows=1)
headerr <- unlist(strsplit(colnames(test),"\\."))

##2007-02-01 and 2007-02-02
test <- read.table("household_power_consumption.txt", header = F, nrows=2880, skip=66637)
temp <- t(matrix(unlist(strsplit(as.character(test[1:2880,]), "\\;")),nrow=9,ncol=2880))
colnames(temp) <- headerr

xx <- t(matrix(as.numeric(unlist(strsplit(temp[,2], "\\:"))),nrow=3,ncol=2880))
for (i in 1441:2880){
  xx[i,3] <- 1
}
xxx <- xx[,1]*60+xx[,2]+xx[,3]*24*60
yyy1 <- as.numeric(temp[,7])
yyy2 <- as.numeric(temp[,8])
yyy3 <- as.numeric(temp[,9])

png("E:/E220 BackUp/System/Users/Ethan_Han/Desktop/Coursea/Data_Science_JHU9Courses/Exploratory_Data_Analysis/Week_1_Project/plot3.png", width = 480, height = 480)
library(datasets)
plot(xxx, yyy1, type="l",  xaxt="n", xlab="", ylab="Energy sub metering") 
lines(xxx, yyy2, col = "red")
lines(xxx, yyy3, col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=1, at=seq(0,2880,1440),label=c("Thu","Fri","Sat"))
dev.off()