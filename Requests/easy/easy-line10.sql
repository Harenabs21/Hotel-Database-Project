--- Afficher la liste des hotels dans une localisation (province) donnée
SELECT * FROM "hotel" INNER JOIN province_available p ON id_province = p.id WHERE p.province_name = 'Antananarivo';