-- DISPLAY THE LIST PF HOTELS THAT CONTAIN ROOMS
-- WHOSE DESCRIPTION CORRESPONDS TO GIVEN KEYWORD

-->
SELECT h.*
FROM hotel h
WHERE h.id IN (
    SELECT r.id_hotel
    FROM room r
    INNER JOIN room_features rf ON rf.id = r.id_room_features
    WHERE CONCAT_WS(', ',
        CASE WHEN rf.sea_view THEN 'sea_view' END,
        CASE WHEN rf.VIP_category THEN 'VIP_category' END,
        CASE WHEN rf.hot_water THEN 'hot_water' END,
        CASE WHEN rf.wifi_available THEN 'wifi_available' END,
        CASE WHEN rf.room_service THEN 'room_service' END,
        CASE WHEN rf.mini_bar THEN 'mini_bar' END,
        CASE WHEN rf.flat_screen THEN 'flat_screen' END
    ) ILIKE '%VIP%'
); ----LE MOTS CLE ici VIP
                                -->
                                

-- NOTE:
-- First we store the available rooms features 
-- in a room in a new column 
-- Then we filter according to the keyword given here VIP