
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

png(filename = 'plot1.png',
          width = 480,
          height = 480,
          units = "px",
          bg = "transparent")
with(y, hist(Global_active_power, 
             col = "red", 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)", 
             ylab = "Frequency",
             ylim = c(0,1300))
             )
#ylim had to be maximum of 1300 as 1200 would limit the y range to 1000 for some reason
dev.off()





