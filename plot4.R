library("data.table")
library("dplyr")
library("lubridate")
setwd("C:\\Users\\Renato\\ExData_Plotting1")

#read the file
energy <- fread("C:\\Users\\Renato\\Desktop\\power_cons\\household_power_consumption.txt", 
                sep = ';', header = TRUE, stringsAsFactors = FALSE,
                na.strings = '?')

# select the two days 
energy_sel <- filter(energy, dmy(Date) == '2007-02-01' | dmy(Date) == '2007-02-02')

# generate plot
# weekdays in brazilian portuguese 
# equivalent to thu, fri, sat)
png(file = "plot4.png")
par(mfrow = c(2,2))
plot(dmy_hms(paste(energy_sel$Date, energy_sel$Time)), 
     energy_sel$Global_active_power, 
     type = "l", ylab = "Global Active Power", xlab = "")
##
plot(dmy_hms(paste(energy_sel$Date, energy_sel$Time)), 
     energy_sel$Voltage, 
     type = "l", ylab = "Voltage", xlab = "datetime")
##
with(energy_sel, plot(dmy_hms(paste(Date, Time)), 
                      Sub_metering_1, type = 'l', col = "black",
                      xlab = "", ylab = "Energy sub metering"))
with(energy_sel, lines(dmy_hms(paste(Date, Time)), Sub_metering_2, col = "red"))
with(energy_sel, lines(dmy_hms(paste(Date, Time)), Sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), lty = 1, lwd = 1, bty = 'n', cex = 0.9)
##
plot(dmy_hms(paste(energy_sel$Date, energy_sel$Time)), 
     energy_sel$Global_reactive_power, 
     type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
