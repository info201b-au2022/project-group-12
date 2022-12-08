# tab_panel_summary

library(shiny)
# library(plotly)

filler <- "this is filler text"

p1 <- "We were able to select specific elements from the chosen datasets and wrangle the 
data to gather information about who votes, and who they vote for. Some major findings are as follows. "

p2 <- "The following table shows summary information about different demoraphic groups across all 
50 states, and how they voted for Trump in the 2016 election. All values are in percentages except for income."

p3 <- "By mapping out the locations of voting centers and drop boxes, it became noticable that physical locations
for voting become increasingly sparse the further you go from the urban areas of Washington state. This highlights the issue
of accessibility; a voter's ability to cast a ballot should not be limited by the availability of physical voting locations nearby."

p4 <- "To visualize the turnout of different genders in the 2020 election, we chose a select few states (Washington, 
California, Washington D.C., Arkansas, & New York) and compared their turnouts to the turnout of the country as a whole. In all observed
cases, a slightly higher percentage of women voted than men. In future analysis, it would be interesting to investigate what issues in particular 
motivated a higher percentage of women to vote."

p5 <- "In our last chart, we plotted the median household income of all counties with available data, in relation to what percentage of the county's
voters voted for Trump in 2016. The scatterplot depicted an overwhelming trend: in counties with the highest percentage of votes for Trump, the median household
income tended to cluster around $40k to $50k. For reference, the median household income across the nation as a whole was $59k in 2016, according to the U.S. Census.
Further analysis can be done to determine what political issues motivated this economic range of Americans to cast their vote for Trump."

tab_panel_summary <-tabPanel(
    "Summary",
    hr(),
    fluidPage(
      h2("Summary & Key Takeaways"),
      p(p1),
      hr(),
      h3("2016 Election Demographics"),
      p(p2),
      tableOutput("summary"),
      hr(),
      h3("Mapping Voting Locations"),
      p(p3),
      hr(),
      h3("Gender Analysis"),
      p(p4),
      hr(),
      h3("Income Analysis"),
      p(p5)
      
    )
)

