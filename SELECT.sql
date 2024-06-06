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
