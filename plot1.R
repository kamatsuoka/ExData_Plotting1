power <- read.csv("household_power_consumption.txt", na.strings = c("?"), sep=";")
p <- power[grep("^[12]/2/2007", power$Date), ]
png(file = 'plot1.png', width = 480, height = 480)
hist(p$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = 'red')
dev.off()