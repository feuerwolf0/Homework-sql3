-- добавляю жанры
INSERT INTO genres(genre)
VALUES ('Техно'), ('Драм-н-бэйс'), ('Эмбиент'), ('Классика');

-- Добавляю исполнителей
INSERT INTO artists(name)
VALUES ('Эрик Сати'), ('Boris Brejcha'), ('Pendulum'), ('Boys Noize'), ('36'), ('No name 41');

-- Связываю артистов с жанрами
INSERT INTO genre_artist(artist_id, genre_id)
VALUES (1,4), (2,1), (3,2), (4,1), (5,3), (6,1), (6,2);

-- Добавляю альбомы
INSERT INTO albums(title, year)
VALUES ('Vodka & Orange EP', 2021), ('Gravity', 2019), ('Route de Paris', 2023), 
('Gymnopekiev', 2022), ('Sine Dust', 2015), ('Void Dance', 2015), ('Alarm', 2014), ('Mayday', 2016),
('Immersion', 2010), ('Elemental', 2021), ('Puzzle', 2020);

-- Связываю альбомы с исполнителями
INSERT INTO album_artist(album_id, artist_id)
VALUES (1,2), (2,2), (3,1), (4,1), (5,5), (6,5), (7,4), (8,4), (9,3), (10,3), (11, 2), (11, 6);

-- Добавляю треки (по 1-2 трека в альбом) duration в секундах
INSERT INTO tracks(title, duration, album_id)
VALUES ('Driver', 3*60+27, 10), ('Nothing for Free', 3*60+2, 10), ('Crush', 4*60+13, 9),
('Gymnopekiev', 3*60+51, 4), ('Overthrow', 4*60+46, 8), ('Mayday', 3*60+21, 8), ('Alarm', 3*60+14, 7),
('Diamond Rain', 3*60+24, 6), ('Drift Orbit', 5*60+22, 5), ('Gnossienne No. 3', 3*60+21, 3),('Gnossienne No. 1', 4*60+4, 3),
('Gravity', 3*60+36, 2), ('A Piece Of Light', 8*60+44, 1), ('Shake It Down', 7*60+56, 1), ('My Moon My Man (Boys Noize Classic Mix)', 6*60+42, 7);

-- добавляю сборники 
INSERT INTO collections (title, year)
VALUES ('Relax', 2023), ('Энергичная', 2019), ('Избранное', 2020), ('Классическая', 2021);

-- Связываю сборники с треками
INSERT INTO collection_track (track_id, collection_id)
VALUES (10,1), (11,1), (9,1), (4,1), (14,2), (13,2), (12,2), (7,2), (6,2), (5,2), (3,2), (2,2), (1,2),
(5,3), (7,3), (10,3), (3,3), (4,4), (10,4), (11,4);