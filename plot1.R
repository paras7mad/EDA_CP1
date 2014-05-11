setwd("D:/Data Science/Exploratory Data Analysis/Course Projects/1")

dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

subd1 <- as.Date("1/2/2007", "%d/%m/%Y")
subd2 <- as.Date("2/2/2007", "%d/%m/%Y")

subd <- dat[dat$Date==subd1|dat$Date==subd2, ]
names(split(subd, subd$Date))

hist(as.numeric(subd$Global_active_power), col = "Red", main = "Global Active Power", xlab = "GLobal Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot11.png", width = 480, height = 980 )
dev.off()
