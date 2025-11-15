# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Filter dates and create datetime
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Convert to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create plot
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()