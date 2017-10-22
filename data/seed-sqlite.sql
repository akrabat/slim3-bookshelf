 -- Initial database schema and data
drop table if exists "books";
drop table if exists "authors";

create table "authors" (
  "id" integer primary key autoincrement not null,
  "name" char(100),
  biography text
);

create table "books" (
  "id" integer primary key autoincrement not null,
  "author_id" integer not null,
  "title" char(100) not null,
  "isbn" char(13),
  "description" text,

  foreign key(author_id) references authors(id)
);


INSERT INTO authors (name, biography) VALUES ('Suzanne Collins', 'Suzanne Marie Collins is an American television writer and novelist, best known as the author of The Underland Chronicles and The Hunger Games trilogy');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Gregor the Overlander', '9780439678131');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Gregor and the Prophecy of Bane', '9780439650762');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Gregor and the Curse of the Warmbloods', '9780439656245');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Gregor and the Marks of Secret', '9780439791465');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Gregor and the Code of Claw', '9780439791441');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'The Hunger Games', '9780439023528');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Catching Fire', '9780545227247');
INSERT INTO books (author_id, title, isbn) VALUES (1, 'Mockingjay', '9780439023511');

INSERT INTO authors (name) VALUES ('Anne McCaffrey');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'Dragonflight', '9780345335463');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'Dragonquest', '9780345022455');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'The White Dragon', '9780345275677');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'Dragonsong', '9780689305078');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'Dragonsinger', '9780689305702');
INSERT INTO books (author_id, title, isbn) VALUES (2, 'Dragondrums', '9780689306853');


INSERT INTO authors (name) VALUES ('Peter F. Hamilton');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'Mindstar Rising', '9780330537742');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'A Quantum Murder', '9780330537759');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Nano Flower', '9780330537810');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Reality Dysfunction', '9781447208570');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Neutronium Alchemist', '9781447208587');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Naked God', '9781447208594');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'Misspent Youth', '9781447224082');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'Pandora''s Star', '9781447279662');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'Judas Unchained', '9781447279679');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Dreaming Void', '9781447208563');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Temporal Void', '9780330507882');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Evolutionary Void', '9780330443173');
INSERT INTO books (author_id, title, isbn) VALUES (3, 'The Abyss Beyond Dreams', '9780230769465');


INSERT INTO authors (name) VALUES ('J. K. Rowling');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Philosopher''s Stone', '0747532699');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Chamber of Secrets', '0747538492');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Prisoner of Azkaban', '0747542155');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Goblet of Fire', '074754624X');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Order of the Phoenix', '0747551006');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Half-Blood Prince', '0747581088');
INSERT INTO books (author_id, title, isbn) VALUES (4, 'Harry Potter and the Deathly Hallows', '0545010225');


INSERT INTO authors (name) VALUES ('Ursula Le Guin');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'A Wizard of Earthsea', '0395276535');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Tombs of Atuan', '187470323X');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Farthest Shore', '0689300549');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'Tehanu', '0689315953');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'Tales from Earthsea', '0151005613');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Other Wind', '0151006849');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Dispossessed', '0060125632');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Word for World Is Forest', '0399117164');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'Rocannon''s World', '0824014243');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'Planet of Exile', '0575025956');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'City of Illusions', '0575007583');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Left Hand of Darkness', '0441478123');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Telling', '0151005672');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Lathe of Heaven', '0684125293');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'The Wind''s Twelve Quarters', '0060125624');
INSERT INTO books (author_id, title, isbn) VALUES (5, 'Orsinian Tales', '0060125616');


INSERT INTO authors (name) VALUES ('Terry Pratchett');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Colour of Magic', '086140324X');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Light Fantastic', '0861402030');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Equal Rites', '0575039507');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Mort', '0575041714');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Sourcery', '0575042176');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Wyrd Sisters', '0575043636');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Pyramids', '0575044632');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Guards! Guards!', '0575046066');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Eric', '0575051914');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Moving Pictures', '0575047631');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Reaper Man', '0575049790');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Witches Abroad', '0575049804');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Small Gods', '0060177500');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Lords and Ladies', '0575052236');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Men At Arms', '0575055030');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Soul Music', '0575055049');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Interesting Times', '0575058005');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Maskerade', '0575058080');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Feet of Clay', '0575059001');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Hogfather', '057506403X');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Jingo', '0575065400');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Last Continent', '0385409893');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Carpe Jugulum', '0385409923');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Fifth Elephant', '0385409958');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Truth', '0385601026');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Thief of Time', '0060199563');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Last Hero', '057506885X');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Amazing Murice and his Educated Rodents', '0385601239');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Night Watch', '0385602642');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Wee Free Men', '0385605331');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Monstrous Regiment', '0385603401');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'A Hat Full of Sky', '0385607369');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Going Postal', '0385603428');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Thud!', '0385608675');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Wintersmith', '0385609841');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Making Money', '0385611013');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Unseen Academicals', '0385609345');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'I Shall Wear Midnight', '0385611072');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Snuff', '9780385619264');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'Raising Steam', '9780857522276');
INSERT INTO books (author_id, title, isbn) VALUES (6, 'The Shepherd''s Crown', '9780857534811');

