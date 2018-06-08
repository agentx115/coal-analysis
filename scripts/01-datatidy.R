####Cleaning up Beetle Data####

#set up libraries
library(tidyverse)
library(lubridate)

#import data
beetle = read_csv("data/beetledata.csv")

summary(beetle)
glimpse(beetle)
unique(beetle$SpeciesName)

beetle = beetle %>%
  mutate(fullDate = make_date(Year, Month, Day)) %>%
  glimpse()

#want to get count data instead

#way 1 - unused in this example
# table(beetle$SpeciesName, beetle$SeedYear, beetle$Month)

#way 2
newbeetles = beetle %>%
  group_by(SpeciesName, SeedYear, Month, Year, fullDate) %>% #includes year because I'll have 2018 data soon
  summarize(count = n()) #makes new count column
View(newbeetles)



#make the new csv
write_csv(newbeetles, "data/newbeetle2.csv")
