-- =============================================
-- SELECT DATABASE
-- =============================================
USE imdb_202201


-- ==========================================================================
-- ------------------ Verifying number of rows from tables ------------------
-- ==========================================================================
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_akas_202201;			  ---30,625,715 rows 
SELECT COUNT(*), MAX(ROWNUMBER) FROM name_basics_202201;		  ---11,333,711 rows 
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_basics_202201;		  ---8,601,758 rows
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_ratings_202201;	      ---1,204,488 rows
	

-- ==========================================================================
-- --------------------- DROPPING NULLS (ROWS or COLUMNS) -------------------
-- ==========================================================================
-- ================================================================
--------------------- Checking NULLS in name_basics_202201 -------------------- 11,333,711 rows 
-- ================================================================
SELECT TOP(50) * FROM name_basics_202201 ORDER BY [RowNumber];	  

SELECT COUNT(*) as nulls  --1,249,941
FROM name_basics_202201 
WHERE birthYear = -1 AND deathYear = -1 AND knownForTitles = '\N' AND primaryProfession = '';	

DELETE FROM name_basics_202201
WHERE birthYear = -1 AND deathYear = -1 AND knownForTitles = '\N' AND primaryProfession = '';	


-- ================================================================
-------------------- Checking NULLS in title_basics_202201 -------------------- 8,601,758 rows
-- ================================================================
SELECT TOP(50) * FROM title_basics_202201 ORDER BY [RowNumber];	  

SELECT COUNT(*) as endYear_nulls         --8,515,490
FROM title_basics_202201 
WHERE endYear = -1;	

SELECT COUNT(*) as runtimeMinutes_nulls  --6,264,390
FROM title_basics_202201 
WHERE runtimeMinutes = -1;	

ALTER TABLE title_basics_202201
DROP COLUMN endYear, runtimeMinutes;


-- ================================================================
--------------------- Checking NULLS in title_akas_202201 -------------------- 30,625,715
-- ================================================================
SELECT TOP(50) * FROM title_akas_202201 ORDER BY [RowNumber];	

SELECT COUNT(*) as lang_nulls  --6,040,928
FROM title_akas_202201 
WHERE language = '\N';	

SELECT COUNT(*) as att_nulls   --30,390,689
FROM title_akas_202201 
WHERE attributes = '\N';	

ALTER TABLE title_akas_202201
DROP COLUMN attributes;

-- ================================================================
------------------- Checking NULLS in title_ratings_202201 ------------------- 1,204,488 rows
-- ================================================================
SELECT TOP(50) * FROM title_ratings_202201 ORDER BY [RowNumber];   

SELECT COUNT(*) as numVotes_nulls  --0
FROM title_ratings_202201 
WHERE numVotes = 0;	




-- ==========================================================================
-- ------------------- Recount number of rows from tables -------------------
-- ==========================================================================
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_akas_202201;			  ---30,625,715 rows
SELECT COUNT(*), MAX(ROWNUMBER) FROM name_basics_202201;		  ---10,118,770 rows **
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_basics_202201;		  ---8,601,758 rows
SELECT COUNT(*), MAX(ROWNUMBER) FROM title_ratings_202201;	      ---1,204,488 rows



-- ==========================================================================
-- -------------------- CREATING AND MODIFYING TABLES -----------------------
-- ==========================================================================
SELECT TOP(50) * FROM name_basics_202201 ORDER BY [RowNumber];	
SELECT TOP(50) * FROM title_basics_202201 ORDER BY [RowNumber];	

-- ================================================================
-- -------------------- known_titles_202201 -----------------------
-- ================================================================
-- =============================================
-- DROP TABLE BLOCK
-- =============================================
IF OBJECT_ID('known_titles_202201') IS NOT NULL
DROP TABLE [known_titles_202201]

-- =============================================
-- CREATE TABLE BLOCK
-- =============================================

CREATE TABLE [known_titles_202201]
	([RowNumber] INT IDENTITY(1,1)
      ,[nconst_t] VARCHAR(10)
      ,[knownForTitles] VARCHAR(10)
	  
	  CONSTRAINT [nconst_t] FOREIGN KEY ([nconst_t]) 
	  REFERENCES name_basics_202201 ([nconst]),
	  
	  CONSTRAINT [knownForTitles] FOREIGN KEY ([knownForTitles]) 
	  REFERENCES title_basics_202201 ([tconst]))

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [known_titles_202201]

-- =============================================
-- INSERT INTO BLOCK
-- =============================================
INSERT INTO [known_titles_202201]
(
      [nconst_t]
      ,[knownForTitles]
)


SELECT sub.nconst, sub.title
FROM 
	(SELECT RowNumber, nconst, value as title			
	FROM name_basics_202201  nb
			CROSS APPLY STRING_SPLIT(knownForTitles, ',')) AS sub
JOIN title_basics_202201 tb
	ON sub.title = tb.tconst
ORDER BY sub.RowNumber;


-- ================================================================
-- -------------------- professions_202201 ------------------------
-- ================================================================

-- =============================================
-- DROP TABLE BLOCK
-- =============================================
IF OBJECT_ID('professions_202201') IS NOT NULL
DROP TABLE [professions_202201]

-- =============================================
-- CREATE TABLE BLOCK
-- =============================================

CREATE TABLE [professions_202201]
	([RowNumber] INT IDENTITY(1,1)
      ,[nconst_p] VARCHAR(10)
      ,[profession] VARCHAR(100)
	  
	  CONSTRAINT [nconst_p] FOREIGN KEY ([nconst_p]) 
	  REFERENCES name_basics_202201 ([nconst]));

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [professions_202201]

-- =============================================
-- INSERT INTO BLOCK
-- =============================================
INSERT INTO [professions_202201]
(
      [nconst_p]
      ,[profession]
)

SELECT nconst, value as profession
FROM name_basics_202201  
	CROSS APPLY STRING_SPLIT(primaryProfession, ',')
ORDER BY RowNumber;

-- ================================================================
-- -------------------- name_basics_202201 ------------------------
-- ================================================================
ALTER TABLE name_basics_202201
DROP COLUMN [primaryProfession], [knownForTitles];


-- ================================================================
-- -------------------- titles_genres_202201 ----------------------
-- ================================================================

-- =============================================
-- DROP TABLE BLOCK
-- =============================================
IF OBJECT_ID('titles_genres_202201') IS NOT NULL
DROP TABLE [titles_genres_202201]

-- =============================================
-- CREATE TABLE BLOCK
-- =============================================

CREATE TABLE [titles_genres_202201]
	([RowNumber] INT IDENTITY(1,1)
      ,[tconst_g] VARCHAR(10)
      ,[genres] VARCHAR(50)
	  
	  CONSTRAINT [tconst_g] FOREIGN KEY ([tconst_g]) 
	  REFERENCES title_basics_202201 ([tconst]))

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [titles_genres_202201]

-- =============================================
-- INSERT INTO BLOCK
-- =============================================
INSERT INTO [titles_genres_202201]
(
      [tconst_g]
      ,[genres]
)

SELECT tconst, value as genres
FROM title_basics_202201  
		CROSS APPLY STRING_SPLIT(genres, ',');


SELECT COUNT(*)                  --395,098 rows
FROM titles_genres_202201 
WHERE genres = '\N';	  

SELECT COUNT(*)                  --13,633,583 rows
FROM titles_genres_202201;	  

-- ================================================================
-- -------------------- title_basics_202201 -----------------------
-- ================================================================
ALTER TABLE title_basics_202201
DROP COLUMN genres;