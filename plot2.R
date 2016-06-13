# Reading the downloaded and unzipped data
readdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subsetting to obtain 2 days data: 
plotdata <- readdata[readdata$Date == "1/2/2007" | readdata$Date== "2/2/2007", ]
# Combining date and time data to create a new column
plotdata$datetime <- paste(plotdata$Date,plotdata$Time)
plotdata$datetime <- strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")
# Plotting output in png
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(plotdata$datetime , plotdata$Global_active_power, type="l",ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()