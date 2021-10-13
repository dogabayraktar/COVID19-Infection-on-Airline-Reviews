# loading the data from the data folder and observing it
# We use read_csv2 from tidyverse as they use ";" as a separator and do not alter variable names
# We also transform the 'n/a' to NA so that they are accurately depicted in R
library(tidyverse)
KLM_data <- read_csv2('../../data/klm-royal-dutch-airlines_data_12-10-21.csv', na = 'n/a')

View(KLM_data)
glimpse(KLM_data)

# subsetting the data pre_covid (Date Flown = 2019) and post covid (Date Flown is 2020 or 2021)
library(stringr)
pre_covid <- subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2018|2019') == TRUE)
post_covid <- subset(KLM_data, str_detect(KLM_data$`Date Flown`, '2020|2021') == TRUE) 

# average review rating pre and post covid
average_rating_pre_covid <- mean(pre_covid$`Review Rating`)
average_rating_post_covid <- mean(post_covid$`Review Rating`)

average_rating_post_covid-average_rating_pre_covid

# Thus, the review ratings for KLM seem to have dropped by 1.4 after COVID-19