# Generating Plot 1

data <- read.table("https://www.dropbox.com/s/mrwd99x6uxnjc2i/household_power_consumption.txt?dl=1", header = T, sep = ";", stringsAsFactors = F)

data<- data[66637:69516,]

hist(as.numeric(data$Global_active_power), col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")
