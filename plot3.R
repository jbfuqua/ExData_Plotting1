# Exploratory Data Analysis - Project 1
# Generate plot3.png 

# Load the data

pwr <- read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

# convert Date format to "Date"

pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")

# select requested range: 2007-02-01 - 2007-02-02

range<-pwr[pwr$Date==as.Date("2007-02-01")|pwr$Date==as.Date("2007-02-02"),]

# convert time colum to POSIX

tmp <- as.character (range$Date)
tmp2 <- paste (tmp, range$Time, sep = " ")
  
range$Time<- strptime(tmp2, format="%Y-%m-%d %H:%M:%S")

# make the plot

plot(range$Time, range$Sub_metering_1, xlab="",ylab="Energy sub metering", type="l")
lines(range$Time, range$Sub_metering_2, col="red")
lines(range$Time, range$Sub_metering_3, col="blue")

legend("topright",col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

# save to PNG

dev.copy(png,"plot3.png",width=480,height=480)
dev.off()