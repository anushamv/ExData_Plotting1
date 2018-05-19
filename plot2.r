plot2 <- function(){
  # Read the power consumption.txt file (assumes the file is in the working directory)
  PC_Data <- read.delim("./household_power_consumption.txt", header = TRUE, sep = ";",dec = ".", stringsAsFactors = FALSE)
  
  # Merge Date and Time together into a new column
  DateTime <- strptime(paste(PC_Data$Date, PC_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  PC_Data <- cbind(PC_Data, DateTime)
  
  #Change date column to Data class 
  PC_Data$Date <- as.Date(PC_Data$Date,format="%d/%m/%Y")
  
  #subset Dataset to include data from 2007-02-01 and 2007-02-02 only
  PC_DataSub <- subset(PC_Data, Date == "2007-02-01" | Date =="2007-02-02")
  
  #change Global Active power column to numeric class
  PC_DataSub$Global_active_power <- as.numeric(PC_DataSub$Global_active_power)
  
  #plot Global Active power vs DateTime
  png("plot2.png", width=480, height=480)
  plot(PC_DataSub$DateTime, PC_DataSub$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
  
}
