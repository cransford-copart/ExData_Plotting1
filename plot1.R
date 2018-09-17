library(chron)
library(ggplot2)

energyDf <- read.delim("~/exploratory_data_analysis_wk1/household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";")

energyDf$Date <- as.Date(energyDf$Date, format = "%d/%m/%Y")
energyDfSubset <- as.data.table(energyDf)[Date >= "2007-02-01" & Date <= "2007-02-02"]
energyDfSubset$Time2 <- as.POSIXct(energyDfSubset$Time, tz = "", format = "%H:%M:%S", usetz = FALSE)
energyDfSubset$Time2 <- times(format(energyDfSubset$Time2, "%H:%M:%S"))
energyDfSubset$dateTime <- as.POSIXct(paste(energyDfSubset$Date, energyDfSubset$Time2), formatt = "%d/%m/%Y %H:%M:%S")

png(filename = "~/exploratory_data_analysis_wk1/plot_1.png", width = 480, height = 480)
hist(as.numeric(energyDfSubset$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()