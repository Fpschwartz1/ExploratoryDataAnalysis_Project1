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

# ploting the values of the Global_active_power along the time
plot(dat,t$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dat,t$Global_active_power)

# copying my plot to a PNG file
dev.copy(png, file = "plot2.png")

# closing the PNG device
dev.off()