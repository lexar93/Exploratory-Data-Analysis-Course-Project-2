



## Convert into data.table
NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)

#Obtain SCC codes for coal combustion 

coal.scc = SCC.DT[grep("Coal", SCC.Level.Three), SCC]

#Aggregate Emissions for  SCC by year

coal.emissions = NEI.DT[SCC %in% coal.scc, sum(Emissions), by = "year"]
colnames(coal.emissions) <- c("year", "Emissions")


#Open the PNG device

png(filename = "C:/r/exploratory data/2/plot4.png", width = 480, height = 480, units = "px")

#Plot emissions per year with ggplot2 plotting system Emissions from coal from 1999-2008.

g = ggplot(coal.emissions, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "red") + labs(x = "Year") + 
  labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Emissions from Coal Combustion for the USA")

# Close the PNG device

dev.off()