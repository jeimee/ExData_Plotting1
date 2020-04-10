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

#Create a graph that shows Three sub meterings during three days.

png(file = "Plot4.png")
par(mfcol= c(2,2))
#First Graph 
with(df_sub, plot(DT, Global_active_power,
                  type = "l",
                  ylab = "Global Active Power (kilowatts)",
                  xlab = "Weekday"))
#Second Graph
with(df_sub, plot(DT, Sub_metering_1, type = "l", xlab = "Weekday", ylab = "Energy sub metering"))
lines(df_sub$DT, df_sub$Sub_metering_2, col = "red")
lines(df_sub$DT, df_sub$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1)
#Third Graph
with(df_sub, plot(DT, Voltage,
        type = "l",
        ylab = "Voltage",
        xlab = "Weekday"))

#Fourth Graph
with(df_sub, plot(DT, Global_reactive_power,
                  type = "l",
                  ylab = "Global Reactive Power",
                  xlab = "Weekday"))

dev.off()