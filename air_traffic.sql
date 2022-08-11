-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY, 
  seat TEXT NOT NULL, 
  airline INTEGER REFERENCES airlines(id)
  departure TIMESTAMP NOT NULL, 
  arrival TIMESTAMP NOT NULL, 
  from_city INTEGER REFERENCES cities(id),
  from_country INTEGER REFERENCES countries(id), 
  to_city INTEGER REFERENCES cities(id), 
  to_country INTEGER REFERENCES countries(id), 
  passenger INTEGER REFERENCES passengers(id)
);

CREATE TABLE passengers 
(id SERIAL PRIMARY KEY, 
first_name TEXT NOT NULL, 
last_name TEXT);

CREATE TABLE airlines 
(id SERIAL PRIMARY KEY 
airline_name TEXT NOT NULL);

CREATE TABLE cities 
(id SERIAL PRIMARY KEY 
city_name TEXT NOT NULL)

CREATE TABLE countries 
(id SERIAL PRIMARY KEY 
country_name TEXT NOT NULL)