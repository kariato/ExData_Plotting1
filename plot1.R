#Author Mark Davey
#Date June 6th 2016
#Desription: R code to produced plot 1
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
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white" )
hist(energyUsage$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
