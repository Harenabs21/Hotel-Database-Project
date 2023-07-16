-- Afficher les chambres les moins réservés d'un hotel donné
-->
    SELECT COUNT(re.id) reservation, ro.number as room_reference, h.name as hotel FROM room ro
    INNER JOIN reservation re ON ro.id = re.id_room
    INNER JOIN hotel h ON h.id = ro.id_hotel
    WHERE h.name = 'Grand Hotel'  --<--- Param
    GROUP BY ro.number, h.name
    ORDER BY reservation ASC;
                            -->


-- NOTE:
-- Just change Param appropriately here: Grand Hotel
-- We just add hotel name for verification