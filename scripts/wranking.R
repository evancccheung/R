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

surveys %>% 
  filter(year==1995) %>% 
  count(species_id) %>% 
  arrange(desc(n))

survey2 <- surveys %>% 
  filter(year==1995,
         !is.na(weight),
         species_id %in% c("PL", "PF", "PH")) %>% 
  group_by(species_id) %>% 
  summarise(min_weight=min(weight),
            max_weight=max(weight),
            total=n())

#Cleaning data
surveys %>% 
  filter(!is.na(weight),
         !is.na(sex),
         !is.na(hindfoot_length)) -> surveys_clean

surveys_clean %>% 
  count(species_id) %>% 
  filter(n >= 50) -> species_count

surveys_clean %>% 
  filter(surveys_clean$species_id %in% species_count$species_id) -> surveys_complete

write_csv(surveys_complete, 
          "data_output/surveys_complete.csv")
