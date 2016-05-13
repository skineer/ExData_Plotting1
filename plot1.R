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

# generate de histogram
par(mfrow = c(1,1))
hist(energy_sel$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file = "plot1.png" )
dev.off()
