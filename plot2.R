#set working directory
setwd('C:/Users/mskead/Google Drive/Data Science Course/Exploratory Data Analysis/Project 1/Exploratory_Data_Analysis_Project1')
#read table into R but only those dates between 2007/02/01 and 2007/02/02
consumption <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header = TRUE, sep= ";", 
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", 
                                        "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#convert Date and time into POSIXlt and POSIXt and combine into one variable
DateTime <- strptime(paste(consumption$Date, consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# Set up png file
png("Plot2.png", width=504, height=504)
# Set up line chart
plot(DateTime, consumption$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)")
# close png device
dev.off()
