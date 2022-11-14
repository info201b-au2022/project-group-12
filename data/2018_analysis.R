


library("tidyverse")
library("RcppRoll")
library('dplyr')
data_orig <- read.csv('https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv')

data_wa <- data_orig %>%
  filter(state == "Washington")


data <- select(data_orig, -c(10:21)) %>%
  select(-c(27)) %>%

