setwd("C:/Users/Stuart/Documents/EDA")
PowerAll <- read.csv(file="power.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
power <- (PowerAll[which(PowerAll$Date == '1/2/2007' | PowerAll$Date == '2/2/2007'),])

x <- paste(power$Date, power$Time)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
power <- cbind(power,DateTime)

par(mfrow=c(2,2),mar=c(4,3,4,3),mgp=c(1.8,0.7,0))
plot(power$DateTime, power$Global_active_power, xlab='', ylab="Global Active Power", type="l",  cex.axis = .75, cex.lab=.75, cex.main=1)
plot(power$DateTime, power$Voltage, xlab='datetime', ylab="Voltage", type="l",  cex.axis = .75, cex.lab=.75, cex.main=1)
plot(power$DateTime, power$Sub_metering_1, xlab='', ylab="Energy sub metering", type="l", cex.axis = .75, cex.lab=.75)
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "blue", "red"), lwd = 1, cex=.75, bty = "n")
plot(power$DateTime, power$Global_reactive_power, xlab='datetime', ylab="Global_reactive_power", type="l", cex.axis = .75, cex.lab=.75, cex.main=1)

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()