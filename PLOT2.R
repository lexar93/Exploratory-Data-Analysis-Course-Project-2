

#Aggregate Data emissions, year and county
Baltimore<- subset(NEI, fips == "24510")
total.emissions.baltimore <- with(Baltimore, aggregate(Emissions, by = list(year), 
                                                       sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")


#creat the png plot
png(filename = "C:/r/exploratory data/2/plot2.png", width = 480, height = 480, units = "px")


#ttotal emissions from PM2.5 decreased in the Baltimore City, Maryland 1999 to 2008
plot(total.emissions.baltimore$year, total.emissions.baltimore$Emissions, type = "b", 
     pch = 17, col = "red", ylab = "Emissions PM2.5", xlab = "Year", main = "Baltimore Emissions")


# close the png
dev.off()