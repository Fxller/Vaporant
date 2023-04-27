DROP DATABASE IF EXISTS storage;
CREATE DATABASE storage;
USE storage;

DROP TABLE IF EXISTS product;

CREATE TABLE product (	
  code int primary key,
  name varchar(200) not null,
  description varchar(800),
  price int default 0,
  quantity int default 0,
  nome_file char(100)
);

INSERT INTO product values (1,"Zaino All-in-one","Il nostro iconico zaino,puoi trasportare i tuoi oggetti essenziali quotidiani in una maniera più comoda ed efficiente.",88,50,"img1");
INSERT INTO product values (2,"Day-to-Day","Leggero,portatile e agevolmente versatile,lo zaino ThickPack è lo zaino più comodo che abbiamo nel nostro catalogo",180,60,"img2");
INSERT INTO product values (3,"Tech-Pack","Lo zaino Tech-Pack è uno zaino fornito con tantissime tasche per organizzare bene il tutto e una porta di ricarica USB.",220,15,"img3");
INSERT INTO product values (4,"Eliz","Dal design elegante,pratico e intelligente che combina moda e funzionalità,il classico Eliz è un moderno zaino con patta a scatto ideato pensando al tuo comfort.",130,5,"img4");
INSERT INTO product values (5,"Mini-Zaino","Piccolo ma potente,il Mini-Zaino è qui per accompagnarti nelle tue avventure di tutti i giorni.",150,20,"img5");