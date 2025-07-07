CREATE TABLE beeld-audio-visueel object (
  id INT PRIMARY KEY,
  vervaardiger VARCHAR(255), -- uri
  opslag_locatie VARCHAR(255), -- uri
  titel VARCHAR(255),
  beschrijving_omschrijving VARCHAR(255),
  toon_intern boolean,
  toon_extern boolean,
  FOREIGN KEY (opslag_locatie) REFERENCES opslag_locatie(id),
  FOREIGN KEY (vervaardiger) REFERENCES vervaardiger(id)
);

CREATE TABLE afbeelding (
  id INT PRIMARY KEY,
  bav_id INT,
  soort_afbeelding VARCHAR(255), -- uri
  toponiem VARCHAR(255), -- uri
  trefwoord VARCHAR(255), -- uri
  geografisch trefwoord VARCHAR(255), -- uri
  persoonstrefwoord VARCHAR(255), -- uri
  hoofdcollectie VARCHAR(255), -- uri
  collectie VARCHAR(255), -- uri
  techniek INT,
  uitsluitingsverzoek_id INT,
  vervaardiging_datum DATE,
  project_code VARCHAR(255),
  documentnummer VARCHAR(255),
  alternatiefnummer VARCHAR(255),
  soort_alternatiefnummer VARCHAR(255),
  begin_periode_complextype VARCHAR(255),
  eind_periode_complextype VARCHAR(255),
  scheepswraknummer VARCHAR(255),
  maritieme_archeologie_locatie VARCHAR(255),
  invoerder_record VARCHAR(255),
  invoerbron VARCHAR(255),
  historisch_adres VARCHAR(255),
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id),
  FOREIGN KEY (soort_afbeelding) REFERENCES soort_afbeelding(id),
  FOREIGN KEY (techniek) REFERENCES techniek(id),
  FOREIGN KEY (toponiem) REFERENCES toponiem(id),
  FOREIGN KEY (trefwoord) REFERENCES trefwoord(id),
  FOREIGN KEY (persoonstrefwoord) REFERENCES persoonstrefwoord(id),
  FOREIGN KEY (hoofdcollectie) REFERENCES hoofdcollectie(id),
  FOREIGN KEY (collectie) REFERENCES collectie(id),
  FOREIGN KEY (uitsluitingsverzoek_id) REFERENCES uitsluitingsverzoek(id)
);

CREATE TABLE audio-visueel materiaal (
  id INT PRIMARY KEY,
  bav_id INT,
  persoons_onderwerp VARCHAR(255), -- uri
  geografische_aanduiding_id INT,
  objectnummer VARCHAR(255),
  archiefnummer VARCHAR(255),
  inventarisnummer VARCHAR(255),
  datering_van DATE,
  datering_tot DATE,
  uitgever VARCHAR(255),
  onderwerp VARCHAR(255),
  materiele_omschrijving VARCHAR(255),
  duur VARCHAR(255),
  taal VARCHAR(255),
  conditie VARCHAR(255),
  notitieveld_conditie VARCHAR(255),
  verwervingsmethode VARCHAR(255),
  verwervingsdatum DATE,
  land_herkomst VARCHAR(255),
  collectie_verzameling VARCHAR(255),
  opmerkingen VARCHAR(255),
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id),
  FOREIGN KEY (persoons_onderwerp) REFERENCES persoons_onderwerp(id),
  FOREIGN KEY (geografische_aanduiding_id) REFERENCES geografische_aanduiding(id)
);

CREATE TABLE digitaal (
  id INT PRIMARY KEY,
  afbeelding_id VARCHAR(255),
  opdracht_id INT,
  analoog_id INT, 
  FOREIGN KEY (afbeelding_id) REFERENCES afbeelding(id),
  FOREIGN KEY (opdracht_id) REFERENCES opdracht(id),
  FOREIGN KEY (analoog_id) REFERENCES analoog(id)
);

CREATE TABLE analoog (
  id INT PRIMARY KEY,
  afbeelding_id bav_id INT,
  opschrift_id INT,
  vindplaats_depot VARCHAR(255),
  titel VARCHAR(255),
  standplaats VARCHAR(255),
  afmetingen VARCHAR(255),
  hoogte VARCHAR(255),
  breedte VARCHAR(255),
  sectie_verzamelplan VARCHAR(255),
  blad_verzamelplan VARCHAR(255),
  objectnummer_verzamelplan VARCHAR(255),
  sectie_minuutplan VARCHAR(255),
  blad_minuutplan VARCHAR(255),
  objectnummer_minuutplan VARCHAR(255),
  beschrijving VARCHAR(255),
  sectie_verzamelplan VARCHAR(255),
  FOREIGN KEY (afbeelding_id) REFERENCES afbeelding(id),
  FOREIGN KEY (opschrift_id) REFERENCES opschrift(id)
);

CREATE TABLE vervaardiger (
  id INT PRIMARY KEY,
  naam_vervaardiger VARCHAR(255), -- uri
  rol_vervaardiger VARCHAR(255) -- uri
);

CREATE TABLE geografische_aanduiding (
  id INT PRIMARY KEY,
  locatie_of_standplaats VARCHAR(255),
  specifieke_plaats VARCHAR(255),
  straatnaam VARCHAR(255),
  straatnummer VARCHAR(255)
);

CREATE TABLE rechten (
  id INT PRIMARY KEY,
  bav_id INT,
  creative_commons INT,
  rechthebbende INT,
  type_recht INT,
  copyrights VARCHAR(255),
  copyrights_notitie DATE,
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id),
  FOREIGN KEY (creative_commons) REFERENCES creative_commons(id),
  FOREIGN KEY (rechthebbende) REFERENCES rechthebbende(id),
  FOREIGN KEY (type_recht) REFERENCES type_recht(id)
);

CREATE TABLE opdracht (
  id INT PRIMARY KEY,
  FOOL_opdrachtgever VARCHAR(255),
  FOOL_soort VARCHAR(255),
  reden_opnemen VARCHAR(255)
);

CREATE TABLE opschrift (
   id INT PRIMARY KEY,
  taal_inscriptie VARCHAR(255),
  beschrijving VARCHAR(255),
  datum_inscriptie DATE,
  FOREIGN KEY (taal_inscriptie) REFERENCES  taal_inscriptie(id)
);

CREATE TABLE opslag_locatie (
  url VARCHAR(255),
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

CREATE TABLE creative_commons (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE rechthebbende (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE type_recht (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE taal_inscriptie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE soort_afbeelding (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE cultuurhistorische_thesaurus (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE collectie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE techniek (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE persoons_onderwerp (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);