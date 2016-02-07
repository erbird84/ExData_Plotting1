
#colClasses takes care of the column initial formatting
#na.strings = ? will eliminate rows with na in them
x <- read.table("household_power_consumption.txt", 
                header = TRUE, sep = ";",
                stringsAsFactors = F, 
                na.strings = "?",
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

#x$IDate <- as.character(x$IDate)
x$IDate <- as.Date(x$IDate, format = "%d/%m/%Y")

y <- subset(x, IDate >= "2007-02-01" & IDate <= "2007-02-02")

y$DateTime <- strptime(paste(as.character(y$IDate), y$Time), 
                       "%Y-%m-%d %H:%M:%S", tz = "UTC")
rm(x)

png(filename = 'plot3.png',
          width = 480,
          height = 480)
with(y, plot(DateTime, Sub_metering_1,
             type = "l",
             ylab = "Energy Sub Metering",
             xlab = ""
             ))
with(y, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(y, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = par("lwd"), cex = .8)
dev.off()





