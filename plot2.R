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
#print(x)
y <- as.numeric(myData$Global_active_power)
#print(y)

#opening png graphic device
png("plot2.png", width=480, height=480)

#Creating a plot of type line and with Y label
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#closing the device
dev.off()
