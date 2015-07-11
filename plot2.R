# Exploratory Data Analysis - Project 1
# Generate plot2.png 

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

plot(range$Time, range$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="l")

# save to PNG

dev.copy(png,"plot2.png",width=480,height=480)
dev.off()