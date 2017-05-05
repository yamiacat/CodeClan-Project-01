DROP TABLE IF EXISTS editions;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
id SERIAL8 PRIMARY KEY,
artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
title VARCHAR(255),
genre VARCHAR(255),
original_release_year INT4
);

CREATE TABLE editions (
  id SERIAL8 PRIMARY KEY,
  title_id INT8 REFERENCES albums(id) ON DELETE CASCADE,
  format VARCHAR(255),
  version_notes VARCHAR(255)
  edition_release_year INT4,
  number_in_stock INT4,
  supplier_price INT4,
  retail_price INT4
);
