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

# Combine the two data sets
subset_data <- rbind(date1_data, date2_data)

# Pull just the global active power data and convert to numeric
data_to_plot <- as.numeric(subset_data[,"Global_active_power"])

# Plot the data
png("plot1.png",width = 480, height = 480)

# Display the histogram
hist(data_to_plot, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

# Close the device
dev.off()     
