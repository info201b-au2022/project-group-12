# Voting Frequencies and Democratic Equity: Project Proposal

# Code Name
Seattle Vote

# Authors
- Naiyyra Abdel Aziz, naiyyraa@uw.edu
- Elizabeth Deng, elideng@uw.edu
- Sukhman Dhillon, skd26@uw.edu
- Judy Lee, seylee@uw.edu

# Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

# Date
Autumn 2022

# Abstract
Our main question is “How do the race, economics, and social status of each household affect voting rates in the United States in 2020?” This question is important because it allows us to see how democracy and votes are affected by demographics and socioeconomic status. To address the question, we will research, collect, and analyze the data for elections from 2020, and make comparisons between the states for better understanding.  

# Keywords
- Frequency of Voting
- Demographics 
- Barriers
- Gender 
- Income

# Introduction
In the United States, the voting results and how people are involved in the process of voting all differ based on race, Hispanic origin, sex, age, or socioeconomic status. Our project is to demonstrate and visualize what the differences in registration as well as voting are by looking at the data provided. Between these different variables, we will also be comparing how they differ between the states of the United States of America by looking at the results from the election in 2020. And we will mainly focus on household income, age, and educational attainment effects on voting rates between the states. Also, we will address the value of human well-being and the reality of the voting system in America to see what aspects of the current voting system need to be changed. This data science will allow us to teach about the socioeconomic status influencing voting behavior in the United States. 

# Problem Domain
## I. Topic & Sociotechnical Setting
In this project, we decided to tackle the topic of voting and democracy, particularly in a dense urban area such as Seattle. Our group is interested in investigating the rates of voter turnout throughout different demographics, including but not limited to: socioeconomic status, ethnicity, location, and education level. In the era of technological connectivity, participating in our nation’s democracy should be as seamless and equitable as possible. However, barriers still exist that prevent certain groups of people from having a civic voice.

Theodore Johnson of the Brennan Center For Justice gives one example of many:
> “...the Brennan Center has documented a surge in voter purges — the sometimes error-prone process by which election officials remove allegedly ineligible voters from the rolls — in jurisdictions with a history of racial discrimination in voting”
[(Johnson 2020)](https://www.brennancenter.org/our-work/research-reports/new-voter-suppression)

## II. Values Addressed
One of the core values we aim to investigate (aside from the obvious value of democracy) is equity. Providing all members of a community with an equal opportunity to voice their opinions is a cornerstone of a society that values all walks of life and their needs.Collecting data around the subject of voting can lead to valuable conclusions about the areas where the law may lack in terms of protecting civil rights. Another key value of this problem domain is justice. Justice and equity are closely intertwined; addressing questions of equity in our democracy can then open doors for justice. For example, last year the League of United Latin American Citizens (LULAC) and the Latino Community Fund of Washington opened legal cases against Benton, Chelan, and Yakima counties on the subject of voter suppression. The lawsuits challenge the current ballot system and rise in defense of Latino voters:
> “‘This is definitely a tool of voter suppression,’ says [voting and human rights attorney] Matter… ‘It seems the more politically engaged and civically engaged Latino voters are, the more discriminatory measures are being used’”
[(Hernandez 2021)](https://www.nbcrightnow.com/news/3-washington-state-counties-facing-a-lawsuit-for-latino-voter-suppression/article_4f4e6cda-bcf8-11eb-817a-43e11f752665.html)

## IV. Potential Harms & Benefits
A potential benefit of investigating democratic disparities would be the ability to increase voting accessibility for social groups that are currently underrepresented.
> “Turnout in states with all-mail balloting has been among the nation’s highest, and is often seen as a key to attracting voters who may not otherwise cast ballots because of the challenges of work, child care or transportation”
[(Baker 2022)](https://www.nytimes.com/2022/02/02/us/mail-voting-black-latino.html)
Bringing awareness to the issues faced by underrepresented communities would prevent further voter suppression and underrepresentation of said communities in the legal system and the government.

# Research Questions
1. How do voting rates differ between each state?
  * This question was motivated by the idea that each state has their own way of having elections done whether that is by going in person, having mail in voting, or both and it will be interesting to see if states with a certain way of voting have higher or lower voting rates.
2. How does someone’s household income correlate with voting rates?
  * This question is important because there should not be obstacles to prevent people from voting. If it is found that differences in income do affect whether one can vote, more needs to be done to get rid of those differences.
3. How does one’s age affect their tendency to vote?
  * This question is important because as people get older, health problems tend to rise that can potentially make it harder to go out and vote. If voting rates are higher among younger populations, more needs to be done to prevent those differences.
4. How does education attainment relate to whether one votes or not?
  * This question is important because one of the reasons the electoral college was created was due to the fear that people weren’t educated enough to vote. If voting among people with higher education is indeed increasing, the electoral college should possibly be modified.

# The Dataset
Our dataset is related to our problem domain because our dataset collected values about the total population in a group, the amount registered in that group, and the amount of people that actually registered in that group. The many groups in our dataset include age, sex, income, location, education, etc. This dataset will enable us to answer our research questions because we will be able to make a visualization that can show us relative trends between voting rates and each of the variables like income, age, and education levels.

| Name of Data File                                                                             | Number of Observations (Rows) | Number of Variables (Columns) |
|-----------------------------------------------------------------------------------------------|-------------------------------|-------------------------------|
| Reported Voting and Registration, by Sex, Race and Hispanic Origin, for States: November 2020 | 572                           | 13                            |
| Reported Voting and Registration of Family Members, by Age and Family Income: November 2020   | 71                            | 17                            |
| Method of Voting, By Selected Characteristics: November 2020                                  | 39                            | 6                             |
| Reported Voting and Registration, by Age, for States: November 2020                           | 312                           | 13                            |
| Reasons for Not Voting, By Selected Characteristics: November 2020                            | 41                            | 15                            |

Bureau, US Census. “Voting and Registration in the Election of November 2020.” Census.gov, 28 Oct. 2021, [https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-585.html.](https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-585.html)

[Reported Voting and Registration, by Sex, Race and Hispanic Origin, for States: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table04b.xlsx) 

[Reported Voting and Registration of Family Members, by Age and Family Income: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table07.xlsx)

[Method of Voting, By Selected Characteristics: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table14.xlsx)

[Reported Voting and Registration, by Sex, Veteran Status, and Age: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table13.xlsx)

[Reasons For Not Voting, By Selected Characteristics: November 2020](https://www2.census.gov/programs-surveys/cps/tables/p20/585/table10.xlsx)

1. Who collected the data? When? For what purpose? 
 * The United States Census Bureau collected the data. They did this after the 2020 federal election and continued to update it until October 28, 2021. They did this because their mission is to be the leading provider of data related to the United States people and economy.
2. How was the data collection effort funded? Who is likely to benefit from the data or make money? 
 * The data collection effort was funded by the United States Census Bureau. We believe politicians who are interested in voting rates and turn out in particular areas will benefit most from the data. This is because they can see which types of people or types of areas vote more and may try to either target those populations to get their vote or reach out to populations that have low voting rates and try to find a way to increase those numbers in their favor.
3. How was the data validated and held secure? Is it credible and trustworthy?
 * The data was validated and held secure by obtaining the data from the 2020 Current Population Survey Voting and Registration Supplement for the presidential election. The United States Census Bureau also watches for misinformation online and makes sure they have high data quality and that those efforts are transparent. This makes the data credible and trustworthy.
4. How did you obtain the data? Do you credit the source of the data? 
 * We obtained this data by doing google searches about the 2020 elections with keywords like “census”, “demographics”, “population”, etc. which led us to this data. Yes, we credit the source of the data.


# Expected Implications
The possible implications for our research questions is that it may push people to rethink and reevaluate the voting system set in place in America. It will allow for us to see the reality of the voting system and see the adverse effects of common issues such as age, finances, and education. This will allow state officials and policymakers to revise their systems and have a better understanding of where most votes come from and how certain populations make up most of the numbers. This will create better systems to be put in place to create equality and fair voting. However, another implication is that it's possible that politicians use the data we collect to their advantage by looking at the populations that have higher voting rates and only target those to their campaign. This can be a problem because this would further enhance the problem that is currently happening.

# Limitations
A limitation that may need to be addressed is the possibility of residents simply not voting, for no reason other than negligence. We might address this limitation by examining the total number of registered voters, the total number of people who actually voted, and count the difference of that as people who didn't vote. Another limitation in this project could be differences in advertising about elections and election dates across the United States of America. It's possible that this could influence whether people vote or not and could vary greatly across the United States. That means that in some locations, voting rates could be inflated but since we aren't looking into this variable, we won't be sure how it gets affected. To address this, we will example the margin of errors in the data to give us a relative idea about what the differences are and if they are significant.

# References

Baker, M. (2022, February 2). *Rejected mail ballots are showing racial disparities.* The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/02/02/us/mail-voting-black-latino.html

Bureau, US Census. “Voting and Registration in the Election of November 2020.” *Census.gov,* 28 Oct. 2021, https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-585.html.

Hernandez, X. (2021, May 24). *3 Washington State counties facing a lawsuit for Latino voter suppression* NBC Right Now. Retrieved October 31, 2022, from https://www.nbcrightnow.com/news/3-washington-state-counties-facing-a-lawsuit-for-latino-voter-suppression/article_4f4e6cda-bcf8-11eb-817a-43e11f752665.html

Johnson, T. R. (2020, January 16). *The new voter suppression.* Brennan Center for Justice. Retrieved October 31, 2022, from https://www.brennancenter.org/our-work/research-reports/new-voter-suppression

# Appendix A: Questions

None.


