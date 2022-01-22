USE [imdb_202201]
GO
/****** Object:  Table [dbo].[known_titles_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[known_titles_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[nconst_t] [varchar](10) NOT NULL,
	[knownForTitles] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[name_basics_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[name_basics_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[nconst] [varchar](10) NOT NULL,
	[primaryName] [nvarchar](100) NOT NULL,
	[birthYear] [int] NULL,
	[deathYear] [int] NULL,
 CONSTRAINT [nconst] PRIMARY KEY CLUSTERED 
(
	[nconst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[professions_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[professions_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[nconst_p] [varchar](10) NOT NULL,
	[profession] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[title_akas_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title_akas_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[titleId] [varchar](10) NOT NULL,
	[ordering] [int] NULL,
	[title] [nvarchar](100) NULL,
	[region] [varchar](5) NULL,
	[language] [varchar](4) NULL,
	[types] [varchar](100) NULL,
	[isOriginalTitle] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[title_basics_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title_basics_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [varchar](10) NOT NULL,
	[titleType] [varchar](20) NULL,
	[primaryTitle] [nvarchar](100) NULL,
	[originalTitle] [nvarchar](100) NULL,
	[isAdult] [int] NULL,
	[startYear] [int] NULL,
 CONSTRAINT [tconst] PRIMARY KEY CLUSTERED 
(
	[tconst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[title_ratings_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title_ratings_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[tconst_r] [varchar](10) NOT NULL,
	[averageRating] [float] NULL,
	[numVotes] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles_genres_202201]    Script Date: 22/01/2022 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles_genres_202201](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[tconst_g] [varchar](10) NOT NULL,
	[genres] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[known_titles_202201]  WITH CHECK ADD  CONSTRAINT [knownForTitles] FOREIGN KEY([knownForTitles])
REFERENCES [dbo].[title_basics_202201] ([tconst])
GO
ALTER TABLE [dbo].[known_titles_202201] CHECK CONSTRAINT [knownForTitles]
GO
ALTER TABLE [dbo].[known_titles_202201]  WITH CHECK ADD  CONSTRAINT [nconst_t] FOREIGN KEY([nconst_t])
REFERENCES [dbo].[name_basics_202201] ([nconst])
GO
ALTER TABLE [dbo].[known_titles_202201] CHECK CONSTRAINT [nconst_t]
GO
ALTER TABLE [dbo].[professions_202201]  WITH CHECK ADD  CONSTRAINT [nconst_p] FOREIGN KEY([nconst_p])
REFERENCES [dbo].[name_basics_202201] ([nconst])
GO
ALTER TABLE [dbo].[professions_202201] CHECK CONSTRAINT [nconst_p]
GO
ALTER TABLE [dbo].[title_akas_202201]  WITH CHECK ADD  CONSTRAINT [titleId] FOREIGN KEY([titleId])
REFERENCES [dbo].[title_basics_202201] ([tconst])
GO
ALTER TABLE [dbo].[title_akas_202201] CHECK CONSTRAINT [titleId]
GO
ALTER TABLE [dbo].[title_ratings_202201]  WITH CHECK ADD  CONSTRAINT [tconst_r] FOREIGN KEY([tconst_r])
REFERENCES [dbo].[title_basics_202201] ([tconst])
GO
ALTER TABLE [dbo].[title_ratings_202201] CHECK CONSTRAINT [tconst_r]
GO
ALTER TABLE [dbo].[titles_genres_202201]  WITH CHECK ADD  CONSTRAINT [tconst_g] FOREIGN KEY([tconst_g])
REFERENCES [dbo].[title_basics_202201] ([tconst])
GO
ALTER TABLE [dbo].[titles_genres_202201] CHECK CONSTRAINT [tconst_g]
GO
