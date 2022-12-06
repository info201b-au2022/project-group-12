#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("tidyverse")
library("ggplot2")


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
  labs(title = "Voting Locations and Type", x = "Longitude", y = "Latitude", color = "Type") +
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
  labs(title = "Voting Locations and Type", x = "Longitude", y = "Latitude", color = "Type") +
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
  labs(title = "Voting Locations and Type", x = "Longitude", y = "Latitude", color = "Type") +
  coord_map()
# overall_map

complete_map <- overall_map +
  geom_polygon(data = washington_county, mapping = aes(x = long, y = lat, group=group), fill = NA, color = "white") +
  geom_polygon(fill = NA, mapping = aes(x = long, y = lat)) +
  scale_color_manual(values = c("purple", "yellow"))
# complete_map


#------------------- Server -----------------------------


server <- function(input, output) {
  
  output$img1 <- renderImage({
    file <- normalizePath(file.path("./www/vote1.jpg"))
    list(src = file)}, deleteFile = FALSE)
  
  output$the_map <- renderPlotly({
    if (input$map_points == "Drop Box and Voting Center") {
      complete_map
    }
    else if (input$map_points == "Drop Box") {
      complete_drop
    }
    else if (input$map_points == "Voting Center") {
      complete_center
    }
  })
  
}


#------------------ Interactive Page 2: Bar chart -------------------

source('./source/Nov2020_Bar.R')
Nov2020_states_data <- read.csv('./data/Reported_Voting_and_Registration_by_Sex_Race_and_Hispanic_Origin_for_States_November_2020.csv', stringsAsFactors = FALSE)

#------------------- Server -----------------------------

server <- function(input, output) {
  
  output$bar_chart <- renderPlotly({
    return(Nov2020_Bar(MF_bar, input$Gender))
  })
}