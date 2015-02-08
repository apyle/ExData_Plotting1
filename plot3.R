library(data.table)
library(plyr)

plot3 <- function() {
        URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile <- "household_power_consumption.zip"
        #download.file(URL, zipfile,  method="curl")
        #unzip(zipfile)
        filename <- "household_power_consumption.txt"
        allpower <- read.table(filename, header=TRUE, sep=";", as.is=TRUE)
        p3 <- data.table(allpower[allpower$Date == "1/2/2007" | allpower$Date =="2/2/2007",])
        #p3 <- data.table(mypower)
        
        p3 <- mutate(p3, 
                     Sub_metering_1 = as.numeric(Sub_metering_1), 
                     Sub_metering_2 = as.numeric(Sub_metering_2),
                     Sub_metering_3 = as.numeric(Sub_metering_3),
                     date_time = strptime(paste(p2$Date, p2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
        
        dev.set(2)
        png(file = "plot3.png", bg="white")
        plot(p3$date_time, p3$Sub_metering_1, xlab="", ylab="Energy Sub metering", type="n")
        lines(p3$date_time, p3$Sub_metering_1, col="black")
        lines(p3$date_time, p3$Sub_metering_2, col="red")
        lines(p3$date_time, p3$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, col=c("black", "red", "blue"))
        dev.off()
        
        
}