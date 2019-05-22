Data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")

## set time variable
Data_new <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Set_Time <-strptime(paste(Data_new$Date, Data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data_new <- cbind(Set_Time, Data_new)

## Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(Data_new$Set_Time, Data_new$Global_active_power, type="l", col="yellow", xlab="", ylab="Global Active Power")
plot(Data_new$Set_Time, Data_new$Voltage, type="l", col="purple", xlab="datetime", ylab="Voltage")
plot(Data_new$Set_Time, Data_new$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data_new$Set_Time, Data_new$Sub_metering_2, type="l", col="red")
lines(Data_new$Set_Time, Data_new$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(Data_new$Set_Time, Data_new$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()