library(tidyverse)
library(lubridate)

beetledata = read_csv("data/newbeetle2.csv") #this one includes full dates
####Protapion fulvipes removed because they are too abundant!####
noProtapion = filter(beetledata, SpeciesName != "Protapion fulvipes")
####Protapion fulvipes only####
ProtapionOnly = filter(beetledata, SpeciesName == "Protapion fulvipes")

names(beetledata)
glimpse(beetledata)

####All beetle bar plots####
ggplot(beetledata, aes(x = SeedYear, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity")
#bar plot for non P. fulvi
ggplot(noProtapion, aes(x = SeedYear, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity")


#this one doesn't look so great
ggplot(noProtapion, aes(x = SpeciesName)) +
  geom_bar() +
  facet_wrap(~ SeedYear) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) #flips species names other way


####Scatter plot for P. fulvipes
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

####Splits all of the species next to each other####
ggplot(beetledata,
       aes(
         x = fullDate,
         y = count,
         group = SeedYear,
         colour = SeedYear
       )) +
  geom_point() +
  stat_smooth() +
  facet_wrap(~SpeciesName)
####This one is alright####
ggplot(noProtapion,
       aes(
         x = fullDate,
         y = count,
         group = SeedYear,
         colour = SeedYear
       )) +
  geom_point() +
  stat_smooth() +
  facet_wrap(~SpeciesName)
