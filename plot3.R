# Author: Eric Andrés Jardón Chao 
# Code for plot 3

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
plot(xTime, data$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="n")
lines(xTime, data$Sub_metering_1, col="black")
lines(xTime, data$Sub_metering_2, col="red")
lines(xTime, data$Sub_metering_3, col="blue")

# Add legends to indicate colors, specify line type
legend("topright", lty=1, col = c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.7)

# Save to png
dev.copy(png, file="plot4.png")
dev.off()