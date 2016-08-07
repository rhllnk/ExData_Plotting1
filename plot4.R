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

# Converting values to numeric and saving them in a variables(to make code simple), which can be later used in plotting functions
y <- as.numeric(myData$Global_active_power)
z <- as.numeric(myData$Voltage)
p <- as.numeric(myData$Global_reactive_power)

#opening png graphic device
png("plot4.png", width=480, height=480)

# Number of plots per row/coloumns can be set usig Par() and mfrow/mfcol parameter.
#Par() is used to specify global graphics parameters. using mfrow, graphs are plotted row wise
par(mfrow = c(2,2))

# Below command Plot datetime vs Global_active_power of type line and with X, Y labels at (1,1)
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")

# Below command Plot datetime vs Voltage of type line and with X, Y labels at (1,2)
plot(x,z,type = "l", xlab = "datetime", ylab = "Voltage")

# Below functions plots datetime vs energy sub metering at (2,1). Initially, datetime vs Sub_metering_1 is plotted of line type with X, Y labels.
plot(x,myData$Sub_metering_1 ,type='l', col="black", xlab = " ", ylab = "Energy Sub Metering")

#adding graph for Sub_metering_2 and Sub_metering_3
lines(x,myData$Sub_metering_2 ,type='l', col = "red")
lines(x,myData$Sub_metering_3 ,type='l', col = "blue")

#adding legend on the topright of the graph. "Legend" parameter adds legend data, 
#lty provides details about line type and "Col" creates the lines in desired color
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

# Below command Plot datetime vs Global_reactive_power of type line and with X, Y labels at (2,2)
plot(x,p,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#closing the device
dev.off()
