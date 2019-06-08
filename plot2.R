library(tidyverse)
library(lubridate)

# Read data
df <- read.csv2("household_power_consumption.txt",na.strings="?",dec=".",stringsAsFactors=FALSE)

# Select the dates we want with dplyr, format time data with lubridate,
# and create a second dataframe with only the data we want for the plot
df %>% filter(Date %in% c("1/2/2007","2/2/2007"))  %>%
    transmute(Time = dmy_hms(paste(Date,Time)),
        "Global Active Power (kilowatts)" = Global_active_power) -> df.subset

# Open png device
png("plot2.png",width=480,height=480)

# Plot the figure. Not much to do since we've 
# already labeled the dataframe properly.
plot(df.subset,type="l",xlab="")

# Close drawing device
dev.off()
