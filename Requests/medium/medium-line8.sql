-- DISPLAY HOTEL WITH ROOMS NUMBRE BY HOTEL

-->
    SELECT h.id AS hotel_id, h.name AS hotel_name, COUNT(r.id) AS number_of_rooms
    FROM hotel h 
    LEFT JOIN room r ON h.id = r.id_hotel
    GROUP BY h.id, h.name;
                        --->