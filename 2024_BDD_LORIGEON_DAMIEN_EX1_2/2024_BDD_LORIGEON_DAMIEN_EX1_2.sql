{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Cr\'e9ation de la table Mat\'e9riel\
CREATE TABLE Materiel (\
    # Identifiant du mat\'e9riel\
    ID_Materiel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\
    # Nom du mat\'e9riel\
    Nom VARCHAR(100),\
    # Description du mat\'e9riel\
    Description VARCHAR(255),\
    # Quantit\'e9 disponible du mat\'e9riel\
    QuantiteDisponible INT,\
    # \'c9tat du mat\'e9riel (nouveau, utilis\'e9, endommag\'e9, etc..)\
    Etat VARCHAR(50),\
    # Emplacement physique du mat\'e9riel (b\'e2timent, salle, etc..)\
    Emplacement VARCHAR(100)\
);\
\
# Insertion de donn\'e9es dans la table Mat\'e9riel\
INSERT INTO Materiel (Nom, Description, QuantiteDisponible, Etat, Emplacement)\
VALUES\
('MacBook Air', 'PC portable Apple MacBook Air M1', 8, 'Neuf', 'Salle A101'),\
('\'c9cran tactile', '\'c9cran tactile Dell 27 pouces', 5, 'Bon \'e9tat', 'Salle de conf\'e9rence'),\
('Tablette Samsung', 'Tablette Samsung Galaxy Tab S7', 10, 'Occasion', 'Salle B205'),\
('Cam\'e9ra GoPro', 'Cam\'e9ra GoPro Hero 10', 3, 'Tr\'e8s bon \'e9tat', 'Studio photo'),\
('Micro-casque', 'Micro-casque Logitech G Pro X', 6, 'Neuf', 'Salle de r\'e9union'),\
('Clavier m\'e9canique', 'Clavier m\'e9canique Corsair K95 RGB Platinum', 12, 'Neuf', 'Bureau 1'),\
('Imprimante 3D', 'Imprimante 3D Creality Ender 3', 2, 'Bon \'e9tat', 'Bureau 3'),\
('Scanner de codes-barres', 'Scanner de codes-barres Zebra DS4608', 1, 'Occasion', 'Bureau 2'),\
('Drones', 'Drones DJI Phantom 4 Pro', 4, 'Bon \'e9tat', 'Atelier cr\'e9atif'),\
('Console de jeu', 'Console de jeu Sony PlayStation 5', 7, 'Neuf', 'Espace d\'e9tente');\
}