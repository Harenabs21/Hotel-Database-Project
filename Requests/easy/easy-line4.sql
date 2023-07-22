-- LIST OF ROOM TYPE GIVE AND HOTEL GIVE
    --> 
    SELECT * FROM "room" ro
    WHERE ro.room_type = 'twin' -- <-- Param
    AND ro.id_hotel = 50; -- <-- Param
                        --->


-- NOTE :
-- *Param : changeables parameters