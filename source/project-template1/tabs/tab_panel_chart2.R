# tab_panel_chart2

library(shiny)

tab_panel_chart2 <-tabPanel(
  "Chart 2",
  hr(),
  fluidPage(
    h2("Percentage of Male Voted vs Percentage of Female Voted"),
    hr()
  ),
  fluidRow(
    column(12,
           
           #Create a select box
           selectInput(
             "Gender", 
             label = "Choose a gender", 
             choices = c("Male and Female", "Male", "Female")
           )),
    hr(),
  ),
  fluidPage(
    plotlyOutput("bar_chart"),
    hr(),
  ),
  fluidPage(
    h3("Purpose"),
    p("The purpose of this chart is to compare the percentage of votes between gender in the United States in November 2020. 
      The distribution of this data set is into many different categories, such as gender, race, Hispanic origin, total percentage of registration, 
      total percentage of votes, and more. For that reason, we thought it would be interesting to make a distribution in a bar chart that shows 
      the comparison of votes in gender by the state in the United States."),
    h3("Observations"),
    p("Through this chart, we can determine the gender participation in voting by states in the United States. 
    For example, we can notice that the District of Columbia had the highest voting participation, and the females voted more, 
    with 79.5%, while 75.7% of males voted. Also, we can observe that Arkansas had the lowest participation, and the females voted more, 
    with 54.1% and 49.6% of males voting. Overall, females have participated more than males in voting. ")
  )
)