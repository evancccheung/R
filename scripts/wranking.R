surveys <- read.csv("data/portal_data_joined.csv")

require(dplyr); require(tidyr)

surveys %>% 
  filter(year == 1995) %>% 
  select(species_id) %>% 
  group_by(species_id) %>% # group_by always goes with summarise
  summarise(total = n()) %>% 
  arrange(desc(total)) # default: ascending

surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000) %>% 
  select(weight, weight_kg)
  