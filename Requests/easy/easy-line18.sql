------- Afficher le client avec le plus d'avis négatifs redigés envers les hotels
SELECT * FROM "customer" INNER JOIN feed_back f ON id_customer = f.id WHERE f.rating <= 5;