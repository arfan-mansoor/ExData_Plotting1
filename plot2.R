# Project 1


setwd("C:/Users/dell pc/Desktop/course/EDA 4")
data=read.csv('household_power_consumption.txt',header=T, sep=';') 
data$Datetime = paste(as.character(data[,1]) , data[,2])  # merge date and time 
data[,1]=as.Date(data$Date,'%d/%m/%Y') # convert the Date from string to date 
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02') #select two days
data[,3] = as.numeric(as.character(data[,3])) # convert the Global Active Power's to numbers
data$data <- strptime(data$Datetime, '%d/%m/%Y %H:%M') # create a datetime object 


png('plot2.png',width=480,height=480)
plot(data$data,data$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()