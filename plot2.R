# Read the original data to be processed
originalData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset the necessary data from the original
specificData <- subset(originalData, as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

# Plot the graph and save to the file
png("plot2.png", width=480, height=480, units="px")
with(specificData, {
  plot(
    strptime(
      paste(specificData$Date, specificData$Time),
      format="%d/%m/%Y %H:%M:%S"
    ),
    specificData$Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)",
    main=""
  )
})
dev.off()

# Remove all date from environment
remove(list=ls())