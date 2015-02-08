library(data.table)
library(plyr)

plot2 <- function() {
        URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile <- "household_power_consumption.zip"
        download.file(URL, zipfile,  method="curl")
        unzip(zipfile)
        filename <- "household_power_consumption.txt"
        allpower <- read.table(filename, header=TRUE, sep=";", as.is=TRUE)
        mypower <- allpower[allpower$Date == "1/2/2007" | allpower$Date =="2/2/2007",]
        p2 <- data.table(mypower)

        p2 <- mutate(p2, active_power = as.numeric(Global_active_power), 
                     date_time = strptime(paste(p2$Date, p2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

        dev.set(2)
        png(file = "plot2.png", bg="white")
        plot(p2$date_time, p2$active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
        dev.off()
        
        
}