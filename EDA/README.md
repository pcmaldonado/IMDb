# Exploratory Data Analysis (SQL, Python, Tableau)

IMDb has two main sources of income: advertising & paid membership (IMDbPro) “aimed at film industry professionals” ([source](https://help.imdb.com/article/imdb/general-information/how-much-does-using-imdb-cost/G47U365PP8GQVQYV?ref_=helpart_nav_38#)). This means that :

- they need to attract general public, from which some will click on ad banners, thus generating revenue for IMDb
- they need to attract industry professionals to suscribe to their paid membership

In the available database we have more than 4,000,000 actors/actresses, almost 1 million different producers and hundred of thousands of writers, directors as well as people working in camera and sound departments, and many other professsions (legal, publicist, choreographer, set decorator, etc.). All of these people are potential suscribers of the IMDb membership.

Some of the biggest productions (largest cast and crew in the IMDb available dataset) per title type since the year 2001 are the “Avengers: Endgame” (movie) with 3,421 people having worked on, and “Game of Thrones” (tvSeries) with 2,856 people. Having worked on a big production can help cast and crew members to show a quality portfolio of projects as well as increase their network, in other words, these people would specially benefit from having an IMDb membership !
<br><br>


Having a good rating system is important to attract more users, and thus increase ads revenue. Unfortunately, titles with lower number of votes are not well represented by their average rating:

![numVotes_rating.png](https://github.com/pcmaldonado/IMDb/blob/main/EDA/numVotes_rating.png)

We can see that when the votes are very low, a title can have a score from 0 to 10. However, as the number of votes increases, the average rating tends to go higher (but below 10).<br><br>

We can see what are the best titles in the available data, considering only titles with more than 50k votes:
<details>
<summary><b>Best titles per type in the IMDb dataset </b></summary>
From the available data in the inner join of tables “title_basics” and “title_ratings”, and considering only titles with more than 50K votes, the best titles per title type are: <br><br>
    
<table><tr>
<th>tconst</th>
<th>titleType</th>
<th>primaryTitle</th>
<th>averageRating</th>
<th>numVotes</th>
</tr><tr>
    
<td>tt0111161</td>
<td>movie</td>
<td>The Shawshank Redemption</td>
<td>9,3</td>
<td>2,523,946</td>
</tr><tr>
    
<td>tt15097216</td>
<td>movie</td>
<td>Jai Bhim</td>
<td>9,3</td>
<td>166,667</td>
</tr><tr>
    
<td>tt0108598</td>
<td>short</td>
<td>The Wrong Trousers</td>
<td>8,3</td>
<td>53,272</td>
</tr><tr>
    
<td>tt2301451</td>
<td>tvEpisode</td>
<td>Ozymandias</td>
<td>10</td>
<td>149,682</td>
</tr><tr>
    
<td>tt5491994</td>
<td>tvMiniSeries</td>
<td>Planet Earth II</td>
<td>9,5</td>
<td>107,823</td>
</tr><tr>
    
<td>tt0067023</td>
<td>tvMovie</td>
<td>Duel</td>
<td>7,6</td>
<td>68,641</td>
</tr><tr>
    
<td>tt14392248</td>
<td>tvSeries</td>
<td>Aspirants</td>
<td>9,6</td>
<td>290,200</td>
</tr><tr>
    
<td>tt14650074</td>
<td>tvSeries</td>
<td>Dhindora</td>
<td>9,6</td>
<td>111,317</td>
</tr><tr>
    
<td>tt11337862</td>
<td>tvSpecial</td>
<td>Friends: The Reunion</td>
<td>8,1</td>
<td>55,145</td>
</tr><tr>
    
<td>tt1569923</td>
<td>video</td>
<td>Batman: Under the Red Hood</td>
<td>8,1</td>
<td>59,376</td>
</tr><tr>
    
<td>tt2140553</td>
<td>videoGame</td>
<td>The Last of Us</td>
<td>9,7</td>
<td>56,588</td>
</tr></table>

</details>
    

<details>
<summary><b>Best Series from the 90’s </b></summary>
From the available data, the best series from the 90’s, by genre, are: <br><br>

<table>
	<thead>
		<tr>
			<td>tconst</td>
			<td>startYear</td>
			<td>genres</td>
			<td>primaryTitle</td>
			<td>averageRating</td>
			<td>numVotes</td>
		</tr>
	</thead>
	<tr>
		<td>tt0096657</td>
		<td>1990</td>
		<td>Family</td>
		<td>Mr. Bean</td>
		<td>8,5</td>
		<td>111625</td>
	</tr>
	<tr>
		<td>tt0098936</td>
		<td>1990</td>
		<td>Mystery</td>
		<td>Twin Peaks</td>
		<td>8,8</td>
		<td>188434</td>
	</tr>
	<tr>
		<td>tt0103359</td>
		<td>1992</td>
		<td>Action</td>
		<td>Batman: The Animated Series</td>
		<td>9</td>
		<td>95844</td>
	</tr>
	<tr>
		<td>tt0103359</td>
		<td>1992</td>
		<td>Adventure</td>
		<td>Batman: The Animated Series</td>
		<td>9</td>
		<td>95844</td>
	</tr>
	<tr>
		<td>tt0103359</td>
		<td>1992</td>
		<td>Animation</td>
		<td>Batman: The Animated Series</td>
		<td>9</td>
		<td>95844</td>
	</tr>
	<tr>
		<td>tt0108778</td>
		<td>1994</td>
		<td>Comedy</td>
		<td>Friends</td>
		<td>8,8</td>
		<td>925851</td>
	</tr>
	<tr>
		<td>tt0108778</td>
		<td>1994</td>
		<td>Romance</td>
		<td>Friends</td>
		<td>8,8</td>
		<td>925851</td>
	</tr>
	<tr>
		<td>tt0112178</td>
		<td>1995</td>
		<td>Sci-Fi</td>
		<td>Star Trek: Voyager</td>
		<td>7,8</td>
		<td>65338</td>
	</tr>
	<tr>
		<td>tt0118276</td>
		<td>1997</td>
		<td>Fantasy</td>
		<td>Buffy the Vampire Slayer</td>
		<td>8,2</td>
		<td>140086</td>
	</tr>
	<tr>
		<td>tt0118421</td>
		<td>1997</td>
		<td>Thriller</td>
		<td>Oz</td>
		<td>8,7</td>
		<td>95231</td>
	</tr>
	<tr>
		<td>tt0141842</td>
		<td>1999</td>
		<td>Crime</td>
		<td>The Sopranos</td>
		<td>9,2</td>
		<td>356000</td>
	</tr>
	<tr>
		<td>tt0141842</td>
		<td>1999</td>
		<td>Drama</td>
		<td>The Sopranos</td>
		<td>9,2</td>
		<td>356000</td>
	</tr>
</table>
<i>Note: one title can have multiple genres, thus, it can appear more than once.</i>
</details>


<details>
<summary><b>Best films since the 2000s</b></summary>
From the available data, the best movies since the 2000s, by genre, are:  <br><br>
<table>
	<thead>
		<tr>
			<td>tconst</td>
			<td>startYear</td>
			<td>genres</td>
			<td>primaryTitle</td>
			<td>averageRating</td>
			<td>numVotes</td>
		</tr>
	</thead>
	<tr>
		<td>tt0245429</td>
		<td>2001</td>
		<td>Animation</td>
		<td>Spirited Away</td>
		<td>8,6</td>
		<td>711577</td>
	</tr>
	<tr>
		<td>tt0245429</td>
		<td>2001</td>
		<td>Family</td>
		<td>Spirited Away</td>
		<td>8,6</td>
		<td>711577</td>
	</tr>
	<tr>
		<td>tt0211915</td>
		<td>2001</td>
		<td>Romance</td>
		<td>Amélie</td>
		<td>8,3</td>
		<td>733344</td>
	</tr>
	<tr>
		<td>tt0253474</td>
		<td>2002</td>
		<td>Music</td>
		<td>The Pianist</td>
		<td>8,5</td>
		<td>786946</td>
	</tr>
	<tr>
		<td>tt0167260</td>
		<td>2003</td>
		<td>Adventure</td>
		<td>The Lord of the Rings: The Return of the King</td>
		<td>8,9</td>
		<td>1742198</td>
	</tr>
	<tr>
		<td>tt0365748</td>
		<td>2004</td>
		<td>Horror</td>
		<td>Shaun of the Dead</td>
		<td>7,9</td>
		<td>538596</td>
	</tr>
	<tr>
		<td>tt0367110</td>
		<td>2004</td>
		<td>Musical</td>
		<td>Swades</td>
		<td>8,2</td>
		<td>88076</td>
	</tr>
	<tr>
		<td>tt0338013</td>
		<td>2004</td>
		<td>Romance</td>
		<td>Eternal Sunshine of the Spotless Mind</td>
		<td>8,3</td>
		<td>963062</td>
	</tr>
	<tr>
		<td>tt0482571</td>
		<td>2006</td>
		<td>Mystery</td>
		<td>The Prestige</td>
		<td>8,5</td>
		<td>1268469</td>
	</tr>
	<tr>
		<td>tt0468569</td>
		<td>2008</td>
		<td>Action</td>
		<td>The Dark Knight</td>
		<td>9</td>
		<td>2474194</td>
	</tr>
	<tr>
		<td>tt1286537</td>
		<td>2008</td>
		<td>News</td>
		<td>Food, Inc.</td>
		<td>7,8</td>
		<td>50783</td>
	</tr>
	<tr>
		<td>tt1424432</td>
		<td>2010</td>
		<td>Documentary</td>
		<td>Senna</td>
		<td>8,5</td>
		<td>68839</td>
	</tr>
	<tr>
		<td>tt1375666</td>
		<td>2010</td>
		<td>Sci-Fi</td>
		<td>Inception</td>
		<td>8,8</td>
		<td>2218561</td>
	</tr>
	<tr>
		<td>tt1424432</td>
		<td>2010</td>
		<td>Sport</td>
		<td>Senna</td>
		<td>8,5</td>
		<td>68839</td>
	</tr>
	<tr>
		<td>tt1562872</td>
		<td>2011</td>
		<td>Musical</td>
		<td>Zindagi Na Milegi Dobara</td>
		<td>8,2</td>
		<td>74215</td>
	</tr>
	<tr>
		<td>tt1853728</td>
		<td>2012</td>
		<td>Western</td>
		<td>Django Unchained</td>
		<td>8,4</td>
		<td>1459482</td>
	</tr>
	<tr>
		<td>tt2582802</td>
		<td>2014</td>
		<td>Music</td>
		<td>Whiplash</td>
		<td>8,5</td>
		<td>783845</td>
	</tr>
	<tr>
		<td>tt5813916</td>
		<td>2016</td>
		<td>War</td>
		<td>The Mountain II</td>
		<td>8,7</td>
		<td>107342</td>
	</tr>
	<tr>
		<td>tt6751668</td>
		<td>2019</td>
		<td>Comedy</td>
		<td>Parasite</td>
		<td>8,6</td>
		<td>704270</td>
	</tr>
	<tr>
		<td>tt6751668</td>
		<td>2019</td>
		<td>Thriller</td>
		<td>Parasite</td>
		<td>8,6</td>
		<td>704270</td>
	</tr>
	<tr>
		<td>tt8503618</td>
		<td>2020</td>
		<td>History</td>
		<td>Hamilton</td>
		<td>8,4</td>
		<td>80437</td>
	</tr>
	<tr>
		<td>tt10554232</td>
		<td>2020</td>
		<td>War</td>
		<td>Dara of Jasenovac</td>
		<td>8,7</td>
		<td>80163</td>
	</tr>
	<tr>
		<td>tt10295212</td>
		<td>2021</td>
		<td>Biography</td>
		<td>Shershaah</td>
		<td>8,7</td>
		<td>111676</td>
	</tr>
	<tr>
		<td>tt15097216</td>
		<td>2021</td>
		<td>Crime</td>
		<td>Jai Bhim</td>
		<td>9,3</td>
		<td>166667</td>
	</tr>
	<tr>
		<td>tt15097216</td>
		<td>2021</td>
		<td>Drama</td>
		<td>Jai Bhim</td>
		<td>9,3</td>
		<td>166667</td>
	</tr>
	<tr>
		<td>tt10872600</td>
		<td>2021</td>
		<td>Fantasy</td>
		<td>Spider-Man: No Way Home</td>
		<td>8,8</td>
		<td>377723</td>
	</tr>
</table>
</details>
<br>

<i>And check the cast and crew that work on the best titles of 2021 (more than 100K votes and above 8.0 average rating) [here](https://public.tableau.com/app/profile/paula2733/viz/BestCrew2021_imdbdata/Dashboard1) on Tableau ! </i>


<br><br>
Finally, knowing the industry can be helpful. The genre that has developped the more in the last 20 years is the “Documentary” genre, going from 25,874 total titles in 2001 up to 107,812 in 2021 (i.e. 7.4% annual growth), and the second most growing genre is the “Short”, with 6.36% annual growth rate. Finally, the most common genres, “Drama” and “Comedy”, also continue growing.

![tot_titles_genre_year.gif](https://github.com/pcmaldonado/IMDb/blob/main/EDA/tot_titles_genre_year.gif)

<i>Also you can check the evolution of genres preference by country through time [here](https://public.tableau.com/app/profile/paula2733/viz/TopGenreCountryYear/Sheet1) on Tableau Public ! </i>