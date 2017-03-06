source("load_and_prepare_data.R")

mydata <- load_powerdata()

#
# Create the plot without X tic marks
plot( mydata$Global_active_power, type = "l", 
      ylab = "Global Active Power (kilowatts)", 
      xlab = "",
      xaxt = "n")
#
# Create the range for X tic marks based on 1440 min/day
at <- seq(from=0,to=2880,by=1440 )
#
# Put up the axis labels
axis(labels=c("Thurs","Fri","Sat"),side=1, at=at)
print("Saving image")
dev.copy(png, file="plot2.png")
dev.off()
