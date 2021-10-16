### loading the data from the data folder and observing it
## We use read_csv2 from tidyverse as they use ";" as a separator and do not alter variable names
# We also transform the 'n/a' to NA so that they are accurately depicted in R
library(tidyverse)
library(dplyr)
KLM_data <- read_csv2('../../data/klm-royal-dutch-airlines_data_14-10-21.csv', na = 'n/a')

View(KLM_data)

# 1230 rows mean we found 1230 reviews
glimpse(KLM_data)

# Unique writers, 1092 rows which mean 1092 unique writers
count(KLM_data, KLM_data$`Review Writer`)

# Date flown
flown_2021 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2021') == TRUE))
flown_2020 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2020') == TRUE))
flown_2019 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2019') == TRUE))
flown_2018 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2018') == TRUE))
flown_2017 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2017') == TRUE))
flown_2016 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2016') == TRUE))
flown_2015 <- nrow(subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2015') == TRUE))
flown_NA <- nrow(KLM_data) - (flown_2021+flown_2020+flown_2019+flown_2018+flown_2017+flown_2016+flown_2015)

# country frequency
country <- KLM_data %>% 
  count(Country, sort = TRUE)

country_frequency <- country %>% mutate(country_percentage = n/sum(country$n))
country_frequency

# subsetting the data pre_covid (Date Flown = 2018|2020) and post covid (Date Flown is 2020|2021)
pre_covid <- subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2018|2019') == TRUE)
post_covid <- subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2020|2021') == TRUE) 

# average review rating pre and post covid
average_rating_pre_covid <- mean(pre_covid$`Review Rating`)
average_rating_post_covid <- mean(post_covid$`Review Rating`)

average_rating_post_covid-average_rating_pre_covid

# Thus, the review ratings for KLM seem to have dropped by around 1.5 after COVID-19