# Author: pourbrew
# Comments: removed working directory for security
###############################################################################

setwd("")

library(httr) 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data <- "data"
if(!file.exists(data)){
  dir.create(data)
} 
graphs <- "graphs" 
if(!file.exists(graphs)){
  dir.create(graphs)
}
archive <- paste(getwd(), "/data/household_power_consumption.zip", sep = "")
if(!file.exists(archive)){
  download.file(url, archive, method="curl", mode="wb")
}
archive <- paste(getwd(), "/data/household_power_consumption.txt", sep = "")
if(!file.exists(archive)){
  unzip(archive, list = FALSE, overwrite = FALSE, exdir = data)
}

dataprep <- paste(getwd(), "/data/dataprep.rds", sep = "")
if(!file.exists(dataprep)){
  data <- "data/household_power_consumption.txt"
  drawings <- read.table(data, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  drawings$Time <- strptime(paste(drawings$Date, drawings$Time), "%d/%m/%Y %H:%M:%S")
  drawings$Date <- as.Date(drawings$Date, "%d/%m/%Y")
  fetch <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  drawings <- subset(drawings, Date %in% fetch)
  dataprep <- paste(getwd(), "/", "data", "/", "dataprep", ".rds", sep="")
  saveRDS(drawings, dataprep)
} else {
  data <- "data/dataprep.rds"
  drawings <- readRDS(data)
}
