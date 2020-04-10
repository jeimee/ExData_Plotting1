setwd("/Users/jaimiechoi/Documents/ExData_Plotting1/Electric_Project")

library("data.table")
library(chron)

#Read in Household Power Consumption Data Set from UC Irvine Machine Learning Repository
df <- fread("/Users/jaimiechoi/Documents/household_power_consumption.txt", na.strings="?")

#Change the Date and Time to Date/Time Column and subset dataset
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df_sub <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"),]
df_sub$DT <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format="%Y-%m-%d %H:%M:%S")

#Remove original dataset to save space
rm(df)
#Create a graph that shows Global Active Power Usage during three days.

png(file = "Plot2.png")
with(df_sub, plot(DT, Global_active_power,
                                 type = "l",
                                 ylab = "Global Active Power (kilowatts)",
                                 xlab = "Date",
                                 main = "Global Active Power"))
dev.off()

