library(tidyverse)
library(lubridate)

beetledata = read_csv("data/newbeetle2.csv")

names(beetledata)
glimpse(beetledata)

##Protapion fulvipes removed because they are too abundant!
noProtapion = filter(beetledata, SpeciesName != "Protapion fulvipes")

ggplot(noProtapion, aes(x=SpeciesName)) +
  geom_bar() +
  facet_wrap(~SeedYear) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) #flips species names other way


####Protapion fulvipes only####
ProtapionOnly = filter(beetledata, SpeciesName == "Protapion fulvipes")


ggplot(ProtapionOnly, aes(x= fullDate, y = count, group = SeedYear, colour = SeedYear)) +
  geom_point() +
  stat_smooth() #+
  #facet_wrap(~SeedYear)

