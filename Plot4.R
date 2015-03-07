############################################################
#Create Plot 4 - 4-plot matrix

#Create data file: 
require(sqldf)
mydata <- read.csv.sql(file='household_power_consumption.txt', sep=";",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       header = T)

mydata$datetimestmp <- paste(mydata$Date,mydata$Time)
mydata$datetime = strptime(mydata$datetimestmp,"%d/%m/%Y %H:%M:%S")

#Create Plots:

png(width=480, height=480, units = "px",file="Plot4.png")

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0.5,0.5,2,0.5))

#first graph, top left
with (mydata,plot(datetime,Global_active_power,type="l",
                  ylab = "Global Active Power",xlab=""))

#second graph, top right
with (mydata,plot(datetime,Voltage,type="l",
                  ylab = "Voltage",xlab="datetime"))

#third graph, bottom left
with(mydata,plot(datetime,Sub_metering_1,type="l",ylab = "Energy sub metering", xlab=""))
with(mydata,lines(datetime,Sub_metering_2,type="l",col = "red"))
with(mydata,lines(datetime,Sub_metering_3,type="l",col = "blue"))
legend("topright", col = c("black","blue","red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,cex=0.75,box.lwd=1)

#forth graph, bottom righ
with (mydata,plot(datetime,Global_reactive_power,type="l",
                  ylab = "Global_reactive_power",xlab="datetime"))

dev.off()
