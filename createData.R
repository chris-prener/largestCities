library(rvest)
library(dplyr)
library(stringr)

# download webpage content
webpage <- read_html("https://en.wikipedia.org/wiki/List_of_largest_cities_in_the_United_States_by_population_by_decade")

# identify table notes
tables <- html_nodes(webpage, "table")

# extract the second node, which contains the 1790 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[2] %>%
  html_table(fill = TRUE)

# convert 1790 data to a data frame
pop1790 <- do.call(rbind, tablesList)

# tidy 1790 data frame
pop1790 %<>%
  rename(rank = Rank) %>%
  rename(city = City) %>%
  rename(state = State) %>%
  rename(pop = `Population[4]`) %>%
  mutate(pop = as.numeric(gsub(",", "", pop))) %>%
  select(-Notes) %>%
  mutate(year = 1790)
  
# extract the second node, which contains the 1800 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[3] %>%
  html_table(fill = TRUE)

# convert 1800 data to a data frame
pop1800 <- do.call(rbind, tablesList)

# tidy 1800 data frame
pop1800 %<>%
  rename(rank = Rank) %>%
  rename(city = City) %>%
  rename(state = State) %>%
  rename(pop = `Population[5]`) %>%
  mutate(pop = as.numeric(gsub(",", "", pop))) %>%
  select(-Notes) %>%
  mutate(year = 1800)

# extract the second node, which contains the 1810 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[4] %>%
  html_table(fill = TRUE)

# convert 1810 data to a data frame
pop1810 <- do.call(rbind, tablesList)

# tidy 1810 data frame
pop1810 %<>%
  rename(rank = Rank) %>%
  rename(city = City) %>%
  rename(state = State) %>%
  rename(pop = `Population[6]`) %>%
  mutate(pop = as.numeric(gsub(",", "", pop))) %>%
  select(-Notes) %>%
  mutate(year = 1810)

# combine data sets
largestCities <- bind_rows(pop1790, pop1800, pop1810)
