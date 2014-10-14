##  Exploratory Data Analysis Project 1

##  download data from Coursera class page and unzip
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(URL, destfile = "./epc.zip", method ="curl")
dateDownloaded <- date()
unzip("epc.zip")

##  retrieve unzipped data
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data$Date, format="%d/%m/%Y")

##  only data from February 1 and 2, 2007
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

##  convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##  make plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##  save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()