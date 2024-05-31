{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- La requ\'eate r\'e9cup\'e8re les noms et pr\'e9noms des utilisateurs qui ont effectu\'e9 une r\'e9servation, \
-- Il prend aussi les dates de d\'e9but et de fin de leurs r\'e9servations.\
SELECT Utilisateur.Nom, Utilisateur.Prenom, Reservation.DateDebutReservation, Reservation.DateFinReservation FROM Utilisateur INNER JOIN Reservation ON Utilisateur.ID_Utilisateur = Reservation.Utilisateur_ID;\
\
-- La requ\'eate r\'e9cup\'e8re le nom et la description du mat\'e9riel r\'e9serv\'e9, \
-- ainsi que les dates de d\'e9but et de fin de la r\'e9servation pour l'utilisateur avec l'ID 1.\
SELECT Materiel.Nom, Materiel.Description, Reservation.DateDebutReservation, Reservation.DateFinReservation\
FROM Materiel\
INNER JOIN Reservation ON Materiel.ID_Materiel = Reservation.Materiel_ID\
WHERE Reservation.Utilisateur_ID = 1;\
}