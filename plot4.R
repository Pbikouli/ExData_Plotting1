mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

newdata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Plotdata <- as.numeric(newdata$Global_active_power)
Plotdatareac <- as.numeric(newdata$Global_reactive_power)
Plotdatavolt <- as.numeric(newdata$Voltage)
x<-as.numeric(newdata$Sub_metering_1)
y<-as.numeric(newdata$Sub_metering_2)
z<-as.numeric(newdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datetime, Plotdata, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, x, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, y, type="l", col="red")
lines(datetime, z, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime, Plotdatavolt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Plotdatareac, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

