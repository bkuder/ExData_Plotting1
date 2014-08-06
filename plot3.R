power <- read.table("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    na.strings="?",
                    stringsAsFactors=FALSE
)
power$DateObj <- as.Date(power$Date, format="%d/%m/%Y")
filteredPower <- power[power$DateObj %in% as.Date(c("2007-02-01","2007-02-02")),]
filteredPower$DateTime <- strptime(paste(filteredPower[,1],filteredPower[,2],sep=" "), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot3.png", width = 480, height = 480)

with(filteredPower,
     plot(DateTime,Sub_metering_1,
       type = "l",
       main = "",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
)

with(filteredPower,
     lines(DateTime,Sub_metering_2,
          type = "l",
          col = "red")
)

with(filteredPower,
     lines(DateTime,Sub_metering_3,
           type = "l",
           col = "blue")
)

legend("topright",
       lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

dev.off()
