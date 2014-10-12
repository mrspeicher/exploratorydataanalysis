data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## convert dates
datetime <- paste(as.Date(data$Date), data$Time)
-data$Datetime <- as.POSIXct(datetime)
+data$datetime <- as.POSIXct(datetime)

## plot 2
-plot(data$Global_active_power~data$Datetime, type="l",
      +plot(data$Global_active_power~data$datetime, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
      
      ## save to file
      -dev.copy(png, file="plot2.png", height=480, width=480)
      +         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
+  plot(Global_reactive_power~Datetime, type="l", 
        +       ylab="Global_reactive_power", xlab="datetime")
+  })
dev.off()
