Sys.setlocale("LC_ALL","English")

# Generating Plot 2

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

plot(data$Global_active_power~data$dateTime, xlab="",
     ylab = "Global Active Power (kilowatts)", type="l")
