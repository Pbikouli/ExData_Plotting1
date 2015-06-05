mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

newdata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

x<-as.numeric(newdata$Sub_metering_1)
y<-as.numeric(newdata$Sub_metering_2)
z<-as.numeric(newdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, x, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, y, type="l", col="red")
lines(datetime, z, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
