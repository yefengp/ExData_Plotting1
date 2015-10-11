powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F, na.strings = "?")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData <- cbind(powerData, datetime)
data <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot4.png")

par(mfrow = c(2, 2)) 
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(data, plot(datetime, Voltage, type = "l"))
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty = "n", lty = 1 , col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
