data <- read.csv("power.txt", sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
data <- transform(data, datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
png("plot4.png")

par(mfrow = c(2, 2))

with(data, plot(datetime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power"))

with(data, plot(datetime, Voltage, type = "l"))

with(data, plot(datetime, Sub_metering_1, type = "n", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_1, col = "black"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright",
       bty = "n",
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
