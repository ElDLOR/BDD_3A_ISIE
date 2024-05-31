{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10200\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #La requ\'eate compte le nombre total de r\'e9servations. \
#La clause WHERE filtre les r\'e9servations par rapport \'e0 de la date de d\'e9but de la r\'e9servation.\
#Uniquement les r\'e9servations effectu\'e9es dans la plage de date 15/03/2024 et le 20/03/2024.\
SELECT COUNT(*) AS TotalReservations\
FROM Reservation\
WHERE DateDebutReservation BETWEEN \'ab\'a02024-03-15\'a0\'bb AND \'ab\'a02024-03-20\'a0\'bb;\
\
#La requ\'eate compte le nombre de user qui ont effectu\'e9 une r\'e9servation.\
SELECT COUNT(DISTINCT Utilisateur_ID) AS NombreUtilisateurs\
FROM Reservation;}