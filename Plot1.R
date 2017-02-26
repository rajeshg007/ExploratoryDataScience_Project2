# This code assumes that the required RDS files are present in the Working directory

# Check if the files are present in your working directory
# Files will be printed in your console

dir()

# now load the data into varialbles

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# now perform a tapply to group the data based on Year

EmYears <- tapply(NEI$Emissions, NEI$year, sum)

# Visualise in RStudio before writing it down to a file. easier to make Changes before writing down to a file

plot(names(EmYears), EmYears, type="l", xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~"Emissions (in Tons)"), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Red")

# now plot the graph to png

png("plot1.png")

plot(names(EmYears), EmYears, type="l", xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~"Emissions (in Tons)"), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Red")

dev.off()
