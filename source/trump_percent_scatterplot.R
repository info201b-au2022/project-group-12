library(tidyverse)
library(ggplot2)
dataframe <- read.csv("https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv")
View(dataframe)



df_trumppercent<- mutate(
  dataframe,
  trump_percent = (trump16 / (trump16 + clinton16 + otherpres16)) *100 
)
View(df_trumppercent)



p<- ggplot(data = df_trumppercent) +
  geom_point(
    mapping = aes(
    x = median_hh_inc,
    y = trump_percent,
    color = state
    ) 
     )
p + labs(
  title = "Correlation Between Median Household Income and Trump Votes", 
  x = "Median Household Income", 
  y = "Percentage of Votes for Trump in Each County")


#Descriptive paragraph
#- Includes purpose (why it's included)
#- Includes insights (what information is revealed)

# We included this chart because as per our research question, we want to analyze
# how household income correlates with the type of candidate they vote for. We 
# want to observe if there are, or aren't, any trends along all the counties in 
# America, which is what made this dataset perfect as it has the statistics and data
# of each county and state, and the number of votes in each county for each candidate. 
# This information can not only help with predicting voting trends, but understanding 
# the finanical setting of individuals and how it infleunces their voting decisions.
# This graph revealed a trend between house hold income and the percentage of people
# that would vote for Trump in the Presidential Election. In almost all counties in America, 
# The largest cluster of votes for Trump were individuals with a median household income 
# of between 40,000 - 50,000 dollars a year. This reveals that people in lower social economic
# statuses tended to vote for Trump. 