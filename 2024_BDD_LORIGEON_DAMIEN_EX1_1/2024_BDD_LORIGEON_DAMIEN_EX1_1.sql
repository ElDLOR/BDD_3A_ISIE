# Création de la table Utilisateur
CREATE TABLE Utilisateur (
    # Identifiant de l'utilisateur
    ID_Utilisateur INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    # Nom de l'utilisateur
    Nom VARCHAR(50),
    # Prénom de l'utilisateur
    Prenom VARCHAR(50),
    # Email de l'utilisateur
    Email VARCHAR(100),
    # Numéro étudiant de l'utilisateur
    NumeroEtudiant VARCHAR(20),
    # Statut de l'utilisateur (étudiant, enseignant)
    Statut VARCHAR(50)
);

# Insertion de données dans la table Utilisateur
INSERT INTO Utilisateur (Nom, Prenom, Email, NumeroEtudiant, Statut)
VALUES
# Données aléatoires
('Smith', 'John', 'john.smith@example.com', '21801688t', 'étudiant'),
('Johnson', 'Emily', 'emily.johnson@example.com', '21820688t', 'étudiant'),
('Williams', 'Michael', 'michael.williams@example.com', '21907888t', 'étudiant'),
('Jones', 'Jessica', 'jessica.jones@example.com', '27896881t', 'étudiant'),
('Brown', 'David', 'david.brown@example.com', '21801690t', 'étudiant'),
('Davis', 'Sarah', 'sarah.davis@example.com', '21801126t', 'étudiant'),
('Miller', 'Christopher', 'christopher.miller@example.com', '21801661t', 'étudiant'),
('Wilson', 'Ashley', 'ashley.wilson@example.com', '21801111t', 'étudiant'),
('Moore', 'Matthew', 'matthew.moore@example.com', '21805676t', 'étudiant'),
('Taylor', 'Samantha', 'samantha.taylor@example.com', '20101688t', 'étudiant');
