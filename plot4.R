setwd("D:/Data Science/Exploratory Data Analysis/Course Projects/1")

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

subd1 <- as.Date("1/2/2007", "%d/%m/%Y")
subd2 <- as.Date("2/2/2007", "%d/%m/%Y")

subd <- dat[dat$Date==subd1|dat$Date==subd2, ]
class(names(split(subd, subd$Date)))

subd_date_time <- paste(subd$Date, subd$Time, sep = " ")

subd_dt_tm <- as.POSIXlt(subd_date_time)

subdd <- cbind(subd, subd_dt_tm)

subdd$subd_dt_tm <- strptime(subdd$subd_dt_tm, format = '%Y-%m-%d %H:%M:%S')

par(mfrow = c(2,2))

plot(subdd$subd_dt_tm, subdd$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(subdd$subd_dt_tm, subdd$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(subdd$subd_dt_tm, subdd$Sub_metering_1, type = 'l', col = 'Black', xlab = "", ylab = "Energy sub metering")
legend("topright", border = NULL , pch = "____", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), )
lines(subdd$subd_dt_tm, subdd$Sub_metering_2, type = 'l', col = 'Red')
lines(subdd$subd_dt_tm, subdd$Sub_metering_3, type = 'l', col = 'Blue')
plot(subdd$subd_dt_tm, subdd$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
