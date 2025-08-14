-- Dit zijn tabellen uit beeld-audio-visueel object

CREATE TABLE beeld-audio-visueel object (
  id INT PRIMARY KEY,
  titel VARCHAR(255),
  beschrijving VARCHAR(255),
);

CREATE TABLE afbeelding (
  id INT PRIMARY KEY,
  bav_id INT,
  documentnummer VARCHAR(255),
  vervaardiger VARCHAR(255),
  vervaardiging_datum DATE,
  soort_afbeelding VARCHAR(255),
  trefwoord VARCHAR(255),
  persoonstrefwoord VARCHAR(255),
  monumentnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);


-- Dit zijn tabellen uit cultuurhistorisch_object

CREATE TABLE cultuurhistorisch_object (
  id INT PRIMARY KEY,
);

CREATE TABLE rijksmonument (
  id INT PRIMARY KEY,
  cho_id INT,
  rijksmonument_complex INT, 
  aard_monument VARCHAR(255), -- uri
  juridische_status VARCHAR(255), -- uri
  datum_van_inschrijving_in_mon_register DATE,
  rijksmonumentnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (rijksmonument_complex) REFERENCES rijksmonumentaal_complex(id),
  FOREIGN KEY (aard_monument) REFERENCES aard_monument(id),
  FOREIGN KEY (juridische_status) REFERENCES juridische_status(id)
);

CREATE TABLE rijksmonument_complex (
  id INT PRIMARY KEY,
  cho_id INT,
  complexnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

CREATE TABLE werelderfgoed (
  id INT PRIMARY KEY,
  cho_id INT,
  werelderfgoed_type VARCHAR(255), -- uri
  jaar_van_inschrijving VARCHAR(255),
  werelderfgoed_nummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (werelderfgoed_type) REFERENCES werelderfgoed_type(id)
);

CREATE TABLE stads_en_dorpsgezicht (
  id INT PRIMARY KEY,
  cho_id INT,
  gezicht_status VARCHAR(255), -- uri
  gezicht_nummer VARCHAR(255),
  proceduredatum_gezicht DATE,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (gezicht_status) REFERENCES gezicht_status(id)
);

CREATE TABLE zoologische_vondst (
  id INT PRIMARY KEY,
  cho_id INT,
  vondst_id INT,
  boneinfo_soort_id VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
);

CREATE TABLE vondst (
  id INT PRIMARY KEY,
  cho_id INT,
  verzamelwijze VARCHAR(255), -- uri
  verwervingswijze VARCHAR(255), -- uri
  omvang VARCHAR(255), -- uri
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (vindplaats_id) REFERENCES vindplaats(id),
  FOREIGN KEY (verwervingswijze) REFERENCES verwervingswijze(id),
  FOREIGN KEY (verzamelwijze) REFERENCES verzamelwijze(id),
  FOREIGN KEY (omvang) REFERENCES omvang(id)
);

CREATE TABLE vindplaats (
 id INT PRIMARY KEY,
  cho_id INT,
  archeologisch_onderzoeksgebied_id INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (archeologisch_onderzoeksgebied_id) REFERENCES archeologisch_onderzoeksgebied(id)
);

CREATE TABLE archeologisch_terrein (
  id INT PRIMARY KEY,
  cho_id INT,
  archis2_monumentnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

CREATE TABLE archeologisch_onderzoeksgebied (
  id INT PRIMARY KEY,
  cho_id INT,
);

CREATE TABLE verwervingswijze_zoologisch (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE verzamelwijze (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE gezicht_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE werelderfgoed_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE juridische_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE aard_monument (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit zijn tabellen uit kennisregistratie

CREATE TABLE kennisregistratie (
  id INT PRIMARY KEY,
  cho_id INT,
  formeel_standpunt boolean,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

CREATE TABLE omschrijving (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  omschrijving_type VARCHAR(255),
  omschrijving VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (omschrijving_type) REFERENCES omschrijving_type(id)
);

CREATE TABLE naam (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_soort VARCHAR(255),
  naam VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_soort) REFERENCES naam_soort(id)
);

CREATE TABLE functie (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  functie_soort VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (functie_soort) REFERENCES functie_soort(id)
);

CREATE TABLE object_type (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  type_naam VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (type_naam) REFERENCES type_naam(id)
);

CREATE TABLE gebeurtenis (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_gebeurtenis VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_gebeurtenis) REFERENCES naam_gebeurtenis(id)
);

CREATE TABLE datering (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  gebeurtenis_id VARCHAR(255),
  datering_methode VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (gebeurtenis_id) REFERENCES gebeurtenis(id),
  FOREIGN KEY (datering_methode) REFERENCES datering_methode(id)
);

CREATE TABLE datering_begin (
  id INT PRIMARY KEY,
  datering_id VARCHAR(255),
  datum VARCHAR(255),
  FOREIGN KEY (datering_id) REFERENCES datering(id)
);

CREATE TABLE datering_eind (
  id INT PRIMARY KEY,
  datering_id VARCHAR(255),
  datum VARCHAR(255),
  FOREIGN KEY (datering_id) REFERENCES datering(id)
);

CREATE TABLE betrokkene (
  id INT PRIMARY KEY,
  to_id INT,
  actor VARCHAR(255), -- uri
  rol VARCHAR(255), -- uri
  FOREIGN KEY (to_id) REFERENCES tekst_object(id),
  FOREIGN KEY (actor) REFERENCES actor(id),
  FOREIGN KEY (rol) REFERENCES rol(id)
);

CREATE TABLE actor (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_actor VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_actor) REFERENCES naam_actor(id)
);

CREATE TABLE omschrijving_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE soort (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  soort_naam VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (soort_naam) REFERENCES soort_naam(id),
);

CREATE TABLE omvang (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE naam_soort (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE datering_methode (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE naam_gebeurtenis (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE actor (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE rol (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE type_naam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE functie_soort (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit zijn tabellen uit locatieregistratie

CREATE TABLE locatieregistratie (
  id INT PRIMARY KEY,
  cho_id INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

CREATE TABLE basisregistratie (
  id INT PRIMARY KEY,
  locatieregistratie_id VARCHAR(255),
  gemeente VARCHAR(255), -- uri
  provincie VARCHAR(255), -- uri
  FOREIGN KEY (locatie_registratie_id) REFERENCES locatie_registratie(id),
  FOREIGN KEY (gemeente) REFERENCES gemeente(id),
  FOREIGN KEY (provincie) REFERENCES provincie(id)
);

CREATE TABLE basisregistratie_adressen_en_gebouwen (
  id INT PRIMARY KEY,
  basis_registratie_id INT,
  woonplaatsnaam VARCHAR(255),
  straat VARCHAR(255),
  volledig_adres VARCHAR(255),
  postcode VARCHAR(255),
  FOREIGN KEY (basis_registratie_id) REFERENCES basis_registratie(id)
);

CREATE TABLE basisregistratie_kadaster (
  id INT PRIMARY KEY,
  basis_registratie_id bav_id INT,
  brk_relatienummer INT,
  appartementsaanduiding VARCHAR(255),
  sectie VARCHAR(255),
  perceelnummer VARCHAR(255),
  FOREIGN KEY (basis_registratie_id) REFERENCES basis_registratie(id)
);

CREATE TABLE geometrie (
  id INT PRIMARY KEY,
  locatieregistratie_id VARCHAR(255),
  FOREIGN KEY (locatie_registratie_id) REFERENCES locatie_registratie(id)
);

CREATE TABLE polygoon (
  id INT PRIMARY KEY,
  geometrie_id INT,
  WKT VARCHAR(255),
  WKT-RD VARCHAR(255),
  FOREIGN KEY (geometrie_id) REFERENCES geometrie(id)
);

-- Dit zijn tabellen uit tekstobject
CREATE TABLE tekst_object (
  id INT PRIMARY KEY,
  titel VARCHAR(255),
);

CREATE TABLE betrokkene_tekstobject (
  id INT PRIMARY KEY,
  to_id INT,
  actor VARCHAR(255), -- uri
  FOREIGN KEY (to_id) REFERENCES tekst_object(id),
);
