library("dplyr")

getData <- function(datadir, file) {
  ## 'datadir' is a character vector of length 1 indicating the data location
  ## 'file' is a character vector of length 1 indicating the data file
  
  ## Return a data frame with the household_power data from 01/02/2007 to 02/0272007
  
  household_power_consumption <- read.csv(paste(datadir,file, sep=""), sep=";")
  household_power_consumption_tbl <- tbl_df(household_power_consumption)
  hpc_period <- filter(household_power_consumption_tbl, Date == "1/2/2007" | Date == "2/2/2007")
  hpc_period$Date.Time <- strptime(paste(as.character(hpc_period$Date), as.character(hpc_period$Time)),"%d/%m/%Y %H:%M:%S")
  hpc_period$Global_active_power <- as.numeric(as.character(hpc_period$Global_active_power))
  hpc_period$Global_reactive_power <- as.numeric(as.character(hpc_period$Global_reactive_power))
  hpc_period$Voltage <- as.numeric(as.character(hpc_period$Voltage))
  hpc_period$Global_intensity <- as.numeric(as.character(hpc_period$Global_intensity))
  hpc_period$Sub_metering_1 <- as.numeric(as.character(hpc_period$Sub_metering_1))
  hpc_period$Sub_metering_2 <- as.numeric(as.character(hpc_period$Sub_metering_2))
  hpc_period$Sub_metering_3 <- as.numeric(as.character(hpc_period$Sub_metering_3))
  hpc_period
}
