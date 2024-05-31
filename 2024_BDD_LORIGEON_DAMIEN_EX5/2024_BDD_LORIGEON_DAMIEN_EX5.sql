#La requête décrémente la quantité disponible du matériel avec comme IdentifiantMateriel = 1
#Avant la màj la quantité était de 6, maintenant elle sera de 5
UPDATE Materiel
SET QuantiteDisponible = QuantiteDisponible - 1
WHERE ID_Materiel = 1;