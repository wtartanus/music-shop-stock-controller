DROP TABLE artists;
DROP TABLE albums;
DROP TABLE inventory;

CREATE TABLE artists(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL4 primary key,
  name VARCHAR(255),
  gender VARCHAR(255),
  price_buying INT4,
  price_selling INT4,
  stock INT4
);

CREATE TABLE inventory(
  id SERIAL4 primary key,
  artist_id INT4 references artists ( id ) ON DELETE CASCADE,
  album_id INT4 references albums ( id ) ON DELETE CASCADE
);
