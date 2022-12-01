# tab_panel_chart1

library(shiny)

tab_panel_chart1 <-tabPanel(
  "Chart 1",
  hr(),
  fluidRow(
    column(12,
           
           # Copy the line below to make a set of radio buttons
           radioButtons(inputId = "map_points", label = h3("Plot:"),
                        choices = list("Drop Box and Voting Center", "Drop Box", "Voting Center"),
                        selected = "Drop Box and Voting Center")),
    
    hr(),
    
  ),
  fluidPage(
    plotlyOutput("the_map"),
    
    hr(),
    
  ),
  fluidPage(
    h3("Purpose"),
    p("We included this chart because we noticed that in the dataset, the type of ballot
box was split into two categories: drop boxes and voting centers. Because of this,
we thought it would be interesting to see what the distribution of drop boxes and
voting centers across Washington state were like to see if any obvious patterns arise,
like whether location affects the type of ballot box is near someone."),
    h3("Observations"),
    p("After creating this map, something that can be seen quickly is the high number of
data points near Seattle. Specifically, these data points are red which represent 
drop boxes. We can learn from this chart that more drop boxes are put in more densely
populated areas. However, that means that areas with less people have less options
for where they can return their ballots. This can make it harder for these populations
to vote and unfairly affect voting rates. Something else we can learn from this map
is that there's almost one voting center in each county. However, some counties are
larger than others which means that if someone in a larger county is interested in
voting in person, they have to go a further distance than a smaller county. This can
also limit voting rates in these populations."))
)

