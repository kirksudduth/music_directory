SELECT SongId, Title, ReleaseDate
FROM Song;

SELECT *
FROM Genre;

INSERT INTO
Artist
VALUES
    (null, "Madlib", 1997);

INSERT INTO
Album
    (AlbumId,
    Title,
    ReleaseDate,
    AlbumLength,
    Label,
    ArtistId,
    GenreId
    )
SELECT null,
    "Bandana",
    "08/25/2019",
    2847,
    "Fuzzy Ear",
    ArtistId,
    GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Madlib" and Genre.Label = "Rap";

INSERT INTO
Album
    (AlbumId,
    Title,
    ReleaseDate,
    AlbumLength,
    Label,
    ArtistId,
    GenreId
    )
SELECT null,
    "Bad Neighbor Instrumentals",
    "02/16/2015",
    2587,
    "Fuzzy Ear",
    ArtistId,
    GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Madlib" and Genre.Label = "Rap";


INSERT INTO
Song
    (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT null, "Peroxide", 530, Album.ReleaseDate, Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Album, Genre, Artist
WHERE Album.Title LIKE "%Bad%" and Genre.Label = "Rap" and Artist.ArtistName LIKE "%Madl%" and Album.Title LIKE "%Bad Neigh%";

INSERT INTO
Song
    (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT null, "Knock Knock", 287, Album.ReleaseDate, Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Album, Genre, Artist
WHERE Album.Title LIKE "%Bad%" and Genre.Label = "Rap" and Artist.ArtistName LIKE "%Madl%" and Album.Title LIKE "%Bad Neigh%";

INSERT INTO
Song
    (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT null, "Crime Pays", 269, Album.ReleaseDate, Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Album, Genre, Artist
WHERE Album.Title LIKE "%Banda%" and Genre.Label = "Rap" and Artist.ArtistName LIKE "%Madl%" AND Album.Title LIKE "%Banda%";

SELECT Song.Title as "Song Title", Album.Title as "Album Title", Artist.ArtistName as "Artist Name"
FROM Song
    JOIN Album ON Song.AlbumId = Album.AlbumId
    JOIN Artist ON Song.ArtistId = Artist.ArtistId
WHERE Artist.ArtistName = "Madlib";

-- #6
SELECT COUNT() as "Total Songs on Album", Album.Title
FROM Song
    JOIN Album ON Song.AlbumId = Album.AlbumId
GROUP BY Song.AlbumId;

-- #7
SELECT COUNT() as "Total Songs Per Artist", Artist.ArtistName
FROM Song
    JOIN Artist ON Song.ArtistId = Artist.ArtistId
GROUP BY Song.ArtistId;

-- #8
SELECT COUNT() as "Total Songs Per Genre", Genre.Label
FROM Song
    JOIN Genre ON Song.GenreId = Genre.GenreId
GROUP BY Song.GenreId;

-- #9
SELECT MAX(Album.AlbumLength) as "Longest Album", Album.Title
FROM Album