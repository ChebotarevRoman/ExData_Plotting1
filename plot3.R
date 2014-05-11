## Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", na.strings="?", stringsAsFactors=FALSE)

## Convert Dates and Times
data$Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Time)

## Subset 2 days - 2007-02-01 and 2007-02-02
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

## Open PNG device file and plot graph into
png(file = "plot3.png", width=480, height=480)

plot(data$Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(data$Time, data$Sub_metering_1, type="l", col="black")
points(data$Time, data$Sub_metering_2, type="l", col="red")
points(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", pch="_", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()