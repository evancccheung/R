
3 + 5

x <- 20

# Calculate x*3
x * 3 # calculate something

round(3.14159, digits=2) # 3.14
round(3.14159, 2) # 3.14
round(2, 3.14159) # 2
round(digits=2, x=3.14159) # 3.14
round(digits=2, 3.14159) # 3.14


weight_g <- c(50, 60, 65, 82)
weight_g

animals <- c("mouse", "rat", "dog")
animals

class(weight_g)
length(weight_g)

class(animals)
length(animals)

animals[1] # "mouse"
animals[1:2] # "mouse" "rat"
animals[c(1,3)] # "mouse" "dog"
animals[-2] # "mouse" "dog"

weight <- c(21, 34, 39, 54, 55)
weight > 50 # FALSE FALSE FALSE  TRUE  TRUE
weight[weight > 50] # 54 55
weight[weight > 50 | weight < 30] # 21 54 55
weight[weight > 30 & weight < 50] # 34 39

animals <- c("mouse", "rat", "dog", "cat", "fish")
animals[animals %in% c("dog", "cat")]
animals[animals %in% c("dog", "cat", "lion")]

install.packages("tidyverse")
require(tidyverse)

sex_data <- factor(surveys$sex)

sex_data <- addNA(sex_data)
plot(sex_data)

levels(sex_data)[3] <- "undetermined"
levels(sex_data)
plot(sex_data)

levels(sex_data)[1:2] <- c("female", "male")
levels(sex_data)
sex_data <- factor(sex_data, levels=c("undetermined", "female", "male"))
plot(sex_data)

test <- addNA(factor(surveys$sex))
levels(test)
levels(test)[1:3] <- c("female", "male", "undetermined")
levels(test)
test <- factor(test, levels = c("undetermined", "female", "male"))
plot(test)


+nlevels(sex_data) 
levels(sex_data)
levels(sex_data)[1] <- "female"
levels(sex_data)

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(as.character(year_fct))

require(lubridate)
my_date <- ymd("2015-01-01")
str(my_date)

my_date <- ymd(paste("2015", "1", "1", sep = "-"))
surveys$date <- with(surveys, ymd(paste(year, month, day, sep = "-")))
summary(surveys$date)
surveys[is.na(surveys$date), c("year", "month", "day")]


require(esquisse)

esquisser()


library(dplyr)
library(ggplot2)

surveys %>%
 filter(!is.na(sex)) %>%
 ggplot() +
 aes(x = hindfoot_length, y = weight, colour = sex) +
 geom_point(shape = "circle", size = 1.5) +
 scale_color_hue(direction = 1) +
 theme_minimal() +
 facet_wrap(vars(sex))

surveys %>%
 filter(!is.na(sex)) %>%
 ggplot() +
 aes(x = hindfoot_length, y = weight, colour = sex) +
 geom_point(shape = "circle", size = 1.5) +
 scale_color_hue(direction = 1) +
 theme_minimal() +
 facet_wrap(vars(sex))

surveys %>%
  filter(!is.na(sex)) %>%
  ggplot() +
  aes(x = hindfoot_length, y = species, colour = sex) +
  geom_jitter(size = 0.5) +
  scale_color_hue(direction = 1) +
  labs(x = "Hindfoot Length", y = "Species", color = "Sex") +
  theme_minimal() +
  facet_wrap(vars(sex))

surveys %>%
  filter(!is.na(sex)) %>%
  ggplot() +
  aes(x = hindfoot_length, y = species, colour = sex) +
  geom_jitter(size = 0.5) +
  scale_color_hue(direction = 1) +
  labs(x = "Hindfoot Length", y = "Species", color = "Sex") +
  theme_minimal() +
  facet_wrap(vars(sex))
