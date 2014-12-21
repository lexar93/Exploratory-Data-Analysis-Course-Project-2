


# Agrregate data by year and county 
Baltimore<- subset(NEI, fips == "24510")
total.emissions.baltimore <- with(Baltimore, aggregate(Emissions, by = list(year), 
                                                       sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

# Aggregate Emissions by year, county, type and filter 

total.emissions.baltimore.type <- ddply(Baltimore, .(type, year), summarize, 
                                        Emissions = sum(Emissions))
total.emissions.baltimore.type$Pollutant_Type <- total.emissions.baltimore.type$type

#create the png plot
png(filename='C:/r/exploratory data/2/plot3.png', width=480, height=480, units='px')

# qplot with point, nonpoint, onroad, nonroad
qplot(year, Emissions, data = total.emissions.baltimore.type, group = Pollutant_Type, 
      color = Pollutant_Type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Total Emissions in U.S.A by Type of Pollutant")

# close the png
dev.off()