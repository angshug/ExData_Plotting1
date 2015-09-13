## Program to create different plots in the same png file device 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec =".")

## Filter data based on date for differnt parameters
dataToUse <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- na.omit(as.numeric(dataToUse$Global_active_power))
globalReactivePower <- na.omit(as.numeric(dataToUse$Global_reactive_power))
Voltage <- na.omit(as.numeric(dataToUse$Voltage))
Submetering1 = as.numeric(dataToUse$Sub_metering_1)
Submetering2 = as.numeric(dataToUse$Sub_metering_2)
Submetering3 = as.numeric(dataToUse$Sub_metering_3)

 
png("plot4.png",width=480, height=480)
## Create panel plots with two rows and two columns
par(mfrow=c(2,2))

## First plot is Global Active Power vs datetime 
plot(datetime, globalActivePower, type='l', xlab="", ylab = "Global Active Power")

## First row, second column plot is Voltage vs datetime 
plot(datetime, Voltage, type="l", xlab="datetime", ylab = "Voltage")

## Second row, first column plot is energy submetering vs datetime 
plot(datetime, Submetering1, type='l', xlab="", ylab = "Energy Submetering")
lines(datetime, Submetering2, type ='l', col="red" )
lines(datetime, Submetering3, type ='l', col="blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))

## Second row, second column plot is Global reactive power vs datetime 
plot(datetime, globalReactivePower, type='l', xlab="datetime", ylab = "Global_reactive_power")
dev.off()
