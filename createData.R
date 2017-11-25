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

# extract the eigth node, which contains the 1850 data
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

# extract the 9th node, which contains the 1860 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[9] %>%
  html_table(fill = TRUE)

# convert 1860 data to a data frame
pop1860 <- do.call(rbind, tablesList)

# tidy 1860 data frame
pop1860 %<>%
  rename(Population = `Population[11]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1860)

# extract the 10th node, which contains the 1870 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[10] %>%
  html_table(fill = TRUE)

# convert 1870 data to a data frame
pop1870 <- do.call(rbind, tablesList)

# tidy 1870 data frame
pop1870 %<>%
  rename(Population = `Population[12]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1870)

# extract the 11th node, which contains the 1880 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[11] %>%
  html_table(fill = TRUE)

# convert 1880 data to a data frame
pop1880 <- do.call(rbind, tablesList)

# tidy 1880 data frame
pop1880 %<>%
  rename(Population = `Population[13]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1880)

# extract the 12th node, which contains the 1890 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[12] %>%
  html_table(fill = TRUE)

# convert 1890 data to a data frame
pop1890 <- do.call(rbind, tablesList)

# tidy 1890 data frame
pop1890 %<>%
  rename(Population = `Population[15]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1890)

# extract the 13th node, which contains the 1900 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[13] %>%
  html_table(fill = TRUE)

# convert 1900 data to a data frame
pop1900 <- do.call(rbind, tablesList)

# tidy 1900 data frame
pop1900 %<>%
  rename(Population = `Population[16]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1900)

# extract the 14th node, which contains the 1910 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[14] %>%
  html_table(fill = TRUE)

# convert 1910 data to a data frame
pop1910 <- do.call(rbind, tablesList)

# tidy 1910 data frame
pop1910 %<>%
  rename(Population = `Population[17]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1910)

# extract the 15th node, which contains the 1920 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[15] %>%
  html_table(fill = TRUE)

# convert 1920 data to a data frame
pop1920 <- do.call(rbind, tablesList)

# tidy 1920 data frame
pop1920 %<>%
  rename(Population = `Population[18]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1920)

# extract the 16th node, which contains the 1930 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[16] %>%
  html_table(fill = TRUE)

# convert 1930 data to a data frame
pop1930 <- do.call(rbind, tablesList)

# tidy 1930 data frame
pop1930 %<>%
  rename(Population = `Population[19]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1930)

# extract the 17th node, which contains the 1940 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[17] %>%
  html_table(fill = TRUE)

# convert 1940 data to a data frame
pop1940 <- do.call(rbind, tablesList)

# tidy 1940 data frame
pop1940 %<>%
  rename(Population = `Population[20]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1940)

# extract the 18th node, which contains the 1950 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[18] %>%
  html_table(fill = TRUE)

# convert 1950 data to a data frame
pop1950 <- do.call(rbind, tablesList)

# tidy 1950 data frame
pop1950 %<>%
  rename(Population = `Population[21]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1950)

# extract the 19th node, which contains the 1960 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[19] %>%
  html_table(fill = TRUE)

# convert 1960 data to a data frame
pop1960 <- do.call(rbind, tablesList)

# tidy 1960 data frame
pop1960 %<>%
  rename(Population = `Population[22]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1960)

# extract the 20th node, which contains the 1970 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[20] %>%
  html_table(fill = TRUE)

# convert 1970 data to a data frame
pop1970 <- do.call(rbind, tablesList)

# tidy 1970 data frame
pop1970 %<>%
  rename(Population = `Population[23]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1970)

# extract the 21st node, which contains the 1980 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[21] %>%
  html_table(fill = TRUE)

# convert 1980 data to a data frame
pop1980 <- do.call(rbind, tablesList)

# tidy 1980 data frame
pop1980 %<>%
  rename(Population = `Population[24]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1980)

# extract the 22nd node, which contains the 1990 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[22] %>%
  html_table(fill = TRUE)

# convert 1990 data to a data frame
pop1990 <- do.call(rbind, tablesList)

# tidy 1990 data frame
pop1990 %<>%
  rename(Population = `Population[25]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 1990)

# extract the 23rd node, which contains the 2000 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[23] %>%
  html_table(fill = TRUE)

# convert 2000 data to a data frame
pop2000 <- do.call(rbind, tablesList)

# tidy 2000 data frame
pop2000 %<>%
  rename(Population = `Population[26]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 2000)

# extract the 24th node, which contains the 2010 data
tablesList <- webpage %>%
  html_nodes("table") %>%
  .[24] %>%
  html_table(fill = TRUE)

# convert 2010 data to a data frame
pop2010 <- do.call(rbind, tablesList)

# tidy 2010 data frame
pop2010 %<>%
  rename(Population = `Population[3]`) %>%
  mutate(Population = as.numeric(gsub(",", "", Population))) %>%
  select(-Notes) %>%
  mutate(Year = 2010)

# combine data sets
largestCities <- bind_rows(pop1790, pop1800, pop1810, pop1820, pop1830, pop1840, pop1850,
                           pop1860, pop1870, pop1880, pop1890, pop1900, pop1910, pop1920,
                           pop1930, pop1940, pop1950, pop1960, pop1970, pop1980, pop1990,
                           pop2000, pop2010)

saveRDS(largestCities, "data/largestCities.rds")
