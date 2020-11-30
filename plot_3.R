# Generating Plot 3

data <- read.table("https://www.dropbox.com/s/mrwd99x6uxnjc2i/household_power_consumption.txt?dl=1", header = T, sep = ";", stringsAsFactors = F)

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Subsetting dataset  (Feb. 1, 2007 and Feb. 2, 2007)
data<- data[66637:69516,]
data$Date <- as.factor(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

## Combine Date and Time column
dateTime <- paste(data$Date, data$Time)

## Add DateTime column
data$dataTime <- dateTime

## Format dateTime Column
data$dateTime <- as.POSIXct(dateTime)

plot(data$Sub_metering_1~data$dateTime, type="l", ylab="Energy Submetering", xlab="")
lines(data$Sub_metering_2~data$dateTime, type="l", col="red")
lines(data$Sub_metering_3~data$dateTime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
