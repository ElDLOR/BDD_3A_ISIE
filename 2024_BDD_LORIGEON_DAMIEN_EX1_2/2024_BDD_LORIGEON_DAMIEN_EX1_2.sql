# Création de la table Matériel
CREATE TABLE Materiel (
    # Identifiant du matériel
    ID_Materiel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    # Nom du matériel
    Nom VARCHAR(100),
    # Description du matériel
    Description VARCHAR(255),
    # Quantité disponible du matériel
    QuantiteDisponible INT,
    # État du matériel (nouveau, utilisé, endommagé, etc..)
    Etat VARCHAR(50),
    # Emplacement physique du matériel (bâtiment, salle, etc..)
    Emplacement VARCHAR(100)
);

# Insertion de données dans la table Matériel
INSERT INTO Materiel (Nom, Description, QuantiteDisponible, Etat, Emplacement)
VALUES
('MacBook Air', 'PC portable Apple MacBook Air M1', 8, 'Neuf', 'Salle A101'),
('Écran tactile', 'Écran tactile Dell 27 pouces', 5, 'Bon état', 'Salle de conférence'),
('Tablette Samsung', 'Tablette Samsung Galaxy Tab S7', 10, 'Occasion', 'Salle B205'),
('Caméra GoPro', 'Caméra GoPro Hero 10', 3, 'Très bon état', 'Studio photo'),
('Micro-casque', 'Micro-casque Logitech G Pro X', 6, 'Neuf', 'Salle de réunion'),
('Clavier mécanique', 'Clavier mécanique Corsair K95 RGB Platinum', 12, 'Neuf', 'Bureau 1'),
('Imprimante 3D', 'Imprimante 3D Creality Ender 3', 2, 'Bon état', 'Bureau 3'),
('Scanner de codes-barres', 'Scanner de codes-barres Zebra DS4608', 1, 'Occasion', 'Bureau 2'),
('Drones', 'Drones DJI Phantom 4 Pro', 4, 'Bon état', 'Atelier créatif'),
('Console de jeu', 'Console de jeu Sony PlayStation 5', 7, 'Neuf', 'Espace détente');
