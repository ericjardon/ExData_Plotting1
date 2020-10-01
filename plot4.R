# Author: Eric Andrés Jardón Chao 
# Code for plot 4

#Read and subset data 
file<- read.csv2("household_power_consumption.txt")
data<- subset(file, Date=="2/2/2007"|Date=="1/2/2007")
Sys.setlocale("LC_TIME", "C")

# Construct datetime vector for x-axis
xTime <- paste(data$Date, data$Time, sep=" ")
xTime <- strptime(xTime, "%d/%m/%Y %H:%M:%S")


#Global parameters

windows(height = 7, width = 7)
par(mfrow=c(2,2), mar=c(4,4,1,2))
# plot 1
with(data, plot(xTime, Global_active_power, type="n",
                xlab="", ylab="Global Active Power"))
with(data, lines(xTime, Global_active_power))

# plot 2
with(data, plot(xTime, Voltage, type="n",
                xlab="datetime", ylab="Voltage"))
with(data, lines(xTime, Voltage))

# plot 3
plot(xTime, data$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="n")
lines(xTime, data$Sub_metering_1, col="black")
lines(xTime, data$Sub_metering_2, col="red")
lines(xTime, data$Sub_metering_3, col="blue")

legend("topright", lty=1, col = c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.7, box.lty=0)

# plot 4
with(data, plot(xTime, Global_reactive_power, type="n",
                xlab="datetime", ylab="Global Reactive Power"))
with(data, lines(xTime, Global_reactive_power))

# Save to png
dev.copy(png, file="plot4.png")
dev.off()