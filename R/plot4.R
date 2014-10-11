# Set working directory to current R script directory
setwd("D:/workspace-R/coursera/")

# Load R file containing the getData function
source('getData.R')

# Get Tidy data
hpc <- getData("D:/workspace-R/coursera/data/", "household_power_consumption.txt")

# Choose png graphics device and set image dimensions
png(filename = "plot4.png", width = 480, height = 480)

# Divide the canvas in four windows
par(mfrow = c(2, 2))

# Plot line graph, Global Active Power vs Time in the top left window
with(hpc, plot(Date.Time, Global_active_power, type = "l", xlab="", ylab="Global Active Power"))

# Plot line graph, Voltage vs Time in the top right window
with(hpc, plot(Date.Time, Voltage, type = "l", xlab="datetime", ylab="Voltage"))

# Plot line graphs, Sub Meetering (1,2,3) vs Time in the bottom left window
with(hpc, plot(Date.Time, Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering"))
with(hpc, lines(Date.Time, Sub_metering_2, col="red"))
with(hpc, lines(Date.Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)

# Plot line graph, Global Reactive Power vs Time in the bottom right window
with(hpc, plot(Date.Time, Global_reactive_power, type = "l", xlab="datetime"))

# Close graphics device
dev.off()