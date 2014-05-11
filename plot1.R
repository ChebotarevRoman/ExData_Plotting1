## Read Data
data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", na.strings="?", stringsAsFactors=FALSE)

## Convert Dates
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

## Subset 2 days - 2007-02-01 and 2007-02-02
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
    
## Open PNG device file and plot histogram into it

png(file = "plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power",
         xlab="Global Active Power (kilowatts)", col="red")
dev.off()
