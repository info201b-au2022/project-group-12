
library("tidyverse")
library("RcppRoll")
library("knitr")

data_orig <- read.csv('https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv')

View(data_orig)


data <- select(data_orig, -c(10:21)) %>%
  select(-c(27))

data <- na.omit(data)

total <- data$trump16 + data$clinton16 + data$otherpres16

pct_trump <- round((data$trump16 / total) * 100, 2)

pct_clinton <- round((data$clinton16 / total) * 100, 2)

pct_other <- round((data$otherpres16 / total) * 100, 2)

pres_16 <- transmute(data, State = data$state,
                     County = data$county, Trump = pct_trump,
                     Clinton = pct_clinton, Other = pct_other,
                     White = data$white_pct,
                    Non_White = data$nonwhite_pct,
                     Foreign_born = data$foreignborn_pct,
                     Female = data$female_pct,
                     Under_29 = data$age29andunder_pct,
                     Over_65 = data$age65andolder_pct,
                     Median_Income = data$median_hh_inc,
                     Rural = data$rural_pct) 

pres_16_table <- pres_16 %>%
  group_by(State) %>%
  summarize(
    Trump = round(mean(Trump), 1),
    Clinton = round(mean(Clinton), 1),
    White = round(mean(White), 1),
    NonWhite = round(mean(Non_White), 1),
    Foreign_Born = round(mean(Foreign_born), 1),
    Female = round(mean(Female), 1),
    Under_29 = round(mean(Under_29), 1),
    Median_Income = round(mean(Median_Income), 1),
    Rural = round(mean(Rural), 1)
  )

View(pres_16_table)
