/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
SELECT species FROM animals;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered ,AVG(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth 
BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT a.name AS "Animal", o.full_name AS "Owner name" FROM animals a
JOIN owners o
ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name AS "Animal", s.name AS "Type" FROM animals a
JOIN species s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT  owner_id,DISTINCT name FROM animals;
GROUP BY owner_id;

SELECT o.full_name AS Owner_name,STRING_AGG(a.name,', ')  AS
Animal FROM owners o
LEFT JOIN animals a ON a.owner_id = o.id
GROUP BY o.full_name;

SELECT s.name  AS Species,COUNT(*) AS Number FROM species s JOIN animals a
ON s.id = a.species_id
GROUP BY s.name;

SELECT a.name AS Animal,
s.name AS Species,
o.full_name AS Owner 
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' 
AND o.full_name = 'Jennifer Orwell';

SELECT a.name AS Animal,
o.full_name AS Owner, a.escape_attempts 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE  o.full_name = 'Dean Winchester'
AND a.escape_attempts = 0;


WITH COUNTCTE(name,no_of_animals) AS (
  SELECT o.full_name,COUNT(a.name) FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
)
SELECT * FROM COUNTCTE
WHERE no_of_animals = (SELECT MAX(no_of_animals) from COUNTCTE);




