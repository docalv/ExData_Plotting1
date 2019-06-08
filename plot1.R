library(tidyverse)

# Read data
df <- read.csv2("household_power_consumption.txt",na.strings="?",dec=".")

# Select the dates we want with dplyr
df %>% filter(Date %in% c("1/2/2007","2/2/2007")) -> df.subset

# Open png device
png("plot1.png",width=480,height=480)

# Create the histogram with the desired parameters
hist(df.subset$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# Close drawing device
dev.off()