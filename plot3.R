# Read the original data to be processed
originalData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset the necessary data from the original
specificData <- subset(originalData, as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

# Plot the graph and save to the file
png("plot3.png", width=480, height=480, units="px")
with(specificData, {
  plot(
    strptime(
      paste(specificData$Date, specificData$Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    specificData$Sub_metering_1,
    type="l",
    xlab="",
    ylab="Energy sub metering",
    col="black"
  )
  lines(
    strptime(
      paste(specificData$Date,specificData$Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    specificData$Sub_metering_2,
    type="l",
    col="red"
  )
  lines(
    strptime(
      paste(specificData$Date,specificData$Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    specificData$Sub_metering_3,
    type="l",
    col="blue"
  )
  legend(
    "topright",
    lty=1,
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
})
dev.off()

# Remove all date from environment
remove(list=ls())