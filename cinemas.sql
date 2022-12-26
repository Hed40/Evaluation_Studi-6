CREATE DATABASE IF NOT EXISTS cinemas CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE roles (
role_id CHAR(36) NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE users (
    user_id CHAR(36) NOT NULL PRIMARY KEY  ,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(250),
    password VARCHAR(250),
    birth_year INT (4),
    is_Student BOOLEAN,
  role VARCHAR(50) NOT NULL,
  CONSTRAINT have_role
    FOREIGN KEY (role)
    REFERENCES roles(role_id)
) ENGINE=InnoDB;

CREATE TABLE movies (
movie_id CHAR(36) NOT NULL PRIMARY KEY ,
title VARCHAR(250) NOT NULL,
genre VARCHAR(50),
duration INT(3),
releaseDate DATE
) ENGINE=InnoDB;

CREATE TABLE theaters (
theaters_id CHAR(36) NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
postalAdress VARCHAR(250),
city VARCHAR(50) NOT NULL,
phoneNumber VARCHAR(20) NOT NULL,
email VARCHAR(250) NOT NULL,
roomsQuantity INT(2) NOT NULL,
manager CHAR(36) NOT NULL,
CONSTRAINT is_managed
FOREIGN KEY(manager)
REFERENCES users(user_id)
);

CREATE TABLE moviesRooms (
moviesRooms_id CHAR(36) NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
numberOfSeats INT(5) NOT NULL,
theater CHAR(36) NOT NULL,
CONSTRAINT is_in_the_theater
FOREIGN KEY  (theater)
REFERENCES theaters(theaters_id)
)ENGINE=InnoDB;

CREATE TABLE movieSessions (
sessions_id CHAR(36) NOT NULL PRIMARY KEY,
date DATE NOT NULL,
time TIME NOT NULL,
duration VARCHAR(3) NOT NULL,
availablesSeats INT(5) NOT NULL,
bookedSeats INT(5) NOT NULL,
movie CHAR(36) NOT NULL,
movie_room CHAR(36) NOT NULL,
programmed_by CHAR(36) NOT NULL,
CONSTRAINT is_playing
FOREIGN KEY (movie)
REFERENCES movies(movie_id),
CONSTRAINT show_where
FOREIGN KEY (movie_room)
REFERENCES moviesrooms(moviesRooms_id),
CONSTRAINT is_programmed_by
FOREIGN KEY (programmed_by)
REFERENCES theaters( manager)
)ENGINE=InnoDB;

CREATE TABLE payments (
payments_id CHAR(36) NOT NULL PRIMARY KEY,
paymentsMethods VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE prices (
price_id CHAR(36) NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price DECIMAL(3,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE bookings (
booking_id CHAR(36) NOT NULL PRIMARY KEY,
client_id CHAR(36) NOT NULL,
movie_title CHAR(36) NOT NULL,
sessions CHAR(36) NOT NULL,
payments CHAR(36) NOT NULL,
prices CHAR(36) NOT NULL,
vendor CHAR(36) NOT NULL,
CONSTRAINT is_client
FOREIGN KEY (client_id)
REFERENCES users(user_id),
CONSTRAINT movie_title
FOREIGN KEY (movie_title)
REFERENCES movies(movie_id),
CONSTRAINT sessions
FOREIGN KEY (sessions)
REFERENCES moviesessions(sessions_id),
CONSTRAINT kind_of_payment
FOREIGN KEY (payments)
REFERENCES payments(payments_id),
CONSTRAINT which_price
FOREIGN KEY (prices)
REFERENCES prices(price_id),
CONSTRAINT sell_by
FOREIGN KEY (vendor)
REFERENCES users(user_id)
)ENGINE=InnoDB;


GRANT ALL PRIVILEGES ON cinemas.* TO 'admin' @'%';
GRANT INSERT ON cinemas.movieSessions TO 'manager'@'%';
GRANT INSERT ON cinemas.bookings TO 'seller'@'%';
GRANT SELECT ON cinemas.* TO 'clients'@'%';

FLUSH PRIVILEGES;

INSERT INTO roles (role_id, name) VALUES ('8514c2cc-813a-11ed-ae06-309c2367c9ec','ADMIN');
INSERT INTO roles (role_id, name) VALUES ('b18d4b13-813a-11ed-ae06-309c2367c9ec','MANAGER');
INSERT INTO roles (role_id, name) VALUES ('9ec7e0c3-813a-11ed-ae06-309c2367c9ec','SELLERS');
INSERT INTO roles (role_id,name) VALUES ('c2e870bc-813a-11ed-ae06-309c2367c9ec','CUSTOMERS');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('h7ad846bea85191817188f8d2bcd7437f5236b8a', 'Hope', 'Chart', 'hchart0@ihg.com', '$2y$10$kvYo4bo6UWQO20DKtjFWBOrJmWnCcyuhA2UpJdHeTup5J.UZ2/0FC', 1951, false,'8514c2cc-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('a7ad886bea85691817188f8d2bcd7437f5236b8a', 'Kirbie', 'Hollindale', 'khollindale1@ask.com', '$2y$10$p0yV2jkmRxT1CF6p5/PaOemNHHUzLeg6zOZ1kqfFh3vNVteSDGtsC', 1960, false,'8514c2cc-813a-11ed-ae06-309c2367c9ec');


INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('4eb4c80fc1c7da244e2a5cbef19418d0b53f57cc', 'Mill', 'Dewberry', 'mdewberry0@diigo.com', '$2y$10$gLCh5oBfz.wvY3OWzKk4NO2hsulDuvihAkddXUymMVlVKX3fkPReW', 1974, false, 'b18d4b13-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('1eb4c80fc1c9da564e3a5cbef18418d0b53f58cc', 'Loralyn', 'Yglesias', 'lyglesias1@g.co', '$2y$10$GFgSXfmox50NLtS1bD6KMOKODaJ8fufhG1uKkw6NIe83.d17I1X.O', 1968, false, 'b18d4b13-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('8eb4e80fc1c9da214e5a5cbef19718d0b53f58cc', 'Brittan', 'Smitherham', 'bsmitherham2@rambler.ru', '$2y$10$2W3QpQOkpFqZZEPg7NzXmeIgl2fcHpC8vDQpyKPYRhBn89eNo6Vne', 1955, false, 'b18d4b13-813a-11ed-ae06-309c2367c9ec');



INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('7eb4c80fc1c9da244e2a5cbef16418d0b53f58bs', 'Sydney', 'Whitesel', 'swhitesel3@rakuten.co.jp', '$2y$10$M/sze.dzmaXlV3o/6jfwy.dEAVuhx2V5gQ.h5n.cJRMAAJ19hGccK', 1985, false, '9ec7e0c3-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('1eb4c80fc1c9iu241e2a5qbef12517j0b57f58xf', 'Agneta', 'Foston', 'afoston4@zdnet.com', '$2y$10$9PWL2L3O2K5cbCB6O6rzxeg.uEbzZkXxESC5nyCZTwwSOduqb2Pb2', 1952, false, '9ec7e0c3-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('8eb4c80fc1c9re244e2a4cbef15718d0b83f51gt', 'Donnie', 'O'' Lone', 'dolone5@mysql.com', '$2y$10$N.NvtYHtfns/pSJRRdY5QO5s9/M9mcv8TYHKHKVsO9v3726VTA5TG', 1955, false, '9ec7e0c3-813a-11ed-ae06-309c2367c9ec');


INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('2eb3f80fc1c9ga248e2a5cbef19418d0b43s58op', 'Louisette', 'Wrate', 'lwrate6@addtoany.com', '$2y$10$oo2awk8cHi3vCpmLqNgXouWL.fEBBFg5fMyqbT1AYMaQujlITlLh6', 2004, true, 'c2e870bc-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('6eb4c23fc1c6oa234e2a7cbef13418d0b19f58cc', 'Nickolai', 'Havik', 'nhavik7@chronoengine.com', '$2y$10$L3kOeHalBHOToXmqnng4Z.NlyjIQufGYYSn8g0OWfjXjttwGkKjYm', 1975, false, 'c2e870bc-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('1eb8h85fd1q1pa274e2a5cfef11418d0b49f58cr', 'Adella', 'Bannell', 'abannell8@imdb.com', '$2y$10$.OcF.IvsowKS0I0bbd8fUuXAQmCuxU65CRrcxnu9CITkaMdPsxybe', 2002, true, 'c2e870bc-813a-11ed-ae06-309c2367c9ec');

INSERT INTO users (user_id, firstName, lastName, email, password, birth_year, is_student, role) VALUES ('6eb5s10sc1c7da281e2m5cbef19718d0b33f58eh', 'Myer', 'Smallpeace', 'msmallpeace9@webnode.com', '$2y$10$3TTabM8/zd1WwwC0Bdd1b.6rZi79J.a9sz7Q.bT2.A.NEE3fTsuaC', 1989, false, 'c2e870bc-813a-11ed-ae06-309c2367c9ec');


INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('6e64a7bf-9780-4a7e-898c-f463401497e1', 'Caine Mutiny Court-Martial, The', 'Drama|War', 91, '2022/07/04');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('683154a4-b54e-4473-872c-f366f33a0614', 'Unexpected', 'Comedy|Drama', 116, '2022/02/22');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('d8a60421-7317-4fc9-ba65-ecc85c730ce3', 'Friends of God: A Road Trip with Alexandra Pelosi', 'Documentary', 151, '2022/11/20');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('03e88570-0058-44b7-8463-ffc8812bc94e', 'Dream for an Insomniac', 'Drama|Romance', 110, '2022/07/13');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('835cf1c1-d132-44d3-a3b6-6b2d258b4c64', 'Shock Treatment', 'Comedy|Musical|Sci-Fi', 112, '2022/10/30');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('3b18ba5f-3fb9-40e9-a135-a972af9106a2', 'Fly Away', 'Drama', 131, '2022/06/15');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('fdcf6807-2a61-4d1d-9847-2f23bb9cb187', 'Soupe aux Choux, La', 'Comedy', 38, '2022/11/10');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('d306c283-b75c-4785-a7a9-c028ed6da9ca', 'Camp', 'Drama', 193, '2022/04/05');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('4a143a34-c0fb-4b9f-9674-91f4a50f5cb5', 'Nice Guys Sleep Alone', 'Comedy|Romance', 84, '2022/08/23');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('725dd606-a24f-4dce-a5bd-6d0537c8ff53', 'Just One of the Girls', 'Comedy', 77, '2022/03/02');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('f0d2dab9-b270-4676-a158-7d9c916637d7', '19th Wife, The', 'Drama', 140, '2022/02/22');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('a03919b8-9b34-4a66-97c5-e5c25fd21c69', 'After the Life', 'Crime|Drama', 47, '2022/03/20');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('0a35afa3-daef-4e35-ba68-dfe6283dc5eb', 'Liebelei', 'Romance', 88, '2022/11/24');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('70e203da-fb4b-4fb2-b0b3-e6c998d86719', 'Emperor''s New Groove 2: Kronk''s New Groove, The', 'Animation|Children|Comedy', 189, '2022/07/21');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('a8c05e8f-7a4f-4028-8d9e-b5cac054df3f', 'Tainted', 'Comedy|Thriller', 102, '2022/11/06');
INSERT INTO movies (movie_id, title, genre, duration, releaseDate) VALUES ('a6k05e3f-1o4f-4028-8d9e-c5cac054kf8e', 'Avatar', 'Aventure', 190, '2022/12/15');


INSERT INTO theaters (theaters_id, name, postalAdress, city, phoneNumber, email , roomsQuantity , manager) VALUES ('ea2b39af-ae4e-4034-a6ff-ba943078a232', 'UGC', ' 1 Place de la victoire ', 'Bordeaux', '0556879545', 'UGC@UGC.com', 10, '4eb4c80fc1c7da244e2a5cbef19418d0b53f57cc');
INSERT INTO theaters (theaters_id, name, postalAdress, city, phoneNumber, email , roomsQuantity , manager) VALUES ('f82784cb-a7f1-4545-b782-6ebb67235c83', 'MEGA CGR', ' 145 Rue de la Marne ', 'Bordeaux', '0557419524', 'MCGRBX@MCGR.com', 05, '1eb4c80fc1c9da564e3a5cbef18418d0b53f58cc');
INSERT INTO theaters (theaters_id, name, postalAdress, city, phoneNumber, email , roomsQuantity , manager) VALUES ('e1791e2a-1a20-44dc-bc85-9de589f2d709', 'GRAND ECRAN', ' 22 Rue de la Marne ', 'MERIGNAC', '0556215512', 'GEMERI@GRANDECRAN.com', 7, '1eb4c80fc1c9da564e3a5cbef18418d0b53f58cc');
INSERT INTO theaters (theaters_id, name, postalAdress, city, phoneNumber, email , roomsQuantity , manager) VALUES ('54b5f13c-7e72-4b3b-a953-8b343c489bda', 'LE RENOIR', '43 Rue Jules Ferry ', 'BISCAROSSE', '0558788876', 'LERENOIR@LERENOIR.com', 4, '8eb4e80fc1c9da214e5a5cbef19718d0b53f58cc');


INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('b698af43-b87f-427e-90a9-940222ab3ecf', 'Vincent Cassel', '200', 'ea2b39af-ae4e-4034-a6ff-ba943078a232');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('a2900ec8-3705-4490-b08c-9c3a9fb8d5a3', 'Charleton Heston', '300', 'f82784cb-a7f1-4545-b782-6ebb67235c83');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('cba515b6-4d6d-4324-b39c-6f8225958fd0', 'Charly Chapelin', '100', 'ea2b39af-ae4e-4034-a6ff-ba943078a232');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('1ac083dd-ae86-4676-b872-36f728a0e3df', 'Guillemo Del Toro', '90', 'e1791e2a-1a20-44dc-bc85-9de589f2d709');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('523cb498-f836-428c-8bd9-2653bb8cbe82', 'Robert Redford', '500', '54b5f13c-7e72-4b3b-a953-8b343c489bda');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('30957772-7e1b-4555-b2ed-e3bd41d701d5', 'Cédric Dumaine', '150', '54b5f13c-7e72-4b3b-a953-8b343c489bda');
INSERT INTO moviesRooms (moviesRooms_id, name, numberOfSeats, theater) VALUES ('e82d2b85-b579-4a5c-9cdd-58e2adb55114', 'Steven Spelberg', '250', 'f82784cb-a7f1-4545-b782-6ebb67235c83');


INSERT INTO movieSessions (sessions_id, date, time, duration, availablesSeats, bookedSeats, movie, movie_room, programmed_by) VALUES ('28c58eea-a648-4d24-a90d-10493569c14a','2022-04-21','16:10','180','5','150','6e64a7bf-9780-4a7e-898c-f463401497e1','b698af43-b87f-427e-90a9-940222ab3ecf','4eb4c80fc1c7da244e2a5cbef19418d0b53f57cc');
INSERT INTO movieSessions (sessions_id, date, time, duration, availablesSeats, bookedSeats, movie, movie_room, programmed_by) VALUES ('c22431bc-9280-4c1a-ac8f-6c28a75fa237','2022-06-30','17:10','120','4','125','683154a4-b54e-4473-872c-f366f33a0614','a2900ec8-3705-4490-b08c-9c3a9fb8d5a3','1eb4c80fc1c9da564e3a5cbef18418d0b53f58cc');
INSERT INTO movieSessions (sessions_id, date, time, duration, availablesSeats, bookedSeats, movie, movie_room, programmed_by) VALUES ('9648f4dd-ded4-4d68-bc8a-3694f8edaaf8','2022-10-25','20:30','180','25','150','683154a4-b54e-4473-872c-f366f33a0614','1ac083dd-ae86-4676-b872-36f728a0e3df','8eb4e80fc1c9da214e5a5cbef19718d0b53f58cc');

INSERT INTO payments (payments_id, paymentsMethods) VALUES ('eeeaa26d-f38b-4f68-a3a5-f88e08aa7342', 'PAYMENT ON THE SPOT');
INSERT INTO payments (payments_id, paymentsMethods) VALUES ('d17c8654-9be0-4fcf-813e-6176cbd9bf23', 'PAYMENT ONLINE');

INSERT INTO prices (price_id, name, price) VALUES ('9de546ea-3410-434f-a634-aad8f2321a11', 'Full price', '9.20');
INSERT INTO prices (price_id, name, price) VALUES ('a8b99be8-3f1f-4ae8-b637-7430926ca62a', 'Student', '7.60');
INSERT INTO prices (price_id, name, price) VALUES ('b07e85ee-4cfd-42ae-ae20-9a8725117351', 'Less 14 years hold', '5.90');

INSERT INTO bookings (booking_id, client_id, movie_title, sessions, payments, prices, vendor) VALUES (
'5f94d066-b3e7-4124-83cf-8a7cb45d3d60',
'2eb3f80fc1c9ga248e2a5cbef19418d0b43s58op',
'd306c283-b75c-4785-a7a9-c028ed6da9ca',
'28c58eea-a648-4d24-a90d-10493569c14a',
'eeeaa26d-f38b-4f68-a3a5-f88e08aa7342',
'9de546ea-3410-434f-a634-aad8f2321a11',
'7eb4c80fc1c9da244e2a5cbef16418d0b53f58bs'
); 

INSERT INTO bookings (booking_id, client_id, movie_title, sessions, payments, prices, vendor) VALUES (
'bba343e8-2375-436c-a98b-c40a717903b2',
'6eb4c23fc1c6oa234e2a7cbef13418d0b19f58cc',
'70e203da-fb4b-4fb2-b0b3-e6c998d86719',
'9648f4dd-ded4-4d68-bc8a-3694f8edaaf8',
'd17c8654-9be0-4fcf-813e-6176cbd9bf23',
'b07e85ee-4cfd-42ae-ae20-9a8725117351',
'8eb4c80fc1c9re244e2a4cbef15718d0b83f51gt'
); 