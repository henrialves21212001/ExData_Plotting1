## first plot
h_consumption <- "household_power_consumption.txt"
# Read only relevant data
data <- read.table(h_consumption, header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))
# Subset the correct time interval
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
# Create plot
png("plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## second plot
# Create datetime variable
datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")
# Plot
png("plot2.png", width = 480, height = 480)
plot(datetime, subset_data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## third plot
# Plot
png("plot3.png", width = 480, height = 480)
plot(datetime, subset_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subset_data$Sub_metering_2, col = "red")
lines(datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## fourth plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))  # 2x2 layout

# Top-left
plot(datetime, subset_data$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# Top-right
plot(datetime, subset_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Bottom-left
plot(datetime, subset_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subset_data$Sub_metering_2, col = "red")
lines(datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"),
       lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom-right
plot(datetime, subset_data$Global_reactive_power, type = "l",
     ylab = "Global Reactive Power", xlab = "datetime")

