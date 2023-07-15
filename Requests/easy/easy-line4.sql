-- List de room de type donner et hotel donner
SELECT * 
FROM "room" ro
WHERE ro.room_type = 'twin' -- <-- Param
AND ro.id_hotel = 50; -- <-- Param


-- NOTE :
-- *Param : paramatre qu'on peut changer