## Read Original Data 
OriData<-read.table("D:/r_tmp/assignmentdata/household_power_consumption.txt",sep=";",header=TRUE)
OriData$Time<-paste(OriData$Date,OriData$Time)
OriData$Date<-as.Date(OriData$Date,"%d/%m/%Y")

##Get Plot Data
PlotData<-subset(OriData,Date=="2007-02-01"|Date=="2007-02-02")
PlotData$Time<-strptime(PlotData$Time,"%d/%m/%Y %H:%M:%S")
PlotData$Global_active_power<-as.numeric(as.character(PlotData$Global_active_power))
PlotData$Sub_metering_1<-as.numeric(as.character(PlotData$Sub_metering_1))
PlotData$Sub_metering_2<-as.numeric(as.character(PlotData$Sub_metering_2))
PlotData$Sub_metering_3<-as.numeric(as.character(PlotData$Sub_metering_3))
PlotData$Voltage<-as.numeric(as.character(PlotData$Voltage))
PlotData$Global_reactive_power<-as.numeric(as.character(PlotData$Global_reactive_power))

##Plot
par(mfrow=c(2,2))
plot(PlotData$Time,PlotData$Global_active_power,"l",ylab="Global active power",xlab="")
plot(PlotData$Time,PlotData$Voltage,"l",ylab="Voltage",xlab="datetime")
plot(PlotData$Time,PlotData$Sub_metering_1,"l",ylab="Energy sub metering",xlab="")
lines(PlotData$Time,PlotData$Sub_metering_2,"l",ylab="",xlab="",col="red")
lines(PlotData$Time,PlotData$Sub_metering_3,"l",ylab="",xlab="",col="blue")
legend("topright", pch ="__", col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(PlotData$Time,PlotData$Global_reactive_power,"l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png",height=480, width=480)
dev.off()

