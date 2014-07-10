# Reading the file "household_power_consumption.txt". 
# There was no problem with RAM memory space in my computer
t<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE,
              colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Subsetting to dates "1/2/2007" and "2/2/2007"
t<-t[(t$Date=="1/2/2007" | t$Date=="2/2/2007") & !is.na(t$Global_active_power),1:9]

# setting the background
par(bg="transparent")

# setting language to English because my orininal language is portuguese
Sys.setlocale("LC_TIME", "English")

# converting to Date/Time format
dat<-strptime(paste(t$Date,t$Time),format="%d/%m/%Y %H:%M:%S",tz = "EST5EDT")

# Dividing the graphical device
par(mfrow=c(2,2))

# Plot 1: the values of Global_active_power along the time
plot(dat,t$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(dat,t$Global_active_power)

# Plot 2: the values of Voltage along the time
plot(dat,t$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(dat,t$Voltage)

# Plot 3: the values of Sub_metering_1 along the time
plot(dat,t$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dat,t$Sub_metering_1,col="black")
# ploting the values of the Sub_metering_2 along the time
lines(dat,t$Sub_metering_2,col="red")
# ploting the values of the Sub_metering_3 along the time
lines(dat,t$Sub_metering_3,col="blue")
# Legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
	 cex=1, bty="n", xjust=1,
	 x.intersp=0.7, 
       y.intersp=0.7,
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black", "red", "blue"))

# Plot 4: the values of Global_reactive_power along the time
plot(dat,t$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dat,t$Global_reactive_power)

# copying my plot to a PNG file
dev.copy(png, file = "plot4.png")

# closing the PNG device
dev.off()