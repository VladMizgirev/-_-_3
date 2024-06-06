CREATE TABLE IF NOT EXISTS genres (
	genre_id INTEGER PRIMARY KEY,
	title VARCHAR(40) NOT null
	);

CREATE TABLE IF NOT EXISTS executor (
	executor_id INTEGER PRIMARY KEY,
	name_executor VARCHAR(40) NOT null
	);

CREATE TABLE IF NOT EXISTS albums (
	album_id INTEGER PRIMARY KEY,
	name_album VARCHAR(40) NOT null,
	year_of_release INTEGER NOT null CHECK(year_of_release >1900 AND year_of_release < 2025)
	);

CREATE TABLE IF NOT EXISTS tracks (
	track_id INTEGER PRIMARY kEY,
	album_id INTEGER references albums(album_id),
	name_track VARCHAR(40) NOT null,
	year_of_release INTEGER NOT null CHECK(year_of_release >1900 AND year_of_release < 2025),
    duration INTEGER NOT null CHECK(duration >60 AND duration < 6000)
	);

CREATE TABLE IF NOT EXISTS collections (
	collection_id INTEGER PRIMARY kEY,
	name_collection VARCHAR(60) NOT null,
	year_of_release INTEGER NOT null CHECK(year_of_release >1900 AND year_of_release < 2025)
	);

CREATE TABLE IF NOT EXISTS genre_executor (
	genre_id INTEGER REFERENCES genres(genre_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, executor_id)
	);

CREATE TABLE IF NOT EXISTS album_executor (
	album_id INTEGER REFERENCES albums (album_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pkae PRIMARY KEY (album_id, executor_id)
	);
	
CREATE TABLE IF NOT EXISTS track_collection (
	collection_id INTEGER REFERENCES collections (collection_id),
	track_id INTEGER REFERENCES tracks (track_id),
	CONSTRAINT pktc PRIMARY KEY (track_id, collection_id)
	);

INSERT INTO genres (genre_id, title) VALUES (1, 'Рок');
INSERT INTO genres (genre_id, title) VALUES (2, 'Поп');
INSERT INTO genres (genre_id, title) VALUES (3, 'Рэп');

INSERT INTO executor (executor_id, name_executor) VALUES (1, 'Rammstein');
INSERT INTO executor (executor_id, name_executor) VALUES (2, 'Lil Jon');
INSERT INTO executor (executor_id, name_executor) VALUES (3, 'Анна Asti');
INSERT INTO executor (executor_id, name_executor) VALUES (4, 'Король и Шут');
INSERT INTO executor (executor_id, name_executor) VALUES (5, 'My chemical romance');
INSERT INTO executor (executor_id, name_executor) VALUES (6, 'МакSим');

INSERT INTO albums (album_id, name_album, year_of_release) VALUES (1, 'Made in Germany', 1995);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (2, 'Crunkest Hits (Clean)', 2011);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (3, 'Царица (Делюкс)', 2023);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (4, 'Король и Шут', 1998);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (5, 'Mutter', 2001);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (6, 'Rammstein', 2019);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (7, 'Мой рай', 2007);
INSERT INTO albums (album_id, name_album, year_of_release) VALUES (8, 'Remixes', 2020);

INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (1, 1, 'Du Hast', 1995, 234);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (2, 5, 'Fuer Frei', 2001, 189);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (3, 2, 'Yeah', 2011, 249);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (4, 3, 'Царица', 2023, 215);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (5, 4, 'Кукла Колдуна', 1998, 203);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (6, 4, 'Прыгну со скалы', 1998, 192);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (7, 6, 'DEUTSCHLAND', 2019, 322);
INSERT INTO tracks (track_id, album_id, name_track, year_of_release, duration) VALUES (8, 7, 'Мой рай', 2007, 215);

INSERT INTO collections (collection_id, name_collection, year_of_release) VALUES (1, 'Кумиры зарубежного рока', 2007);
INSERT INTO collections (collection_id, name_collection, year_of_release) VALUES (2, 'Школьная дискотека 2000-х', 2022);
INSERT INTO collections (collection_id, name_collection, year_of_release) VALUES (3, 'Поп-музыка для свадебной вечеринки', 2023);
INSERT INTO collections (collection_id, name_collection, year_of_release) VALUES (4, 'РУССКИЙ РОК / 100 лучших песен', 2023);
INSERT INTO collections (collection_id, name_collection, year_of_release) VALUES (5, 'Хиты FM 2019', 2019);

INSERT INTO genre_executor (genre_id, executor_id) VALUES (1, 1);
INSERT INTO genre_executor (genre_id, executor_id) VALUES (1, 4);
INSERT INTO genre_executor (genre_id, executor_id) VALUES (2, 3);
INSERT INTO genre_executor (genre_id, executor_id) VALUES (3, 2);
INSERT INTO genre_executor (genre_id, executor_id) VALUES (1, 5);
INSERT INTO genre_executor (genre_id, executor_id) VALUES (2, 6);

INSERT INTO album_executor (album_id, executor_id) VALUES (1, 1);
INSERT INTO album_executor (album_id, executor_id) VALUES (5, 1);
INSERT INTO album_executor (album_id, executor_id) VALUES (2, 2);
INSERT INTO album_executor (album_id, executor_id) VALUES (3, 3);
INSERT INTO album_executor (album_id, executor_id) VALUES (4, 4);
INSERT INTO album_executor (album_id, executor_id) VALUES (6, 1);
INSERT INTO album_executor (album_id, executor_id) VALUES (7, 6);
INSERT INTO album_executor (album_id, executor_id) VALUES (8, 1);

INSERT INTO track_collection (collection_id, track_id) VALUES (1, 1);
INSERT INTO track_collection (collection_id, track_id) VALUES (2, 3);
INSERT INTO track_collection (collection_id, track_id) VALUES (3, 4);
INSERT INTO track_collection (collection_id, track_id) VALUES (4, 5);
INSERT INTO track_collection (collection_id, track_id) VALUES (1, 2);
INSERT INTO track_collection (collection_id, track_id) VALUES (4, 6);

with AA as (select MAX(duration) MAX_D from tracks)
select name_track, duration from tracks A 
join AA on A.duration = AA.MAX_D;
 
select name_track, duration from tracks A 
where A.duration = (select MAX(duration) MAX_D from tracks );

select name_track, MAX(duration) from tracks
GROUP BY name_track
limit 1;

select name_track From tracks
where 210 <= duration;

select name_collection from collections
where 2018 <= year_of_release and year_of_release <= 2021; 

select name_executor from executor
where name_executor not like '% %';

select name_track from tracks 
where name_track ilike 'my %' 
or name_track ilike 'мой %'
or name_track ilike '% my'
or name_track ilike '% мой';

SELECT title, COUNT(executor_id) g_e FROM genres f
JOIN genre_executor a ON f.genre_id = a.genre_id
GROUP BY f.title;

select COUNT(track_id) from tracks
where 2019 <= year_of_release and year_of_release <= 2021;

SELECT name_album, AVG(duration) t_d FROM albums f
JOIN tracks a ON f.album_id = a.album_id
GROUP BY f.name_album;

SELECT name_executor FROM executor f
JOIN albums a ON a.year_of_release = 2020
JOIN album_executor b ON a.album_id = b.album_id and f.executor_id != b.executor_id
GROUP BY f.name_executor;

SELECT name_executor
FROM executor
WHERE name_executor NOT in (
	SELECT name_executor FROM executor f
    JOIN album_executor a ON f.executor_id = a.executor_id
    JOIN albums b ON b.album_id = a.album_id
    WHERE year_of_release = 2020);

select name_collection from collections f
JOIN album_executor a ON a.executor_id = 1
JOIN tracks b on b.album_id = a.album_id
join track_collection c on b.track_id  = c.track_id and f.collection_id = c.collection_id 
GROUP BY f.name_collection;

SELECT DISTINCT name_collection
FROM collections f
JOIN track_collection a ON f.collection_id = a.collection_id
JOIN tracks b ON b.track_id = a.track_id 
JOIN albums c ON b.album_id = c.album_id
JOIN album_executor d ON d.album_id = c.album_id
JOIN executor e ON d.executor_id = e.executor_id
WHERE name_executor = 'Rammstein'; 