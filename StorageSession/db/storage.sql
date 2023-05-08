create database storage;
use storage;


CREATE TABLE Prodotto(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    descrizione VARCHAR(255),
    quantita INT NOT NULL CHECK(quantita>=0),
    prezzoAttuale FLOAT NOT NULL CHECK(prezzoAttuale >= 0.1)
);

insert into prodotto values (1,"noisy creek 2", "box semimeccanica", 12, 29.99);
insert into prodotto values (2,"kiwi", "pod entry level", 25, 79.99);
insert into prodotto values (3,"voopoo drag 2", "box completa", 5, 49.99);
insert into prodotto values (4,"smok nord", "pod", 22, 69.99);