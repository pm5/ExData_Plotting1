data <- read.csv("power.txt", sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
data <- transform(data, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
png("plot3.png")
with(data, plot(DateTime, Sub_metering_1, type = "n", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
