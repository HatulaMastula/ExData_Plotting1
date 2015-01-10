# Load the 'data.table' package
library(data.table)

# Set working directory
setwd("E:/DataAnalysis/ExploratoryDataAnalysis/proj1")

# Read the data table from file
DT <- fread("household_power_consumption.txt",na.strings=c('?'))  

# Use only subsets  from the dates 2007-02-01 and 2007-02-02.
DT <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Change the desired data columns from 'character' to 'numeric'
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)

# Start PNG device driver to save output to plot3.png
png(filename="plot3.png", height=480, width=480, 
    bg="white")

# Compute the largest y value used in the data.
max_y <- max(DT$Sub_metering_1, DT$Sub_metering_2, DT$Sub_metering_1)

# Calculate range from 0 to max value of three columns
g_range <- range(0, max_y)

# Graph Global Active Power.
plot(DT$Sub_metering_1, type="l", col='black', 
     ylim=g_range, axes=F, ann=T, xlab="",
     ylab="Energy sub metering", lwd=1)

# Compute the largest x value for positioning x axis tick marks and labels.
max_x <- max(length(DT$Sub_metering_1), length(DT$Sub_metering_2),
             length(DT$Sub_metering_3))

# Make x axis using Thu-Sat labels
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"),cex=0.5)

# Make y axis using max_y
axis(2, at=10*0:max_y)

# Graph Sub_metering_2 with red line and Sub_metering_3 with a blue line.
lines(DT$Sub_metering_2, type="l", col="red")
lines(DT$Sub_metering_3, type="l", col="blue")

#Create a legend at the top right corner.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black', 'red', 'blue'), lty=1)

# Create box around plot
box()

# Turn off device driver (to flush output to png)
dev.off()
