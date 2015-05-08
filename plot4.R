## Reading the data
## Assumes the script the data file is in the working directory
data<-read.csv("household_power_consumption.txt",sep=";")

## Selecting data from 1/2/2007 and 2/2/2007
d<-data[which(data$Date %in% c("1/2/2007","2/2/2007")),]

## Creating a date column
datetime <- strptime(paste(d$Date,d$Time,sep=" ") , "%d/%m/%Y %H:%M:%S")

## Converting data to numeric

d$Global_active_power<-as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power<-as.numeric(as.character(d$Global_reactive_power))
d$Voltage<-as.numeric(as.character(d$Voltage))
d$Sub_metering_1<-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_1<-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_1<-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2<-as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3<-as.numeric(as.character(d$Sub_metering_3))

## Creating the png device
png(filename = "plot4.png")

## Creating the plot

par(mfrow=c(2,2))

## First plot
plot(datetime,d$Global_active_power,"l", xlab="", ylab="Global Active Power (kilowatts)")

## Second plot
plot(datetime,d$Voltage,"l", ylab="Voltage")

## Third plot
ylab <- "Energy sub metering"
plot(datetime,d$Sub_metering_1, xlab="", ylab=ylab, type="n")
lines(datetime,d$Sub_metering_1, col="black")
lines(datetime,d$Sub_metering_2, col="red")
lines(datetime,d$Sub_metering_3, col="blue")

col<-c("black","red","blue")
lty<-c(1,1,1)
legend("topright",textlegend,lty=lty,col=col, bty="n")

## Fourth plot
plot(datetime,d$Global_reactive_power,"l", ylab="Global reactive power")

## Closing the device
dev.off()
