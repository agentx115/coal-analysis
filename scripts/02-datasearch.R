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
#change x for what you want to check 
ggplot(noProtapion, aes(x = SeedYear, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity") +
  labs( y = "Species count",
        fill = "Species name") +
  theme_light()
#bar plot for non P. fulvi
ggplot(noProtapion, aes(x = Month, y = count, fill = SpeciesName)) +
  geom_bar(stat = "identity") +
  labs( y = "Species count",
        fill = "Species name") +
  facet_wrap(~SeedYear, ncol = 1) +
  theme_light()

#ggplot(noProtapion, aes(x = Month, y = count, fill = SpeciesName)) +
#geom_bar(stat = "identity") +
#  labs( y = "Species count",
#        fill = "Species name") +
#  facet_wrap(~SeedYear, ncol = 1) +
#  theme_light()


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

####Bar plot rarity####

####Species by month####
#select by month, then plot them next to each other