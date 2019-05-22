Data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")

## set time variable
Data_new <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Set_Time <-strptime(paste(Data_new$Date, Data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data_new <- cbind(Set_Time, Data_new)

## Generating Plot 1
hist(Data_new$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()