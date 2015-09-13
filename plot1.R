## Program to plot histogram of global active power between two dates and store it in a png file 

## Filter data between specified dates
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec =".")
dataToUse <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Get data for only the global active power 
globalActivePower <- na.omit(as.numeric(dataToUse$Global_active_power))

## Open a png file device, plot the histogram and then close the file device 
png("plot1.png",width=480, height=480)
hist(globalActivePower, col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()