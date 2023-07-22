------ DISPLAY THE TOTAL NUMBER OF RESERVATIONS BY ROOM TYPE (FOR EXAMPLE : VIP: 30 reservations, SINGLE: 40 reservations ..)
--->
    SELECT r.room_type,
        COUNT(*) AS total_reservations_per_type 
    FROM room r INNER JOIN reservation res ON r.id = res.id_room 
    GROUP BY r.room_type;
                        --->