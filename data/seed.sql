 -- Initial database schema and

CREATE TABLE authors (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE books (
  id int(11) NOT NULL AUTO_INCREMENT,
  author_id int NOT NULL,
  title varchar(100) NOT NULL,
  isbn varchar(13),

  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES authors (id)
) ENGINE=InnoDB;


INSERT INTO authors (name) VALUES ('Suzanne Collins');
SET @id = LAST_INSERT_ID();
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Gregor the Overlander', '9780439678131');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Gregor and the Prophecy of Bane', '9780439650762');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Gregor and the Curse of the Warmbloods', '9780439656245');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Gregor and the Marks of Secret', '9780439791465');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Gregor and the Code of Claw', '9780439791441');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Hunger Games', '9780439023528');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Catching Fire', '9780545227247');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Mockingjay', '9780439023511');

 
INSERT INTO authors (name) VALUES ('Anne McCaffrey');
SET @id = LAST_INSERT_ID();
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Dragonflight', '9780345335463');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Dragonquest', '9780345022455');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The White Dragon', '9780345275677');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Dragonsong', '9780689305078');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Dragonsinger', '9780689305702');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Dragondrums', '9780689306853');


INSERT INTO authors (name) VALUES ('Peter F. Hamilton');
SET @id = LAST_INSERT_ID();
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Mindstar Rising', '9780330537742');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'A Quantum Murder', '9780330537759');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Nano Flower', '9780330537810');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Reality Dysfunction', '9781447208570');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Neutronium Alchemist', '9781447208587');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Naked God', '9781447208594');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Misspent Youth', '9781447224082');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Pandora''s Star', '9781447279662');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Judas Unchained', '9781447279679');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Dreaming Void', '9781447208563');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Temporal Void', '9780330507882');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Evolutionary Void', '9780330443173');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Abyss Beyond Dreams', '9780230769465');


INSERT INTO authors (name) VALUES ('J. K. Rowling');
SET @id = LAST_INSERT_ID();
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Philosopher''s Stone', '0747532699');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Chamber of Secrets', '0747538492');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Prisoner of Azkaban', '0747542155');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Goblet of Fire', '074754624X');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Order of the Phoenix', '0747551006');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Half-Blood Prince', '0747581088');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Harry Potter and the Deathly Hallows', '0545010225');


INSERT INTO authors (name) VALUES ('Ursula Le Guin');
SET @id = LAST_INSERT_ID();
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'A Wizard of Earthsea', '0395276535');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Tombs of Atuan', '187470323X');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Farthest Shore', '0689300549');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Tehanu', '0689315953');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Tales from Earthsea', '0151005613');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Other Wind', '0151006849');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Dispossessed', '0060125632');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Word for World Is Forest', '0399117164');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Rocannon''s World', '0824014243');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Planet of Exile', '0575025956');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'City of Illusions', '0575007583');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Left Hand of Darkness', '0441478123');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Telling', '0151005672');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Lathe of Heaven', '0684125293');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Wind''s Twelve Quarters', '0060125624');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Orsinian Tales', '0060125616');


INSERT INTO authors (name) VALUES ('Terry Pratchett');
SET @id = LAST_INSERT_ID();
 
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Colour of Magic', '086140324X');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Light Fantastic', '0861402030');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Equal Rites', '0575039507');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Mort', '0575041714');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Sourcery', '0575042176');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Wyrd Sisters', '0575043636');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Pyramids', '0575044632');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Guards! Guards!', '0575046066');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Eric', '0575051914');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Moving Pictures', '0575047631');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Reaper Man', '0575049790');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Witches Abroad', '0575049804');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Small Gods', '0060177500');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Lords and Ladies', '0575052236');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Men At Arms', '0575055030');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Soul Music', '0575055049');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Interesting Times', '0575058005');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Maskerade', '0575058080');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Feet of Clay', '0575059001');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Hogfather', '057506403X');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Jingo', '0575065400');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Last Continent', '0385409893');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Carpe Jugulum', '0385409923');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Fifth Elephant', '0385409958');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Truth', '0385601026');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Thief of Time', '0060199563');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Last Hero', '057506885X');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Amazing Murice and his Educated Rodents', '0385601239');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Night Watch', '0385602642');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Wee Free Men', '0385605331');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Monstrous Regiment', '0385603401');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'A Hat Full of Sky', '0385607369');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Going Postal', '0385603428');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Thud!', '0385608675');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Wintersmith', '0385609841');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Making Money', '0385611013');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Unseen Academicals', '0385609345');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'I Shall Wear Midnight', '0385611072');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Snuff', '9780385619264');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'Raising Steam', '9780857522276');
INSERT INTO books (author_id, title, isbn) VALUES (@id, 'The Shepherd''s Crown', '9780857534811');

