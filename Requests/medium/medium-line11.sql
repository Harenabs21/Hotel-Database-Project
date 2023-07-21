-- DISPLAY MOST RESERVED ROOM IN GIVEN HOTEL

-->
    SELECT COUNT(re.id) reservation_s_number, ro.number as room_reference, h.name as hotel FROM room ro
    INNER JOIN reservation re ON ro.id = re.id_room
    INNER JOIN hotel h ON h.id = ro.id_hotel
    WHERE h.name = 'Tranquil Bay Resort' --<-- Param
    GROUP BY ro.number, h.name
    ORDER BY reservation_s_number DESC;
    -- LIMIT 1;                       -->


-- NOTE:
-- Just change Param appropriately here: 'Tranquil Bay Resort'
-- We just add hotel name for verification.
-- There is only the limit in one but better want 
-- to manage this at the fetch level because it 
-- is possible that several rooms in the same 
-- hotel have the same maximum reservation rate.