# tab_panel_chart3

library(shiny)
library(plotly)
tab_panel_chart3 <-tabPanel(
  "Chart 3",
  hr(),
  fluidPage(
    h2("Median Household Income and Trump Votes in USA"),
    hr(),
  ),
  fluidRow(
    column(12,
           #Create a select box
           selectInput(
             "State", 
             label = "Choose a location", 
             choices = list("USA", "Arkansas", "California", "Kentucky", "New York", "Virginia", "Washington"),
             selected = "USA"
             
           )),
    
    hr(),
    
  ),
  fluidPage(
    plotlyOutput("scatter"),
    
    hr(),
    
  ),
  fluidPage(
    h3("Purpose"),
    p("We included this chart because as per our research question, we want to analyze how household income 
    correlates with the type of candidate they vote for. We want to observe if there are, or aren't,
    any trends along all the counties in America. With this chart, we can choose a state and 
    clearly observe all the counties in that state and their voting patterns based on their 
    median household income. We decided for our graph to focus on locations from different regions
      of the United States to get a more clear visualization and see how they differ so
      we only selected a few states from different regions to look at separately."),
    h3("Observations"),
    p("After creating this chart, something that can be seen quickly is the high number of 
    voters at a median household income of between $40,000 - $50,000 a year. Most of these populations had a higher percentage of votes for Trump.
    Further, households with higher incomes tended to have a smaller percentage of votes go to Trump. This pattern
    occurred in almost all states. "))
)