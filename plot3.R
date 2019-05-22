Data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")

## set time variable
Data_new <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Set_Time <-strptime(paste(Data_new$Date, Data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data_new <- cbind(Set_Time, Data_new)

## Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Data_new$Set_Time, Data_new$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(Data_new$Set_Time, Data_new$Sub_metering_2, col=columnlines[2])
lines(Data_new$Set_Time, Data_new$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()