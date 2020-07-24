library(data.table)

# Set the working directory
setwd("C:\\data\\exdata_data_household_power_consumption\\")

# Read in all the data
power_consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Reformat the date
power_consumption_data[,"Date"] <- as.Date(power_consumption_data[,"Date"],format = "%d/%m/%Y")

# Get the data for the first day
date1_data <- subset(power_consumption_data,Date == "2007-02-01")

# Get the data for teh second day
date2_data <- subset(power_consumption_data,Date == "2007-02-02")

# combine the two data sets
subset_data <- rbind(date1_data, date2_data)

# Pull out the date : ex. "2007-02-01"
date_var <- subset_data$Date

# Combine date and time : ex. "2007-02-01 16:39:00"
date_time_var <- paste(date_var, subset_data$Time, sep = " ")

# User strptime to create the final format : ex. "2007-02-01 15:42:00 PST"
final_data_set <- strptime(date_time_var,  "%Y-%m-%d %H:%M:%S")

# Pull just the global active power data and convert to numeric
global_active_power_data <- as.numeric(subset_data[,"Global_active_power"])

# Produce the graphic
png("plot2.png",width = 480, height = 480)

# Create plot
plot(final_data_set,global_active_power_data ,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")

# Close the device
dev.off()

