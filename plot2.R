Data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")

## set time variable
Data_new <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Set_Time <-strptime(paste(Data_new$Date, Data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data_new <- cbind(Set_Time, Data_new)

## Generating Plot 2
plot(Data_new$Set_Time, Data_new$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()