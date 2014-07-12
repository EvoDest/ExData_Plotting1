# Read the original data to be processed
originalData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset the necessary data from the original
specificData <- subset(originalData, as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

# Plot the graph and save to the file
png("plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))
with(specificData, {
  plot(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power",
    main=""
  )
  plot(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Sub_metering_1,
    type="l",
    xlab="",
    ylab="Energy sub metering",
    col="black"
  )
  lines(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Sub_metering_2,
    type="l",
    col="red"
  )
  lines(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Sub_metering_3,
    type="l",
    col="blue"
  )
  legend(
    "topright",
    bty="n",
    lty=1,
    col = c("black", "red", "blue"),
    cex=0.9,
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  plot(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Voltage,
    type="l",
    xlab="datetime",
    ylab="Voltage",
    main=""
  )
  plot(
    strptime(
      paste(Date, Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    Global_reactive_power,
    type="l",
    xlab="datetime",
    ylab="Global_reactive_power",
    main=""
  )
})
dev.off()

# Remove all date from environment
remove(list=ls())