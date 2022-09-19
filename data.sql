-- Day 1
INSERT INTO pets (name, birth_date, escape_attempts, neutered, weight_kg) VALUES ('Agumon', DATE '2020-02-03', 0, true, 10.23);
INSERT INTO pets (name, birth_date, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', DATE '2018-11-15', 2, true, 8);
INSERT INTO pets VALUES (3, 'Pikachu', DATE '2021-01-07', 1, false, 15.04);
INSERT INTO pets VALUES (4, 'Devimon', DATE '2017-05-12', 5, true, 11);

-- Day 2
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', DATE '2020-02-08', 0, false, -11.0);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', DATE '2021-11-15', 2, true, -5.7);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', DATE '1993-04-02', 3, false, -12.13);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', DATE '2005-06-12', 1, true, -45);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', DATE '2005-06-07', 7, true, 20.4);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', DATE '1998-10-13', 3, true, 17);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', DATE '2022-05-14', 4, true, 22);

-- Day 3
INSERT INTO species VALUES (1, 'Pokemon');
INSERT INTO species VALUES (2, 'Digimon');

INSERT INTO owners VALUES (1, 'Sam Smith', 34);
INSERT INTO owners VALUES (2, 'Jennifer Orwell', 19);
INSERT INTO owners VALUES (3, 'Bob', 45);
INSERT INTO owners VALUES (4, 'Melody Pond', 77);
INSERT INTO owners VALUES (5, 'Dean Winchester', 14);
INSERT INTO owners VALUES (6, 'Jodie Whittaker', 38);

UPDATE pets SET species_id = 2 WHERE name LIKE '%mon'; -- Update species_id column for Digimon
UPDATE pets SET species_id = 1 WHERE species_id IS NULL; -- Update species_id column for Pokemon

UPDATE pets SET owner_id = 1 WHERE name = 'Agumon'; -- Update owner_id column for Agumon
UPDATE pets SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu'); -- Update owner_id column for Gabumon and Pikachu
UPDATE pets SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon'); -- Update owner_id column for Devimon and Plantmon
UPDATE pets SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom'); -- Update owner_id column for Charmander, Squirtle and Blossom
UPDATE pets SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon'); -- Update owner_id column for Angemon and Boarmon

-- Day 4
INSERT INTO vets VALUES (1, 'William Tatcher', 45, '2000-04-23'),
(2, 'Maisy Smith', 26, '2019-01-17'),
(3, 'Stephanie Mendez', 64, '1981-05-04'),
(4, 'Jack Harkness', 38, '2008-06-08'); -- Insert new vets

INSERT INTO specializations VALUES (1, 1), (3, 1), (3, 2), (4, 2); -- Insert new specializations

INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-05-24' FROM vets JOIN pets ON pets.name = 'Agumon' AND vets.name = 'William Tatcher';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-07-22' FROM vets JOIN pets ON pets.name = 'Agumon' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2021-02-02' FROM vets JOIN pets ON pets.name = 'Gabumon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-01-05' FROM vets JOIN pets ON pets.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-03-08' FROM vets JOIN pets ON pets.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-05-14' FROM vets JOIN pets ON pets.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2021-05-04' FROM vets JOIN pets ON pets.name = 'Devimon' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2021-02-24' FROM vets JOIN pets ON pets.name = 'Charmander' AND vets.name = 'Jack Harkness';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2019-12-21' FROM vets JOIN pets ON pets.name = 'Plantmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-08-10' FROM vets JOIN pets ON pets.name = 'Plantmon' AND vets.name = 'William Tatcher';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2021-04-07' FROM vets JOIN pets ON pets.name = 'Plantmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2019-09-29' FROM vets JOIN pets ON pets.name = 'Squirtle' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-10-03' FROM vets JOIN pets ON pets.name = 'Angemon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-11-04' FROM vets JOIN pets ON pets.name = 'Angemon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2019-01-24' FROM vets JOIN pets ON pets.name = 'Boarmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2019-05-15' FROM vets JOIN pets ON pets.name = 'Boarmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-02-27' FROM vets JOIN pets ON pets.name = 'Boarmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-08-03' FROM vets JOIN pets ON pets.name = 'Boarmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2020-05-24' FROM vets JOIN pets ON pets.name = 'Blossom' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (vet_id, pet_id, visit_date) SELECT vets.id, pets.id, '2021-01-11' FROM vets JOIN pets ON pets.name = 'Blossom' AND vets.name = 'William Tatcher';



