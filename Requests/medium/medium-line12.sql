-------- Afficher la liste des promotions en cours actuellement
SELECT * FROM "promotion" WHERE (begin >= current_date);