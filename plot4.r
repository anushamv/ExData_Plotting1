plot4 <- function(){
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
  
  #change Voltage column to numeric class
  PC_DataSub$Voltage <- as.numeric(PC_DataSub$Voltage)
  
  #change Global Active column to numeric class
  PC_DataSub$Global_active_power <- as.numeric(PC_DataSub$Global_active_power)
  
  #change Global Reactive power column to numeric class
  PC_DataSub$Global_reactive_power <- as.numeric(PC_DataSub$Global_reactive_power)
  
  #plot Global Active power vs DateTime
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  
  #Subplot1
  plot(PC_DataSub$DateTime, PC_DataSub$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #Subplot2
  plot(PC_DataSub$DateTime, PC_DataSub$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  
  #Subplot3
  plot(PC_DataSub$DateTime, PC_DataSub$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  lines(PC_DataSub$DateTime, PC_DataSub$Sub_metering_2, type="l", col = "red")
  lines(PC_DataSub$DateTime, PC_DataSub$Sub_metering_3, type="l", col = "blue")
  legend(c("topright"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  
  #Subplot4
  plot(PC_DataSub$DateTime, PC_DataSub$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
  dev.off()
  
}
