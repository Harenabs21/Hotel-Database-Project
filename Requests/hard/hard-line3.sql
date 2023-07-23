-- DISPLAY THE LIST OF ROOMS AVAILABLE OVER A GIVEN PERIOD, SPECIFYING THEIR HOTEL.

--> 
    SELECT h.name as hotel_name
    FROM room r
    INNER JOIN hotel h ON h.id = r.id_hotel
    WHERE r.id NOT IN (
         SELECT res.id_room FROM reservation res 
         WHERE  res.date_arrived  >= '2023-08-07' --> min_date_param
         AND res.leaving_date  <= '2023-09-07' --> max_date_param
    );
                        -->


-- EVEN MORE EFFICIENT AND MORE WIDESPREAD WITH ALL INFORMATIONS:
-->
    SELECT r.id, r.number, r.room_type, r.capacity_room, h.name as hotel_name
    , p.cost_per_night AS Price
    , (p.cost_per_night - p.cost_per_night * pm.percent / 100) AS Promotions_day,
    CONCAT_WS(', ',
            CASE WHEN rf.sea_view THEN 'sea_view' ELSE NULL END,
            CASE WHEN rf.VIP_category THEN 'VIP_category' ELSE NULL END,
            CASE WHEN rf.hot_water THEN 'hot_water' ELSE NULL END,
            CASE WHEN rf.wifi_available THEN 'wifi_available' ELSE NULL END,
            CASE WHEN rf.room_service THEN 'room_service' ELSE NULL END,
            CASE WHEN rf.mini_bar THEN 'mini_bar' ELSE NULL END,
            CASE WHEN rf.flat_screen THEN 'flat_screen' ELSE NULL END
        ) AS features
    FROM room r
    INNER JOIN hotel h ON h.id = r.id_hotel
    INNER JOIN price p ON r.id_price = p.id
    INNER JOIN room_features rf ON rf.id = r.id_room_features
    LEFT JOIN  affiliate af ON r.id = af.id_room
    LEFT JOIN  promotion pm ON pm.id = af.id_promotion
    WHERE r.id NOT IN (
         SELECT res.id_room FROM reservation res 
         WHERE  res.date_arrived  >= '2023-08-07' --> min_date_param
         AND res.leaving_date  <= '2023-09-07' --> max_date_param
    )
    AND (pm.begin IS NULL OR pm.begin >= '2023-08-07') --> min_date_param
    AND (pm."end" IS NULL OR pm."end" <= '2023-09-07' ) ; --> max_date_param
                                    -->