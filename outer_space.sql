-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES celestial_bodies(id),
  galaxy INTEGER REFERENCES galaxies(id),
);

CREATE TABLE celestial_bodies 
(
  id SERIAL PRIMARY KEY,
  body_name TEXT NOT NULL,
  galaxy INTEGER REFERENCES galaxies(id)
);

CREATE TABLE galaxies 
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  orbits_around INTEGER REFERENCES planets(id)
)