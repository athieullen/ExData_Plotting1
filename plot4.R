# Load data

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <-  "household_power_consumption.txt"

temp <- tempfile()
download.file(fileUrl,temp)
dat <- read.table(unz(temp, fileName), sep = ';', header = TRUE, dec = '.', na.strings = '?',
                  colClasses = c('character','character','numeric','numeric',
                                 'numeric','numeric','numeric','numeric','numeric'))
unlink(temp)


# Select data from 2007-02-01 to 2007-02-02
dat <- dat[which(as.Date(dat$Date,format = '%d/%m/%Y') >= as.Date("2007-02-01") &
                   as.Date(dat$Date,format = '%d/%m/%Y') <= as.Date("2007-02-02")),]


png(filename = "~\\GitHub\\ExData_Plotting1\\plot4.png", bg = "transparent")
par(mfrow=c(2,2))

# Plot 1
plot(y = dat$Global_active_power,
     x = Time,type = 'l',
     ylab = "Global Active Power", xlab = "")

# Plot 2
plot(y = dat$Voltage,
     x = Time,type = 'l',
     ylab = "Voltage", xlab = "datetime")

# Plot 3
plot(y = dat$Sub_metering_1,
     x = Time, type = 'l',col = c("black"),
     ylab = "Energy sub metering", xlab = "")
lines(y = dat$Sub_metering_2,
      x = Time, type = 'l',col = c("red"))
lines(y = dat$Sub_metering_3,
      x = Time, type = 'l',col = c("blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       lty = c(1,1,1), col = c('black','red','blue'),bty = 'n')

# Plot 4
plot(y = dat$Global_reactive_power,
     x = Time,type = 'l',
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()



