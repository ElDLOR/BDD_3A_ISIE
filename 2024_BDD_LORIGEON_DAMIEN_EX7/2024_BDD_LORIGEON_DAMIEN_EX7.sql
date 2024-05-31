 #Le rajout de ces lignes pour faire en sorte de reverser + de 3 fois un matériels.
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation)
VALUES
('2024-04-01', '2024-04-01', '2024-04-03', 1, 1, 'confirmée'), # Réservation 1
('2024-04-05', '2024-04-01', '2024-04-07', 2, 1, 'confirmée'), # Réservation 2
('2024-04-10', '2024-04-01', '2024-04-12', 3, 1, 'confirmée'), # Réservation 3
('2024-04-10', '2024-04-01', '2024-04-15', 4, 1, 'confirmée'); # Réservation 4

#Afficher tous les utilisateurs ayant emprunté au moins un équipement
SELECT DISTINCT Utilisateur.*
FROM Utilisateur
INNER JOIN Reservation ON Utilisateur.ID_Utilisateur = Reservation.Utilisateur_ID;

#Afficher les équipements n’ayant jamais été empruntés
SELECT *
FROM Materiel
WHERE ID_Materiel NOT IN (SELECT DISTINCT Materiel_ID FROM Reservation);

#Affiche les équipements ayant été emprunté + de 3 fois
SELECT Materiel.*, COUNT(Reservation.Materiel_ID) AS NbEmprunts
FROM Materiel
INNER JOIN Reservation ON Materiel.ID_Materiel = Reservation.Materiel_ID
GROUP BY Materiel.ID_Materiel
HAVING COUNT(Reservation.Materiel_ID) > 3;

#Afficher le nombre d’emprunt pour tous les users
SELECT Utilisateur.ID_Utilisateur, Utilisateur.Nom, Utilisateur.Prenom, COUNT(Reservation.Utilisateur_ID) AS NbEmprunts
FROM Utilisateur
LEFT JOIN Reservation ON Utilisateur.ID_Utilisateur = Reservation.Utilisateur_ID
GROUP BY Utilisateur.ID_Utilisateur, Utilisateur.Nom, Utilisateur.Prenom;