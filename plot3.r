plot3 <- function(){
  # Read the power consumption.txt file (assumes the file is in the working directory)
  PC_Data <- read.delim("./household_power_consumption.txt", header = TRUE, sep = ";",dec = ".", stringsAsFactors = FALSE)
  
  # Merge Date and Time together into a new column
  DateTime <- strptime(paste(PC_Data$Date, PC_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  PC_Data <- cbind(PC_Data, DateTime)
  
  #Change date column to Data class 
  PC_Data$Date <- as.Date(PC_Data$Date,format="%d/%m/%Y")
  
  #subset Dataset to include data from 2007-02-01 and 2007-02-02 only
  PC_DataSub <- subset(PC_Data, Date == "2007-02-01" | Date =="2007-02-02")
  
  #change Sub_metering_1,2,3 columns to numeric class
  PC_DataSub$Sub_metering_1 <- as.numeric(PC_DataSub$Sub_metering_1)
  PC_DataSub$Sub_metering_2 <- as.numeric(PC_DataSub$Sub_metering_2)
  PC_DataSub$Sub_metering_3 <- as.numeric(PC_DataSub$Sub_metering_3)
  
  #plot Global Active power vs DateTime
  png("plot3.png", width=480, height=480)
  plot(PC_DataSub$DateTime, PC_DataSub$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  lines(PC_DataSub$DateTime, PC_DataSub$Sub_metering_2, type="l", col = "red")
  lines(PC_DataSub$DateTime, PC_DataSub$Sub_metering_3, type="l", col = "blue")
  
  # Add a legend
  legend(c("topright"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  dev.off()
  
}
