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

Time <- paste(dat$Date,dat$Time,sep=' ')
Time <- strptime(Time,format = '%d/%m/%Y %H:%M:%S')

png(filename = "~\\GitHub\\ExData_Plotting1\\plot2.png", bg = "transparent")
plot(y = dat$Global_active_power,
     x = Time,type = 'l',
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()



