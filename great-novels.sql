CREATE DATABASE greatnovels; 
CREATE USER 'novel'@'localhost' identified with mysql_native_password by 'novel$';
GRANT ALL ON greatnovels.* TO 'novel'@'localhost';
USE greatnovels;

CREATE TABLE authors (
id INT auto_increment,
	nameFirst VARCHAR(255),
	nameLast VARCHAR(255),
	createdAt DATETIME DEFAULT NOW(),
	updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
	deletedAt DATETIME,
	PRIMARY KEY(id)
);
CREATE TABLE genres (
	id INT auto_increment,
    name VARCHAR(255),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(id)
);
CREATE TABLE novels (
	id INT auto_increment,
    title VARCHAR(255),
    authorId INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (authorId)REFERENCES authors (id)
);

CREATE TABLE novelsGenres (
  novelId INT,
  genreId INT,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(novelId, genreId),
  FOREIGN KEY (novelId) REFERENCES novels(id),
  FOREIGN KEY (genreId) REFERENCES genres(id)
);

INSERT INTO authors (nameFirst, nameLast) 
VALUES ("Bram", "Stoker"),
("Oscar","Wilde"),
("Alice","Walker"),
("Leo","Tolstoy"),
("Charles","Dickens"),
("Arthur","Miller"),
("Alexandre","Dumas"),
("Arthur Conan","Doyle"),
("Robert Louis","Stevenson"),
("Fyodor","Dostoyevsky"),
("Agatha","Christie"),
("Ray","Bradbury"),
("George","Orwell"),
("H.G.","Wells"),
("Chinua","Achebe");

INSERT INTO genres (name) 
VALUES ("Adventure"),
("African Literature"),
("Crime"),
("Drama"),
("Dystopia"),
("Fantasy"),
("Fiction"),
("French Literature"),
("Gothic"),
("Historical Fiction"),
("Horror"),
("Mystery"),
("Plays"),
("Russian Literature"),
("Science Fiction"),
("Thriller"),
("Time Travel"),
("War");
INSERT INTO novels (title,authorId) 
VALUES ("Dracula",1),
("The Picture of Dorian Gray",2),
("The Color Purple",3),
("War and Peace",4),
("A Tale of Two Cities",5),
("The Crucible",6),
("The Three Musketeers",7),
("The Hound of the Baskervilles",8),
("The Strange Case of Dr. Jekyll and Mr. Hyde",9),
("Crime and Punishment",10),
("Murder on the Orient Express",11),
("Fahrenheit 451",12),
("Animal Farm",13),
("The Time Machine",14),
("Things Fall Apart",15);

INSERT INTO novelsGenres (genreId,novelId) 
VALUES (7,1),
(11,1),
(6,1),
(7,2),
(11,2),
(9,2),
(6,2),
(7,3),
(10,3),
(7,4),
(10,4),
(18,4),
(14,4),
(7,5),
(10,5),
(7,6),
(10,6),
(4,6),
(13,6),
(7,7),
(10,7),
(1,7),
(8,7),
(7,8),
(12,8),
(3,8),
(16,8),
(7,9),
(12,9),
(15,9),
(11,9),
(7,10),
(14,10),
(12,10),
(7,11),
(12,11),
(7,12),
(15,12),
(5,12),
(7,13),
(15,13),
(5,13),
(7,14),
(15,14),
(17,14),
(7,15),
(10,15),
(2,15);