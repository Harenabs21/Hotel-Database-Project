------- DISPLAY AVERAGE NUMBER OF RESERVATIONS PER HOTEL, PER DAY, ALL PERIODS COMBINED
--->
    SELECT name, round(AVG(nombre_reservations)) AS moyenne_reservations_par_jour
    FROM (
        SELECT h.name, res.date_arrived, COUNT(*) AS nombre_reservations
        FROM hotel h
        INNER JOIN room r ON h.id = r.id_hotel
        INNER JOIN reservation res ON r.id = res.id_room
        GROUP BY h.name, res.date_arrived
    ) AS sous_requete
    GROUP BY name;
                --->