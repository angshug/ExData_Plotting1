## Program to plot variation of three different Energy submeterings   over time on the same plot
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec =".")

## Filter data based on date
dataToUse <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Submetering1 = as.numeric(dataToUse$Sub_metering_1)
Submetering2 = as.numeric(dataToUse$Sub_metering_2)
Submetering3 = as.numeric(dataToUse$Sub_metering_3)

## Plot variation of energy submetering with time and store in png file device
png("plot3.png",width=480, height=480)

plot(datetime, Submetering1, type='l', xlab="", ylab = "Energy Submetering")
lines(datetime, Submetering2, type ='l', col="red" )
lines(datetime, Submetering3, type ='l', col="blue" )
#Add legend on top right corner for the three line plots using three colors
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))

dev.off()

