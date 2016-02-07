## exploratory data analysis plot3


setwd("D:/Dropbox/nisarg_dss_home/4 exploratory data analysis")

## read the full data with header and required seperation and missing value symbols
power_data<- read.table("household_power_consumption.txt",sep = ";",na.strings="?",header = T)
str(power_data)

## subset the data with only the required data for 2 days
two_days<-subset(power_data,power_data$Date %in% c("1/2/2007","2/2/2007"))
str(two_days)

## merge the date and time columns and get them in to the correct format
two_days$datetime <- strptime(paste(two_days$Date, two_days$Time), format = "%d/%m/%Y %H:%M:%S")
head(two_days)

## plot in png device
png(filename = "D:/Dropbox/nisarg_dss_home/ExData_Plotting1/plot3.png")
with(two_days,plot(datetime,Sub_metering_1,type = "n",ylab = "Energy sub metering"))
points(two_days$datetime,two_days$Sub_metering_1,col ="black",type = "l")
points(two_days$datetime,two_days$Sub_metering_2,col ="red",type = "l")
points(two_days$datetime,two_days$Sub_metering_3,col ="blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=c(1,1,1),cex = 0.75)
dev.off()


