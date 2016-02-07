
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

png(filename = 'plot2.png',
          width = 480,
          height = 480)
with(y, plot(DateTime, Global_active_power,
             type = "l",
             ylab = "Global Active Power (kilowatts)",
             xlab = ""
             ))
#ylim had to be maximum of 1300 as 1200 would limit the y range to 1000 for some reason
dev.off()





