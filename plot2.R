## Reading the data
## We assume the script the data file is in the working directory
data<-read.csv("household_power_consumption.txt",sep=";")

## Selecting data from 1/2/2007 and 2/2/2007
d<-data[which(data$Date %in% c("1/2/2007","2/2/2007")),]

## Creating a date column
d$DateTime <- strptime(paste(d$Date,d$Time,sep=" ") , "%d/%m/%Y %H:%M:%S")

## Converting Global Active Power to numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

## Creating the png device
png(filename = "plot2.png")

## Creating the plot
plot(d$DateTime,d$Global_active_power,"l", xlab="", ylab="Global Active Power (kilowatts)")

## Closing the device
dev.off()
