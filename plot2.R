setwd("C:/Users/Stuart/Documents/EDA")
PowerAll <- read.csv(file="power.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
power <- (PowerAll[which(PowerAll$Date == '1/2/2007' | PowerAll$Date == '2/2/2007'),])

x <- paste(power$Date, power$Time)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
power <- cbind(power,DateTime)

plot(power$DateTime, power$Global_active_power, xlab='', ylab="Global Active Power (kilowatts)", type="l",  cex.axis = .75, cex.lab=.75, cex.main=1)

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()