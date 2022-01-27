# IMDb

## Data
IMDb authorizes the use of subsets of its total database for non-commercial purposes. Seven dataset files are available (title.akas, title.basics, title.crew, title.episode, title.principals, title.ratings and name.basics) and each one contains different information about the millions of different titles and people available in the IMDb database (learn more [here](https://www.imdb.com/interfaces/)).

### Use of:
* Python Version: 3.8.10 *(Packages: numpy, pandas, matplotlib, seaborn)*
* Visual Studio 2019 - SSIS
* Microsfot SQL Server
* Tableau Public 2021.4

<br>

# Overview
## [ETL & Pre-processing](https://github.com/pcmaldonado/IMDb/tree/main/Preprocessing) 
Data was first extracted from the IMDb available data sets, then imported to MS SQL using Microsoft Visual Studio 2019, using the “Integration Services Project” template and the SSIS toolbox. The data was imported as “raw” and all columns as type of strings in order to avoid any kind of errors, then it was transformed in SQL. 

Some tables were discarded, and others were created to avoid having multiple values in a single cell.

<br>

## [Exploratory Data Analyis](https://github.com/pcmaldonado/IMDb/tree/main/EDA) 
<i>This analysis was done using MSSQL, Python and Tableau Public.</i>

IMDb's revenue comes from both advertisers and its paying members (IMDbPro). 

- IMDbPro
	- The target audience for these members is the more than 4 million actors, nearly 1 million different producers, and hundreds of thousands of writers, directors, and other crew members in their database.
	- People who have worked on big productions like "Avengers: Endgame" or "Game of Thrones" would probably benefit the most from the network's capabilities of their paid membership, whether it's recruiters who can easily find the right team for these types of productions or people who have worked on these productions, in order to get a nice portfolio page showing off their achievements.
- IMDb
	- Users of IMDb could also benefit from having a robust rating system. Indeed, as of now, titles with a high number of votes tend to have higher ratings, which makes the average title rating at relatively high 6.62 --moreover, titles with fewer than 10 votes get an average rating above average, at around 7.05.	

See more informations about the IMDb datasets [here](https://github.com/pcmaldonado/IMDb/tree/main/EDA) (best titles per title type, best series from the 90's, and more!)