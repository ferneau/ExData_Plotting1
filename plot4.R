source("load_and_prepare_data.R")

mydata <- load_powerdata()

#
# set up plot area for multiple plots
par(mfrow=c(2,2))

#
# Upper left
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

#
# Upper right plot
# Create the plot without X tic marks
plot( mydata$Voltage, type = "l", 
      ylab = "Voltage", 
      xlab = "datetime",
      xaxt = "n")
#
# Create the range for X tic marks based on 1440 min/day
at <- seq(from=0,to=2880,by=1440 )

# Put up the axis labels
axis(labels=c("Thurs","Fri","Sat"),side=1, at=at)

#
# lower left plot 

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

#
# lower right plot
# Create the plot without X tic marks
plot( mydata$Global_reactive_power, type = "l", 
      ylab = "Global_reactive_power", 
      xlab = "",
      xaxt = "n")
#
# Create the range for X tic marks based on 1440 min/day
at <- seq(from=0,to=2880,by=1440 )
#
# Put up the axis labels
axis(labels=c("Thurs","Fri","Sat"),side=1, at=at)

print("Saving image")
dev.copy(png, file="plot4.png")
dev.off()
