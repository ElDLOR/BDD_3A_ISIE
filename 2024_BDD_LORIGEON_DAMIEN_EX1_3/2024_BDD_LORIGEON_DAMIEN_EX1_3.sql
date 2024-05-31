{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Cr\'e9ation de la table R\'e9servation\
CREATE TABLE Reservation (\
    ID_Reservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\
    DateReservation DATE,\
    DateDebutReservation DATE,\
    DateFinReservation DATE,\
    Utilisateur_ID INT,\
    Materiel_ID INT,\
    StatutReservation VARCHAR(50),\
    FOREIGN KEY (Utilisateur_ID) REFERENCES Utilisateur(ID_Utilisateur),\
    FOREIGN KEY (Materiel_ID) REFERENCES Materiel(ID_Materiel)\
);\
\
# Insertion de donn\'e9es dans la table R\'e9servation\
INSERT INTO Reservation (DateReservation, DateDebutReservation, DateFinReservation, Utilisateur_ID, Materiel_ID, StatutReservation)\
VALUES\
('2024-03-19', '2024-03-20', '2024-03-22', 1, 1, 'confirm\'e9e'),\
('2024-03-18', '2024-03-25', '2024-03-27', 2, 2, 'confirm\'e9e'),\
('2024-03-17', '2024-03-21', '2024-03-23', 3, 3, 'confirm\'e9e'),\
('2024-03-16', '2024-03-24', '2024-03-26', 4, 4, 'en attente'),\
('2024-03-15', '2024-03-19', '2024-03-21', 5, 5, 'confirm\'e9e');\
}