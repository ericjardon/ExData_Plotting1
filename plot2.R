# Author: Eric Andrés Jardón Chao 
# Code for plot 2

#Read data
file<- read.csv2("household_power_consumption.txt")

# subset to dates of interest
data<- subset(file, Date=="2/2/2007"|Date=="1/2/2007")

# combine Date and Time columns into a single POSIXlt vector
xTime <- paste(data$Date, data$Time, sep=" ")
xTime <- strptime(xTime, "%d/%m/%Y %H:%M:%S")

# Print weekdays to English:
Sys.setlocale("LC_TIME", "C")

# Create the graph
plot(xTime, data$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="n")
lines(xTime, data$Global_active_power)

# Save to png
dev.copy(png, file="plot4.png")
dev.off()