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

UPDATE pets
SET species = 'Digimon'
WHERE name LIKE '%mon'; -- Set species of Digimon to the pets that have 'mon' in the end of their name

UPDATE pets
SET species = 'Pokemon'
WHERE species ISNULL; -- Set species of Pokemon to the pets WHERE species IS NULL;

COMMIT;

BEGIN;
DELETE FROM pets; -- Delete all rows from the pets table
ROLLBACK; -- screenshot is delete.png

UPDATE pets
SET weight_kg = weight_kg * -1
WHERE species = 'Pokemon'; -- Make weights negative;

BEGIN;
DELETE FROM pets
WHERE birth_date > '2022-01-01'; -- Delete pets after 2022;

SAVEPOINT sp1; -- Savepoint

UPDATE pets
SET weight_kg = weight_kg * -1; -- Make weights negative;

ROLLBACK TO sp1; -- Rollback to savepoint

UPDATE pets
SET weight_kg = weight_kg * -1 -- Make all weights positive;
WHERE weight_kg < 0; -- screenshot is positive_weight.png

SELECT COUNT(*) FROM pets; -- How many pets are there?
SELECT COUNT(*) FROM pets WHERE escape_attempts = 0; -- How many pets have never tried to escape?
SELECT AVG(weight_kg) FROM pets; -- What is the average weight of all pets?
SELECT MAX(escape_attempts), neutered FROM pets GROUP BY neutered; -- Maximum number of escape attempts per neutered status
SELECT Min(weight_kg), Max(weight_kg), COUNT(weight_kg), species FROM pets GROUP BY species; -- Min and Max weight of Pokemon and Digimon
SELECT AVG(escape_attempts), species, birth_date FROM pets GROUP BY species, birth_date HAVING birth_date BETWEEN '1990-01-01' AND '2000-12-31'; -- What is the average number of escape attempts per pet type of those born between 1990 and 2000?



