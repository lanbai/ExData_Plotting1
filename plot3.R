plot3<-function(){
  setwd("d://download/exdata-data-household_power_consumption")
  library(lubridate)
  tk1<-read.table("household_power_consumption.txt",sep = ";",header = T)
  tk1$Date<-strptime(tk1$Date,format = "%d/%m/%Y")
  tk1$Date<-as.Date(tk1$Date)
  tk2<-subset(tk1,Date=="2007-02-01"|Date=="2007-02-02")
  tk2$Global_reactive_power<-as.numeric(as.character(tk2$Global_reactive_power))
  tk2$Voltage<-as.numeric(as.character(tk2$Voltage))
  tk2$Sub_metering_1<-as.numeric(as.character(tk2$Sub_metering_1))
  tk2$Sub_metering_2<-as.numeric(as.character(tk2$Sub_metering_2))
  tk2$Sub_metering_3<-as.numeric(as.character(tk2$Sub_metering_3))
  tk2$Global_active_power<-as.numeric(as.character(tk2$Global_active_power))
  tk2$Global_intensity<-as.numeric(as.character(tk2$Global_intensity))
  tk2$shijian<-paste(tk2$Date,tk2$Time,sep = " ")
  tk2$shijian<-as.factor(tk2$shijian)
  tk2$shijian<-ymd_hms(tk2$shijian)
  plot(tk2$shijian,tk2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  with(tk2,points(tk2$shijian,tk2$Sub_metering_2,type = "l",col=10))
  with(tk2,points(tk2$shijian,tk2$Sub_metering_3,type = "l",col=4))
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c(1,10,4),lty = 1,cex = 0.7)
}
