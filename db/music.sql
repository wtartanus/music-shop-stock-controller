DROP TABLE discography;
DROP TABLE artists;
DROP TABLE albums;


CREATE TABLE artists(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL4 primary key,
  name VARCHAR(255),
  genre VARCHAR(255),
  price_buying INT4,
  price_selling INT4,
  shelf VARCHAR(255),
  stock INT4
);

CREATE TABLE discography(
  id SERIAL4 primary key,
  artist_id INT4 references artists ( id ) ON DELETE CASCADE,
  album_id INT4 references albums ( id ) ON DELETE CASCADE
);
