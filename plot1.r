plot1 <- function(){
  # Read the power consumption.txt file (assumes the file is in the working directory)
  PC_Data <- read.delim("./household_power_consumption.txt", header = TRUE, sep = ";",dec = ".", stringsAsFactors = FALSE)
  
  #Change date column to Data class 
  PC_Data$Date <- as.Date(PC_Data$Date,format="%d/%m/%Y")
  
  #subset Dataset to include data from 2007-02-01 and 2007-02-02 only
  PC_DataSub <- subset(PC_Data, Date == "2007-02-01" | Date =="2007-02-02")
  
  #change Global Active column to numeric class
  PC_DataSub$Global_active_power <- as.numeric(PC_DataSub$Global_active_power)
  
  #plot histogram of global active power for those 2 days
  png("plot1.png", width=480, height=480)
  hist(PC_DataSub$Global_active_power,xlab = "Global Active Power(kilowatts)",col = "RED", main = "Global Active Power")
  dev.off()
  
}
