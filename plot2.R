#Author Mark Davey
#Date June 6th 2016
#Desription: R code to produced plot 2
#load libraries required
library(data.table)
library(dplyr)
#read in datatable
energyUsage <- fread("./data/household_power_consumption.txt",sep=";",na.strings="?")
#dim(energyUsage)
#Filter Data to two days
energyUsage <- filter(energyUsage, Date == "1/2/2007" | Date == "2/2/2007")
#calculate datetime in POSTIX for plotting
energyUsage <- mutate(energyUsage, DateTime = strptime(paste(energyUsage$Date,energyUsage$Time,sep=" "), "%d/%m/%Y %H:%M:%S"))
#
#Create Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white" )
plot(energyUsage$DateTime,energyUsage$Global_active_power,type="n",xlab="",ylab = "Global Active Power (kilowatts)")
lines(energyUsage$DateTime,energyUsage$Global_active_power)
dev.off()