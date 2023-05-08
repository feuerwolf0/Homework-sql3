-- 2.1 Название и продолжительность самого длительного трека.
SELECT title, duration 
FROM tracks t
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT title, duration 
FROM tracks t 
WHERE duration > 3.5*60;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM collections c 
WHERE year BETWEEN 2018 AND 2020;

-- 2.4 Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artists a 
WHERE name NOT LIKE '% %';

-- 2.4 Альтернативный вариант
SELECT name
FROM artists a 
WHERE name !~ ' ';

--2.5 Название треков, которые содержат слово «мой» или «my». (Изменил на "My" чтобы был трек)
SELECT title
FROM tracks t 
WHERE title LIKE '% My %' OR title LIKE '% мой %';

-- 3.1 Количество исполнителей в каждом жанре.
SELECT genre, COUNT(*)
FROM genres g
JOIN genre_artist ga ON g.genre_id = ga.genre_id 
JOIN artists a ON a.artist_id = ga.artist_id 
GROUP BY genre;

-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(track_id)
FROM tracks 
JOIN albums a ON a.album_id = tracks.album_id 
WHERE a.year BETWEEN 2019 AND 2020;

-- 3.3 Средняя продолжительность треков по каждому альбому.
SELECT a.title , AVG(duration)
FROM albums a 
JOIN tracks t ON t.album_id = a.album_id 
GROUP BY a.title;

-- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году. (В 2020 албом выпущен у Boris Brejcha)
SELECT name
FROM artists a
WHERE a.name NOT IN (
	SELECT a.name 
	FROM artists
    JOIN album_artist aa ON aa.artist_id = a.artist_id
	JOIN albums alb ON alb.album_id = aa.album_id
	WHERE alb.year = 2020
);

-- 3.5 Названия сборников, в которых присутствует конкретный исполнитель (Boys Noize 5 и 7 трек есть в двух коллекциях).
SELECT c.title
FROM collections c 
JOIN collection_track ct ON ct.collection_id = c.collection_id 
JOIN tracks t ON t.track_id = ct.track_id 
JOIN albums a ON a.album_id = t.album_id 
JOIN album_artist aa ON aa.album_id = t.track_id 
JOIN artists art ON art.artist_id = aa.artist_id 
WHERE art.name = 'Boys Noize';  

-- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра. (У No name 41 2 жанра.)
SELECT DISTINCT a.title
FROM albums a
JOIN album_artist aa ON aa.album_id = a.album_id 
JOIN genre_artist ga ON ga.artist_id = aa.artist_id
GROUP BY a.album_id, ga.artist_id 
HAVING COUNT(ga.genre_id) > 1;


-- 4.2 Наименования треков, которые не входят в сборники.
SELECT t.title
FROM tracks t
WHERE t.track_id NOT IN (
	SELECT track_id
	FROM collection_track ct
);

-- 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a.name, t.duration 
FROM artists a 
JOIN album_artist aa ON aa.artist_id = a.artist_id 
JOIN tracks t ON t.album_id = aa.album_id 
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- 4.4 Названия альбомов, содержащих наименьшее количество треков.
SELECT a.title
FROM albums a
JOIN tracks t ON t.album_id = a.album_id
GROUP BY a.album_id
HAVING COUNT(t.track_id) = (
	SELECT COUNT(t2.track_id)
	FROM tracks t2 
	GROUP BY t2.album_id
	ORDER BY 1
	LIMIT 1);