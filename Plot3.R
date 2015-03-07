############################################################
#Create Plot 3 - Tri-color Sub_metering

#Create data file: 
require(sqldf)
mydata <- read.csv.sql(file='household_power_consumption.txt', sep=";",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       header = T)

mydata$datetimestmp <- paste(mydata$Date,mydata$Time)
mydata$datetime = strptime(mydata$datetimestmp,"%d/%m/%Y %H:%M:%S")

#Create Plot:

png(width=480, height=480, units = "px",file="Plot3.png")

with(mydata,plot(datetime,Sub_metering_1,type="l",ylab = "Energy sub metering", xlab=""))
with(mydata,lines(datetime,Sub_metering_2,type="l",col = "red"))
with(mydata,lines(datetime,Sub_metering_3,type="l",col = "blue"))
legend("topright", col = c("black","blue","red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,cex=0.75,box.lwd=1)

dev.off()



