

# Obtain SCC codes for motor vehicle sources
motor.vehicle.scc = SCC.DT[grep("[Mm]obile|[Vv]ehicles", EI.Sector), SCC]

#Aggregate Emissions for the SCC by year and county and filter Baltimore City

motor.vehicle.emissions.baltimore = NEI.DT[SCC %in% motor.vehicle.scc, sum(Emissions), 
                                           by = c("year", "fips")][fips == "24510"]
colnames(motor.vehicle.emissions.baltimore) <- c("year", "fips", "Emissions")

#Open the PNG device

png(filename = "C:/r/exploratory data/2/plot5.png", width = 480, height = 480, units = "px")

#Plot emissions per year using ggplot2 plotting system Emissions from motor vehicle sources decreased 
#from 1999-2008 in Baltimore City, even though there was a blip in the year 2008.

g = ggplot(motor.vehicle.emissions.baltimore, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "red") + labs(x = "Year") + 
  labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Total Emissions from Motor Vehicle Sources in Baltimore")

# Close pNG
dev.off()