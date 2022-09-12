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
ROLLBACK;

UPDATE pets
SET species = 'Digimon'
WHERE name LIKE '%mon'; -- Set species of Digimon to the pets that have 'mon' in the end of their name

UPDATE pets
SET species = 'Pokemon'
WHERE species ISNULL; -- Set species of Pokemon to the pets WHERE species IS NULL;

COMMIT;

BEGIN;
DELETE FROM pets; -- Delete all rows from the pets table
ROLLBACK;

UPDATE pets
SET weight_kg = weight_kg * -1
WHERE species = 'Pokemon'; -- Make weights negative;

BEGIN;
DELETE FROM pets
WHERE birth_date > '2022-01-01'; -- Delete pets after 2022;

SAVEPOINT sp1; -- Savepoint

UPDATE pets
SET weight_kg = weight_kg * -1; -- Make weights negative;

