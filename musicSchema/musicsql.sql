CREATE TABLE artists (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(10)
);

CREATE TABLE songs (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(10),
    album_id integer,
    FOREIGN KEY(album_id) REFERENCES album(id)

);

CREATE TABLE albums (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(10),
    artist_id integer,
    FOREIGN KEY(artist_id) REFERENCES artists(id)
);

CREATE TABLE tracklist(
    id integer PRIMARY KEY AUTOINCREMENT,
    song_id integer,
    album_id integer,
    FOREIGN KEY (song_id) REFERENCES songs(id),
    FOREIGN KEY (album_id)  REFERENCES albums(id)
);

INSERT INTO artists (name) VALUES ('Kanye');
INSERT INTO artists (name) VALUES ('Drake');


INSERT INTO songs (name, album_id) VALUES ('Off the Grid', 1);
INSERT INTO songs (name, album_id) VALUES ('Donda', 1);
INSERT INTO songs (name, album_id) VALUES ('5am in Toronto', 2);
INSERT INTO songs (name, album_id) VALUES ('6am in Toronto', 2);


INSERT INTO albums(name, artist_id) VALUES ('DONDA', 1);
INSERT INTO albums(name, artist_id) VALUES ('CLB', 2);


INSERT INTO songalbum(song_id, album_id) VALUES (1, 1);
INSERT INTO songalbum(song_id, album_id) VALUES (2, 1);
INSERT INTO songalbum(song_id, album_id) VALUES (1, 2);
INSERT INTO songalbum(song_id, album_id) VALUES (2, 2);

CREATE INDEX song_index ON songalbum(song_id);

EXPLAIN QUERY PLAN SELECT * FROM songalbum WHERE id = 1;
EXPLAIN QUERY PLAN SELECT * FROM songalbum WHERE  song_id = 1;


SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM songs;
SELECT * FROM songalbum;

