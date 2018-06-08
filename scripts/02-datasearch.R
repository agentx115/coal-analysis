library(tidyverse)
library(lubridate)

beetledata = read_csv("data/newbeetle2.csv") #this one includes full dates

names(beetledata)
glimpse(beetledata)

####All beetle bar plots####
ggplot(beetledata, aes(x = SeedYear, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity")

####Protapion fulvipes removed because they are too abundant!####
noProtapion = filter(beetledata, SpeciesName != "Protapion fulvipes")

#this one doesn't look so great
ggplot(noProtapion, aes(x = SpeciesName)) +
  geom_bar() +
  facet_wrap(~ SeedYear) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) #flips species names other way

#bar plot for non P. fulvi
ggplot(noProtapion, aes(x = SeedYear, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity")


####Protapion fulvipes only####
ProtapionOnly = filter(beetledata, SpeciesName == "Protapion fulvipes")


ggplot(ProtapionOnly,
       aes(
         x = fullDate,
         y = count,
         group = SeedYear,
         colour = SeedYear
       )) +
  geom_point() +
  stat_smooth() #+
#facet_wrap(~SeedYear)
