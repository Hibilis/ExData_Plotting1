
############################################################
#Create Plot 1 - Histogram

#Create data file: 
require(sqldf)
mydata <- read.csv.sql(file='household_power_consumption.txt', sep=";",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       header = T)

mydata$datetimestmp <- paste(mydata$Date,mydata$Time)
mydata$datetime = strptime(mydata$datetimestmp,"%d/%m/%Y %H:%M:%S")

#Create Plot

png(width=480, height=480, units = "px",file="Plot1.png")

hist(mydata$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = 'red')

#Turn off output device

dev.off()




