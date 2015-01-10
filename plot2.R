# Load the 'data.table' package
library(data.table)

# Set working directory
setwd("E:/DataAnalysis/ExploratoryDataAnalysis/proj1")

# Read the data table from file
DT <- fread("household_power_consumption.txt",na.strings=c('?'))  

# Use only subsets  from the dates 2007-02-01 and 2007-02-02.
DT <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Change the desired data column from 'character' to 'numeric'
DT$Global_active_power <- as.numeric(DT$Global_active_power)

# Start PNG device driver to save output to plot3.png
png(filename="plot2.png", height=480, width=480, 
    bg="white")

# Graph Global Active Power.
plot(DT$Global_active_power, type="l", col='black', 
           ylim=range(DT$Global_active_power), axes=F, ann=T, xlab="",
           ylab="Global Active Power (kilowatts)", lwd=1)

# Compute the largest x value for positioning x axis tick marks and labels.
max_x <- length(DT$Global_active_power)

# Make x axis using Thu-Sat labels
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"),cex=0.5)

# Compute the largest y value used in the data.
max_y <- max(DT$Global_active_power)

# Make y axis using max_y
axis(2, at=2*0:max_y,cex=0.5)

# Create box around plot
box()

# Turn off device driver (to flush output to png)
dev.off()
