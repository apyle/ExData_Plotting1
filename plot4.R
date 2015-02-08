library(data.table)
library(plyr)

plot4 <- function() {
        URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile <- "household_power_consumption.zip"
        download.file(URL, zipfile,  method="curl")
        unzip(zipfile)
        filename <- "household_power_consumption.txt"
        allpower <- read.table(filename, header=TRUE, sep=";", as.is=TRUE)
        p4 <- data.table(allpower[allpower$Date == "1/2/2007" | allpower$Date =="2/2/2007",])
        
        p4 <- mutate(p4, 
                     active_power = as.numeric(Global_active_power),
                     Global_reactive_power = as.numeric(Global_reactive_power),
                     Voltage = as.numeric(Voltage),
                     Sub_metering_1 = as.numeric(Sub_metering_1),
                     Sub_metering_2 = as.numeric(Sub_metering_2),
                     Sub_metering_3 = as.numeric(Sub_metering_3),
                     date_time = strptime(paste(p2$Date, p2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
        
        dev.set(2)
        png(file = "plot4.png", bg="white")
        par(mfcol=c(2,2))
        plot(p4$date_time, p4$active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
        
        plot(p4$date_time, p4$Sub_metering_1, xlab="", ylab="Energy Sub metering", type="n")
        lines(p4$date_time, p4$Sub_metering_1, col="black")
        lines(p4$date_time, p4$Sub_metering_2, col="red")
        lines(p4$date_time, p4$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, col=c("black", "red", "blue"))
        
        plot(p4$date_time, p4$Voltage, xlab="datetime", ylab="Voltage", type="l")
        
        plot(p4$date_time, p4$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
        dev.off()
        
        
}