OriData<-read.table("D:/r_tmp/assignmentdata/household_power_consumption.txt",sep=";",header=TRUE)
OriData$Time<-paste(OriData$Date,OriData$Time)
OriData$Date<-as.Date(OriData$Date,"%d/%m/%Y")
PlotData<-subset(OriData,Date=="2007-02-01"|Date=="2007-02-02")
PlotData$Time<-strptime(PlotData$Time,"%d/%m/%Y %H:%M:%S")
PlotData$Sub_metering_1<-as.numeric(as.character(PlotData$Sub_metering_1))
PlotData$Sub_metering_2<-as.numeric(as.character(PlotData$Sub_metering_2))
PlotData$Sub_metering_3<-as.numeric(as.character(PlotData$Sub_metering_3))
plot(PlotData$Time,PlotData$Sub_metering_1,"l",ylab="Energy sub metering",xlab="")
lines(PlotData$Time,PlotData$Sub_metering_2,"l",ylab="",xlab="",col="red")
lines(PlotData$Time,PlotData$Sub_metering_3,"l",ylab="",xlab="",col="blue")
legend("topright", pch ="__", col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",height=480, width=480)
dev.off()

