library(tidyverse)
library(lubridate)
library(vegan)
library(plyr)
library(ggvegan)

beetledata = read_csv("data/newbeetle21.csv")


data2013 = filter(beetledata, SeedYear == 2013)
unique(data2013$SpeciesName)

data2014 = filter(beetledata, SeedYear == 2014)
unique(data2014$SpeciesName)

data2015 = filter(beetledata, SeedYear == 2015)
unique(data2015$SpeciesName)


####Calculating Species Richness####

#read in Vegan formatted data

veganBeetles = read_csv("data/veganbeetleEDIT.csv")

#Shannon-Weiner Index
#Collections assumed truly random
#H ranges from 0 to 5
diversity(veganBeetles[-1], index="shannon")

#Brillouin
#for some reason this one has out of range? Need to read up more on brillouin!!
ddply(veganBeetles,~Sites,function(x) {
         data.frame(BRILLOUIN=brillouin(x[-1]))
 })

#Simpsons index
diversity(veganBeetles[-1], index="simpson")


####VEGAN PACKAGE STUFF####
#"One thing that stumbles most vegan beginners around me is that you must
#organize your data in the way vegan expects it (i.e. one column per species and
#one row per site) and eliminate all other columns. Once you do that, things
#should go smoothly." 

####CCA plot attempts####
cca(veganBeetles)

diversity(veganBeetles)
