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
plot(dmy_hms(paste(energy_sel$Date, energy_sel$Time)), 
     energy_sel$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
