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
  rename(Population = `Population[4]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1790)
  
# extract the third node, which contains the 1800 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[3] %>%
  html_table(fill = TRUE)

# convert 1800 data to a data frame
pop1800 <- do.call(rbind, tablesList)

# tidy 1800 data frame
pop1800 %<>%
  rename(Population = `Population[5]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1800)

# extract the fourth node, which contains the 1810 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[4] %>%
  html_table(fill = TRUE)

# convert 1810 data to a data frame
pop1810 <- do.call(rbind, tablesList)

# tidy 1810 data frame
pop1810 %<>%
  rename(Population = `Population[6]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1810)

# extract the fifth node, which contains the 1820 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[5] %>%
  html_table(fill = TRUE)

# convert 1820 data to a data frame
pop1820 <- do.call(rbind, tablesList)

# tidy 1820 data frame
pop1820 %<>%
  rename(Population = `Population[7]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1820)

# extract the sixth node, which contains the 1830 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[6] %>%
  html_table(fill = TRUE)

# convert 1830 data to a data frame
pop1830 <- do.call(rbind, tablesList)

# tidy 1830 data frame
pop1830 %<>%
  rename(Population = `Population[8]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1830)

# extract the seventh node, which contains the 1840 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[7] %>%
  html_table(fill = TRUE)

# convert 1840 data to a data frame
pop1840 <- do.call(rbind, tablesList)

# tidy 1840 data frame
pop1840 %<>%
  rename(Population = `Population[9]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1840)

# extract the eigth node, which contains the 1840 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[8] %>%
  html_table(fill = TRUE)

# convert 1850 data to a data frame
pop1850 <- do.call(rbind, tablesList)

# tidy 1850 data frame
pop1850 %<>%
  rename(Population = `Population[10]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1850)

# combine data sets
largestCities <- bind_rows(pop1790, pop1800, pop1810, pop1820, pop1830, pop1840, pop1850)

saveRDS(largestCities, "data/largestCities.rds")
