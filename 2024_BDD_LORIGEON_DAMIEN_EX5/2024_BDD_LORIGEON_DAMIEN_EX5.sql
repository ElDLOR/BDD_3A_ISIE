{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #La requ\'eate d\'e9cr\'e9mente la quantit\'e9 disponible du mat\'e9riel avec comme IdentifiantMateriel = 1\
#Avant la m\'e0j la quantit\'e9 \'e9tait de 6, maintenant elle sera de 5\
UPDATE Materiel\
SET QuantiteDisponible = QuantiteDisponible - 1\
WHERE ID_Materiel = 1;}