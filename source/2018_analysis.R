
library("tidyverse")
library("RcppRoll")
library("knitr")

data_orig <- read.csv('https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv')

data_wa <- data_orig %>%
  filter(state == "Washington")


data <- select(data_orig, -c(10:21)) %>%
  select(-c(27))

pres_16 <- data %>% 
  select(state, county, trump16, clinton16, otherpres16,
                            cvap, white_pct, nonwhite_pct, foreignborn_pct,
                            female_pct, age29andunder_pct, age65andolder_pct,
                            median_hh_inc, rural_pct) %>%
  filter(state == "Washington")


total <- pres_16$trump16 + pres_16$clinton16 + pres_16$otherpres16

pct_trump <- round((pres_16$trump16 / total) * 100, 2)

pct_clinton <- round((pres_16$clinton16 / total) * 100, 2)

pct_other <- round((pres_16$otherpres16 / total) * 100, 2)


pres_16 <- transmute(pres_16, County = pres_16$county, Trump = pct_trump,
                     Clinton = pct_clinton, Other = pct_other,
                     Non_Hispanic_Whites = pres_16$white_pct,
                     Non_White = pres_16$nonwhite_pct,
                     Foreign_born = pres_16$foreignborn_pct,
                     Female = pres_16$female_pct,
                     Under_29 = pres_16$age29andunder_pct,
                     Over_65 = pres_16$age65andolder_pct,
                     Median_Income = pres_16$median_hh_inc,
                     Rural = pres_16$rural_pct)




View(pres_16)
