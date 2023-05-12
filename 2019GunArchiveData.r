library(readr)
library(dplyr)
library(tmaptools)
library(ggplot2)

##data importation
handgun1 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataDec2nd2019ThroughDec31st2019HandgunIncidents.csv")
rifle <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughDec31st2019RifleIncidents.csv")
handgun2 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJan1st2019ThroughMar1st2019HandgunIncidents.csv")
handgun3 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataJul2nd2019ThroughSep1st2019HandgunIncidents.csv")
handgun4 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMar2nd2019ThroughMay1st2019HandgunIncidents.csv")
handgun5 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataMay2nd2019ThroughJul1st2019HandgunIncidents.csv")
handgun6 <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunArchiveDataSep2nd2019ThroughDec1st2019HandgunIncidents.csv")
legalDefenseByState <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/usDataOnLegalityOfDefense.csv")
shotgun <- read_csv("https://raw.githubusercontent.com/Duceman56/PublicData/main/gunViolenceJan1stThroughDec31stShotgunIncidents.csv")

# select only wanted columns
handgun1 <- handgun1[, 1:7]
handgun2 <- handgun2[, 1:7]
handgun3 <- handgun3[, 1:7]
handgun4 <- handgun4[, 1:7]
handgun5<- handgun5[, 1:7]
handgun6 <- handgun6[, 1:7]
shotgun <- shotgun[, 1:7]

# combine the handgun data frames into one large data frame
handgun <- rbind(handgun1, handgun2, handgun3, handgun4, handgun5, handgun6)
wiHandgun <- subset(handgun, handgun$State == "Wisconsin")

## combine the individual address, state/county, and state into one field
wholeAddress <- paste(handgun$Address, handgun$`City Or County`, handgun$State, sep = ", ") ## for whole handgun data set
handgunTemp <- as.data.frame(wholeAddress) ## for whole handgun data set

wholeAddressWi <- paste(wiHandgun$Address, wiHandgun$`City Or County`, wiHandgun$State, sep = ", ") ## for wisconsin handgun data set
handgunWi <- as.data.frame(wholeAddressWi) ## for wisconsin handgun data set

wholeAddress1 <- paste(handgun1$Address, handgun1$`City Or County`, handgun1$State, sep = ", ")
handgunTemp1 <- as.data.frame(wholeAddress1)

wholeAddress2 <- paste(handgun2$Address, handgun2$`City Or County`, handgun2$State, sep = ", ")
handgunTemp2 <- as.data.frame(wholeAddress2)

wholeAddress3 <- paste(handgun3$Address, handgun3$`City Or County`, handgun3$State, sep = ", ")
handgunTemp3 <- as.data.frame(wholeAddress3)

wholeAddress4 <- paste(handgun4$Address, handgun4$`City Or County`, handgun4$State, sep = ", ")
handgunTemp4 <- as.data.frame(wholeAddress4)

wholeAddress5 <- paste(handgun5$Address, handgun5$`City Or County`, handgun5$State, sep = ", ")
handgunTemp5 <- as.data.frame(wholeAddress5)

wholeAddress6 <- paste(handgun6$Address, handgun6$`City Or County`, handgun6$State, sep = ", ")
handgunTemp6 <- as.data.frame(wholeAddress6)

wholeAddressRifle <- paste(rifle$Address, rifle$`City Or County`, rifle$State, sep = ", ")
rifleTemp1 <- as.data.frame(wholeAddressRifle)

wholeAddressShotgun <- paste(shotgun$Address, shotgun$`City Or County`, shotgun$State, sep = ", ")
shotgunTemp1 <- as.data.frame(wholeAddressShotgun)

## add address to main handgun dataframe
handgun <- cbind(handgun, handgunTemp)
rifle <- cbind(rifle, rifleTemp1)
shotgun <- cbind(shotgun, shotgunTemp1)

## geocode portion
geocoded <- geocode_OSM(handgunTemp$wholeAddress)
geocodedWhole <- geocode_OSM(handgun$wholeAddress)

## summary statistics
sum(handgun$`# Killed`)
sum(handgun$`# Injured`)
str(handgun)

sum(rifle$`# Killed`)
sum(rifle$`# Injured`)
str(rifle)

sum(shotgun$`# Victims Killed`)
sum(shotgun$`# Victims Injured`)
str(shotgun)

## write new csv to dedicated locations
write_csv(handgun, file = "//Users//carsond//Desktop//handgun.csv") #"Q://StudentCoursework//Zeitler//GEOG.280.001.2235//DUCECR1126//09 - Final Map Project//handgun.csv")
write_csv(rifle, file = "//Users//carsond//Desktop//rifle.csv")
write_csv(shotgun, file = "//Users//carsond//Desktop//shotgun.csv")

