CREATE TABLE "Pets"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL DEFAULT '(50)',
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" INTEGER NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL
);
ALTER TABLE
    "Pets" ADD PRIMARY KEY("id");
ALTER TABLE
    "Pets" ADD PRIMARY KEY("id");
CREATE TABLE "Owners"(
    "id" BIGINT NOT NULL,
    "full_name" VARCHAR(255) NOT NULL DEFAULT '(50)',
    "age" INTEGER NOT NULL
);
ALTER TABLE
    "Owners" ADD PRIMARY KEY("id");
ALTER TABLE
    "Owners" ADD PRIMARY KEY("id");
CREATE TABLE "Visits"(
    "vet_id" INTEGER NOT NULL,
    "animal_id" INTEGER NOT NULL,
    "date_of_visit" INTEGER NOT NULL
);
ALTER TABLE
    "Visits" ADD PRIMARY KEY("vet_id");
ALTER TABLE
    "Visits" ADD PRIMARY KEY("vet_id");
CREATE TABLE "Species"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL DEFAULT '(50)'
);
CREATE INDEX "species_id_index" ON
    "Species"("id");
ALTER TABLE
    "Species" ADD PRIMARY KEY("id");
CREATE TABLE "Vets"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL DEFAULT '(50)',
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "Vets" ADD PRIMARY KEY("id");
ALTER TABLE
    "Vets" ADD PRIMARY KEY("id");
CREATE TABLE "Specializations"(
    "vet_id" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL
);
ALTER TABLE
    "Specializations" ADD PRIMARY KEY("vet_id");
ALTER TABLE
    "Specializations" ADD PRIMARY KEY("vet_id");
ALTER TABLE
    "Visits" ADD CONSTRAINT "visits_animal_id_foreign" FOREIGN KEY("animal_id") REFERENCES "Pets"("id");
ALTER TABLE
    "Pets" ADD CONSTRAINT "pets_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "Owners"("id");
ALTER TABLE
    "Pets" ADD CONSTRAINT "pets_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "Species"("id");
ALTER TABLE
    "Specializations" ADD CONSTRAINT "specializations_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "Species"("id");