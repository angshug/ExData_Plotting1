## Program to plot variation of global active power consumption over time
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec =".")

## Filter data based on date
dataToUse <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- na.omit(as.numeric(dataToUse$Global_active_power))

## Plot variation of power with time and store in png file device
png("plot2.png",width=480, height=480)
plot(datetime, globalActivePower, type='l', xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
