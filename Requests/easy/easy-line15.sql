-- DISPLAY DETAILS OF THE ROOM CURRENTLY OCCUPID BY A GIVEN GUEST

-->
    SELECT ro.id, ro.number, ro.room_type, ro.capacity_room, h.name,
        CONCAT(pr.cost_per_night, ' Ar') AS cost_per_night,
        CONCAT_WS(', ',
            CASE WHEN rf.sea_view = true THEN 'sea_view' ELSE NULL END,
            CASE WHEN rf.VIP_category = true THEN 'VIP_category' ELSE NULL END,
            CASE WHEN rf.hot_water = true THEN 'hot_water' ELSE NULL END,
            CASE WHEN rf.wifi_available = true THEN 'wifi_available' ELSE NULL END,
            CASE WHEN rf.room_service = true THEN 'room_service' ELSE NULL END,
            CASE WHEN rf.mini_bar = true THEN 'mini_bar' ELSE NULL END,
            CASE WHEN rf.flat_screen = true THEN 'flat_screen' ELSE NULL END
        ) AS features
    FROM room ro
    INNER JOIN hotel h ON h.id = ro.id_hotel
    INNER JOIN room_features rf ON rf.id = ro.id_room_features
    INNER JOIN price pr ON pr.id = ro.id_price
    WHERE 
        ro.id IN (
            SELECT res.id_room  
            FROM reservation res
            INNER JOIN customer c ON c.id = res.id_customer
            WHERE res.leaving_date > CURRENT_DATE
                AND c.name = 'William' -- Paramètre : Nom du client
                AND c.id = 78 -- Paramètre : ID du client
        );
                            -->


-- NOTE:
-- just change params appropriately