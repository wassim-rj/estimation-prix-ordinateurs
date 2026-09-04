DROP DATABASE IF EXISTS pc_db;

CREATE DATABASE pc_db;
USE pc_db;

CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL
);

CREATE TABLE historique_predictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marque VARCHAR(50),
    ram INT,
    processeur VARCHAR(100),
    prix_estime DOUBLE,
    date_simulation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO utilisateurs (nom, email, mot_de_passe) VALUES ('Wassim', 'wassim@email.com', '123456');
INSERT INTO historique_predictions (marque, ram, processeur, prix_estime) VALUES ('Dell', 16, 'Intel Core i5 11th Gen.', 606.54);