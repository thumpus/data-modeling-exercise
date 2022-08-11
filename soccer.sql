DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams 
(id SERIAL PRIMARY KEY, 
team_name TEXT NOT NULL, 
city TEXT);

CREATE TABLE players 
(id SERIAL PRIMARY KEY, 
first_name TEXT NOT NULL, 
last_name TEXT, 
team INTEGER REFERENCES teams(id));

CREATE TABLE goals 
(id SERIAL PRIMARY KEY, 
scoring_player INTEGER REFERENCES players(id), 
scoring_team INTEGER REFERENCES teams(id), 
match INTEGER REFERENCES matches(id));

CREATE TABLE matches 
(id SERIAL PRIMARY KEY, 
home_team INTEGER REFERENCES teams(id), 
away_team INTEGER REFERENCES teams(id),
referee INTEGER REFERENCES referees(id), 
season INTEGER REFERENCES seasons(id));

CREATE TABLE referees 
(id SERIAL PRIMARY KEY, 
first_name TEXT NOT NULL, 
last_name TEXT);

CREATE TABLE seasons 
(id SERIAL PRIMARY KEY, 
season_start DATE, 
season_end DATE);

CREATE TABLE rankings 
(id SERIAL PRIMARY KEY 
rank INTEGER, 
team INTEGER REFERENCES teams(id));
