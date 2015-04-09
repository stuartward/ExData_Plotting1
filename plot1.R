setwd("C:/Users/Stuart/Documents/EDA")
PowerAll <- read.csv(file="power.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
power <- (PowerAll[which(PowerAll$Date == '1/2/2007' | PowerAll$Date == '2/2/2007'),])

hist(power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red",  cex.axis = .75, cex.lab=.75, cex.main=1)

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()