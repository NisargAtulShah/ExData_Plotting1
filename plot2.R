## exploratory data analysis plot2


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
png(filename = "D:/Dropbox/nisarg_dss_home/ExData_Plotting1/plot2.png")
plot(two_days$datetime,two_days$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()


