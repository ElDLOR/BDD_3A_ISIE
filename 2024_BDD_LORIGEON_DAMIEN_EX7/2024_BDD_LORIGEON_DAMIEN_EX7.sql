{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww27880\viewh14940\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0  #Le rajout de ces lignes pour faire en sorte de reverser + de 3 fois un mat\'e9riels.\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation)\
VALUES\
('2024-04-01', '2024-04-01', '2024-04-03', 1, 1, 'confirm\'e9e'), # R\'e9servation 1\
('2024-04-05', '2024-04-01', '2024-04-07', 2, 1, 'confirm\'e9e'), # R\'e9servation 2\
('2024-04-10', '2024-04-01', '2024-04-12', 3, 1, 'confirm\'e9e'), # R\'e9servation 3\
('2024-04-10', '2024-04-01', '2024-04-15', 4, 1, 'confirm\'e9e'); # R\'e9servation 4\
\
#Afficher tous les utilisateurs ayant emprunt\'e9 au moins un \'e9quipement\
SELECT DISTINCT Utilisateur.*\
FROM Utilisateur\
INNER JOIN Reservation ON Utilisateur.ID_Utilisateur = Reservation.Utilisateur_ID;\
\
#Afficher les \'e9quipements n\'92ayant jamais \'e9t\'e9 emprunt\'e9s\
SELECT *\
FROM Materiel\
WHERE ID_Materiel NOT IN (SELECT DISTINCT Materiel_ID FROM Reservation);\
\
#Affiche les \'e9quipements ayant \'e9t\'e9 emprunt\'e9 + de 3 fois\
SELECT Materiel.*, COUNT(Reservation.Materiel_ID) AS NbEmprunts\
FROM Materiel\
INNER JOIN Reservation ON Materiel.ID_Materiel = Reservation.Materiel_ID\
GROUP BY Materiel.ID_Materiel\
HAVING COUNT(Reservation.Materiel_ID) > 3;\
\
#Afficher le nombre d\'92emprunt pour tous les users\
SELECT Utilisateur.ID_Utilisateur, Utilisateur.Nom, Utilisateur.Prenom, COUNT(Reservation.Utilisateur_ID) AS NbEmprunts\
FROM Utilisateur\
LEFT JOIN Reservation ON Utilisateur.ID_Utilisateur = Reservation.Utilisateur_ID\
GROUP BY Utilisateur.ID_Utilisateur, Utilisateur.Nom, Utilisateur.Prenom;}