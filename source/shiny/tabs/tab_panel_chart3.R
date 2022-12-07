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
             inputId = 'state_chosen', 
             label = "Choose a State", 
             choices = list("USA", "Alabama", "Arizona", "Arkanasas", "California", "Colorado", "Connecticut", "Delaware", 
                         "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
                         "Kansas","Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
                         "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
                         "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
                         "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia",
                         "Wisconsin", "Wyoming"),
             selected = TRUE
                         
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
    median household income"),
    p("After creating this map, something that can be seen quickly is the high number of 
    voters at a median household income of between 40,000 - 50,000 dollars a year. This pattern
    occurred in almost all states."))
)