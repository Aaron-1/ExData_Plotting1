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

##Plot1 (default png are 480 by 480)

png("plot1.png")
hist(FinalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
