power <- read.table("household_power_consumption.txt",
                    header=TRUE,
                    sep=";",
                    na.strings="?",
                    stringsAsFactors=FALSE
)
power$DateObj <- as.Date(power$Date, format="%d/%m/%Y")
filteredPower <- power[power$DateObj %in% as.Date(c("2007-02-01","2007-02-02")),]
filteredPower$DateTime <- strptime(paste(filteredPower[,1],filteredPower[,2],sep=" "), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot1.png", width = 480, height = 480)

hist(filteredPower$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red") 

dev.off()
