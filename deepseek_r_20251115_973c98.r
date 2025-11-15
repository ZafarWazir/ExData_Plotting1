# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Filter dates and create datetime
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create plot
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()