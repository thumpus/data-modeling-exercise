-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INTEGER REFERENCES artists(id),
  album INTEGER REFERENCES albums(id),
  producers INTEGER REFERENCES producers(id)
);

CREATE TABLE artists 
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE albums 
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  artist INTEGER REFERENCES artists(id),
  producer INTEGER REFERENCES producers(id),
)

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
)