DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions 
(id SERIAL PRIMARY KEY, 
region_name TEXT NOT NULL);

CREATE TABLE users 
(id SERIAL PRIMARY KEY, 
username TEXT NOT NULL UNIQUE, 
preferred_region INTEGER REFERENCES regions(id));

CREATE TABLE posts 
(id SERIAL PRIMARY KEY, 
title TEXT NOT NULL, 
post_text TEXT NOT NULL, 
author INTEGER REFERENCES users(id), 
region INTEGER REFERENCES regions(id), 
category INTEGER REFERENCES categories(id));

CREATE TABLE categories 
(id SERIAL PRIMARY KEY, 
cat_name TEXT NOT NULL, 
cat_description TEXT NOT NULL);