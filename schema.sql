CREATE TABLE pets(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  name VARCHAR(16),
  birth_date date,
  escape_attempts INT,
  neutered bool,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);