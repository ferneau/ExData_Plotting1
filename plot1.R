source("load_and_prepare_data.R")

mydata <- load_powerdata()
hist( mydata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
print("Saving image")
dev.copy(png, file="plot1.png")
dev.off()
