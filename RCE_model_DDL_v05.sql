CREATE TABLE grondspoor (
  id INT PRIMARY KEY,
  cho_id INT,
  vindplaats_id VARCHAR(255),
  spoor_type VARCHAR(255),
  aantal_grondsporen INT,
  archis2_vondstnummer VARCHAR(255),
  grondspoor_nummer VARCHAR(255),
  grondspoor_code VARCHAR(255),
  lokale_fase VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (spoor_type) REFERENCES  spoortype(id),
  FOREIGN KEY (vindplaats_id) REFERENCES vindplaats(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE rol (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  betrokkene_id INT,
  naam_rol VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
 FOREIGN KEY (betrokkene_id) REFERENCES betrokkene(id),
  FOREIGN KEY (naam_rol) REFERENCES naam_rol(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_rol (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE actor (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_actor VARCHAR(255), -- uri
  geboorte_datum DATE,
  overleiding_datum DATE,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_actor) REFERENCES naam_actor(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE organisatie (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  betrokkene_id INT,
  naam_organisatie VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (betrokkene_id) REFERENCES betrokkene(id),
  FOREIGN KEY (naam_organisatie) REFERENCES naam_organisatie(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE actor_organisatie (
  id INT PRIMARY KEY,
  actor_id INT,
  organisatie_id INT,
  FOREIGN KEY (actor_id) REFERENCES actor(id),
  FOREIGN KEY (organisatie_id) REFERENCES organisatie(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE datering (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  gebeurtenis_id VARCHAR(255),
  indicatie_nauwkeurigheid VARCHAR(255), -- uri
  betrouwbaarheid VARCHAR(255), -- uri
  datering_methode VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (gebeurtenis_id) REFERENCES gebeurtenis(id),
  FOREIGN KEY (indicatie_nauwkeurigheid) REFERENCES indicatie_nauwkeurigheid(id),
  FOREIGN KEY (betrouwbaarheid) REFERENCES betrouwbaarheid(id),
  FOREIGN KEY (datering_methode) REFERENCES datering_methode(id)
);

CREATE TABLE bronverwijzing (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE omschrijving (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  omschrijving_type VARCHAR(255),
  omschrijving VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (omschrijving_type) REFERENCES omschrijving_type(id)
);

CREATE TABLE bouwkundige_kwaliteit (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  bouwkundige_staat VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (bouwkundige_staat) REFERENCES bouwkundige_staat(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_soort VARCHAR(255),
  naam VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_soort) REFERENCES naam_soort(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE stijl_en_cultuur (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  zuiverheid VARCHAR(255), -- uri
  naam_stijl_en_cultuur VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (zuiverheid) REFERENCES zuiverheid(id),
  FOREIGN KEY (naam_stijl_en_cultuur) REFERENCES naam_stijl_en_cultuur(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE kennisregistratie (
  id INT PRIMARY KEY,
  cho_id INT,
  vertrouwelijk_aanduiding VARCHAR(255), -- uri
  kennisdomein VARCHAR(255), -- uri
  kennisregistratie_toelichting VARCHAR(255),
  formeel_standpunt boolean,
  is_volgens_norm boolean,
  observatie_datum DATE,
  melder VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (vertrouwelijk_aanduiding) REFERENCES vertrouwelijk_aanduiding(id),
  FOREIGN KEY (kennisdomein) REFERENCES kennisdomein(id)
);

-- Dit is een tabel uit cho
CREATE TABLE cultuurhistorisch_object (
  id INT PRIMARY KEY,
  vertrouwelijk_aanduiding VARCHAR(255), -- uri
  internationale_kenteken BOOLEAN,
  FOREIGN KEY (vertrouwelijk_aanduiding) REFERENCES vertrouwelijk_aanduiding(id)
);

-- Dit is een tabel uit cho
CREATE TABLE vondsten (
  id INT PRIMARY KEY,
  cho_id INT, 
  vindplaats_id VARCHAR(255),
  verwervingswijze VARCHAR(255), -- uri
  verzamelwijze VARCHAR(255), -- uri
  archis3_onderzoekmeldingnummer VARCHAR(255),
  archis3_waarnemingnummer VARCHAR(255),
  archis2_vondstnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (vindplaats_id) REFERENCES vindplaats(id),
  FOREIGN KEY (verwervingswijze) REFERENCES verwervingswijze(id),
  FOREIGN KEY (verzamelwijze) REFERENCES verzamelwijze(id)
);

-- Dit is een tabel uit cho
CREATE TABLE artefact_vondst (
  id INT PRIMARY KEY,
  cho_id INT, 
  aantal_vondsten INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
);

-- Dit is een tabel uit cho
CREATE TABLE vindplaats (
 id INT PRIMARY KEY,
  cho_id INT,
  archeologisch_onderzoeksgebied_id INT,
  archis2_waarnemingsnummer VARCHAR(255),
  archis2_complexnummer VARCHAR(255),
  archis2_vondstmeldingsnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (archeologisch_onderzoeksgebied_id) REFERENCES archeologisch_onderzoeksgebied(id)
);

CREATE TABLE monster (
  id INT PRIMARY KEY,
  cho_id INT,
  grondspoor_id VARCHAR(255),
  monster_type VARCHAR(255),
  monster_nummer VARCHAR(255),
  monster_code VARCHAR(255),
  aantal_monsters INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (grondspoor_id) REFERENCES grondspoor(id),
  FOREIGN KEY (monster_type) REFERENCES  monster_type(id)
);

-- Dit is een tabel uit cho
CREATE TABLE botanische_vondst (
  id INT PRIMARY KEY,
  cho_id INT,
  monster_id INT,
  omvang VARCHAR(255), -- uri
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (monster_id) REFERENCES monster(id),
  FOREIGN KEY (omvang) REFERENCES omvang(id)
);

-- Dit is een tabel uit cho
CREATE TABLE zoologische_vondst (
  id INT PRIMARY KEY,
  cho_id INT,
  monster_id INT,
  boneinfo_soort_id VARCHAR(255), -- uri
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (monster_id) REFERENCES monster(id)
);

-- Dit is een tabel uit cho
CREATE TABLE monsters (
  id INT PRIMARY KEY,
  cho_id INT,
  grondspoor_id INT,
  monster_type INT, -- uri
  monster_nummer VARCHAR(255),
  monster_code VARCHAR(255),
  aantal_monsters INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (grondspoor_id) REFERENCES grondsporen(id),
  FOREIGN KEY (monster_type) REFERENCES monster_type(id),
);

-- Dit is een tabel uit cho
CREATE TABLE grondsporen (
  id INT PRIMARY KEY,
  cho_id INT,
  vindplaats_id INT,
  spoor_type VARCHAR(255), -- uri
  aantal_grondsporen VARCHAR(255),
  archis2_vondstnummer VARCHAR(255),
  grondspoornummer VARCHAR(255),
  grondspoor_code VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (vindplaats_id) REFERENCES vindplaats(id),
  FOREIGN KEY (spoor_type) REFERENCES spoor_type(id)
);

-- Dit is een tabel uit cho
CREATE TABLE spoor_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit cho
CREATE TABLE omvang (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE monstertype (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE zoologische_vondst (
  id INT PRIMARY KEY,
  cho_id INT,
  archis_onderzoek_meldingnummer VARCHAR(255),
  archis_waarneming_nummer VARCHAR(255),
  verwervingswijze_zoologisch VARCHAR(255),
  verzamelwijze VARCHAR(255),
  boneinfo_diersoort_id VARCHAR(255),
  aantal_zoologische_vondsten INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (archis_onderzoek_meldingnummer) REFERENCES archis_onderzoek_meldingnummer(id),
  FOREIGN KEY (archis_waarneming_nummer) REFERENCES archis_waarneming_nummer(id),
  FOREIGN KEY (verwervingswijze_zoologisch) REFERENCES verwervingswijze_zoologisch(id),
  FOREIGN KEY (verzamelwijze) REFERENCES verzamelwijze(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE soort (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  zekerheid VARCHAR(255), -- uri
  soort_naam VARCHAR(255), -- uri
  aanvullend_onderzoek VARCHAR(255), -- uri
  monster_genomen BOOLEAN,
  monster_analyse_status VARCHAR(255),
  eigen_invoer_nieuwe_soort VARCHAR(255),
  aantal VARCHAR(255),
  toelichting VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (zekerheid) REFERENCES zekerheid(id),
  FOREIGN KEY (soort_naam) REFERENCES soort_naam(id),
  FOREIGN KEY (aanvullend_onderzoek) REFERENCES aanvullend_onderzoek(id)
);

-- Dit is een tabel uit cho
CREATE TABLE archeologisch_complex (
  id INT PRIMARY KEY,
  cho_id INT,
  archeologisch_terrein_id INT, 
  archeologische_complextype VARCHAR(255), -- uri
  radar_site_id INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (archeologisch_terrein_id) REFERENCES archeologisch_terrein(id),
  FOREIGN KEY (archeologisch_complextype) REFERENCES archeologisch_complextype(id)
);

-- Dit is een tabel uit cho
CREATE TABLE archeologisch_terrein (
  id INT PRIMARY KEY,
  cho_id INT,
  archis2_monumentnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

-- Dit is een tabel uit cho
CREATE TABLE rijksmonument (
  id INT PRIMARY KEY,
  cho_id INT,
  rijksmonument_complex INT, 
  bebouwde_kom VARCHAR(255), -- uri
  aard_monument VARCHAR(255), -- uri
  juridische_status VARCHAR(255), -- uri
  datum_van_inschrijving_in_mon_register DATE,
  rijksmonumentnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (rijksmonument_complex) REFERENCES rijksmonumentaal_complex(id),
  FOREIGN KEY (bebouwde_kom) REFERENCES bebouwde_kom(id),
  FOREIGN KEY (aard_monument) REFERENCES aard_monument(id),
  FOREIGN KEY (juridische_status) REFERENCES juridische_status(id)
);

-- Dit is een tabel uit cho
CREATE TABLE werelderfgoed (
  id INT PRIMARY KEY,
  cho_id INT,
  werelderfgoed_type VARCHAR(255), -- uri
  jaar_van_inschrijving VARCHAR(255),
  werelderfgoed_nummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (werelderfgoed_type) REFERENCES werelderfgoed_type(id)
);
-- Dit is een tabel uit cho
CREATE TABLE stads_en_dorpsgezicht (
  id INT PRIMARY KEY,
  cho_id INT,
  gezicht_status VARCHAR(255), -- uri
  gezicht_nummer VARCHAR(255),
  bijzonder_gebied VARCHAR(255),
  proceduredatum_gezicht DATE,
  intrekkingsdatum_gezicht DATE,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (gezicht_status) REFERENCES gezicht_status(id)
);

-- Dit is een tabel uit cho
CREATE TABLE samenhang (
  id INT PRIMARY KEY,
  cho_id INT,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE locatie_aanduiding (
  id INT PRIMARY KEY,
  locatieregistratie_id VARCHAR(255),
  locatie_aanduiding_status VARCHAR(255), -- uri
  plaatsnaam VARCHAR(255), -- uri
  toponiem VARCHAR(255),
  kaartbladcode VARCHAR(255),
  locatie_omschrijving VARCHAR(255),
  FOREIGN KEY (locatieregistratie_id) REFERENCES locatie_registratie(id),
  FOREIGN KEY (locatie_aanduiding_status) REFERENCES locatie_aanduiding_status(id),
  FOREIGN KEY (plaatsnaam) REFERENCES plaatsnaam(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE locatie_aanduiding_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE basisregistratie (
  id INT PRIMARY KEY,
  locatieregistratie_id VARCHAR(255),
  gemeente VARCHAR(255), -- uri
  provincie VARCHAR(255), -- uri
  FOREIGN KEY (locatie_registratie_id) REFERENCES locatie_registratie(id),
  FOREIGN KEY (gemeente) REFERENCES gemeente(id),
  FOREIGN KEY (provincie) REFERENCES provincie(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE basisregistratie_kadaster (
  id INT PRIMARY KEY,
  basis_registratie_id INT UNIQUE NOT NULL,
  gemeentecode VARCHAR(255), -- uri
  gemeentenaam VARCHAR(255), -- uri
  provinciecode VARCHAR(255), --uri
  brk_relatienummer INT,
  appartementsaanduiding VARCHAR(255),
  plaatscode VARCHAR(255),
  kadastrale_gemeentecode VARCHAR(255),
  sectie VARCHAR(255),
  perceelnummer VARCHAR(255),
  deelperceelnummer VARCHAR(255),
  FOREIGN KEY (basis_registratie_id) REFERENCES basis_registratie(id),
  FOREIGN KEY (gemeentecode) REFERENCES gemeentecode(id),
  FOREIGN KEY (gemeentenaam) REFERENCES gemeentenaam(id),
  FOREIGN KEY (provinciecode) REFERENCES provinciecode(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE basisregistratie_adressen_en_gebouwen (
  id INT PRIMARY KEY,
  basis_registratie_id INT,
  woonplaatsnaam VARCHAR(255), -- uri
  pand VARCHAR(255), -- uri
  verblijfsobject VARCHAR(255), -- uri
  situering VARCHAR(255), -- uri
  openbare_ruimte VARCHAR(255),
  huisnummer VARCHAR(255),
  huisletter VARCHAR(255),
  huisnummer_toevoeging VARCHAR(255),
  volledig_adres VARCHAR(255),
  postcode VARCHAR(255),
  FOREIGN KEY (basis_registratie_id) REFERENCES basis_registratie(id),
  FOREIGN KEY (woonplaatsnaam) REFERENCES woonplaatsnaam(id),
  FOREIGN KEY (pand) REFERENCES pand(id),
  FOREIGN KEY (verblijfsobject) REFERENCES verblijfsobject(id),
  FOREIGN KEY (situering) REFERENCES situering(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE geometrie (
  id INT PRIMARY KEY,
  locatieregistratie_id VARCHAR(255),
  geometrie_status  VARCHAR(255), -- uri
  geometrie_kwaliteit  VARCHAR(255), -- uri
  geometrie_type  VARCHAR(255), -- uri
  herkomst  VARCHAR(255), -- uri
  ondergrond_gezicht  VARCHAR(255), -- uri
  begrenzingsdatum_gezicht DATE,
  oppervlakte_in_km INT,
  oppervlakte_in_vierkante_meters INT,
  oppervlakte_in_hectare INT,
  FOREIGN KEY (locatie_registratie_id) REFERENCES locatie_registratie(id),
  FOREIGN KEY (geometrie_status) REFERENCES geometrie_status(id),
  FOREIGN KEY (geometrie_kwaliteit) REFERENCES geometrie_kwaliteit(id),
  FOREIGN KEY (geometrie_type) REFERENCES geometrie_type(id),
  FOREIGN KEY (herkomst) REFERENCES herkomst(id),
  FOREIGN KEY (ondergrond_gezicht) REFERENCES ondergrond_gezicht(id)
);

CREATE TABLE afbeelding (
  id INT PRIMARY KEY,
  bav_id VARCHAR(255),
  soort_afbeelding VARCHAR(255),
  toponiem VARCHAR(255),
  trefwoord VARCHAR(255),
  geografisch trefwoord VARCHAR(255),
  persoonstrefwoord VARCHAR(255),
  hoofdcollectie VARCHAR(255),
  collectie VARCHAR(255),
  techniek INT,
  uitsluitingsverzoek_id INT,
  vervaardiging_datum DATE,
  project_code VARCHAR(255),
  document_nummer VARCHAR(255),
  alternatief_nummer VARCHAR(255),
  soort_alternatief_nummer VARCHAR(255),
  begin_periode_complextype VARCHAR(255),
  eind_periode_complextype VARCHAR(255),
  scheepswrak_nummer VARCHAR(255),
  maritieme_archeologie_locatie VARCHAR(255),
  invoerder_record VARCHAR(255),
  invoerbron VARCHAR(255),
  historisch adres VARCHAR(255),
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id),
  FOREIGN KEY (techniek) REFERENCES techniek(id),
  FOREIGN KEY (uitsluitingsverzoek_id) REFERENCES uitsluitingsverzoek(id)
);

CREATE TABLE vervaardiger (
  id INT PRIMARY KEY,
  naam_vervaardiger VARCHAR(255),
  rol_vervaardiger VARCHAR(255)
);

CREATE TABLE analoog (
  id INT PRIMARY KEY,
  afbeelding_id INT UNIQUE NOT NULL,
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
  FOREIGN KEY (afbeelding_id) REFERENCES afbeelding(id),
  FOREIGN KEY (opschrift_id) REFERENCES opschrift(id)
);

CREATE TABLE tekst_object (
  id INT PRIMARY KEY,
  uitgever_id INT,
  auteur_id INT,
  redacteur_id INT,
  publicatie_status INT,
  opslag_locatie INT,
  titel VARCHAR(255),
  digitale_link VARCHAR(255),
  plaatsingscode_bibliotheek VARCHAR(255),
  heeft_digitale_versie boolean,
  FOREIGN KEY (uitgever_id) REFERENCES uitgever(id)
);

CREATE TABLE tekst_object_bav (
  tekst_object_id INT,
  bav_id INT,
  PRIMARY KEY (tekst_object_id, bav_id),
  FOREIGN KEY (tekst_object_id) REFERENCES tekst_object(id),
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id)
);

CREATE TABLE cho_tekst_object (
  cultuurhistorisch_object_id INT,
  tekst_object_id INT,
  PRIMARY KEY (cultuurhistorisch_object_id, tekst_object_id),
  FOREIGN KEY (cultuurhistorisch_object_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (tekst_object_id) REFERENCES tekst_object(id)
);

CREATE TABLE rapport (
  id INT PRIMARY KEY,
  to_id VARCHAR(255),
  reeks_id INT,
  dans_doi  VARCHAR(255),
  reeks_volgnummer VARCHAR(255),
  FOREIGN KEY (to_id) REFERENCES tekst_object(id) UNIQUE,
  FOREIGN KEY (reeks_id) REFERENCES reeks(id)
);

CREATE TABLE tijdschrift (
  id INT PRIMARY KEY,
  to_id INT,
  periodiek_deelnummer VARCHAR(255),
  FOREIGN KEY (to_id) REFERENCES tekst_object(id) UNIQUE
);

CREATE TABLE artikel (
  id INT PRIMARY KEY,
  to_id INT,
  tijdschrift_id INT,
  FOREIGN KEY (to_id) REFERENCES tekst_object(id) UNIQUE
);

CREATE TABLE verwervingswijze_zoologisch (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE spoortype (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE verzamelwijze (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE datering_begin (
  id INT PRIMARY KEY,
  datering_id VARCHAR(255),
  begin_periode VARCHAR(255), -- uri
  datum VARCHAR(255),
  jaar VARCHAR(255),
  FOREIGN KEY (datering_id) REFERENCES datering(id),
  FOREIGN KEY (begin_periode) REFERENCES datering_periode(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE zuiverheid (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_stijl_en_cultuur (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE archis_waarneming_nummer (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE archis_onderzoeksmelding_nummer (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE rce_zaaknummer (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE zaak (
  id INT PRIMARY KEY,
  cho_id INT UNIQUE NOT NULL,
  zaaknummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE gemeentecode (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE gemeentenaam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);
-- Dit is een tabel uit locatieregistratie
CREATE TABLE gemeente (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE provincie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE bag_pand (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE bag_verblijfsobject (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE plaatsnaam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE overheid.nl_gemeente (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE overheid.nl_provincie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE dans_doi (
  doi VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE botanische_soort (
  id INT PRIMARY KEY,
  soort_id VARCHAR(255),
  behoudstatus VARCHAR(255), -- uri
  kwalificatie_minimaal VARCHAR(255),
  kwalificatie_maximaal VARCHAR(255),
  FOREIGN KEY (soort_id) REFERENCES soort(id),
  FOREIGN KEY (behoudstatus) REFERENCES behoudstatus(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE zoologische_soort (
  id INT PRIMARY KEY,
  soort_id VARCHAR(255),
  leeftijdsgegevens_beschikbaar boolean,
  maten_beschikbaar boolean,
  FOREIGN KEY (soort_id) REFERENCES soort(id)
);

CREATE TABLE botanische_zoo_naam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE botanische_zoo_onderdeel (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE botanische_zoo_behoudstatus (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE speciale_depositie_graf (
  id INT PRIMARY KEY,
  zoologische_soort_id INT,
  type_gevonden_depositie VARCHAR(255), -- uri
  aantal_onderzocht INT,
  aantal_gevonden INT,
  aantal_resten INT,
  toelichting VARCHAR(255),
  FOREIGN KEY (zoologische_soort_id) REFERENCES zoologische_soort(id),
  FOREIGN KEY (type_gevonden_depositie) REFERENCES type_gevonden_depositie(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE type_gevonden_depositie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE aanvullend_onderzoek (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit cho
CREATE TABLE aard_monument (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit cho
CREATE TABLE bebouwde_kom (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);
-- Dit is een tabel uit cho
CREATE TABLE juridische_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE geometrie_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE geometrie_kwaliteit (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE herkomst (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE geometrie_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE ondergrond_gezicht (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE provinciecode (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE situering (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);
-- Dit is een tabel uit cho en kennis- en locatieregistratie
CREATE TABLE vertrouwelijk_aanduiding (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE omschrijving_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE bouwkundige_staat (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE functie_soort (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE indicatie_nauwkeurigheid (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE betrouwbaarheid (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE woonplaatsnaam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit cho
CREATE TABLE werelderfgoed_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE gezicht_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE zekerheid (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE pand (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE verblijfsobject (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE puntcoordinaat (
  id INT PRIMARY KEY,
  geometrie_id INT,
  x-coordinaat FLOAT,
  y-coordinaat FLOAT,
  FOREIGN KEY (geometrie_id) REFERENCES geometrie(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE polygoon (
  id INT PRIMARY KEY,
  geometrie_id INT,
  asWKT VARCHAR(255),
  asWKT-RD VARCHAR(255),
  FOREIGN KEY (geometrie_id) REFERENCES geometrie(id)
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

CREATE TABLE techniek (
   id INT PRIMARY KEY,
  naam_techniek VARCHAR(255),
  FOREIGN KEY (naam_techniek) REFERENCES naam_techniek(id)
);

CREATE TABLE opschrift (
   id INT PRIMARY KEY,
  taal_inscriptie VARCHAR(255),
  beschrijving VARCHAR(255),
  datum_inscriptie DATE,
  FOREIGN KEY (analoog_id) REFERENCES analoog(id)
);

CREATE TABLE taal (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE collectie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE soort_afbeelding (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_organisatie (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_actor (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_soort (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE soort_naam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
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

-- Dit is een tabel uit kennisregistratie
CREATE TABLE type_naam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE archeologische_toestand (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE dimensie (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  dimensie_type VARCHAR(255), -- uri
  meeteenheid VARCHAR(255), -- uri
  waarde VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (dimensie_type) REFERENCES dimensie_type(id),
  FOREIGN KEY (meeteenheid) REFERENCES meeteenheid(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE dimensie_type (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE meeteenheid (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE uitsluitingsverzoek (
  id INT PRIMARY KEY,
  aanvrager_uitsluiting VARCHAR(255),
  aanvraagdatum_uitsluiting DATE,
  behandelaar_uitsluiting VARCHAR(255),
  rechten_bijzonderheden VARCHAR(255),
  reden_uitsluiting VARCHAR(255),
  oprmerking_rede_uitsluiting VARCHAR(255)
);

CREATE TABLE opdracht (
  id INT PRIMARY KEY,
  FOOL_opdrachtgever VARCHAR(255),
  FOOL_soort VARCHAR(255),
  reden_opnemen VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE archeologisch_type (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  type_archeologisch VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (type_archeologisch) REFERENCES type_archeologisch(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE stedenbouwkundig_morfologische_aanduiding (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  stedenbouwkundig_morfologische_aanduiding VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (stedenbouwkundig_morfologische_aanduiding) REFERENCES stedenbouwkundig_morfologische_aanduiding(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE stedenbouwkundig_morfologische_aanduiding (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE type_archeologisch (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE functie (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  functie_soort VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (functie_soort) REFERENCES functie_soort(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE archeologische_toestand (
  id INT PRIMARY KEY,
  kennisregistratie_id INT, 
  toestand INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (archeologische_toestand) REFERENCES archeologische_toestand(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE object_type (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  type_naam VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (type_naam) REFERENCES type_naam(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE type_kenmerk (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_type_kenmerk INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_type_kenmerk) REFERENCES naam_type_kenmerk(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_type_kenmerk (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE datering_eind (
  id INT PRIMARY KEY,
  datering_id VARCHAR(255),
  eind_periode VARCHAR(255), -- uri
  datum VARCHAR(255),
  jaar VARCHAR(255),
  FOREIGN KEY (datering_id) REFERENCES datering(id),
  FOREIGN KEY (eind_periode) REFERENCES datering_periode(id)
);

CREATE TABLE geografische_aanduiding (
  id INT PRIMARY KEY,
  locatie_of_standplaats VARCHAR(255),
  specifieke_plaats VARCHAR(255),
  straatnaam VARCHAR(255),
  straatnummer VARCHAR(255),
  FOREIGN KEY (audio_visueel_materiaal_id) REFERENCES audio_visueel_materiaal(id)
);
-- Dit is een tabel uit cho
CREATE TABLE rijksmonument_complex (
  id INT PRIMARY KEY,
  cho_id INT,
  complexnummer VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

-- Dit is een tabel uit cho
CREATE TABLE archeologisch_onderzoeksgebied (
  id INT PRIMARY KEY,
  cho_id INT,
  archeologisch_complex_id INT,
  indicatie_arch_monumentenkaartwaardig boolean,
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (archeologisch_complex_id) REFERENCES archeologisch_complex(id)
);

CREATE TABLE behoudmodus (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE behoudstatus (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE kennisdomein (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE audio-visueel materiaal (
  id INT PRIMARY KEY,
  bav_id VARCHAR(255),
  persoons_onderwerp VARCHAR(255),
  geografische_aanduiding_id INT,
  objectnummer VARCHAR(255),
  archiefnummer VARCHAR(255),
  inventarisnummer VARCHAR(255),
  datering_van datum,
  datering_tot datum,
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
  FOREIGN KEY (geografische_aanduiding_id) REFERENCES geografische_aanduiding(id)
);


CREATE TABLE beeld-audio-visueel object (
  id INT PRIMARY KEY,
  vervaardiger VARCHAR(255), -- uri
  opslag_locatie VARCHAR(255),
  titel VARCHAR(255),
  beschrijving_omschrijving VARCHAR(255),
  toon_intern boolean,
  toon_extern boolean,
  FOREIGN KEY (opslag_locatie) REFERENCES opslag_locatie(id),
  FOREIGN KEY (vervaardiger) REFERENCES vervaardiger(id)
);

CREATE TABLE standplaats_registratie (
  id INT PRIMARY KEY,
  cho_id INT,
  locatiebeschrijving VARCHAR(255),
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE bodemtype (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE waterbodem (
  id INT PRIMARY KEY,
  bodemtype_id VARCHAR(255),
  waterdiepte VARCHAR(255), -- uri
  stroming VARCHAR(255), -- uri
  zoutgehalte VARCHAR(255), -- uri
  getijden_niveau VARCHAR(255),
  nationaal_contact_nummer VARCHAR(255),
  FOREIGN KEY (bodemtype_id) REFERENCES bodemtype(id),
  FOREIGN KEY (waterdiepte) REFERENCES waterdiepte(id),
  FOREIGN KEY (stroming) REFERENCES stromingen(id),
  FOREIGN KEY (zoutgehalte) REFERENCES zoutgehalte(id),
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE bodemtype (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE waterdiepte (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE stroming (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE zoutgehalte (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);


CREATE TABLE hoofdstuk (
  id INT PRIMARY KEY,
  to_id VARCHAR(255),
  boek_id INT,
  rapport_id INT,
  startpagina VARCHAR(255),
  eindpagina VARCHAR(255),
  FOREIGN KEY (to_id) REFERENCES tekst_object(id),
  FOREIGN KEY (boek_id) REFERENCES boek(id),
  FOREIGN KEY (rapport_id) REFERENCES rapport(id)
);

CREATE TABLE boek (
  id INT PRIMARY KEY,
  to_id VARCHAR(255),
  reeks_id INT,
  isbn VARCHAR(255),
  reeks_volgnummer VARCHAR(255),
  FOREIGN KEY (to_id) REFERENCES tekst_object(id),
  FOREIGN KEY (reeks_id) REFERENCES reeks(id)
);

CREATE TABLE reeks (
  id INT PRIMARY KEY,
  reeks_naam VARCHAR(255),
  issn VARCHAR(255)
);

CREATE TABLE reeks_naam (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE uitgever (
  id INT PRIMARY KEY,
  to_id INT,
  uitgever_naam VARCHAR(255),
  jaar_van_uitgave VARCHAR(255),
  plaats_van_uitgave VARCHAR(255)
);

CREATE TABLE publicatie_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit cho
CREATE TABLE archeologisch_complextype (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE datering_periode (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  begin_jaar VARCHAR(255),
  eind_jaar VARCHAR(255)
);

CREATE TABLE verwervingswijze_botanisch (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE persoons_onderwerp (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE betrokkene (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  gebeurtenis_id VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (gebeurtenis_id) REFERENCES gebeurtenis(id),
);

CREATE TABLE degradatie_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE degradatie_status (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  degradatie_status VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (degradatie_status) REFERENCES degradatie_status(id)

);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE datering_methode (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE datering_methode (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  datering_methode VARCHAR(255),
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (datering_methode) REFERENCES datering_methode(id)


);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE maritiem (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  vlaggenstaat VARCHAR(255),
  bouwjaar INT,
  zinkjaar INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (vlaggenstaat) REFERENCES vlaggenstaat(id)
);

CREATE TABLE rechten (
  id INT PRIMARY KEY,
  bav_id VARCHAR(255),
  creative_commons INT,
  rechthebbende INT,
  type_recht INT,
  copyrights VARCHAR(255),
  copyrights_notitie DATE,
  FOREIGN KEY (bav_id) REFERENCES beeld_audio_visueel_object(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE vlaggenstaat (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE locatieaanduiding_status (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE opslag_locatie (
  url VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE verwervingswijze (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE complextype (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE auteur (
  id INT PRIMARY KEY,
  io_id VARCHAR(255),
  auteur VARCHAR(255),
  volgorde_nummer VARCHAR(255)
);

CREATE TABLE redacteur (
  id INT PRIMARY KEY,
  io_id VARCHAR(255),
  redacteur VARCHAR(255),
  volgorde_nummer VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE gebeurtenis (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_gebeurtenis VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_gebeurtenis) REFERENCES naam_gebeurtenis(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE bouwkundige_kwaliteit (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  bouwkundige_staat VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (bouwkundige_staat) REFERENCES bouwkundige_staat(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_gebeurtenis (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

CREATE TABLE betrokkene_gebeurtenis (
  betrokkene_id INT,
  gebeurtenis_id INT,
  PRIMARY KEY (betrokkene_id, gebeurtenis_id),
  FOREIGN KEY (betrokkene_id) REFERENCES betrokkene(id),
  FOREIGN KEY (gebeurtenis_id) REFERENCES gebeurtenis(id)
);

-- Dit is een tabel uit locatieregistratie
CREATE TABLE locatieregistratie (
  id INT PRIMARY KEY,
  cho_id INT,
  vertrouwelijk_aanduiding VARCHAR(255), -- uri
  FOREIGN KEY (cho_id) REFERENCES cultuurhistorisch_object(id),
  FOREIGN KEY (vertrouwelijk_aanduiding) REFERENCES vertrouwelijk_aanduiding(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE bronverwijzing (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_materiaal VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_materiaal) REFERENCES naam_materiaal(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE naam_materiaal (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE materiaal (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  naam_materiaal INT,
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (naam_materiaal) REFERENCES naam_materiaal(id)

);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE archeologische_kwaliteit (
  id INT PRIMARY KEY,
  kennisregistratie_id INT,
  object_kwaliteit VARCHAR(255), -- uri
  FOREIGN KEY (kennisregistratie_id) REFERENCES kennisregistratie(id),
  FOREIGN KEY (object_kwaliteit) REFERENCES object_kwaliteit(id)
);

-- Dit is een tabel uit kennisregistratie
CREATE TABLE object_kwaliteit (
  id INT PRIMARY KEY,
  uri VARCHAR(255),
  label VARCHAR(255)
);





