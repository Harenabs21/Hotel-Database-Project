-- DISPLAY THE LIST OF ROOMS AVAILABLE TOMORROW
    -->
    SELECT r.number, r.room_type, r.capacity_room FROM room r
    LEFT JOIN reservation res ON res.id_room = r.id 
    AND res.leaving_date = CURRENT_DATE + INTERVAL '1 day'
    WHERE res.id_room IS NULL; 

-- NOTE :
--- '1 day' indicates that the next day