# Load the 'data.table' package
library(data.table)

# Set working directory
setwd("E:/DataAnalysis/ExploratoryDataAnalysis/proj1")

# Read the data table from file
DT <- fread("household_power_consumption.txt",na.strings=c('?')) 

# Use only subsets  from the dates 2007-02-01 and 2007-02-02
DT <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Start PNG device driver to save output to plot1.png
png(filename="plot4.png", height=480, width=480, 
    bg="white")

# 4 figures arranged in 2 rows and 2 columns
par(mfrow=c(2,2), cex=0.8)

# First plot(top-left) 
# Change the desired data column from 'character' to 'numeric'
DT$Global_active_power <- as.numeric(DT$Global_active_power)

# Graph Global Active Power.
plot(DT$Global_active_power, type="l", col='black', 
     ylim=range(DT$Global_active_power), axes=F, ann=T, xlab="",
     ylab="Global Active Power", lwd=1)

# Compute the largest x value for positioning x axis tick marks and labels.
max_x <- length(DT$Global_active_power)

# Make x axis using Thu-Sat labels
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"))

# Compute the largest y value used in the data.
max_y <- max(DT$Global_active_power)

# Make y axis using max_y
axis(2, at=2*0:max_y)

# Create box around plot
box()
#---------------------------------
#Second plot (top-right) Voltage

# turn column to numeric
Voltage <- as.numeric(DT$Voltage)

# plot Voltage Data
plot(Voltage, type="l", col='black', 
     ylim=range(Voltage), axes=F, ann=T, xlab="datetime",
      lwd=1)

# Compute the largest x value for positioning x axis tick marks and labels.
max_x <- length(Voltage)

# Make x axis using Thu-Sat labels
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"))

# Make y axis 
axis(2, at=seq(234,246,2))

# Create box around plot
box()

#---------------------------------

#Third Plot : the sub_metering
# Change the desired data columns from 'character' to 'numeric'
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)

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
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"))

# Make y axis using max_y
axis(2, at=10*0:max_y)

# Graph Sub_metering_2 with red line and Sub_metering_3 with a blue line.
lines(DT$Sub_metering_2, type="l", col="red")
lines(DT$Sub_metering_3, type="l", col="blue")

#Create a legend at the top right corner.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black', 'red', 'blue'), lty=1, bty = "n")

# Create box around plot
box()
#---------------------------------
#Fourth Plot : Global Reactive Power
# Change the desired data column from 'character' to 'numeric'
Global_reactive_power <- as.numeric(DT$Global_reactive_power)

# Graph Global Active Power.
plot(Global_reactive_power, type="l", col='black', 
     ylim=range(Global_reactive_power), axes=F, ann=T, xlab="datetime",
     lwd=1)

# Compute the largest x value for positioning x axis tick marks and labels.
max_x <- length(Global_reactive_power)

# Make x axis using Thu-Sat labels
axis(1, at=c(1,max_x/2, max_x), lab=c("Thu", "Fri", "Sat"))
axis(2, tick=T, labels=T)
# Create box around plot
box()

# Turn off device driver (to flush output to png)
dev.off()