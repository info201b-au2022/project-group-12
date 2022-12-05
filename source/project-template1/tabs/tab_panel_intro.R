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



tab_panel_intro <- tabPanel(
    "Introduction",
    h1("Project Introduction"),
    p(p1),
    p(p2),
    imageOutput("img1"),
    p(p3)
)
