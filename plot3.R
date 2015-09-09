#set working directory
setwd('C:/Users/mskead/Google Drive/Data Science Course/Exploratory Data Analysis/Project 1/Exploratory_Data_Analysis_Project1')
#read table into R but only those dates between 2007/02/01 and 2007/02/02
consumption <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header = TRUE, sep= ";", 
                          col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity", 
                                        "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#convert Date and time into POSIXlt and POSIXt and combine into one variable
DateTime <- strptime(paste(consumption$Date, consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# Set up png file
png("Plot3.png", width=504, height=504)
# Set up line chart with legend in top right
with(consumption, plot(DateTime, consumption$Sub_metering_1, ylab = "Energy sub metering", xlab=" ", type = "l", col= "black"))
lines(DateTime, consumption$Sub_metering_2, type = "l", col= "red")
lines(DateTime, consumption$Sub_metering_3, type= "l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))

# close png device
dev.off()