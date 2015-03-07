
############################################################
#Create Plot 2 - Line
#Create datetime variable

#Create data file: 
require(sqldf)
mydata <- read.csv.sql(file='household_power_consumption.txt', sep=";",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       header = T)

mydata$datetimestmp <- paste(mydata$Date,mydata$Time)
mydata$datetime = strptime(mydata$datetimestmp,"%d/%m/%Y %H:%M:%S")

#Create Plot:

with (mydata,plot(datetime,Global_active_power,type="l",
                  ylab = "Global Active Power (kilowatts)",xlab=""))

dev.copy(png,file = "Plot2.png")
dev.off()
