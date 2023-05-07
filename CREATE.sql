-- таблица всех артистов
CREATE TABLE IF NOT EXISTS artists (
artist_id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE
);

-- таблица всех жанров
CREATE TABLE IF NOT EXISTS genres (
genre_id SERIAL PRIMARY KEY,
genre VARCHAR(255) NOT NULL UNIQUE
);

-- промежуточная таблица жанр-артист
CREATE TABLE IF NOT EXISTS genre_artist (
artist_id INTEGER NOT NULL REFERENCES artists(artist_id),
genre_id INTEGER NOT NULL REFERENCES genres(genre_id)
);

-- таблица всех албомов
CREATE TABLE IF NOT EXISTS albums (
album_id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
year INTEGER NOT NULL CHECK(year >= 1500 AND year <= 2023) --год выпуска больше 1500 и меньше 2023 включительно
);

--промежуточная таблица альбом-артист
CREATE TABLE IF NOT EXISTS album_artist (
album_id INTEGER NOT NULL REFERENCES albums(album_id),
artist_id INTEGER NOT NULL REFERENCES artists(artist_id)
);

--таблица всех треков
CREATE TABLE IF NOT EXISTS tracks (
track_id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
duration INTEGER NOT NULL CHECK(duration > 0),
album_id INTEGER NOT NULL REFERENCES albums(album_id)
);

-- таблица всех сборников
CREATE TABLE IF NOT EXISTS collections (
collection_id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
year INTEGER NOT NULL CHECK(year >= 1500 AND year <= 2023) --год выпуска больше 1500 и меньше 2023 включительно
);

--промежуточная таблица сборник-трек
CREATE TABLE IF NOT EXISTS collection_track (
track_id INTEGER NOT NULL REFERENCES tracks(track_id),
collection_id INTEGER NOT NULL REFERENCES collections(collection_id)
);

