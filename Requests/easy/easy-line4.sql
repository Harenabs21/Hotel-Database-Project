-- LIST OF ROOM TYPE GIVE AND HOTEL GIVE
    --> 
    SELECT * FROM "room" ro
    WHERE ro.room_type = 'double' -- <-- Param
    AND ro.id_hotel = 80; -- <-- Param
                        --->


-- NOTE :
-- *Param : changeables parameters