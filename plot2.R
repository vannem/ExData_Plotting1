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
yyy <- as.numeric(temp[,3])

png("E:/E220 BackUp/System/Users/Ethan_Han/Desktop/Coursea/Data_Science_JHU9Courses/Exploratory_Data_Analysis/Week_1_Project/plot2.png", width = 480, height = 480)
library(datasets)
plot(xxx, yyy, type="l",  xaxt="n", xlab="", ylab="Global Active Power (kilowatts)") 
axis(side=1, at=seq(0,2880,1440),label=c("Thu","Fri","Sat"))
dev.off()

