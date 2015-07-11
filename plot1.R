# Exploratory Data Analysis - Project 1
# Generate plot1.png 

# Load the data

pwr <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

# convert Date format to "Date"

pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")

# select requested range: 2007-02-01 - 2007-02-02

range<-pwr[pwr$Date==as.Date("2007-02-01")|pwr$Date==as.Date("2007-02-02"),]

# make the histogram

hist(range$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")

# save to PNG

dev.copy(png,"plot1.png",width=480,height=480)
dev.off()