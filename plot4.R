library(chron)
library(ggplot2)

energyDf <- read.delim("~/exploratory_data_analysis_wk1/household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";")

energyDf$Date <- as.Date(energyDf$Date, format = "%d/%m/%Y")
energyDfSubset <- as.data.table(energyDf)[Date >= "2007-02-01" & Date <= "2007-02-02"]
energyDfSubset$Time2 <- as.POSIXct(energyDfSubset$Time, tz = "", format = "%H:%M:%S", usetz = FALSE)
energyDfSubset$Time2 <- times(format(energyDfSubset$Time2, "%H:%M:%S"))
energyDfSubset$dateTime <- as.POSIXct(paste(energyDfSubset$Date, energyDfSubset$Time2), formatt = "%d/%m/%Y %H:%M:%S")


png(filename = "~/exploratory_data_analysis_wk1/plot_4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot1 <- plot(energyDfSubset$dateTime, type = "n",energyDfSubset$Global_active_power, xlab = "", ylab = "Global Active Power")
plot1 <- lines(energyDfSubset$dateTime, energyDfSubset$Global_active_power)

plot2 <- plot(energyDfSubset$dateTime, type = "n",energyDfSubset$Voltage, xlab = "datetime", ylab = "Voltage")
plot2 <- lines(energyDfSubset$dateTime, energyDfSubset$Voltage)

plot3 <- plot(energyDfSubset$dateTime, type = "n", energyDfSubset$Sub_metering_1, xlab = "", ylab = "Energy sub metering")
plot3 <- lines(energyDfSubset$dateTime, energyDfSubset$Sub_metering_1)
plot3 <- lines(energyDfSubset$dateTime, energyDfSubset$Sub_metering_2, col = "red")
plot3 <- lines(energyDfSubset$dateTime, energyDfSubset$Sub_metering_3, col = "blue")
plot3 <- legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot4 <- plot(energyDfSubset$dateTime, type = "n", energyDfSubset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")
plot4 <- lines(energyDfSubset$dateTime, energyDfSubset$Global_reactive_power)

dev.off()