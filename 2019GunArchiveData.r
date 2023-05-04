library(readr)
library(dplyr)

##data importation
handgun1 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataDec2nd2019ThroughDec31st2019HandgunIncidents.csv", col_names = T, comment = "")
rifle <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughDec31st2019RifleIncidents.csv", col_names = T, comment = "")
handgun2 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughMar1st2019HandgunIncidents.csv", col_names = T, comment = "")
handgun3 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJul2nd2019ThroughSep1st2019HandgunIncidents.csv", col_names = T, comment = "")
handgun4 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMar2nd2019ThroughMay1st2019HandgunIncidents.csv", col_names = T, comment = "")
handgun5 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMay2nd2019ThroughJul1st2019HandgunIncidents.csv", col_names = T, comment = "")
handgun6 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataSep2nd2019ThroughDec1st2019HandgunIncidents.csv", col_names = T, comment = "")
legalDefenseByState <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/usDataOnLegalityOfDefense.csv", col_names = T, comment = "")

handgun106 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataSep2nd2019ThroughDec1st2019HandgunIncidents.csv", col_names = T, comment = "")
handgun103 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJul2nd2019ThroughSep1st2019HandgunIncidents.csv", col_names = T, comment = "")

View(handgun3)

# select only wanted columns
handgun3 <- subset(handgun3, select = c(Address, State, "City Or County", "# Killed", "# Injured", "Incident ID", "Incident Date"))
handgun3 <- subset(handgun3, select = c(Address, State, City Or County))

?subset
?read_csv
# combine the handgun data frames into one large data frame
combinedTest <- rbind(handgun106, handgun103)

## combine the individual address, state/county, and state into one field
Address <- paste(handgun106$Address, handgun106$`City Or County`, handgun106$State, sep = ", ")
handgun106 <- as.data.frame(Address)  

View(handgun106)

