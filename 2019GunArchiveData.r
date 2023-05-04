library(readr)
library(dplyr)
library(tmaptools)

# citations


##data importation
handgun1 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataDec2nd2019ThroughDec31st2019HandgunIncidents.csv")
rifle <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughDec31st2019RifleIncidents.csv")
handgun2 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughMar1st2019HandgunIncidents.csv")
handgun3 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJul2nd2019ThroughSep1st2019HandgunIncidents.csv")
handgun4 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMar2nd2019ThroughMay1st2019HandgunIncidents.csv")
handgun5 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMay2nd2019ThroughJul1st2019HandgunIncidents.csv")
handgun6 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataSep2nd2019ThroughDec1st2019HandgunIncidents.csv")
legalDefenseByState <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/usDataOnLegalityOfDefense.csv")

# select only wanted columns
handgun1 <- handgun1[, 1:7]
handgun2 <- handgun2[, 1:7]
handgun3 <- handgun3[, 1:7]
handgun4 <- handgun4[, 1:7]
handgun5<- handgun5[, 1:7]
handgun6 <- handgun6[, 1:7]

# combine the handgun data frames into one large data frame
handgun <- rbind(handgun1, handgun2, handgun3, handgun4, handgun5, handgun6)

## combine the individual address, state/county, and state into one field
wholeAddress <- paste(handgun$Address, handgun$`City Or County`, handgun$State, sep = ", ")
handgunTemp <- as.data.frame(wholeAddress)

wholeAddress <- paste(handgun1$Address, handgun1$`City Or County`, handgun1$State, sep = ", ")
handgunTemp <- as.data.frame(wholeAddress)

## add address to main handgun dataframe
handgun <- cbind(handgun, handgunTemp)

## geocode portion
geocoded <- geocode_OSM(handgunTemp$wholeAddress)
geocodedWhole <- geocode_OSM(handgun$wholeAddress)
