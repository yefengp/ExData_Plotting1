powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F, na.strings = "?")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData <- cbind(powerData, datetime)
data <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot3.png")
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1 , col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()