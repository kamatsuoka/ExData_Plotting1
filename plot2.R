power <- read.csv("household_power_consumption.txt", na.strings = c("?"), sep=";")
p <- power[grep("^[12]/2/2007", power$Date), ]
p$DateTime <- strptime(paste0(p$Date, "T", p$Time), "%d/%m/%YT%T")
png(file = 'plot2.png', width = 480, height = 480)
plot(y = p$Global_active_power, x = p$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()