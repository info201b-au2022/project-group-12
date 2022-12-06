library(dplyr)
library(ggplot2)
library(tidyr)

## Data set
Nov2020_states_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-12/main/data/Reported_Voting_and_Registration_by_Sex_Race_and_Hispanic_Origin_for_States_November_2020.csv")
data.frame(Nov2020_states_data)

## Organize the data
Nov2020_states_data <- Nov2020_states_data %>%
  rename("State" = "Table.with.row.headers.in.columns.A.and.B..and.column.headers.in.rows.5.through.6."
         , "Sex_Race_and_Hispanic_Origin" = "X"
         , "Total_population" = "X.1"
         , "Total_citizen_population" = "X.2"
         , "Total_registered" = "X.3"
         , "Percent_registered..Total." = "X.4"
         , "Margin_of_error_1" = "X.5"
         , "Percent_registered..Citizen." = "X.6"
         , "Margin_of_error_2" = "X.7"
         , "Total_voted" = "X.8"
         , "Percent_voted..Total." = "X.9"
         , "Margin_of_error_3" = "X.10"
         , "Percent_voted..Citizen." = "X.11"
         , "Margin_of_error_4" = "X.12"
  )
Nov2020_states_data <- slice(Nov2020_states_data, -1, -2, -3, -4, -5)

Nov2020_states_data <- Nov2020_states_data %>% 
  select(-c(Margin_of_error_1, Margin_of_error_2, Margin_of_error_3, Margin_of_error_4))

Nov2020_states_data <- Nov2020_states_data[!apply(Nov2020_states_data == "", 1, all),]

Nov2020_states_data[Nov2020_states_data == ""] <- NA

library(tidyverse)

Nov2020_states_data <- Nov2020_states_data %>% 
  fill(State, .direction = "down")

## New data with the total percentage of voted in gender 
gender_total_voted <- Nov2020_states_data %>% 
  filter(grepl('Male|Female', Sex_Race_and_Hispanic_Origin))

gender_total_voted <- gender_total_voted %>%
  rename("Gender" = "Sex_Race_and_Hispanic_Origin")



## Total percentage of Male voted v.s. Total percentage of Female voted
Male_vs_Female <- gender_total_voted %>%
  select(Gender, State, Percent_voted..Total.)

data.frame(Male_vs_Female)

Male_vs_Female$Percent_voted..Total. <- as.numeric(Male_vs_Female$Percent_voted..Total.)
class(Male_vs_Female$Percent_voted..Total.)


## Male voted
male_total_voted <- Nov2020_states_data %>%
  filter(grepl('Male', Sex_Race_and_Hispanic_Origin))

male_total_voted <- male_total_voted %>%
  rename("Male" = "Sex_Race_and_Hispanic_Origin")

Male_voted <- male_total_voted %>%
  select(Male, State, Percent_voted..Total.)

data.frame(Male_voted)

Male_voted$Percent_voted..Total. <- as.numeric(Male_voted$Percent_voted..Total.)
class(Male_voted$Percent_voted..Total.)



## Female voted
female_total_voted <- Nov2020_states_data %>%
  filter(grepl('Female', Sex_Race_and_Hispanic_Origin))

female_total_voted <- female_total_voted %>%
  rename("Female" = "Sex_Race_and_Hispanic_Origin")

Female_voted <- female_total_voted %>%
  select(Female, State, Percent_voted..Total.)

data.frame(Female_voted)

Female_voted$Percent_voted..Total. <- as.numeric(Female_voted$Percent_voted..Total.)
class(Female_voted$Percent_voted..Total.)



## Bar Chart
library(scales)

Male_bar <- ggplot(Male_voted, 
                   aes(x = State, y = Percent_voted..Total./100, 
                       fill = State)) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total./100, fill = State), position = "dodge") +
  facet_grid(Male ~ .) +
  geom_text(aes(label = Percent_voted..Total.), vjust = -0.5, colour = "black", size = 2.2) +
  geom_bar(position = "dodge", stat = "identity") +
  xlab("State") + 
  ylab("Percentage") +
  scale_y_continuous(labels = percent, breaks = seq(0.45, 0.80, by=0.05), 
                     oob = rescale_none, limits = c(0.45, 0.80)) +
  labs(title = "Percentage of Male voted vs Percentage of Female voted") +
  coord_fixed(ratio = 50) +
  theme(plot.title = element_text(hjust = 0.3)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
# Male_bar

Female_bar <- ggplot(Female_voted, 
                     aes(x = State, y = Percent_voted..Total./100, 
                         fill = State)) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total./100, fill = State), position = "dodge") +
  facet_grid(Female ~ .) +
  geom_text(aes(label = Percent_voted..Total.), vjust = -0.5, colour = "black", size = 2.2) +
  geom_bar(position = "dodge", stat = "identity") +
  xlab("State") + 
  ylab("Percentage") +
  scale_y_continuous(labels = percent, breaks = seq(0.45, 0.80, by=0.05), 
                     oob = rescale_none, limits = c(0.45, 0.80)) +
  labs(title = "Percentage of Male voted vs Percentage of Female voted") +
  coord_fixed(ratio = 50) +
  theme(plot.title = element_text(hjust = 0.3)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
# Female_bar

MF_bar <- ggplot(Male_vs_Female, 
                 aes(x = State, y = Percent_voted..Total./100, 
                     fill = State)) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total./100, fill = State), position = "dodge") +
  facet_grid(Gender ~ .) +
  geom_text(aes(label = Percent_voted..Total.), vjust = -0.5, colour = "black", size = 2.2) +
  geom_bar(position = "dodge", stat = "identity") +
  xlab("State") + 
  ylab("Percentage") +
  scale_y_continuous(labels = percent, breaks = seq(0.45, 0.80, by=0.05), 
                     oob = rescale_none, limits = c(0.45, 0.80)) +
  labs(title = "Percentage of Male voted vs Percentage of Female voted") +
  coord_fixed(ratio = 50) +
  theme(plot.title = element_text(hjust = 0.3)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
# MF_bar


# __________________________
# New graph idea

#male and female
both <- data.frame(Male_vs_Female)
# View(both) 

sorted_data <- function(states) {
  states_data <- both %>% 
    filter(State %in% states) %>%
    return(states_data)   
}
both_table <- sorted_data(c("WASHINGTON", "CALIFORNIA", "DISTRICT OF COLUMBIA", "ARKANSAS", "US", "NEW YORK"))
# View(both_table)

both_chart<- ggplot(data = both_table) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total., fill = Gender),
           position = "dodge") +
  labs(
    title = "Percentage of Male Voted vs. Percentage of Female Voted", 
    x = "State", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
both_chart
both_graph <- ggplotly(both_chart)
both_graph



#male
male <- data.frame(Male_df)
# View(male) 

sorted_male_data <- function(states) {
  male_data <- male %>% 
    filter(State %in% states) %>%
    return(male_data)   
}
male_table <- sorted_male_data(c("WASHINGTON", "CALIFORNIA", "DISTRICT OF COLUMBIA", "ARKANSAS", "US", "NEW YORK"))
View(male_table)

male_chart<- ggplot(data = male_table) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total.),
           position = "dodge") +
  labs(
    title = "Percentage of Male Voted", 
    x = "State", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
male_chart
male_graph <- ggplotly(male_chart)
male_graph



#female
female <- data.frame(Female_df)
# View(female) 

sorted_female_data <- function(states) {
  female_data <- female %>% 
    filter(State %in% states) %>%
    return(female_data)   
}
female_table <- sorted_female_data(c("WASHINGTON", "CALIFORNIA", "DISTRICT OF COLUMBIA", "ARKANSAS", "US", "NEW YORK"))
# View(female_table)

female_chart<- ggplot(data = female_table) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total.,),
           position = "dodge") +
  labs(
    title = "Percentage of Female Voted", 
    x = "State", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
female_chart
female_graph <- ggplotly(female_chart)
female_graph




