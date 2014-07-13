power <- read.csv("household_power_consumption.txt", na.strings = c("?"), sep=";")
p <- power[grep("^[12]/2/2007", power$Date), ]
p$DateTime <- strptime(paste0(p$Date, "T", p$Time), "%d/%m/%YT%T")

png(file = 'plot4.png', width = 480, height = 480)
mf <- par("mfrow")

par(mfrow = c(2, 2))

plot(y = p$Global_active_power, x = p$DateTime, type = "l", xlab = "", ylab = "Global Active Power")

plot(y = p$Voltage, x = p$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")

plot(y = p$Sub_metering_1, x = p$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
points(y = p$Sub_metering_2, x = p$DateTime, type = "l", col = "red")
points(y = p$Sub_metering_3, x = p$DateTime, type = "l", col = "blue")
legend("topright", bty = "n", legend = c("Sub_metering_1",  "Sub_metering_2",  "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

plot(y = p$Global_reactive_power, x = p$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

par(mfrow = mf)