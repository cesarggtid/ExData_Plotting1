# Set working directory to current R script directory
setwd("D:/workspace-R/coursera/")

# Load R file containing the getData function
source('getData.R')

# Get Tidy data
hpc <- getData("D:/workspace-R/coursera/data/", "household_power_consumption.txt")

# Choose png graphics device and set image dimensions
png(filename = "plot3.png", width = 480, height = 480)

# Plot the first line graph (submetering_1)
with(hpc, plot(Date.Time, Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering"))

# Add the second line graph (submetering_2)
with(hpc, lines(Date.Time, Sub_metering_2, col="red"))

# Add the third line graph (submetering_3)
with(hpc, lines(Date.Time, Sub_metering_3, col="blue"))

# Add the legend
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

# Close graphics device
dev.off()