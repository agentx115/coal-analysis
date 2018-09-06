####Functional  diversity analysis####

beetlediv = read_csv("data/phytophagousdiversityno2014S3.csv")


beetleSpec = beetlediv %>%
  filter(SpeciesName != "Protapion fulvipes") %>% #hash this out for all beetles
  group_by(Trifolium, SeedYear, SpeciesName)%>%
  dplyr::summarise(count = n()) %>%
  filter(SeedYear == 2013) %>%
  mutate(nByx = count * Trifolium)
bottom = sum(beetleSpec$count)
top = sum(beetleSpec$nByx)
top/bottom


#Trifolium , LarvaeLocation, FoodSpecificity, Rarity, Status

  


