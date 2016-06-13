# Reading the downloaded and unzipped data
readdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subsetting to obtain 2 days data: 
plotdata <- readdata[readdata$Date == "1/2/2007" | readdata$Date== "2/2/2007", ]
# Plotting output in png
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(plotdata$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()