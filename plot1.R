setwd("E:/E220 BackUp/System/Users/Ethan_Han/Desktop/Coursea/Data_Science_JHU9Courses/Exploratory_Data_Analysis/Week_1_Project")

test <- read.table("household_power_consumption.txt", header = T, nrows=1)
headerr <- unlist(strsplit(colnames(test),"\\."))

##2007-02-01 and 2007-02-02
test <- read.table("household_power_consumption.txt", header = F, nrows=2880, skip=66637)
temp <- t(matrix(unlist(strsplit(as.character(test[1:2880,]), "\\;")),nrow=9,ncol=2880))
colnames(temp) <- headerr

png("E:/E220 BackUp/System/Users/Ethan_Han/Desktop/Coursea/Data_Science_JHU9Courses/Exploratory_Data_Analysis/Week_1_Project/plot1.png", width = 480, height = 480)
library(datasets)
hist(as.numeric(temp[,3]), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
