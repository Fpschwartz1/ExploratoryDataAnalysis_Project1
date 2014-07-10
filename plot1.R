# Reading the file "household_power_consumption.txt". 
# There was no problem with RAM memory space in my computer
t<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE,
              colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Subsetting to dates "1/2/2007" and "2/2/2007"
t<-t[(t$Date=="1/2/2007" | t$Date=="2/2/2007") & !is.na(t$Global_active_power),1:9]

# setting the background
par(bg="transparent")

# ploting the histrogram of the Global_active_power variable
hist(t$Global_active_power,
     col = "orangered", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# copying my plot to a PNG file
dev.copy(png, file = "plot1.png")

# closing the PNG device
dev.off()
