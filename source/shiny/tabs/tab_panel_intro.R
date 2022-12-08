# tab_panel_intro

library(shiny)

p1 <- "This report aims to analyze voting demographics and outcomes across Washington State, as well
as across the nation as a whole. We will examine the relationships between variables including household income, 
ethnicity, gender, and location, and how they factor into election results."

p2 <- "When it comes to participating in the democratic process guaranteed to us
by the Constitution, there still remain considerable barriers to voting that prevent elections from being
a completely accurate representation of a nation/state's demography. Some historical examples of barriers
were legal restrictions based on age, gender, or race, and poll taxes."

p3 <- "Despite the fact that these legal barriers have since been outlawed by the passage
of laws such as the Voting Rights Act of 1965 and the 26th Amendment, many other barriers
still exist and disenfranchise certain groups, particularly voters of color, voters in poverty, voters 
of language minorities, and many more. The goal of this data analysis is to take a look at voting outcomes,
identify groups of people who may be underrepresented in our current democratic process, and ideate methods
to generate a more equitable democracy." 

p4 <- "The data that we use in this report come from a number of places. We refer to the U.S. Census,
the MIT Election Lab, and the Washington Geospatial Open Data Portal. The datasets contain information about the 
2018 and 2020 elections, as well as information about locations across WA state where voters can cast their ballots. 
Within this report, we wrangle the data to visualize and report insights about who is voting, and who isn't."

p5 <- "- How do voting rates between sexes differ between each state?"
p6 <- "- How does someone’s household income correlate with the type of candidate that is voted for?"
p7 <- "- How does location affect the type of way someone votes or returns their ballot?"
p8 <- "In this report, we are going to try to answer these questions:"

p9 <- "From this report, we learned that voting rates aren't too different between each state and how 
overall participation does vary from state to state. We also found that populations with lower household incomes
tend to vote for candidates who have the economy as their main agenda, showing that financial
security tends to be the most important issue over others for these populations. And finally,
we learned that location can affect how someone returns their ballot or votes in person
because the spread of voting centers and drop boxes are not consistent."

tab_panel_intro <- tabPanel(
  "Introduction",
  h1("Project Introduction"),
  hr(),
  p(p1),
  p(p2),
  p(p3),
  h3("Questions"),
  p(p8),
  p(p5),
  p(p6),
  p(p7),
  h3("Data"),
  p(p4),
  h3("Key Findings"),
  p(p9),
  imageOutput("img1")
)
