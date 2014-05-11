setwd("D:/Data Science/Exploratory Data Analysis/Course Projects/1")

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

subd1 <- as.Date("1/2/2007", "%d/%m/%Y")
subd2 <- as.Date("2/2/2007", "%d/%m/%Y")

subd <- dat[dat$Date==subd1|dat$Date==subd2, ]
head(subd)
class(names(split(subd, subd$Date)))

subd_date_time <- paste(subd$Date, subd$Time, sep = " ")

subd_dt_tm <- as.POSIXlt(subd_date_time)

subdd <- cbind(subd, subd_dt_tm)
head(subdd)

subdd$subd_dt_tm <- strptime(subdd$subd_dt_tm, format = '%Y-%m-%d %H:%M:%S')
head(subdd)

plot(subdd$subd_dt_tm, as.numeric(subdd$Global_active_power), type = 'l', xlab = '', ylab = "GLobal Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
