# Création de la table Réservation
CREATE TABLE Reservation (
    ID_Reservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DateReservation DATE,
    DateDebutReservation DATE,
    DateFinReservation DATE,
    Utilisateur_ID INT,
    Materiel_ID INT,
    StatutReservation VARCHAR(50),
    FOREIGN KEY (Utilisateur_ID) REFERENCES Utilisateur(ID_Utilisateur),
    FOREIGN KEY (Materiel_ID) REFERENCES Materiel(ID_Materiel)
);

# Insertion de données dans la table Réservation
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation)
VALUES
('2024-03-19', '2024-03-20', '2024-03-22', 1, 1, 'confirmée'),
('2024-03-18', '2024-03-25', '2024-03-27', 2, 2, 'confirmée'),
('2024-03-17', '2024-03-21', '2024-03-23', 3, 3, 'confirmée'),
('2024-03-16', '2024-03-24', '2024-03-26', 4, 4, 'en attente'),
('2024-03-15', '2024-03-19', '2024-03-21', 5, 5, 'confirmée');
