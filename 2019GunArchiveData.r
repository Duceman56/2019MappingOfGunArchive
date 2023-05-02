library(readr)
library(dplyr)

##data importation
handgun11 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataDec2nd2019ThroughDec31st2019HandgunIncidents.csv")
rifle <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughDec31st2019RifleIncidents.csv")
handgun2 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughMar1st2019HandgunIncidents.csv")
handgun3 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJul2nd2019ThroughSep1st2019HandgunIncidents.csv")
handgun4 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMar2nd2019ThroughMay1st2019HandgunIncidents.csv")
handgun5 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMay2nd2019ThroughJul1st2019HandgunIncidents.csv")
handgun6 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataSep2nd2019ThroughDec1st2019HandgunIncidents.csv")
legalDefenseByState <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/usDataOnLegalityOfDefense.csv")

## combine the individual address, state/county, and state into one field
tempDf <- paste(handgun11$Address, handgun11$`City Or County`, handgun11$State, sep = ", ")
handgun11$CombineAddress <- as.data.frame(tempDf)  

View(handgun11)
