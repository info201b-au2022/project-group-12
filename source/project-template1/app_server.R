#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output) {
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


