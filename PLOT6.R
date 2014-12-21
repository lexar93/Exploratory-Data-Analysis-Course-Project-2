


#subset the data 

font1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

font2 <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]


# subset data Baltimore City
emBA <- NEI[NEI$SCC %in% font2$SCC & NEI$fips == "24510", ]
# subset our data Los Angeles County
emLA <- NEI[NEI$SCC %in% font2$SCC & NEI$fips == "06037", ]

#  bind the data created in previous steps 
emco <- rbind(emBA, emLA)

# Find the emmissions due to motor vehicles in Baltimore (city) and Los Angeles County

tmveYR.county <- aggregate (Emissions ~ fips * year, data =emco, FUN = sum ) 
tmveYR.county$county <- ifelse(tmveYR.county$fips == "06037", "Los Angeles", "Baltimore")

# plot  to png
png("C:/r/exploratory data/2/plot6.png", width=750)
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  1999 to 2008 in Los Angeles Co., CA and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))

# end plot
dev.off()