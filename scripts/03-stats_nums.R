library(tidyverse)
library(lubridate)
library(vegan)
library(plyr)

beetledata = read_csv("data/newbeetle2.csv")

data2013 = filter(beetledata, SeedYear == 2013)
unique(data2013$SpeciesName)

data2014 = filter(beetledata, SeedYear == 2014)
unique(data2014$SpeciesName)

data2015 = filter(beetledata, SeedYear == 2015)
unique(data2015$SpeciesName)


####Calculating Species Richness####

#Menhinick's richness
#number of species divided by the square root of the number of individuals

numsp2013 = nrow(data2013)
individuals2013 = filter(beetle, SeedYear == 2013)
numind2013 = nrow(individuals2013)

#Menhinick's richness for 2013
numsp2013 / (sqrt(numind2013))

####VEGAN PACKAGE STUFF####
#"One thing that stumbles most vegan beginners around me is that you must
#organize your data in the way vegan expects it (i.e. one column per species and
#one row per site) and eliminate all other columns. Once you do that, things
#should go smoothly." 