{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Cr\'e9ation de la table Utilisateur\
CREATE TABLE Utilisateur (\
    # Identifiant de l'utilisateur\
    ID_Utilisateur INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\
    # Nom de l'utilisateur\
    Nom VARCHAR(50),\
    # Pr\'e9nom de l'utilisateur\
    Prenom VARCHAR(50),\
    # Email de l'utilisateur\
    Email VARCHAR(100),\
    # Num\'e9ro \'e9tudiant de l'utilisateur\
    NumeroEtudiant VARCHAR(20),\
    # Statut de l'utilisateur (\'e9tudiant, enseignant)\
    Statut VARCHAR(50)\
);\
\
# Insertion de donn\'e9es dans la table Utilisateur\
INSERT INTO Utilisateur (Nom, Prenom, Email, NumeroEtudiant, Statut)\
VALUES\
# Donn\'e9es al\'e9atoires\
('Smith', 'John', 'john.smith@example.com', '21801688t', '\'e9tudiant'),\
('Johnson', 'Emily', 'emily.johnson@example.com', '21820688t', '\'e9tudiant'),\
('Williams', 'Michael', 'michael.williams@example.com', '21907888t', '\'e9tudiant'),\
('Jones', 'Jessica', 'jessica.jones@example.com', '27896881t', '\'e9tudiant'),\
('Brown', 'David', 'david.brown@example.com', '21801690t', '\'e9tudiant'),\
('Davis', 'Sarah', 'sarah.davis@example.com', '21801126t', '\'e9tudiant'),\
('Miller', 'Christopher', 'christopher.miller@example.com', '21801661t', '\'e9tudiant'),\
('Wilson', 'Ashley', 'ashley.wilson@example.com', '21801111t', '\'e9tudiant'),\
('Moore', 'Matthew', 'matthew.moore@example.com', '21805676t', '\'e9tudiant'),\
('Taylor', 'Samantha', 'samantha.taylor@example.com', '20101688t', '\'e9tudiant');\
}