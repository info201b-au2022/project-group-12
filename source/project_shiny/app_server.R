#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(scales)
library(dplyr)
library(maps)
library(mapproj)


#------------------- Introduction Page -----------------------------




#------------------ Interactive Page 1: Map -------------------
ballot_locations <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-12/main/data/Voting_Locations_and_Ballot_Boxes.csv")
# View(ballot_locations)

state <- map_data("state")
washington <- subset(state, region == "washington")
counties <- map_data("county")
washington_county <- subset(counties, region == "washington")

filtered_counties <- data.frame(
  county = ballot_locations$County, type = ballot_locations$Type, lat = ballot_locations$Lat, long = ballot_locations$Long
)
# View(filtered_counties)

drop_only <- filtered_counties %>%
  filter(type == "Drop Box")

center_only <- filtered_counties %>%
  filter(type == "Voting Center")

overall_drop <- ggplot(washington) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) + 
  geom_point(
    data = drop_only, 
    mapping = aes(x = long, y = lat, color = type),
  )+
  labs(title = "Voting Locations and Type", x = "", y = "", color = "Type") +
  coord_map()

complete_drop <- overall_drop +
  geom_polygon(data = washington_county, mapping = aes(x = long, y = lat, group=group), fill = NA, color = "white") +
  geom_polygon(fill = NA, mapping = aes(x = long, y = lat)) +
  scale_color_manual(values = c("purple"))
# complete_drop

overall_center <- ggplot(washington) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) + 
  geom_point(
    data = center_only, 
    mapping = aes(x = long, y = lat, color = type),
  )+
  labs(title = "Voting Locations and Type", x = "", y = "", color = "Type") +
  coord_map()

complete_center <- overall_center +
  geom_polygon(data = washington_county, mapping = aes(x = long, y = lat, group=group), fill = NA, color = "white") +
  geom_polygon(fill = NA, mapping = aes(x = long, y = lat)) +
  scale_color_manual(values = c("yellow"))
# complete_center

overall_map <- ggplot(washington) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) + 
  geom_point(
    data = filtered_counties, 
    mapping = aes(x = long, y = lat, color = type),
  )+
  labs(title = "Voting Locations and Type", x = "", y = "", color = "Type") +
  coord_map()
# overall_map

complete_map <- overall_map +
  geom_polygon(data = washington_county, mapping = aes(x = long, y = lat, group=group), fill = NA, color = "white") +
  geom_polygon(fill = NA, mapping = aes(x = long, y = lat)) +
  scale_color_manual(values = c("purple", "yellow"))
# complete_map

#------------------ Interactive Page 2: Bar chart -------------------

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






Male_vs_Female$Percent_voted..Total. <- as.numeric(Male_vs_Female$Percent_voted..Total.)
(class(Male_vs_Female$Percent_voted..Total.))


## Male voted
male_total_voted <- Nov2020_states_data %>%
  filter(grepl('Male', Sex_Race_and_Hispanic_Origin))

male_total_voted <- male_total_voted %>%
  rename("Male" = "Sex_Race_and_Hispanic_Origin")

Male_voted <- male_total_voted %>%
  select(Male, State, Percent_voted..Total.)

Male_df <- data.frame(Male_voted)
Male_df

Male_voted$Percent_voted..Total. <- as.numeric(Male_voted$Percent_voted..Total.)
class(Male_voted$Percent_voted..Total.)



## Female voted
female_total_voted <- Nov2020_states_data %>%
  filter(grepl('Female', Sex_Race_and_Hispanic_Origin))

female_total_voted <- female_total_voted %>%
  rename("Female" = "Sex_Race_and_Hispanic_Origin")

Female_voted <- female_total_voted %>%
  select(Female, State, Percent_voted..Total.)

Female_df <- data.frame(Female_voted)
Female_df

Female_voted$Percent_voted..Total. <- as.numeric(Female_voted$Percent_voted..Total.)
class(Female_voted$Percent_voted..Total.)




#male and female graph
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
    x = "Location", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
both_chart
both_graph <- ggplotly(both_chart)
both_graph


#male graph
male <- data.frame(Male_df)
# View(male) 

sorted_male_data <- function(states) {
  male_data <- male %>% 
    filter(State %in% states) %>%
    return(male_data)   
}
male_table <- sorted_male_data(c("WASHINGTON", "CALIFORNIA", "DISTRICT OF COLUMBIA", "ARKANSAS", "US", "NEW YORK"))
# View(male_table)

male_chart<- ggplot(data = male_table) +
  geom_col(mapping = aes(x = State, y = Percent_voted..Total., fill = Male),
           position = "dodge") +
  scale_fill_manual(values = c("Male" = "#00BFC4"))+
  labs(
    title = "Percentage of Male Voted", 
    x = "Location", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(legend.position = "none")
male_chart
male_graph <- ggplotly(male_chart)
male_graph



#female graph
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
  geom_col(mapping = aes(x = State, y = Percent_voted..Total., fill = Female),
           position = "dodge") +
  scale_fill_manual(values = c("Female" = "#F8766D"))+
  labs(
    title = "Percentage of Female Voted", 
    x = "Location", 
    y = "Percentage" 
  ) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(legend.position = "none")
female_chart
female_graph <- ggplotly(female_chart)
female_graph


#--------------------Interactive Page 3 Scatterplot ------------------
library(tidyverse)
library(ggplot2)
dataframe <- read.csv("https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv")
# View(dataframe)



df_trumppercent<- mutate(
  dataframe,
  trump_percent = (trump16 / (trump16 + clinton16 + otherpres16)) *100 
)
# View(df_trumppercent)

ark <- df_trumppercent %>%
  filter(state == "Arkansas")

cali <- df_trumppercent %>%
  filter(state == "California")

vir <- df_trumppercent %>%
  filter(state == "Virginia")

ny <- df_trumppercent %>%
  filter(state == "New York")

wash <- df_trumppercent %>%
  filter(state == "Washington")

ken <- df_trumppercent %>%
  filter(state == "Kentucky")

scatter1<- ggplot(data = df_trumppercent) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income (in dollars)", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_x_continuous(labels = scales::comma)

cali_graph <- ggplot(data = cali) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income (in dollars)", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("orange")) +
  scale_x_continuous(labels = scales::comma)

vir_graph <- ggplot(data = vir) +
  geom_point (
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes",
      x = "Median Household Income (in dollars)",
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("#FF61CC")) +
  scale_x_continuous(labels = scales::comma)

ny_graph <- ggplot(data = ny) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income (in dollars)", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("#00A9FF")) +
  scale_x_continuous(labels = scales::comma)

wash_graph <- ggplot(data = wash) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income (in dollars)", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("#F564E3")) +
  scale_x_continuous(labels = scales::comma)

ark_graph <- ggplot(data = ark) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("dark orange")) +
  scale_x_continuous(labels = scales::comma)

ken_graph <- ggplot(data = ken) +
  geom_point ( 
    mapping = aes( x= median_hh_inc, y = trump_percent, color = state
    )) + labs(
      title = "Median Household Income and Trump Votes", 
      x = "Median Household Income", 
      y = "Percentage of Votes for Trump in Each County",
      color = "State"
    ) +
  scale_color_manual(values = c("#00BA38")) +
  scale_x_continuous(labels = scales::comma)


#------------------Summary Table---------------------------
library("tidyverse")
library("RcppRoll")
library("knitr")

data_orig <- read.csv('https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv')



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

pres_16 <- pres_16 %>%
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


trump <- pres_16 %>% 
  filter(Trump >= 50) %>%
  summarize(
    "Candidate" = "Trump",
    "White" = round(mean(White), 2),
    "Non-White" = round(mean(NonWhite), 2),
    "Foreign-Born" = round(mean(Foreign_Born), 2),
    "Female" = round(mean(Female), 2),
    "Young (Under 29)" = round(mean(Under_29), 2),
    "Median Income" = round(mean(Median_Income), 0),
    "Rural" = round(mean(Rural), 2)
  )

clinton <- pres_16 %>% 
  filter(Clinton >= 50) %>%
  summarize(
    "Candidate" = "Clinton",
    "White" = round(mean(White), 2),
    "Non-White" = round(mean(NonWhite), 2),
    "Foreign-Born" = round(mean(Foreign_Born), 2),
    "Female" = round(mean(Female), 2),
    "Young (Under 29)" = round(mean(Under_29), 2),
    "Median Income" = round(mean(Median_Income), 0),
    "Rural" = round(mean(Rural), 2)
  )


summary_table <- rbind(trump, clinton)

# View(summary_table)

#------------------- Server -----------------------------


server <- function(input, output) {
  
  output$summary <- renderTable(summary_table)
  
  output$the_map <- renderPlotly({
    if (input$map_points == "Drop Box and Voting Center") {
      complete_map
    }
    else if (input$map_points == "Drop Box Only") {
      complete_drop
    }
    else if (input$map_points == "Voting Center Only") {
      complete_center
    }
  })
  
  output$bar_chart <- renderPlotly({
    if (input$Gender == "Male and Female") {
      both_graph
    }
    else if (input$Gender == "Male") {
      male_graph
    }
    else if (input$Gender == "Female") {
      female_graph
    }
  })
  
  output$scatter<- renderPlotly({
    if (input$State == "USA") {
      scatter1
    }
    else if (input$State == "Washington") {
      wash_graph
    }
    else if (input$State == "Arkansas") {
      ark_graph
    }
    else if (input$State == "California") {
      cali_graph
    }
    else if (input$State == "New York") {
      ny_graph
    }
    else if (input$State == "Virginia") {
      vir_graph
    }
    else if (input$State == "Kentucky") {
      ken_graph
    }
  })
  
}






