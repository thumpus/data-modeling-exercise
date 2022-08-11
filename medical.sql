DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(id SERIAL PRIMARY KEY, 
first_name TEXT NOT NULL, 
last_name TEXT, 
center INTEGER REFERENCES centers(id))

CREATE TABLE centers 
(id SERIAL PRIMARY KEY, 
ctr_name TEXT NOT NULL) 

CREATE TABLE patients 
(id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL, 
last_name TEXT)

CREATE TABLE docs_patients 
(id SERIAL PRIMARY KEY, 
doctor INTEGER REFERENCES doctors (id), 
patient INTEGER REFERENCES patients (id))

CREATE TABLE diseases 
(id SERIAL PRIMARY KEY,
disease_name TEXT NOT NULL, 
treatment TEXT NOT NULL)

CREATE TABLE diagnoses 
(id SERIAL PRIMARY KEY, 
patient INTEGER REFERENCES patients(id), 
diagnosis INTEGER REFERENCES diseases(id))
