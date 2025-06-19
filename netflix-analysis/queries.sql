Share of movies vs. series in the entire catalog

SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;

How many movies and TV shows were added to Netflix in successive years?
  
SELECT EXTRACT(YEAR FROM date_added) AS year_added,
       COUNT(*) AS titles_added
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

What are the most popular genres on Netflix?

SELECT TRIM(UNNEST(string_to_array(listed_in, ','))) AS genre,
       COUNT(*) AS count
FROM netflix_titles
GROUP BY genre
ORDER BY count DESC
LIMIT 10;

Top 10 most frequent directors

SELECT director, COUNT(*) AS count
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY count DESC
LIMIT 10;
