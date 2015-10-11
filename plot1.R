powerData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F, na.strings = "?")
#powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
datetime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData <- cbind(powerData, datetime)
data <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
