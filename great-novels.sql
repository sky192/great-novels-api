create database greatnovels; 
create user 'greatnovels'@'localhost' identified with mysql_native_password by 'novel$';
grant all on greatnovels.* to 'greatnovels'@'localhost';
use greatnovels;
create table authors (
	id INT auto_increment,
    name VARCHAR(255),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id)
);
create table genres (
	id INT auto_increment,
    type VARCHAR(255),
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id)
);
create table novels (
	id INT auto_increment,
    title VARCHAR(255),
    authorId INT,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    deletedAt DATETIME,
    primary key(id),
    foreign key (authorId) references authors (id)
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

insert into authors (name) values ("Bram Stoker");
insert into authors (name) values ("Oscar Wilde");
insert into authors (name) values ("Alice Walker");
insert into authors (name) values ("Leo Tolstoy");
insert into authors (name) values ("Charles Dickens");
insert into authors (name) values ("Arthur Miller");
insert into authors (name) values ("Alexandre Dumas");
insert into authors (name) values ("Arthur Conan Doyle");
insert into authors (name) values ("Robert Louis Stevenson");
insert into authors (name) values ("Fyodor Dostoyevsky");
insert into authors (name) values ("Agatha Christie");
insert into authors (name) values ("Ray Bradbury");
insert into authors (name) values ("George Orwell");
insert into authors (name) values ("H.G. Wells");
insert into authors (name) values ("Chinua Achebe");

INSERT INTO genres (type) VALUES ("Adventure");
INSERT INTO genres (type) VALUES ("African Literature");
INSERT INTO genres (type) VALUES ("Crime");
INSERT INTO genres (type) VALUES ("Drama");
INSERT INTO genres (type) VALUES ("Dystopia");
INSERT INTO genres (type) VALUES ("Fantasy");
INSERT INTO genres (type) VALUES ("Fiction");
INSERT INTO genres (type) VALUES ("French Literature");
INSERT INTO genres (type) VALUES ("Gothic");
INSERT INTO genres (type) VALUES ("Historical Fiction");
INSERT INTO genres (type) VALUES ("Horror");
INSERT INTO genres (type) VALUES ("Mystery");
INSERT INTO genres (type) VALUES ("Plays");
INSERT INTO genres (type) VALUES ("Russian Literature");
INSERT INTO genres (type) VALUES ("Science Fiction");
INSERT INTO genres (type) VALUES ("Thriller");
INSERT INTO genres (type) VALUES ("Time Travel");
INSERT INTO genres (type) VALUES ("War");

INSERT INTO novels (title, authorId) VALUES ("Dracula", 1);
INSERT INTO novels (title, authorId) VALUES ("The Picture of Dorian Gray", 2);
INSERT INTO novels (title, authorId) VALUES ("The Color Purple", 3);
INSERT INTO novels (title, authorId) VALUES ("War and Peace", 4);
INSERT INTO novels (title, authorId) VALUES ("A Tale of Two Cities", 5);
INSERT INTO novels (title, authorId) VALUES ("The Crucible", 6);
INSERT INTO novels (title, authorId) VALUES ("The Three Musketeers", 7);
INSERT INTO novels (title, authorId) VALUES ("The Hound of the Baskervilles", 8);
INSERT INTO novels (title, authorId) VALUES ("The Strange Case of Dr. Jekyll and Mr. Hyde", 9);
INSERT INTO novels (title, authorId) VALUES ("Crime and Punishment", 10);
INSERT INTO novels (title, authorId) VALUES ("Murder on the Orient Express", 11);
INSERT INTO novels (title, authorId) VALUES ("Fahrenheit 451", 12);
INSERT INTO novels (title, authorId) VALUES ("Animal Farm", 13);
INSERT INTO novels (title, authorId) VALUES ("The Time Machine", 14);
INSERT INTO novels (title, authorId) VALUES ("Things Fall Apart", 15);

INSERT INTO novelsGenres (novelId, genreId) VALUES (1, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (1, 11);
INSERT INTO novelsGenres (novelId, genreId) VALUES (1, 6);
INSERT INTO novelsGenres (novelId, genreId) VALUES (2, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (2, 11);
INSERT INTO novelsGenres (novelId, genreId) VALUES (2, 9);
INSERT INTO novelsGenres (novelId, genreId) VALUES (2, 6);
INSERT INTO novelsGenres (novelId, genreId) VALUES (3, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (3, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (4, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (4, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (4, 18);
INSERT INTO novelsGenres (novelId, genreId) VALUES (4, 14);
INSERT INTO novelsGenres (novelId, genreId) VALUES (5, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (5, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (6, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (6, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (6, 4);
INSERT INTO novelsGenres (novelId, genreId) VALUES (6, 13);
INSERT INTO novelsGenres (novelId, genreId) VALUES (7, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (7, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (7, 1);
INSERT INTO novelsGenres (novelId, genreId) VALUES (7, 8);
INSERT INTO novelsGenres (novelId, genreId) VALUES (8, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (8, 12);
INSERT INTO novelsGenres (novelId, genreId) VALUES (8, 3);
INSERT INTO novelsGenres (novelId, genreId) VALUES (8, 16);
INSERT INTO novelsGenres (novelId, genreId) VALUES (9, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (9, 12);
INSERT INTO novelsGenres (novelId, genreId) VALUES (9, 15);
INSERT INTO novelsGenres (novelId, genreId) VALUES (9, 11);
INSERT INTO novelsGenres (novelId, genreId) VALUES (10, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (10, 14);
INSERT INTO novelsGenres (novelId, genreId) VALUES (10, 12);
INSERT INTO novelsGenres (novelId, genreId) VALUES (11, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (11, 12);
INSERT INTO novelsGenres (novelId, genreId) VALUES (12, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (12, 15);
INSERT INTO novelsGenres (novelId, genreId) VALUES (12, 5);
INSERT INTO novelsGenres (novelId, genreId) VALUES (13, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (13, 15);
INSERT INTO novelsGenres (novelId, genreId) VALUES (13, 5);
INSERT INTO novelsGenres (novelId, genreId) VALUES (14, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (14, 15);
INSERT INTO novelsGenres (novelId, genreId) VALUES (14, 17);
INSERT INTO novelsGenres (novelId, genreId) VALUES (15, 7);
INSERT INTO novelsGenres (novelId, genreId) VALUES (15, 10);
INSERT INTO novelsGenres (novelId, genreId) VALUES (15, 2);