getwd()

# saving working directory path in a variable, which is later used to read the file
path <- getwd()

# reading the downloaded data file from folder "Data" in current working directory.
tempData <- read.csv(file.path(path, "Data", "household_power_consumption.txt"), sep = ";", stringsAsFactors=FALSE)

# Checking to see if data is correctly read
head(tempData)
nrow(tempData)

#reading required data i.e, data from the dates 2007-02-01 and 2007-02-02
myData <- tempData[tempData$Date %in% "1/2/2007" | tempData$Date %in% "2/2/2007", ]

#converting string to a time data type, which is later used for plotting
x <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#opening png graphic device
png("plot3.png", width=480, height=480)

#Plotting Sub_metering_1 of line type and with required color and labels
plot(x,myData$Sub_metering_1 ,type='l', col="black", xlab = " ", ylab = "Energy Sub Metering")

#adding graph for Sub_metering_2
lines(x,myData$Sub_metering_2 ,type='l', col = "red")

#adding graph for Sub_metering_3
lines(x,myData$Sub_metering_3 ,type='l', col = "blue")

#adding legend on the topright of the graph. "Legend" parameter adds legend data, 
#lty provides details about line type and "Col" creates the lines in desired color
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

#closing the device
dev.off()