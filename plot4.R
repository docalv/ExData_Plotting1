
library(tidyverse)
library(lubridate)

# Read data
df <- read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors=FALSE)

# Select the dates we want with dplyr, format time data with lubridate,
# and create a second dataframe. We're keeping all columns this time.
df %>% filter(Date %in% c("1/2/2007","2/2/2007"))  %>%
    mutate(Time = dmy_hms(paste(Date,Time))) -> df.clean

# Open png device
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2)) # Set up a 2x2 array of plots 

# First plot is plot2.png, check plot2.R for details.
plot(Global_active_power ~ Time,data=df.clean,
    xlab="",ylab="Global Active Power",type="l")
# Second is similar, but with an x axis label.
plot(Voltage ~ Time,data=df.clean,
    xlab="datetime",type="l")

# Third is plot3.png again, as described in plot3.R

plot(Sub_metering_1 ~ Time, data=df.clean,type="l",col="black",ylab="Energy sub metering")
lines(Sub_metering_2 ~ Time, data=df.clean,col="red")
lines(Sub_metering_3 ~ Time, data=df.clean,col="blue")
legend("topright", col=c("black","red","blue"), lty = 1,
    legend=colnames(df.clean)[7:9]) # Grab names from the dataframe

# Final plot is again similar to the first two ones.

plot(Global_reactive_power ~ Time,data=df.clean,
    xlab="datetime",type="l")

dev.off()


