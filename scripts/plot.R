ggplot(data = surveys_complete) + 
  aes(x = weight,
      y = hindfoot_length,
      color = species_id,
      shape = plot_type) + 
  geom_point(alpha = 0.5)

ggplot(data = surveys_complete) + 
  aes(x = weight,
      y = hindfoot_length) +
  geom_point() + # Layer 1: plot the data
  geom_point(data = filter(surveys_complete,
                           species_id %in% c("DM")),
             color = 'red',
             shape = 21) + 
  labs(title = "My title",
       subtitle = "This is the subtitle",
       x = "Weight (g)",
       y = "Hindfoot length (mm)") +
  theme_minimal() # Layer 2: overlap (highlight) species "DM"


yearly_sex_counts <- surveys_complete %>% 
  count(year, genus, sex)

ggplot(data=yearly_sex_counts) + 
  aes(x = year,
      y = n,
      color = sex) +
  geom_line() + 
  facet_grid(rows = vars(genus))

ggsave("fig_output/my_plot.png")
