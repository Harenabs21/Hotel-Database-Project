------------ DISPLAY THE LIST OF HOTELS THAT HAVE FREE ROOMS OVER A PERIOD REQUESTED BY THE USER
--->
    SELECT DISTINCT
     h.name AS hotel
    FROM hotel h 
    LEFT JOIN 
        "room" r ON r.id_hotel = h.id   
    LEFT JOIN 
        "reservation" res ON res.id_room = r.id
        AND res.date_arrived >= '2023-09-1 12:00:00' --- <--- params
        AND res.leaving_date <= '2023-09-10 12:00:00' --- <--- params
    WHERE res.id_room IS NULL;
                            --->
-- NOTE :
-- *params : the given date per customer  