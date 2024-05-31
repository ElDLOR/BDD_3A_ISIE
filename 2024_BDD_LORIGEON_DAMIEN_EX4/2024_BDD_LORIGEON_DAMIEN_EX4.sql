#La requête compte le nombre total de réservations. 
#La clause WHERE filtre les réservations par rapport à de la date de début de la réservation.
#Uniquement les réservations effectuées dans la plage de date 15/03/2024 et le 20/03/2024.
SELECT COUNT(*) AS TotalReservations
FROM Reservation
WHERE DateDebutReservation BETWEEN « 2024-03-15 » AND « 2024-03-20 »;

#La requête compte le nombre de user qui ont effectué une réservation.
SELECT COUNT(DISTINCT Utilisateur_ID) AS NombreUtilisateurs
FROM Reservation;