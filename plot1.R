if(!file.exists("household_power_consumption.txt")) {
  if(!file.exists("exdata_data_household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "exdata_data_household_power_consumption.zip", "mininet")
  }
  unzip("exdata_data_household_power_consumption.zip")
}

power_data <- read.table("household_power_consumption.txt", header = T, sep = ';', na.strings = '?')
dates_rows <- c(grep('^[12]/2/2007', power_data$Date))
power_data <- power_data[dates_rows, ]

png(filename = "plot1.png", width = 480, height = 480)
hist(power_data$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
