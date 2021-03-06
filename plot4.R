# Reading the downloaded and unzipped data
readdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subsetting to obtain 2 days data: 
plotdata <- readdata[readdata$Date == "1/2/2007" | readdata$Date== "2/2/2007", ]
# Combining date and time data to create a new column
plotdata$datetime <- paste(plotdata$Date,plotdata$Time)
plotdata$datetime <- strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")
# Plotting output in png
png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(2,2))

plot(plotdata$datetime, plotdata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

plot(plotdata$datetime,plotdata$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(plotdata$datetime, plotdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(plotdata$datetime, plotdata$Sub_metering_2, type="l", col="red")
lines(plotdata$datetime, plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(plotdata$datetime,plotdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()