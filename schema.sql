/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name text, date_of_birth date, escape_attempts integer,  neutered boolean, weight_kg decimal);
ALTER TABLE animals ADD species text;

CREATE TABLE owners ( id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, full_name text, age integer);
CREATE TABLE species ( id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name text);
ALTER TABLE animals DROP species;

ALTER TABLE animals ADD species_id integer, ADD FOREIGN KEY (species_id)  REFERENCES species(id);
ALTER TABLE animals ADD owner_id integer, ADD FOREIGN KEY (owner_id)  REFERENCES owners(id);