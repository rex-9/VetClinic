-- day 1
SELECT * from pets WHERE name LIKE '%mon';
SELECT name from pets WHERE birth_date BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from pets WHERE neutered IS true and escape_attempts < 3;
SELECT birth_date from pets WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from pets WHERE weight_kg > 10.5;
SELECT * from pets WHERE neutered is true;
SELECT * from pets WHERE name != 'Gabumon';
SELECT * from pets WHERE weight_kg between 10.4 and 17.3;

-- day 2
BEGIN;
ALTER TABLE pets
RENAME COLUMN species TO unspecified; -- rename column from species to unspecified
ROLLBACK; -- screenshot is species.png
SELECT * FROM pets;

UPDATE pets
SET species = 'Digimon' WHERE name LIKE '%mon'; -- Set species of Digimon to the pets that have 'mon' in the end of their name

UPDATE pets
SET species = 'Pokemon' WHERE species ISNULL; -- Set species of Pokemon to the pets WHERE species IS NULL;
SELECT * FROM pets;

COMMIT;
SELECT * FROM pets;
BEGIN;
DELETE FROM pets; -- Delete all rows from the pets table
SELECT * FROM pets;
ROLLBACK; -- screenshot is delete.png
SELECT * FROM pets;
UPDATE pets
SET weight_kg = weight_kg * -1 WHERE species = 'Pokemon'; -- Make weights negative;

BEGIN;
DELETE FROM pets WHERE birth_date > '2022-01-01'; -- Delete pets after 2022;

SAVEPOINT sp1; -- Savepoint

UPDATE pets
SET weight_kg = weight_kg * -1; -- Make weights negative;

ROLLBACK TO sp1; -- Rollback to savepoint

UPDATE pets
SET weight_kg = weight_kg * -1 -- Make all weights positive;
WHERE weight_kg < 0; -- screenshot is weights.png

SELECT COUNT(*) FROM pets; -- How many pets are there?
SELECT COUNT(*) FROM pets WHERE escape_attempts = 0; -- How many pets have never tried to escape?
SELECT AVG(weight_kg) FROM pets; -- What is the average weight of all pets?
SELECT MAX(escape_attempts), neutered FROM pets GROUP BY neutered; -- Maximum number of escape attempts per neutered status
SELECT Min(weight_kg), Max(weight_kg), COUNT(weight_kg), species FROM pets GROUP BY species; -- Min and Max weight of Pokemon and Digimon
SELECT AVG(escape_attempts), species, birth_date FROM pets GROUP BY species, birth_date HAVING birth_date BETWEEN '1990-01-01' AND '2000-12-31'; -- What is the average number of escape attempts per pet type of those born between 1990 and 2000?
-- screenshot for the above 6 operations is aggregates.png

SELECT name, full_name FROM pets INNER JOIN owners ON pets.owner_id = owners.id WHERE owners.id = 4; -- Which pets belong to Melody Pond?
SELECT pets.name, species.name FROM pets INNER JOIN species ON pets.species_id = species.id WHERE species.id = 1; -- List of all pets that are Pokemon.
SELECT name, full_name FROM pets FULL JOIN owners ON pets.owner_id = owners.id; -- List of all owners and their pets, regardless of whether they own a pet or not.
SELECT COUNT(*), species.name FROM pets, species WHERE pets.species_id = species.id GROUP BY species.name; -- How many pets are there for each species?
SELECT name, full_name FROM pets JOIN owners ON pets.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' and species_id = 2; -- List all Digimon owned by Jennifer Orwell.
SELECT name, full_name FROM pets JOIN owners ON pets.owner_id = owners.id WHERE full_name = 'Dean Winchester' and escape_attempts = 0; -- List all pets owned by Dean Winchester that have never tried to escape.
SELECT owners.full_name , COUNT(pets.name) AS total_animals FROM owners JOIN pets ON pets.owner_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1; -- Max pets owned by an owner.
