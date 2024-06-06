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