mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

newdata<-mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Plotdata <- as.numeric(newdata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, Plotdata, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

