source("load_and_prepare_data.R")

mydata <- load_powerdata()

#
# Create the plot without X tic marks
plot( mydata$Sub_metering_1, type = "l", 
      ylab = "Energy sub metering", 
      xlab = "",
      xaxt = "n",
      col = "black")
#
# Add the two other values
lines(mydata$Sub_metering_2,col="red")
lines(mydata$Sub_metering_3,col="blue")
#
# Create the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty="solid")
#
# Create the range for X tic marks based on 1440 min/day
at <- seq(from=0,to=2880,by=1440 )
#
# Put up the axis labels
axis(labels=c("Thurs","Fri","Sat"),side=1, at=at)
print("Saving image")
dev.copy(png, file="plot3.png")
dev.off()
