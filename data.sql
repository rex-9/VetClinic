-- day 1
INSERT INTO pets (name, birth_date, escape_attempts, neutered, weight_kg) VALUES ('Agumon', DATE '2020-02-03', 0, true, 10.23);
INSERT INTO pets (name, birth_date, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', DATE '2018-11-15', 2, true, 8);
INSERT INTO pets VALUES (3, 'Pikachu', DATE '2021-01-07', 1, false, 15.04);
INSERT INTO pets VALUES (4, 'Devimon', DATE '2017-05-12', 5, true, 11);

-- day 2
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', DATE '2020-02-08', 0, false, -11.0);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', DATE '2021-11-15', 2, true, -5.7);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', DATE '1993-04-02', 3, false, -12.13);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', DATE '2005-06-12', 1, true, -45);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', DATE '2005-06-07', 7, true, 20.4);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', DATE '1998-10-13', 3, true, 17);
INSERT INTO pets (id, name, birth_date, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', DATE '2022-05-14', 4, true, 22);

-- day 3
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
