-- Day 1
SELECT * from pets WHERE name LIKE '%mon';
SELECT name from pets WHERE birth_date BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from pets WHERE neutered IS true and escape_attempts < 3;
SELECT birth_date from pets WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from pets WHERE weight_kg > 10.5;
SELECT * from pets WHERE neutered is true;
SELECT * from pets WHERE name != 'Gabumon';
SELECT * from pets WHERE weight_kg between 10.4 and 17.3;

-- Day 2
BEGIN;
ALTER TABLE pets
RENAME COLUMN species TO unspecified; -- rename column from species to unspecified
ROLLBACK; -- screenshot is species.png

UPDATE pets
SET species = 'Digimon' WHERE name LIKE '%mon'; -- Set species of Digimon to the pets that have 'mon' in the end of their name

UPDATE pets
SET species = 'Pokemon' WHERE species ISNULL; -- Set species of Pokemon to the pets WHERE species IS NULL;

COMMIT;
BEGIN;
DELETE FROM pets; -- Delete all rows from the pets table
ROLLBACK; -- screenshot is delete.png
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

-- Day 3
SELECT name, full_name FROM pets INNER JOIN owners ON pets.owner_id = owners.id WHERE owners.id = 4; -- Which pets belong to Melody Pond?
SELECT pets.name, species.name FROM pets INNER JOIN species ON pets.species_id = species.id WHERE species.id = 1; -- List of all pets that are Pokemon.
SELECT name, full_name FROM pets FULL JOIN owners ON pets.owner_id = owners.id; -- List of all owners and their pets, regardless of whether they own a pet or not.
SELECT COUNT(*), species.name FROM pets, species WHERE pets.species_id = species.id GROUP BY species.name; -- How many pets are there for each species?
SELECT name, full_name FROM pets JOIN owners ON pets.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' and species_id = 2; -- List all Digimon owned by Jennifer Orwell.
SELECT name, full_name FROM pets JOIN owners ON pets.owner_id = owners.id WHERE full_name = 'Dean Winchester' and escape_attempts = 0; -- List all pets owned by Dean Winchester that have never tried to escape.
SELECT owners.full_name , COUNT(pets.name) AS total_animals FROM owners JOIN pets ON pets.owner_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1; -- Max pets owned by an owner.

-- Day 4
SELECT pets.name, vets.name, visits.visit_date FROM pets JOIN visits ON pets.id = visits.pet_id JOIN vets ON vets.id = visits.vet_id WHERE vets.id = 1 ORDER BY visits.visit_date DESC LIMIT 1; -- Who was the last pet seen by William Tatcher?
SELECT COUNT(pets.name), vets.name FROM pets JOIN visits ON pets.id = visits.pet_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name; -- How many different animals did Stephanie Mendez see?
SELECT species.name, vets.name FROM vets FULL JOIN specializations ON specializations.vet_id = vets.id FULL JOIN species ON species.id = specializations.species_id; -- List all vets and their specialties, including vets with no specialties.
SELECT pets.name, vets.name, visits.visit_date FROM vets FULL JOIN visits ON visits.vet_id = vets.id FULL JOIN pets ON pets.id = visits.pet_id WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30'; -- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020?
SELECT COUNT(pets.name), pets.name FROM vets JOIN visits ON visits.vet_id = vets.id JOIN pets ON pets.id = visits.pet_id GROUP BY pets.name ORDER BY count DESC LIMIT 1; -- What animal has the most visits to vets?
SELECT vets.name, pets.name, visits.visit_date FROM vets JOIN visits ON visits.vet_id = vets.id JOIN pets ON pets.id = visits.pet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visit_date LIMIT 1; -- Who was Maisy Smith's first visit?
SELECT pets.name AS pet, pets.birth_date, pets.escape_attempts, pets.neutered, pets.weight_kg, species.name, vets.name AS vet, vets.age, vets.graduation_date, visits.visit_date FROM vets JOIN visits ON visits.vet_id = vets.id JOIN pets ON pets.id = visits.pet_id JOIN species ON pets.species_id = species.id ORDER BY visits.visit_date DESC LIMIT 1; -- Details for most recent visit: animal information, vet information, and date of visit.

SELECT pets.name, species.name AS species,
vets.name AS vet, vet_sp.name AS specialized
FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN pets ON visits.pet_id = pets.id
JOIN species ON species.id = pets.species_id
JOIN specializations ON specializations.vet_id = vets.id
JOIN species AS vet_sp ON vet_sp.id = specializations.species_id
WHERE species.id != vet_sp.id; --How many visits were with a vet that did not specialize in that animal's species?

SELECT species.name AS species
FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN pets ON visits.pet_id = pets.id
JOIN species ON species.id = pets.species_id
WHERE vets.name = 'Maisy Smith' GROUP BY species LIMIT 1; -- What specialty should Maisy Smith consider getting?


-- Indexing
explain analyze SELECT COUNT(*) FROM visits where pet_id = 4; -- Explain analyze query for visits where pet_id = 4

CREATE INDEX visits_asc ON visits(pet_id ASC); -- before index -> 1067ms, after index -> 408ms

explain analyze SELECT * FROM visits where vet_id = 2; -- Explain analyze query for visits where vet_id = 2



explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com'; -- Explain analyze query for owners where email = 'owner_18327@mail.com'



