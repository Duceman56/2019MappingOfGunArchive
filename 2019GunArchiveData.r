library(readr)
library(dplyr)
# library(tmaptools)
# library(ggplot2)

# GVA DATA
##data importation
handgun1 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVADec2nd2019ThroughDec31st2019HandgunIncidents.csv")
rifle <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAJan1st2019ThroughDec31st2019RifleIncidents.csv")
handgun2 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAJan1st2019ThroughMar1st2019HandgunIncidents.csv")
handgun3 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAJul2nd2019ThroughSep1st2019HandgunIncidents.csv")
handgun4 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAMar2nd2019ThroughMay1st2019HandgunIncidents.csv")
handgun5 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAMay2nd2019ThroughJul1st2019HandgunIncidents.csv")
handgun6 <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVASep2nd2019ThroughDec1st2019HandgunIncidents.csv")
shotgun <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/GVAJan1stThroughDec31stShotgunIncidents.csv")

# select only wanted columns
handgun1 <- handgun1[, 1:7]
handgun2 <- handgun2[, 1:7]
handgun3 <- handgun3[, 1:7]
handgun4 <- handgun4[, 1:7]
handgun5<- handgun5[, 1:7]
handgun6 <- handgun6[, 1:7]
shotgun <- shotgun[, 1:7]
rifle <- rifle[, 1:7]

# combine the handgun data frames into one large data frame
handgun <- rbind(handgun1, handgun2, handgun3, handgun4, handgun5, handgun6)

## combine the individual address, state/county, and state into one field
wholeAddress <- paste(handgun$Address, handgun$`City Or County`, handgun$State, sep = ", ") ## for whole handgun data set
handgunTemp <- as.data.frame(wholeAddress) ## for whole handgun data set


wholeAddressRifle <- paste(rifle$Address, rifle$`City Or County`, rifle$State, sep = ", ")
rifleTemp1 <- as.data.frame(wholeAddressRifle)

wholeAddressShotgun <- paste(shotgun$Address, shotgun$`City Or County`, shotgun$State, sep = ", ")
shotgunTemp1 <- as.data.frame(wholeAddressShotgun)

## add address to main handgun dataframe
handgun <- cbind(handgun, handgunTemp)
rifle <- cbind(rifle, rifleTemp1)
shotgun <- cbind(shotgun, shotgunTemp1)

## geocode portion
# geocoded <- geocode_OSM(handgunTemp$wholeAddress)
# geocodedWhole <- geocode_OSM(handgun$wholeAddress)

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

# CDC Data
cdc <- read_csv("https://raw.githubusercontent.com/Duceman56/2019MappingOfGunArchive/main/data/cdcData2019.csv")
cdc2019 <- filter(cdc, cdc$YEAR == 2019)
sum(cdc1$DEATHS)


