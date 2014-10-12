data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

-## convert dates
  -datetime <- paste(as.Date(data$Date), data$Time)
-data$Datetime <- as.POSIXct(datetime)
-
  ## plot 1
  hist(data$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")