## Reading the data
## Assumes the script the data file is in the working directory
data<-read.csv("household_power_consumption.txt",sep=";")

## Selecting data from 1/2/2007 and 2/2/2007
d<-data[which(data$Date %in% c("1/2/2007","2/2/2007")),]

## Creating a date column
d$DateTime <- strptime(paste(d$Date,d$Time,sep=" ") , "%d/%m/%Y %H:%M:%S")

## Converting Sub_metering to numeric
d$Sub_metering_1<-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2<-as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3<-as.numeric(as.character(d$Sub_metering_3))

## Creating the png device
png(filename = "plot3.png")

## Creating the plot
ylab <- "Energy sub metering"
plot(d$DateTime,d$Sub_metering_1, xlab="", ylab=ylab, type="n")
lines(d$DateTime,d$Sub_metering_1, col="black")
lines(d$DateTime,d$Sub_metering_2, col="red")
lines(d$DateTime,d$Sub_metering_3, col="blue")

textlegend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3")

col<-c("black","red","blue")
lty<-c(1,1,1)
legend("topright",textlegend,lty=lty,col=col)

## Closing the device
dev.off()
