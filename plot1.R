# Read the original data to be processed
originalData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset the necessary data from the original
specificData <- subset(originalData, as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

# Plot the graph and save to the file
png("plot1.png", width=480, height=480, units="px")
with(specificData, {
  hist(
    Global_active_power,
    col="red",
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    main="Global Active Power"
  )
})
dev.off()

# Remove all data from environment
remove(list=ls())