library(dplyr)
# Setting the working directory to the location of the data file.
setwd("d:/Github/Exploratory_Data/data")

#Read the file (Change Name if needed), delimited by semi colon.
d<- read.table("household_power_consumption.txt",header= TRUE, sep=";",stringsAsFactors=FALSE)

# Doing some exploring on the dataframe
names(d)
summary(d)

# Changing to a table to be used with dplyr
d<- tbl_df(d)

# Reduce the dataset to the dates of interest
d <- filter(d,Date == "1/2/2007" | Date == "2/2/2007")

# add a new column in Date format combining Date and Time
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Set the class to numeric on needed fields
d$Global_active_power<-as.numeric(d$Global_active_power)
d[,3]<-lapply(d[,3], as.numeric)
d[,4]<-lapply(d[,4], as.numeric)
d[,5]<-lapply(d[,5], as.numeric)
d[,6]<-lapply(d[,6], as.numeric)
d[,7]<-lapply(d[,7], as.numeric)
d[,8]<-lapply(d[,8], as.numeric)

# Histogram Plot 1
with(d,hist(Global_active_power, main = "Global Active Power", col = "red", xlab ="Global Active Power (kilowatts)"))

#Export as PNG.
dev.copy(png, file = "plot1.png", width=480, height=480)  
dev.off()
