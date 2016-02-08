# Author: pourbrew
# Comments: removed working directory for security
###############################################################################

setwd()

source("load_data.R")

plot4 <- paste(getwd(), "/graphs/plot4.png", sep = "")
if(!file.exists(plot4)){
  png("graphs/plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))	
  plot(drawings$Time, drawings$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(drawings$Time, drawings$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
  plot(drawings$Time, drawings$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(drawings$Time, drawings$Sub_metering_2, type="l", col="red")
  lines(drawings$Time, drawings$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  plot(drawings$Time, drawings$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
  dev.off()
} else {
  par(mfrow=c(2,2))	
  plot(drawings$Time, drawings$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(drawings$Time, drawings$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
  plot(drawings$Time, drawings$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(drawings$Time, drawings$Sub_metering_2, type="l", col="red")
  lines(drawings$Time, drawings$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  plot(drawings$Time, drawings$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
}
