-- day 1
CREATE TABLE pets(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  name VARCHAR(16),
  birth_date date,
  escape_attempts INT,
  neutered bool,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);

-- day 2
ALTER TABLE pets
ADD species VARCHAR(12);