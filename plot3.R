# Project 1


setwd("C:/Users/dell pc/Desktop/course/EDA 4")
data=read.csv('household_power_consumption.txt',header=T, sep=';') 
data$Datetime = paste(as.character(data[,1]) , data[,2])  # merge date and time 
data[,1]=as.Date(data$Date,'%d/%m/%Y') # convert the Date from string to date 
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02') #select two days
data[,3] = as.numeric(as.character(data[,3])) # convert the Global Active Power's to numbers
data$data <- strptime(data$Datetime, '%d/%m/%Y %H:%M') # create a datetime object

 # Convert Sub_meterings to numbers
data$Sub_metering_1 <- (as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2 <- (as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- (as.numeric(as.character(data$Sub_metering_3)))

png('plot3.png',width=480,height=480)
plot(data$data,data$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(data$data,data$Sub_metering_2,col='red')
lines(data$data,data$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()