--Afficher le nombre total de réservation par type de chambre (par exemple : VIP : 30 reservations, Simple : 40 reservations...)

    SELECT r.room_type,
        COUNT(*) AS total_reservations_per_type 
    FROM room r INNER JOIN reservation res ON r.id = res.id_room 
    GROUP BY r.room_type;