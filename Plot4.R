##read data (assumes has been extracted and in working directory)

data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## convert date

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## reduce data to dates 2007-02-01 and 2007-02-02

subsetdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##Combine date and time and create a final dateset

datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$Date_Time <- as.POSIXct(datetime)
FinalData <- subsetdata[, c(10, 3:9)]

##Plot4 (default png are 480 by 480)

png("plot4.png")


par(mfrow = c(2,2))
plot(FinalData$Global_active_power ~ FinalData$Date_Time, ylab = "Global Active Power", xlab = "", type = "l")
plot(FinalData$Voltage ~ FinalData$Date_Time, ylab = "Voltage", xlab = "datetime", type = "l")
plot(FinalData$Sub_metering_1 ~ FinalData$Date_Time, ylab = "Energy sub metering", xlab = "", type = "l")
lines(FinalData$Sub_metering_2 ~ FinalData$Date_Time, col = 'Red')
lines(FinalData$Sub_metering_3 ~ FinalData$Date_Time, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(FinalData$Global_reactive_power ~ FinalData$Date_Time, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()