# Author: pourbrew
# Comments: removed working directory for security
###############################################################################

setwd()

source("load_data.R")

plot3 <- paste(getwd(), "/graphs/plot3.png", sep = "")
if(!file.exists(plot3)){
  png("graphs/plot3.png", width = 480, height = 480)
  plot(drawings$Time, drawings$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(drawings$Time, drawings$Sub_metering_2, type="l", col="red")
  lines(drawings$Time, drawings$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  dev.off()
} else {
  plot(drawings$Time, drawings$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(drawings$Time, drawings$Sub_metering_2, type="l", col="red")
  lines(drawings$Time, drawings$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
}
