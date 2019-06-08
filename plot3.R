library(tidyverse)
library(lubridate)

# Read data
df <- read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors=FALSE)

# Select the dates we want with dplyr, format time data with lubridate,
# and create a second dataframe with only the data we want for the plot
df %>% filter(Date %in% c("1/2/2007","2/2/2007"))  %>%
    mutate(Time = dmy_hms(paste(Date,Time))) %>%
    select(Time,Sub_metering_1, Sub_metering_2,Sub_metering_3) -> df.subset

# Open png device
png("plot3.png",width=480,height=480)

# Plot the figure. Each data series with one line. 

plot(Sub_metering_1 ~ Time, data=df.subset,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Sub_metering_2 ~ Time, data=df.subset,col="red")
lines(Sub_metering_3 ~ Time, data=df.subset,col="blue")

# Add legend
legend("topright", col=c("black","red","blue"), lty = 1,
    legend=colnames(df.subset)[2:4]) # Grab names from the dataframe

# Close drawing device
dev.off()
