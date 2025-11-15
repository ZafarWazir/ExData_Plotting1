# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Filter dates and create datetime
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot 1 (top-left)
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Plot 2 (top-right)
plot(data$DateTime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Plot 3 (bottom-left)
plot(data$DateTime, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Plot 4 (bottom-right)
plot(data$DateTime, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()