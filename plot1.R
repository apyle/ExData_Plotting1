library(data.table)
library(plyr)

plot1 <- function() {
        URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile <- "household_power_consumption.zip"
        download.file(URL, zipfile,  method="curl")
        unzip(zipname)
        filename <- "household_power_consumption.txt"
        allpower <- read.table(filename, header=TRUE, sep=";", as.is=TRUE)
        mypower <- allpower[allpower$Date == "1/2/2007" | allpower$Date =="2/2/2007",]
        pdt <- data.table(mypower)
        pdt <- mutate(pdt, active_power = as.numeric(Global_active_power))
        
        dev.set(2)
        png(file = "plot1.png", bg="white")
        hist(pdt$active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
        dev.off()

}