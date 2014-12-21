
# Load libraries


library(plyr)
library(ggplot2)
library(data.table)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/r/exploratory data/2/summarySCC_PM25.rds")
SCC <- readRDS("C:/r/exploratory data/2/Source_Classification_Code.rds")


# Aggregate Data by year
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

#creat the png plot
png(filename = "C:/r/exploratory data/2/plot1.png", width = 480, height = 480, units = "px")

#Total emissions from PM2.5 decreased in the United States from 1999 to 2008
plot(total.emissions, type = "b", pch = 18, col = "red", ylab = "PM 2.5 Emissions", 
     xlab = "Year", main = "Annual Emissions")

# close the png
x<-dev.off()