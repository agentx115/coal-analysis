####Cleaning up Beetle Data####

#set up libraries
library(tidyverse)
library(lubridate)

#import data
beetle = read_csv("data/beetledata.csv")

View(beetle)
summary(beetle)
glimpse(beetle)
unique(beetle$SpeciesName)
loti = filter(beetle, Species == "loti")
loti


beetle = beetle %>%
  mutate(fullDate = make_date(Year, Month, Day)) %>%
  glimpse()

#want to get count data instead

#way 1 - unused in this example
# table(beetle$SpeciesName, beetle$SeedYear, beetle$Month)

#way 2
newbeetles = beetle %>%
  group_by(SpeciesName, SeedYear, Month, Year, fullDate) %>% #includes year because I'll have 2018 data soon
  dplyr::summarize(count = n()) #makes new count column
View(newbeetles)

noMonthbeetles = beetle %>%
  group_by(SpeciesName, SeedYear) %>% 
  dplyr::summarize(count = n()) #makes new count column
View(noMonthbeetles)

#make the new csv
write_csv(newbeetles, "data/newbeetle2.csv")
#remember to go and remove Ischnopterapion loti from the data set 

