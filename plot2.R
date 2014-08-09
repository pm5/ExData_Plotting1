data <- read.csv("power.txt", sep = ";", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
data <- transform(data, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
png('plot2.png')
with(data, plot(DateTime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

