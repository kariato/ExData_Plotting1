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
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white" )
par(mfrow=c(2,2))
#plot graph 1 
plot(energyUsage$DateTime,energyUsage$Global_active_power,type="n",xlab="",ylab = "Global Active Power (kilowatts)")
lines(energyUsage$DateTime,energyUsage$Global_active_power)
#plot graph 2
plot(energyUsage$DateTime,energyUsage$Voltage,type="n",xlab="datetime",ylab = "Voltage")
lines(energyUsage$DateTime,energyUsage$Voltage)
#plot 3
plot(energyUsage$DateTime,energyUsage$Sub_metering_1,type="n",xlab="",ylab = "Energy sub metering")
lines(energyUsage$DateTime,energyUsage$Sub_metering_1,col="black")
lines(energyUsage$DateTime,energyUsage$Sub_metering_2,col="red")
lines(energyUsage$DateTime,energyUsage$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
#plot graph 4
plot(energyUsage$DateTime,energyUsage$Global_reactive_power,type="n",xlab="datetime",ylab = "Global_reactive_power")
lines(energyUsage$DateTime,energyUsage$Global_reactive_power)
dev.off()