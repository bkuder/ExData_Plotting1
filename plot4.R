power <- read.table("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    na.strings="?",
                    stringsAsFactors=FALSE
)
power$DateObj <- as.Date(power$Date, format="%d/%m/%Y")
filteredPower <- power[power$DateObj %in% as.Date(c("2007-02-01","2007-02-02")),]
filteredPower$DateTime <- strptime(paste(filteredPower[,1],filteredPower[,2],sep=" "), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(filteredPower,{
     plot(DateTime,Global_active_power,
          type = "l",
          main = "",
          xlab = "",
          ylab = "Global Active Power"
          )

     plot(DateTime,Voltage,
          type = "l",
          main = "",
          xlab = "datetime",
          ylab = "Voltage"
          )
   
     plot(DateTime,Sub_metering_1,
          type = "l",
          main = "",
          xlab = "",
          ylab = "Energy sub metering"
          )

     lines(DateTime,Sub_metering_2,
          type = "l",
          col = "red")

     lines(DateTime,Sub_metering_3,
           type = "l",
           col = "blue")

     legend("topright",
       lty=1,
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )
     
     plot(DateTime,Global_reactive_power,
          type = "l",
          main = "",
          xlab = "datetime",
          ylab = "Global_reactive_power"
     )
     
})

dev.off()
