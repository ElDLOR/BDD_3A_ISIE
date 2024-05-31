-- Récupère toutes les informations de l'utilisateur qui a pour nom : DUPONT
SELECT * FROM Utilisateur WHERE Nom = 'Dupont';

-- Récupère toutes les informations des réservations avec pour statut : confirmée
SELECT * FROM Reservation WHERE StatutReservation = 'confirmée';

-- Récupère toutes les informations du/des matériels qui ont pour état : Neuf
SELECT * FROM Materiel WHERE Etat = 'Neuf';
