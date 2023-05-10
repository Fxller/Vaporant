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


CREATE TABLE Utente(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(20) NOT NULL,
    cognome  VARCHAR(20) NOT NULL,
    dataNascita DATE NOT NULL,
    CF CHAR(16) UNIQUE NOT NULL,
    numTelefono VARCHAR(14),  -- Si potrebbe mettere unique ma magari un utente ha piu account con lo stesso numTelefono
    email VARCHAR(40) UNIQUE NOT NULL,
    psw VARCHAR(30) NOT NULL, 
    citta VARCHAR(20) NOT NULL,
    provincia CHAR(2) NOT NULL,
    cap CHAR(5) NOT NULL,
    via VARCHAR(30) NOT NULL,
    numCivico INT NOT NULL,
    stato VARCHAR(20) NOT NULL,
    tipo VARCHAR(5) DEFAULT 'user' NOT NULL CHECK(tipo = 'user' OR tipo = 'admin') 
);

INSERT INTO Utente VALUES(1,'Gianfranco','Barba', '2002-02-15', 'BRBGFR02B15A508B', '3290026234', 'g.barba14@studenti.unisa.it', 'ABC123.', 'Avella', 'AV', '83031', 'Via F. Vittoria', 12, 'Italia','admin');
INSERT INTO Utente VALUES(2,'Luigi','Guida', '2002-11-09', 'GDDLGG10G11A908B', '3336543123', 'l.guida6@studenti.unisa.it', 'CBA321.', 'Boscotrecase', 'NA', '80042', 'Via Trecase', 1, 'Italia','admin');
INSERT INTO Utente VALUES(3,'Francesco','Corcione', '2002-07-07', 'CRC07FRC07A567C', '3389076543', 'f.corcione5@studenti.unisa.it', '123ABC.', 'Ottaviano', 'NA', '80044', 'Via Terre Sperdute', 2, 'Italia','admin');
INSERT INTO Utente VALUES(4,'Tullio','Mansi', '2002-02-20', 'MNS02TLL20A678D', '3409876321', 't.mansi@studenti.unisa.it', '321CBA.', 'Ravello', 'SA', '84010', 'Via Sulla Montagna', 3, 'Italia','user');

CREATE TABLE Ordine(
    ID_Ordine INT PRIMARY KEY AUTO_INCREMENT,
    ID_Utente INT NOT NULL, 
    prezzoTot FLOAT NOT NULL CHECK(prezzoTot >= 0.1),
    dataAcquisto DATE NOT NULL,
    metodoPagamento VARCHAR(50) check(metodoPagamento = "PayPal" OR metodoPagamento = "Carta di credito/debito"),
    FOREIGN KEY(ID_Utente) REFERENCES Utente(ID)
);

CREATE TABLE Contenuto(
    ID_Ordine INT NOT NULL,
    ID_Prodotto INT NOT NULL,
    quantita INT NOT NULL CHECK(quantita >= 1),
    prezzoAcquisto FLOAT NOT NULL CHECK(prezzoAcquisto >= 0.1),
    ivaAcquisto INT NOT NULL CHECK(ivaAcquisto >= 0) DEFAULT 22,
    PRIMARY KEY(ID_Ordine, ID_Prodotto),
    FOREIGN KEY(ID_Prodotto) REFERENCES Prodotto(ID),
    FOREIGN KEY(ID_Ordine) REFERENCES Ordine(ID_Ordine)
);

INSERT INTO Ordine VALUES (1,4,36.58,'2023-05-08', 'PayPal'); -- calcolato con iva 22
INSERT INTO Ordine VALUES (2,4,97.58,'2023-05-08', 'PayPal'); -- calcolato con iva 22
INSERT INTO Ordine VALUES (3,4,73.17,'2023-05-08', 'PayPal'); -- calcolato con iva 22

INSERT INTO Contenuto VALUES(1,1,1,29.99,22);
INSERT INTO Contenuto VALUES(2,2,1,79.99,22);
INSERT INTO Contenuto VALUES(3,1,2,29.99,22);