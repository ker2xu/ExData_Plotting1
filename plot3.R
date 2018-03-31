if(!file.exists("household_power_consumption.txt")) {
  if(!file.exists("exdata_data_household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "exdata_data_household_power_consumption.zip", "mininet")
  }
  unzip("exdata_data_household_power_consumption.zip")
}

power_data <- read.table("household_power_consumption.txt", header = T, sep = ';', na.strings = '?', stringsAsFactors = F)
dates_rows <- c(grep('^[12]/2/2007', power_data$Date))
power_data <- power_data[dates_rows, ]

data_date_and_time <- strptime(paste(power_data$Date, power_data$Time), "%e/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(data_date_and_time, power_data$Sub_metering_1, type = 'l', xlab = '', ylab = "Energy sub metering")
#lines(data_date_and_time, power_data$Sub_metering_1, type = 'l', col = "black")
lines(data_date_and_time, power_data$Sub_metering_2, type = 'l', col = "red")
lines(data_date_and_time, power_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
