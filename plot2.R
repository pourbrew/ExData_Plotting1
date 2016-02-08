# Author: pourbrew
# Comments: removed working directory for security
###############################################################################

setwd()

source("load_data.R")

plot2 <- paste(getwd(), "/graphs/plot2.png", sep = "")
if(!file.exists(plot2)){
  png("graphs/plot2.png", width = 480, height = 480)
  plot(drawings$Time, drawings$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
} else {
  plot(drawings$Time, drawings$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
}
