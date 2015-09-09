#clean up workspace
rm(list=ls())
#set working directory
setwd('C:/Users/mskead/Google Drive/Data Science Course/Exploratory Data Analysis/Project 1')
#read table into R but only those dates between 2007/02/01 and 2007/02/02
consumption <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header = TRUE, sep= ";", 
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", 
                                        "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Set up png file
png("Plot1.png", width=504, height=504)
# Set up histogram
hist(consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
# Close png file
dev.off()



