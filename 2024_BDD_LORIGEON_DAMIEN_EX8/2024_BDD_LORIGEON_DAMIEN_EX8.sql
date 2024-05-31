{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww14060\viewh14940\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Ajout de la table Disponibilite\
CREATE TABLE Disponibilite (\
    ID_Disponibilite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\
    ID_Materiel INT,\
    DateDebut DATE,\
    DateFin DATE,\
    FOREIGN KEY (ID_Materiel) REFERENCES Materiel(ID_Materiel)\
);\
\
# Ajout de la colonne ID_Disponibilite dans la table Reservation\
ALTER TABLE Reservation\
ADD COLUMN ID_Disponibilite INT,\
ADD FOREIGN KEY (ID_Disponibilite) REFERENCES Disponibilite(ID_Disponibilite);\
\
# D\'e9clencheur avant l insertion pour v\'e9rifier la disponibilit\'e9 du mat\'e9riel\
DELIMITER //\
\
CREATE TRIGGER Before_Reservation_Insert\
BEFORE INSERT ON Reservation\
FOR EACH ROW\
BEGIN\
    DECLARE Availability_Count INT;\
    SET Availability_Count = (\
        SELECT COUNT(*)\
        FROM Disponibilite\
        WHERE ID_Materiel = NEW.Materiel_ID\
        AND NEW.DateDebutReservation BETWEEN DateDebut AND DateFin\
        AND NEW.DateFinReservation BETWEEN DateDebut AND DateFin\
    );\
    IF Availability_Count = 0 THEN\
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le mat\'e9riel n''est pas disponible pendant cette p\'e9riode.';\
    END IF;\
END//\
\
DELIMITER ;\
\
# D\'e9clencheur avant la mise \'e0 jour de la disponibilit\'e9\
DELIMITER $$\
\
CREATE TRIGGER Before_Disponibilite_Update BEFORE UPDATE ON Disponibilite\
FOR EACH ROW\
BEGIN\
    DECLARE Reservation_Count INT;\
    SET Reservation_Count = (\
        SELECT COUNT(*)\
        FROM Reservation\
        WHERE Materiel_ID = NEW.ID_Materiel\
        AND (NEW.DateDebut BETWEEN DateDebutReservation AND DateFinReservation\
        OR NEW.DateFin BETWEEN DateDebutReservation AND DateFinReservation\
        OR (NEW.DateDebut <= DateDebutReservation AND NEW.DateFin >= DateFinReservation))\
    );\
    IF Reservation_Count > 0 THEN\
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La nouvelle p\'e9riode de disponibilit\'e9 se chevauche avec des r\'e9servations existantes.';\
    END IF;\
END $$\
\
DELIMITER ;\
\
# D\'e9clencheur avant suppression de la disponibilit\'e9\
DELIMITER $$\
\
CREATE TRIGGER Before_Disponibilite_Delete BEFORE DELETE ON Disponibilite\
FOR EACH ROW\
BEGIN\
    DECLARE Reservation_Count INT;\
    SET Reservation_Count = (\
        SELECT COUNT(*)\
        FROM Reservation\
        WHERE ID_Disponibilite = OLD.ID_Disponibilite\
    );\
    IF Reservation_Count > 0 THEN\
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible de supprimer cette disponibilit\'e9 car elle est associ\'e9e \'e0 des r\'e9servations existantes.';\
    END IF;\
END $$\
\
DELIMITER ;\
\
# Test 1 : Ajouter une r\'e9servation valide\
# Cette r\'e9servation doit passer car elle est dans la p\'e9riode de disponibilit\'e9 du mat\'e9riel\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)\
VALUES ('2024-03-05', '2024-03-06', '2024-03-07', 1, 1, 'confirm\'e9e', 1);\
\
# Test 2 : Ajouter une r\'e9servation invalide\
# Cette r\'e9servation doit \'e9chouer car elle chevauche une r\'e9servation existante\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)\
VALUES ('2024-03-05', '2024-03-07', '2024-03-09', 1, 1, 'confirm\'e9e', 1);\
\
# Test 3 : Ajouter une r\'e9servation avec une p\'e9riode en dehors de la disponibilit\'e9\
# Cette r\'e9servation doit \'e9chouer car elle est en dehors de la p\'e9riode de disponibilit\'e9 du mat\'e9riel\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)\
VALUES ('2024-03-05', '2024-02-25', '2024-03-01', 1, 1, 'confirm\'e9e', 1);\
\
# Test 4 : Ajouter une r\'e9servation pour un autre mat\'e9riel disponible\
# Cette r\'e9servation doit passer car elle est dans la p\'e9riode de disponibilit\'e9 d'un autre mat\'e9riel\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)\
VALUES ('2024-03-05', '2024-03-06', '2024-03-07', 2, 2, 'confirm\'e9e', NULL);\
\
# Test 5 : Modifier une p\'e9riode de disponibilit\'e9 (valide)\
# Cette modification doit r\'e9ussir car elle ne chevauche aucune r\'e9servation existante\
UPDATE Disponibilite SET DateDebut = '2024-03-02', DateFin = '2024-03-10' WHERE ID_Disponibilite = 1;\
\
# Test 6 : Modifier une p\'e9riode de disponibilit\'e9 (chevauchement)\
# Cette modification doit \'e9chouer car elle chevauche des r\'e9servations existantes\
UPDATE Disponibilite SET DateDebut = '2024-03-05', DateFin = '2024-03-15' WHERE ID_Disponibilite = 1;\
\
# Test 7 : Supprimer une p\'e9riode de disponibilit\'e9 associ\'e9e \'e0 des r\'e9servations\
# Cette suppression doit \'e9chouer car la disponibilit\'e9 est associ\'e9e \'e0 des r\'e9servations existantes\
DELETE FROM Disponibilite WHERE ID_Disponibilite = 1;\
\
# Test 8 : Supprimer une p\'e9riode de disponibilit\'e9 sans r\'e9servations associ\'e9es\
# Cette suppression doit r\'e9ussir car il n y a pas de r\'e9servations associ\'e9es\
DELETE FROM Disponibilite WHERE ID_Disponibilite = 2;\
}