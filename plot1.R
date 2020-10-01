# Author: Eric Andrés Jardón Chao 
# Code for plot 1
# NOTE: FOR THE FOUR PLOTS THE ENTIRE SCRIPT MUST BE RUN :) THANK YOU

#Read data
file<- read.csv2("household_power_consumption.txt")

# subset to dates of interest
data<- subset(file, Date=="2/2/2007"|Date=="1/2/2007")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

hist(as.numeric(data$Global_active_power), col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save to png
dev.copy(png, file="plot4.png")
dev.off()