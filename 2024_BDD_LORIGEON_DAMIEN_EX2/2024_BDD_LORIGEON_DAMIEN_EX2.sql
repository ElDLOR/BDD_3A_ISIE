{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- R\'e9cup\'e8re toutes les informations de l'utilisateur qui a pour nom : DUPONT\
SELECT * FROM Utilisateur WHERE Nom = 'Dupont';\
\
-- R\'e9cup\'e8re toutes les informations des r\'e9servations avec pour statut : confirm\'e9e\
SELECT * FROM Reservation WHERE StatutReservation = 'confirm\'e9e';\
\
-- R\'e9cup\'e8re toutes les informations du/des mat\'e9riels qui ont pour \'e9tat : Neuf\
SELECT * FROM Materiel WHERE Etat = 'Neuf';\
}