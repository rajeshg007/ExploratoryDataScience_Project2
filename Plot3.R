# This code assumes that the required RDS files are present in the Working directory

# Check if the files are present in your working directory
# Files will be printed in your console

dir()

# import libraries
library(ggplot2)
library(plyr)

# now load the data into varialbles
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset the data
setBaltimore <- subset (NEI, fips == "24510")

# use ddply to group the data
EmYears <- ddply(setBaltimore, .(year, type), function(x) sum(x$Emissions))

# check the column names
colnames(EmYears)

# 3rd column in emmisions but is names as V1, so change it

colnames(EmYears)[3] <- "Emissions"

# now plot the graph
qplot(year, Emissions, data=EmYears, color=type, geom ="line") + ggtitle(expression("Baltimore" ~ PM[2.5] ~ "Emmission by type")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in Tons)"))

# now print it to a png file
png("plot3.png") 
qplot(year, Emissions, data=EmYears, color=type, geom ="line") + ggtitle(expression("Baltimore" ~ PM[2.5] ~ "Emmission by Type")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in Tons)"))
dev.off()