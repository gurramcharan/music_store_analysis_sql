--Set 2: Q1: Write query to return the email, first name, last name, & Genre of all Rock Music
-- listeners. Return your list ordered alphabetically by email starting with A
SELECT DISTINCT
	CUS.EMAIL,
	CUS.FIRST_NAME,
	CUS.LAST_NAME,
	GENRE.NAME
FROM
	CUSTOMER CUS
	JOIN INVOICE ON CUS.CUSTOMER_ID = INVOICE.CUSTOMER_ID
	JOIN INVOICE_LINE ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
	JOIN TRACK ON TRACK.TRACK_ID = INVOICE_LINE.TRACK_ID
	JOIN GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE
	GENRE.NAME LIKE 'Rock'
ORDER BY
	CUS.EMAIL

-- Set2: Q2: Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands
SELECT
	ARTIST.ARTIST_ID,
	ARTIST.NAME,
	COUNT(ARTIST.ARTIST_ID) AS NO_OF_SONGS
FROM
	ARTIST
	JOIN ALBUM ON ARTIST.ARTIST_ID = ALBUM.ARTIST_ID
	JOIN TRACK ON ALBUM.ALBUM_ID = TRACK.ALBUM_ID
	JOIN GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE
	GENRE.NAME LIKE 'Rock'
GROUP BY
	ARTIST.ARTIST_ID
ORDER BY
	NO_OF_SONGS DESC
LIMIT 10;

-- Set2: Q3: Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the
-- longest songs listed first
SELECT
	NAME,
	MILLISECONDS
FROM
	TRACK
WHERE
	MILLISECONDS > (
		SELECT
			AVG(MILLISECONDS) AS AVG_TRACK_LENGTH
		FROM
			TRACK
	)
ORDER BY
	MILLISECONDS DESC