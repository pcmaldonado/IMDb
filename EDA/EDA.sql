-- =============================================
-- SELECT DATABASE
-- =============================================
USE imdb_202201


-- ==========================================================================
-- -------------------- Exploratory Data Analysis (EDA) ---------------------
-- ==========================================================================
SELECT TOP(50) * FROM title_ratings_202201 ORDER BY [RowNumber];   
SELECT TOP(50) * FROM name_basics_202201 ORDER BY [RowNumber];	 
SELECT TOP(50) * FROM professions_202201 ORDER BY [RowNumber];	 
SELECT TOP(50) * FROM known_titles_202201 ORDER BY [RowNumber];	 
SELECT TOP(50) * FROM title_basics_202201 ORDER BY [RowNumber];	  
SELECT TOP(50) * FROM titles_genres_202201 ORDER BY [RowNumber];	  
SELECT TOP(50) * FROM title_akas_202201 ORDER BY [RowNumber];	



-- Workers by profession => mainly actors/actresses (41 rows)
SELECT profession, 
		COUNT(nconst_p) as num_workers_professsion
FROM professions_202201 
WHERE profession <> ''
GROUP BY profession
ORDER BY num_workers_professsion DESC;	 



-- Biggest Productions per title type since 2000 ==> movie	Avengers: Endgame  3,421  (10 rows)		
WITH biggest_productions AS
	(SELECT 
			knownForTitles, 
			startYear,
			titleType,
			primaryTitle,
			COUNT(nconst_t) as num_cast_per_title,
			RANK() OVER (PARTITION BY titleType ORDER BY COUNT(nconst_t) DESC) as rnk
	FROM known_titles_202201 t
	JOIN title_basics_202201 b
		ON t.knownForTitles = b.tconst
	WHERE startYear > 2000
	GROUP BY primaryTitle, titleType, knownForTitles, startYear)
SELECT knownForTitles, startYear, titleType, primaryTitle, num_cast_per_title
FROM biggest_productions
WHERE rnk  = 1
ORDER BY num_cast_per_title DESC;



-- Best Title per TitleType  (11 rows)
WITH rank_title_titleType AS  
	(SELECT tconst, 
			titleType,
			primaryTItle,
			RANK() OVER (PARTITION BY titleType ORDER BY averageRating DESC) AS rnk,
			averageRating,
			numVotes
	FROM title_basics_202201 b
	JOIN title_ratings_202201 r
		ON b.tconst = r.tconst_r
	WHERE numVotes > 50000)
SELECT tconst, titleType, primaryTitle, averageRating, numVotes
FROM rank_title_titleType
WHERE rnk = 1;



-- Best series from the 90's by genre (12 rows)
WITH best_series AS 
	(SELECT tconst,
			startYear,
			genres,
			primaryTitle,
			RANK() OVER (PARTITION BY genres ORDER BY averageRating DESC) AS rnk,
			averageRating,
			numVotes
	FROM title_basics_202201 b
	JOIN title_ratings_202201 r
		ON b.tconst = r.tconst_r
	JOIN titles_genres_202201 g
		ON g.tconst_g = r.tconst_r
	WHERE numVotes > 50000 AND titleType = 'tvSeries' AND startYear BETWEEN 1990 AND 2000)
SELECT tconst, startYear, genres, primaryTitle, averageRating, numVotes
FROM best_series
WHERE rnk = 1
ORDER BY startYear, genres, averageRating, numVotes;



-- Best films since the 2000s by genre (26 rows)
WITH best_movies AS 
	(SELECT tconst,
			startYear,
			genres,
			primaryTitle,
			RANK() OVER (PARTITION BY genres ORDER BY averageRating DESC) AS rnk,
			averageRating,
			numVotes
	FROM title_basics_202201 b
	JOIN title_ratings_202201 r
		ON b.tconst = r.tconst_r
	JOIN titles_genres_202201 g
		ON g.tconst_g = r.tconst_r
	WHERE numVotes > 50000 AND titleType = 'movie' AND startYear >= 2000)
SELECT DISTINCT tconst, startYear, genres, primaryTitle, averageRating, numVotes
FROM best_movies
WHERE rnk = 1
ORDER BY startYear, genres, averageRating, numVotes;




-- Best crew in 2021, by profession (97 rows)
SELECT *
FROM 
	(SELECT nconst, 
			primaryName, 
			profession,
			COUNT(knownForTitles) as knownTitles
	FROM title_basics_202201 b
	JOIN known_titles_202201 k
		ON b.tconst = k.knownForTitles
	JOIN name_basics_202201 n
		ON k.nconst_t = n.nconst
	JOIN title_ratings_202201 r
		ON r.tconst_r = b.tconst
	JOIN professions_202201 p
		ON p.nconst_p = n.nconst
	WHERE startYear = 2021 AND numVotes > 100000 AND averageRating > 8 AND profession NOT LIKE 'act%'
	GROUP BY nconst, primaryName, profession) AS best_cast_crew
WHERE knownTitles > 1
ORDER BY knownTitles DESC, profession, primaryName;



-- ==========================================================================
-- ------------------ Exporting DATA for further analysis -------------------
-- ==========================================================================
-- Titles
CREATE VIEW IMDb_titles AS 
SELECT tconst, titleType, startYear, primaryTitle,  --(6,431,723 rows)
		region, genres, averageRating, numVotes
FROM title_basics_202201 tb
JOIN title_ratings_202201 r
	ON tb.tconst = r.tconst_r
JOIN title_akas_202201 a
	ON a.titleId = tb.tconst
JOIN titles_genres_202201 g
	ON g.tconst_g = tb.tconst
WHERE region <> '\N' AND genres <> '\N';
