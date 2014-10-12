data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## convert dates
datetime <- paste(as.Date(data$Date), data$Time)
-data$Datetime <- as.POSIXct(datetime)
+data$datetime <- as.POSIXct(datetime)

-## plot 4
  -par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
+## plot 4 and save to file
  +png("plot4.png", height=480, width=480, units="px", bg = "white")
+par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,2,2,2))
with(data, {
  -  plot(Global_active_power~Datetime, type="l", 
          +  plot(Global_active_power~datetime, type="l", 
                  ylab="Global Active Power", xlab="")
          -  plot(Voltage~Datetime, type="l", 
                  -       ylab="Voltage", xlab="")
          -  plot(Sub_metering_1~Datetime, type="l", 
                  +  plot(Voltage~datetime, type="l", 
                          +       ylab="Voltage", xlab="datetime")
                  +  plot(Sub_metering_1~datetime, type="l", 
                          ylab="Energy sub metering", xlab="")
                  -  lines(Sub_metering_2~Datetime,col='Red')
                  +  lines(Sub_metering_2~datetime,col='Red')
                  lines(Sub_metering_3~Datetime,col='Blue')
                  -  plot(Global_reactive_power~Datetime, type="l", 
                          -       ylab="Global_reactive_power", xlab="")
                  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
                         -         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                  -  
                    -})
-
  -## save to file
  -dev.copy(png, file="plot4.png", height=480, width=480)
+         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
+  plot(Global_reactive_power~Datetime, type="l", 
        +       ylab="Global_reactive_power", xlab="datetime")
+  })
dev.off()
