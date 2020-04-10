setwd("/Users/jaimiechoi/Documents/ExData_Plotting1/Electric_Project")

library("data.table")
library(chron)

#Read in Household Power Consumption Data Set from UC Irvine Machine Learning Repository
df <- fread("/Users/jaimiechoi/Documents/household_power_consumption.txt")

#Change the Date and Time to Date and Time fields
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- times(df$Time)

#Subset dataset for only 2007-02-01 and 2007-02-02
df_sub <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"),]

