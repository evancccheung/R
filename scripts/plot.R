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

ggsave("fig_output/my_plot.png",
       height = 10,
       width = 20,
       units = "cm",
       dpi = 200)

# Radar/Spider Chart
require(fmsb)

data <- as.data.frame(matrix(sample(2:20, 10, replace=T), ncol=10))
colnames(data) <- c("math", "english", "biology", "music", "R-coding",
                    "data-viz", "french", "physics", "statistics", "sport")
head(data)

set.seed(1234)
data <- rbind(rep(20, 10), rep(0, 10), data)

radarchart(data)

# Boxplot
surveys_complete %>% 
  ggplot() + 
  aes(x = plot_type,
      y = weight) + 
  geom_boxplot()

# Violin Plot
surveys_complete %>% 
  ggplot() + 
  aes(x = plot_type,
      y = weight) + 
  geom_violin() + 
  geom_jitter(alpha = 0.2)
