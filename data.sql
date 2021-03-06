/* Populate database with sample data. */

 INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts ) VALUES ('Agumon' , '2020-02-03', 10.23 , TRUE, 0);

 INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts ) VALUES ('Gabumon' , '2018-11-15', 8.00 , TRUE, 2);
 INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts ) VALUES ('Pikachu' , '2021-01-07', 15.04 , FALSE, 1);
 INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts ) VALUES ('Devimon' , '2017-05-12', 11.00 , TRUE, 5);
 INSERT INTO animals ( name, date_of_birth, weight_kg, neutered, escape_attempts ) VALUES 
 ('Charmander' , '2020-02-08', -11.00 , FALSE, 0),
 ('Plantmon' , '2021-11-15', -5.70 , TRUE, 2),
 ('Squirtle' , '1993-04-02', -12.13 , FALSE, 3),
 ('Angemon' , '2005-06-12', -45.00 , TRUE, 1),
 ('Boarmon' , '2005-06-07', 20.40 , TRUE, 7),
 ('Blossom' , '1998-10-13', 17.00 , TRUE, 3),
 ('Ditto' , '2022-05-14', 22.00 , TRUE, 4);

 INSERT INTO owners (full_name, age) VALUES
 ('Sam Smith', 34),
 ('Jennifer Orwell', 19),
 ('Bob', 45),
 ('Melody Pond',77),
 ('Dean Winchester',14),
 ('Jodie Whittaker',38);
 SELECT * FROM owners;

 INSERT INTO species (name) VALUES
 ('Pokemon'), ('Digimon');
 SELECT name FROM species;

 UPDATE animals
 SET species_id = 1
 WHERE name like '%mon';
 SELECT name,species_id FROM animals;

 UPDATE animals
 SET species_id = 2
 WHERE species_id IS NULL;
 SELECT name,species_id FROM animals;

 UPDATE animals
 SET owner_id = (
   SELECT id FROM owners
   WHERE full_name = 'Sam Smith'
 )
 WHERE name = 'Agumon';
 SELECT name,owner_id FROM animals
 WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (
   SELECT id FROM owners
   WHERE full_name = 'Jennifer Orwell'
 )
 WHERE name IN ('Gabumon', 'Pikachu');
 SELECT name,owner_id FROM animals
 WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (
   SELECT id FROM owners
   WHERE full_name = 'Bob'
 )
 WHERE name IN ('Devimon', 'Plantmon');
 SELECT name,owner_id FROM animals
 WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (
   SELECT id FROM owners
   WHERE full_name = 'Melody Pond'
 )
 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
 SELECT name,owner_id FROM animals
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (
   SELECT id FROM owners
   WHERE full_name = 'Dean Winchester'
 )
 WHERE name IN ('Angemon', 'Boarmon');
 SELECT name,owner_id FROM animals
 WHERE name IN ('Angemon', 'Boarmon');

 INSERT INTO vets (name, age, date_of_graduation) VALUES
 ('William Tatcher', 45, '2000-04-23'),
 ('Maisy Smith', 26, '2019-01-17'),
 ('Stephanie Mendez', 64, '1981-05-04'),
 ('Jack Harkness', 38, '2008-06-08');
 SELECT * FROM vets;

 INSERT INTO specializations (vet_id, species_id) VALUES
 (1, 1), (3, 1), (3, 2), (4, 2);

 INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
 (1, 1, '2020-05-24'), (1, 3, '2020-07-22'),
 (2, 4, '2021-02-02'),
 (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'),
 (4, 3, '2021-05-04'),
 (5, 4, '2021-02-24'),
 (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), (6, 2, '2021-04-07'),
 (7, 3, '2019-09-29'),
 (8, 4, '2020-10-03'), (8, 4, '2020-11-04'),
 (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), (9, 2, '2020-08-03'),
 (10, 3, '2020-05-24'), (10, 1, '2021-01-11');

-- vet-clinc perfomance
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';