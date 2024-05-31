# Ajout de la table Disponibilite
CREATE TABLE Disponibilite (
    ID_Disponibilite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_Materiel INT,
    DateDebut DATE,
    DateFin DATE,
    FOREIGN KEY (ID_Materiel) REFERENCES Materiel(ID_Materiel)
);

# Ajout de la colonne ID_Disponibilite dans la table Reservation
ALTER TABLE Reservation
ADD COLUMN ID_Disponibilite INT,
ADD FOREIGN KEY (ID_Disponibilite) REFERENCES Disponibilite(ID_Disponibilite);

# Déclencheur avant l insertion pour vérifier la disponibilité du matériel
DELIMITER //

CREATE TRIGGER Before_Reservation_Insert
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    DECLARE Availability_Count INT;
    SET Availability_Count = (
        SELECT COUNT(*)
        FROM Disponibilite
        WHERE ID_Materiel = NEW.Materiel_ID
        AND NEW.DateDebutReservation BETWEEN DateDebut AND DateFin
        AND NEW.DateFinReservation BETWEEN DateDebut AND DateFin
    );
    IF Availability_Count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le matériel n''est pas disponible pendant cette période.';
    END IF;
END//

DELIMITER ;

# Déclencheur avant la mise à jour de la disponibilité
DELIMITER $$

CREATE TRIGGER Before_Disponibilite_Update BEFORE UPDATE ON Disponibilite
FOR EACH ROW
BEGIN
    DECLARE Reservation_Count INT;
    SET Reservation_Count = (
        SELECT COUNT(*)
        FROM Reservation
        WHERE Materiel_ID = NEW.ID_Materiel
        AND (NEW.DateDebut BETWEEN DateDebutReservation AND DateFinReservation
        OR NEW.DateFin BETWEEN DateDebutReservation AND DateFinReservation
        OR (NEW.DateDebut <= DateDebutReservation AND NEW.DateFin >= DateFinReservation))
    );
    IF Reservation_Count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La nouvelle période de disponibilité se chevauche avec des réservations existantes.';
    END IF;
END $$

DELIMITER ;

# Déclencheur avant suppression de la disponibilité
DELIMITER $$

CREATE TRIGGER Before_Disponibilite_Delete BEFORE DELETE ON Disponibilite
FOR EACH ROW
BEGIN
    DECLARE Reservation_Count INT;
    SET Reservation_Count = (
        SELECT COUNT(*)
        FROM Reservation
        WHERE ID_Disponibilite = OLD.ID_Disponibilite
    );
    IF Reservation_Count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible de supprimer cette disponibilité car elle est associée à des réservations existantes.';
    END IF;
END $$

DELIMITER ;

# Test 1 : Ajouter une réservation valide
# Cette réservation doit passer car elle est dans la période de disponibilité du matériel
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)
VALUES ('2024-03-05', '2024-03-06', '2024-03-07', 1, 1, 'confirmée', 1);

# Test 2 : Ajouter une réservation invalide
# Cette réservation doit échouer car elle chevauche une réservation existante
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)
VALUES ('2024-03-05', '2024-03-07', '2024-03-09', 1, 1, 'confirmée', 1);

# Test 3 : Ajouter une réservation avec une période en dehors de la disponibilité
# Cette réservation doit échouer car elle est en dehors de la période de disponibilité du matériel
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation, ID_Disponibilite)
VALUES ('2024-03-05', '2024-02-25', '2024-03-01', 1, 1, 'confirmée', 1);


