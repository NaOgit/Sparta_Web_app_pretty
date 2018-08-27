DROP TABLE IF EXISTS post;
-- remove table called "post"

CREATE TABLE post (

  id SERIAL PRIMARY KEY,
  image_link TEXT,
  name VARCHAR(255),
  type VARCHAR(255),
  species VARCHAR(255),
  abilities VARCHAR(255),
  description TEXT
);

INSERT INTO post (image_link, name, type, species, abilities, description) VALUES ('https://vignette.wikia.nocookie.net/monstermovies/images/7/77/Bulbasaur_by_Xous54.png/revision/latest?cb=20120720155936', 'Bulbasuar' , 'Grass', 'Seed Pokemon', 'Overgrow, Chorophyll', 'Bulbasaur is a small, quadruped Pokémon that has blue-green skin with darker green patches. It has red eyes with white pupils and scleras. It also has pointed, ear-like structures on top of its head. Its snout is short and blunt, and it has a wide mouth. A pair of small, pointed teeth are visible in the upper jaw when its mouth is open. Each of its thick legs ends with three sharp claws. On its back is a green plant bulb, which is grown from a seed planted there at birth. The bulb provides it with energy through photosynthesis as well as from the nutrient-rich seeds contained within.');
INSERT INTO post (image_link, name, type, species, abilities,  description) VALUES ('https://vignette.wikia.nocookie.net/ultimate-pokemon-fanon/images/5/55/004Charmander_OS_anime_3.png/revision/latest?cb=20160513235325', 'Charmander' , 'Fire', 'Lizard Pokemon', 'Blaze, Solar Power', 'Charmander is a bipedal, reptilian Pokémon with a primarily orange body. Its underside from the chest down and soles are cream-colored. It has two small fangs visible in its upper jaw and two smaller fangs in its lower jaw. Charmander has blue eyes. Its arms and legs are short with four fingers and three clawed toes. A fire burns at the tip of the slender tail of Charmander and has blazed there since its birth. The flame can be used as an indication of its health and mood, burning brightly when the Pokémon is strong, weakly when it is exhausted, wavering when it is happy, and blazing when it is enraged. It is said that Charmander dies if its flame goes out. However, if the Pokémon is healthy, the flame will continue to burn even if it gets a bit wet and is said to steam in the rain.');
INSERT INTO post (image_link, name, type, species, abilities, description) VALUES ('https://vignette.wikia.nocookie.net/winx-club-and-freinds-adventures/images/e/e3/Squirtle.png/revision/latest?cb=20170420051843', 'Squirtle' , 'Water', 'Tiny Turtle Pokemon', 'Torrent, Rain Dish', 'Squirtle is a small Pokémon that resembles a light blue turtle. While it typically walks on its two short legs, it has been shown to run on all fours in Super Smash Bros. Brawl. It has large eyes and a slightly hooked upper lip. Each of its hands and feet has three pointed digits. The end of its long tail curls inward. Its body is encased by a tough shell that forms and hardens after birth. This shell is brown on the top, pale yellow on the bottom, and has a thick white ridge between the two halves.');
INSERT INTO post (image_link, name, type, species, abilities, description) VALUES ('https://vignette.wikia.nocookie.net/nintendo/images/0/05/Caterpie.png/revision/latest?cb=20141002083123&path-prefix=en', 'Caterpie' , 'Bug', 'Worm Pokemon','Shield Dust, Run Away', 'Caterpie is a Pokémon that resembles a green caterpillar. There are yellow ring-shaped markings down the sides of its body, which resemble its eyes and are meant to scare off predators. Its most notable characteristic is the bright red antenna (osmeterium) on its head, which releases a stench to repel predators. Despite these features and its camouflage in green foliage, Caterpie is often preyed upon by Flying-type Pokémon. Its feet are tipped with suction cups, permitting this Pokémon to scale most surfaces with minimal effort.');

-- template
-- create table for database
