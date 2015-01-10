# Load the 'data.table' package
library(data.table)

# Set working directory
setwd("E:/DataAnalysis/ExploratoryDataAnalysis/proj1")

# Read the data table from file
DT <- fread("household_power_consumption.txt",na.strings=c('?')) 

# Use only subsets  from the dates 2007-02-01 and 2007-02-02
DT <- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Start PNG device driver to save output to plot1.png
png(filename="plot1.png", height=480, width=480, 
    bg="white")

# Plot the histogram
hist(as.numeric(DT$Global_active_power),xlab='Global Active Power (kilowatts)',
      col='red', main = 'Global Active Power', cex=0.5)

# Turn off device driver (to flush output to png)
dev.off()