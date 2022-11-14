elections_2018_data <- read.csv("https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv")
# View(elections_2018_data)

library("tidyverse")

summary_info <- list()

summary_info$avg_white_pct <- elections_2018_data %>%
  summarize(avg_white_pct = round(mean(white_pct, na.rm = T)), 2) %>%
  pull(avg_white_pct)

summary_info$avg_nonwhite_pct <- elections_2018_data %>%
  summarize(avg_nonwhite_pct = round(mean(nonwhite_pct, na.rm = T)), 2) %>%
  pull(avg_nonwhite_pct)

summary_info$max_hh_inc <- elections_2018_data %>%
  group_by(state) %>%
  summarize(avg_hh_inc = round(mean(median_hh_inc, na.rm = T)), 2) %>%
  filter(avg_hh_inc == max(avg_hh_inc)) %>%
  pull(state)

summary_info$avg_female_pct <- elections_2018_data %>%
  summarize(avg_female_pct = round(mean(female_pct, na.rm = T)), 2) %>%
  pull(avg_female_pct)

summary_info$max_young <- elections_2018_data %>%
  group_by(state) %>%
  summarize(avg_young_pct = round(mean(age29andunder_pct, na.rm = T)), 2) %>%
  filter(avg_young_pct == max(avg_young_pct)) %>%
  pull(state)


View(summary_info)

