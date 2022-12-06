# Voting Frequencies and Democratic Equity

## Code Name
Seattle Vote

## Authors
- Naiyyra Abdel Aziz, naiyyraa@uw.edu
- Elizabeth Deng, elideng@uw.edu
- Sukhman Dhillon, skd26@uw.edu
- Judy Lee, seylee@uw.edu

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date
Autumn 2022

## Abstract
Our main question is “How does the gender, economics, and social status of each household affect voting rates across the United States?” This question is important because it allows us to see how democracy and votes are affected by demographics and socioeconomic status. To address the question, we will research, collect, and analyze the data for elections from 2020, 2018, and 2016 and make comparisons between the states for better understanding.  

## Keywords
- Frequency of Voting
- Demographics
- Barriers
- Gender
- Income

## Introduction
In the United States, the voting results and how people are involved in the process of voting all differ based on race, Hispanic origin, sex, age, or socioeconomic status. Our project is to demonstrate and visualize what the differences in registration as well as voting are by looking at the data provided. Between these different variables, we will also be comparing how they differ between the states of the United States of America by looking at the results from the elections in 2020, 2018, and 2016. We will mainly focus on how household income, race, location, and sex affects voting rates between the states. Also, we will address the value of human well-being and the reality of the voting system in America to see what aspects of the current voting system need to be changed. This data science will allow us to teach about the socioeconomic status influencing voting behavior in the United States.

## Problem Domain
### I. Topic & Sociotechnical Setting
In this project, we decided to tackle the topic of voting and democracy, particularly in a dense urban area such as Seattle. Our group is interested in investigating the rates of voter turnout throughout different demographics, including but not limited to: socioeconomic status, ethnicity, location, and education level. In the era of technological connectivity, participating in our nation’s democracy should be as seamless and equitable as possible. However, barriers still exist that prevent certain groups of people from having a civic voice.

Theodore Johnson of the Brennan Center For Justice gives one example of many:
> “...the Brennan Center has documented a surge in voter purges — the sometimes error-prone process by which election officials remove allegedly ineligible voters from the rolls — in jurisdictions with a history of racial discrimination in voting”
[(Johnson 2020)](https://www.brennancenter.org/our-work/research-reports/new-voter-suppression)

### II. Values Addressed
One of the core values we aim to investigate (aside from the obvious value of democracy) is equity. Providing all members of a community with an equal opportunity to voice their opinions is a cornerstone of a society that values all walks of life and their needs. Collecting data around the subject of voting can lead to valuable conclusions about the areas where the law may lack in terms of protecting civil rights. Another key value of this problem domain is justice. Justice and equity are closely intertwined; addressing questions of equity in our democracy can then open doors for justice. For example, last year the League of United Latin American Citizens (LULAC) and the Latino Community Fund of Washington opened legal cases against Benton, Chelan, and Yakima counties on the subject of voter suppression. The lawsuits challenge the current ballot system and rise in defense of Latino voters:
> “‘This is definitely a tool of voter suppression,’ says [voting and human rights attorney] Matter… ‘It seems the more politically engaged and civically engaged Latino voters are, the more discriminatory measures are being used’”
[(Hernandez 2021)](https://www.nbcrightnow.com/news/3-washington-state-counties-facing-a-lawsuit-for-latino-voter-suppression/article_4f4e6cda-bcf8-11eb-817a-43e11f752665.html)

### IV. Potential Harms & Benefits
A potential benefit of investigating democratic disparities would be the ability to increase voting accessibility for social groups that are currently underrepresented.
> “Turnout in states with all-mail balloting has been among the nation’s highest, and is often seen as a key to attracting voters who may not otherwise cast ballots because of the challenges of work, child care or transportation”
[(Baker 2022)](https://www.nytimes.com/2022/02/02/us/mail-voting-black-latino.html)
Bringing awareness to the issues faced by underrepresented communities would prevent further voter suppression and underrepresentation of said communities in the legal system and the government.

## Research Questions
1. How do voting rates between sexes differ between each state?
  * This question was motivated by the idea that gender equality and equity have not yet been achieved in the United States. Because of this, we want to compare what voting rates are across states to see if certain states are making a better effort in reaching equality. This will also allow us to point out which states need to put more effort into making voting rates more equal across sexes.
2. How does someone’s household income correlate with the type of candidate that is voted for?
  * This question is important because it will be interesting to see if certain places with a specific household income tend to vote towards a candidate over another. Investigating this question can let us see which aspects of a candidate's campaign is most important for certain households.
3. How does location affect the type of way someone votes or returns their ballot?
  * This question is important because voting needs to be practical so that nobody feels like they are being prevented from voting. Since everybody has unique lives, options are necessary so that everyone can turn in their ballot so it will be interesting to see if certain locations have less options than others.

## The Dataset
Our dataset is related to our problem domain because our dataset collected values about the total population in a group, the amount registered in that group, and the amount of people that actually registered in that group. The many groups in our dataset include age, sex, income, location, race, etc. This dataset will enable us to answer our research questions because we will be able to make a visualization that can show us relative trends between voting rates and each of the variables like income, age, and race.

| Name of Data File                                                                             | Number of Observations (Rows) | Number of Variables (Columns) |
|-----------------------------------------------------------------------------------------------|-------------------------------|-------------------------------|
| Reported Voting and Registration, by Sex, Race and Hispanic Origin, for States: November 2020 | 572                           | 13                            |
| U.S. General Elections 2018 - Analysis Dataset   | 3114                            | 39                            |
| Voting Locations and Ballot Boxes                           | 538                           | 10                            |


#### Dataset Information
1. Who collected the data? When? For what purpose?
 * The United States Census Bureau collected the data. They did this after the 2020 federal election and continued to update it until October 28, 2021. They did this because their mission is to be the leading provider of data related to the United States people and economy.
2. How was the data collection effort funded? Who is likely to benefit from the data or make money?
 * The data collection effort was funded by the United States Census Bureau. We believe politicians who are interested in voting rates and turn out in particular areas will benefit most from the data. This is because they can see which types of people or types of areas vote more and may try to either target those populations to get their vote or reach out to populations that have low voting rates and try to find a way to increase those numbers in their favor.
3. How was the data validated and held secure? Is it credible and trustworthy?
 * The data was validated and held secure by obtaining the data from the 2020 Current Population Survey Voting and Registration Supplement for the presidential election. The United States Census Bureau also watches for misinformation online and makes sure they have high data quality and that those efforts are transparent. This makes the data credible and trustworthy.
4. How did you obtain the data? Do you credit the source of the data?
 * We obtained this data by doing google searches about the 2020 elections with keywords like “census”, “demographics”, “population”, etc. which led us to this data. Yes, we credit the source of the data.

#### Citations
Bureau, US Census. “Voting and Registration in the Election of November 2020.” Census.gov, 28 Oct. 2021, [Reported Voting and Registration, by Sex, Race and Hispanic Origin, for States: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table04b.xlsx)

GitHub,
[U.S. General Elections 2018 - Analysis Dataset](https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv)

Washington Geospatial Open Data Portal, [Voting Locations and Ballot Boxes](https://geo.wa.gov/datasets/75fd31e30c76468291b48470a20b4b49/explore?location=47.194487%2C-120.764138%2C7.64&showTable=true)

## Findings
-  Our first question was investigating whether voting rates are different between males and females between each state. Based on our findings, we found that voting rates aren’t necessary exactly the same. The rates were actually fairly similar, but overall, women actually tended to vote in larger numbers compared to men in most states. This is interesting because it was expected that men would actually tend to have higher voting rates in most states than women in general because of past inequalities that women have faced such as not having the right to vote. But, according to our findings, it is shown that women are voting as much if not more than men in most states. This shows that from past inequalities, states are making voting more accessible to women so that these numbers become and remain high. 
- Our second question was investigating whether someone’s household income can be an indicator of the type of candidate they end up voting for. Based on our findings, the first thing we found was that the number of counties in the United States have average household incomes between $25,00 and $60,000 was highest. That means that most counties in the United States are part of the lower class or middle class. In this particular group, most of these counties had the highest percentages of votes for Trump in 2020. These percentages tended to be in between 50% and about 87%. In contrast, the number of counties that had an average household income between $60,000 and $125,000 was much lower. Within this group, percentages were mostly below 65%. In general, the lower the household income, the higher percentage of voters voted for Trump in a county while the higher one’s household income, the less likely was that country going to vote for Trump.
- Finally, our last question was investigating whether where the location someone lives in can affect the type of way they vote. For this question, we looked at Washington state and its counties specifically. Based on our findings, we learned that the number of drop boxes greatly outweighs the number of voting centers there are across the state. However, the concentration of drop boxes is highest around the Seattle and Puget sound area. Further, most counties have at least one voting center. However, most of these voting centers are on the edges of counties rather than in the middle of one. Our investigation found that there are larger distances between voting centers and drop boxes towards central and eastern Washington which are more rural areas. 

## Discussion
- The importance of our findings is that we are able to find trends that can influence how people vote. There can be restrictions put in place that can reduce accessibility of voting for certain populations. Finding these restrictions are important to stand out so that new policies and methods can be put in place that can eradicate these inequalities as voting is a right all people have.
- Our investigation about the differences in voting rates between sexes found that women tend to vote more than men in general. Now the next step for these states is increasing voting rates overall so that the percentage of voters is closest to 100% as possible. Although it’s important that the voting rates of women are rising, it is imperative that the male voting rate continues to increase as well as all votes count. Our investigation about household incomes showed that lower incomes tended to vote for Trump who was a candidate who had their main focus on the economy compared to other important social issues. This can show that specific characteristics of one’s life can be a large indicator of what issue they believe is most important. Finally, our investigation about the type of voting and the locations of those types can vary across the state. However, in Washington, the large number of drop boxes means that someone can complete their voting at home or elsewhere and drop it off instead of having to go in person and vote. Because of this large number, it is largely accessible option for most people.
- One possible implication for our research questions is that it may push people to rethink and reevaluate the voting system set in place in America. It will allow for us to see the reality of the voting system and see the adverse effects of common issues such as age, finances, and education. This will allow state officials and policymakers to revise their systems and have a better understanding of where most votes come from and how certain populations make up most of the numbers. This will create better systems to be put in place to create equality and fair voting.
- However, another implication is that it's possible that politicians use the data we collect to their advantage by looking at the populations that have higher voting rates and only target those to their campaign. This can be a problem because this would further enhance the problem that is currently happening. Further, politicians could use our findings to purposefully ignore populations whose voting numbers are low as they may believe it wouldn’t be advantageous of them to do use their resources there. This can further discriminate certain populations from being able to share their voice in important policies that can affect their lives.

## Conclusion
- In conclusion, the main take away that we would like the reader to leave with is the idea that there’s many current institutions that are present in the background that can lead to inequalities between groups of people. Because of this, we all need to be aware of these things that leads to inequality so that work can be done on improving those systems.
- From our project, we’ve brought to the spotlight that people with low household incomes tend to vote for a candidate that promises improving the economy as their main plan. From that idea, we can learn that issues such as financial stability is what is most important for these voters over other issues. Although Trump has had many controversial views and has done questionable actions, there was still a high percentage of people that decided to vote in favor of him in the low household income groups. Even though higher voter rates for Trump occurred from low household income groups, it’s possible that other factors could contribute to this. For example, education, religion, the place one lives in, or the type of place they live can also contribute to these rates. Because of this, more research needs to be done to more precisely see what factors leads to these rates so that more specific policies can be created. However, solely on the data we obtained, policies on financial stability should be created.
- Our project also showed that drop boxes greatly outnumber voting centers, specifically in Washington state. However, beyond that, there are more of those drop boxes near Puget Sound compared to in central and eastern Washington. Although there is a larger population in western Washington, there’s more drop boxes in more condensed areas than the rest of the state. This is interesting to learn because even if people live closer together in western Washington, they get more options to where they can drop their vote off. However, in eastern Washington, it is likely that many people don’t live near the drop boxes that are there just because there’s a larger distance between them. That means these people have to travel farther distances which can make it a possible factor that can lead to them not voting at all. Because of this, more drop boxes should be put in place near central and eastern Washington so that the distances people have to travel are more similar.
- Finally, our project also showed us that voting rates between males and females were relatively close between states despite our assumptions that females would vote less. However, besides voting rates between male and females, we actually were able to learn that different states have different turn out rates in general. This is interesting because even if males and females would tend to vote in same rates, the total turnout was different. Some states had about 50% voter turnout per sex while others had over 70%. Because of this, more should be done that encourages voting in general so that rates for both females and males can rise up to 100%.

## References
Baker, M. (2022, February 2). *Rejected mail ballots are showing racial disparities.* The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/02/02/us/mail-voting-black-latino.html

Bureau, US Census. “Voting and Registration in the Election of November 2020.” *Census.gov,* 28 Oct. 2021, https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-585.html.

Hernandez, X. (2021, May 24). *3 Washington State counties facing a lawsuit for Latino voter suppression* NBC Right Now. Retrieved October 31, 2022, from https://www.nbcrightnow.com/news/3-washington-state-counties-facing-a-lawsuit-for-latino-voter-suppression/article_4f4e6cda-bcf8-11eb-817a-43e11f752665.html

Johnson, T. R. (2020, January 16). *The new voter suppression.* Brennan Center for Justice. Retrieved October 31, 2022, from https://www.brennancenter.org/our-work/research-reports/new-voter-suppression

GitHub, https://raw.githubusercontent.com/MEDSL/2018-elections-unoffical/master/election-context-2018.csv.

Washington Geospatial Open Data Portal, https://geo.wa.gov/datasets/75fd31e30c76468291b48470a20b4b49/explore?location=47.194487%2C-120.764138%2C7.64&amp;showTable=true.

## Appendix A: Questions

None.
