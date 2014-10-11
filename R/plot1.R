# Set working directory to current R script directory
setwd("D:/workspace-R/coursera/")

# Load R file containing the getData function
source('getData.R')

# Get Tidy data
hpc <- getData("D:/workspace-R/coursera/data/", "household_power_consumption.txt")

# Choose png graphics device and set image dimensions
png(filename = "plot1.png", width = 480, height = 480)

# Plot histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close graphics device
dev.off()



