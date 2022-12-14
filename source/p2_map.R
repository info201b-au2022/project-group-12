ballot_locations <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-group-12/main/data/Voting_Locations_and_Ballot_Boxes.csv")
# View(ballot_locations)

library("tidyverse")
library("ggplot2")

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


# We included this chart because we noticed that in the dataset, the type of ballot
# box was split into two categories: drop boxes and voting centers. Because of this,
# we thought it would be interesting to see what the distribution of drop boxes and
# voting centers across Washington state were like to see if any obvious patterns arise,
# like whether location affects the type of ballot box is near someone.

# After creating this map, something that can be seen quickly is the high number of
# data points near Seattle. Specifically, these data points are red which represent 
# drop boxes. We can learn from this chart that more drop boxes are put in more densely
# populated areas. However, that means that areas with less people have less options
# for where they can return their ballots. This can make it harder for these populations
# to vote and unfairly affect voting rates. Something else we can learn from this map
# is that there's almost one voting center in each county. However, some counties are
# larger than others which means that if someone in a larger county is interested in
# voting in person, they have to go a further distance than a smaller county. This can
# also limit voting rates in these populations.


# Sources I used to help make my code:
# https://jtr13.github.io/cc19/different-ways-of-plotting-u-s-map-in-r.html 
# https://www.geeksforgeeks.org/how-to-color-scatter-plot-points-in-r/ 
# https://stackoverflow.com/questions/2579995/control-the-size-of-points-in-an-r-scatterplot 
# https://www.datanovia.com/en/blog/ggplot-axis-labels/ 
