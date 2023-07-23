---------- DISPLAY THE LIST OF ROOMS, WITH THEIR GROSS PRICE, AND THEIR NET PRICE (I.E THEIR PRICE
---------- BY APPLYING ALL THE REDUCTIONS THAT ARE APPLIED TODAY)
--->
    SELECT 
        r.id AS room_id,
        r.room_type AS type_of_room,
        ROUND(p.cost_per_night) AS crude_price,
        ROUND(p.cost_per_night - ((p.cost_per_night * promo.percent) / 100)) AS net_price
    FROM "room" r 
    INNER JOIN 
        "affiliate" a ON r.id = a.id_room
    INNER JOIN 
        "price" p ON p.id = r.id_price
    INNER JOIN 
        "promotion" promo ON a.id_promotion = promo.id
    WHERE CURRENT_DATE BETWEEN promo.begin AND promo.end;
                                                        --->

-- GENERALISE:::::::easy-line12

-->
  SELECT 
        r.id, r.number, r.room_type, r.capacity_room, h.name AS hotel
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
    FROM  room r
    INNER JOIN price p ON r.id_price = p.id
    INNER JOIN hotel h ON h.id = r.id_hotel
    INNER JOIN room_features rf ON rf.id = r.id_room_features
    LEFT JOIN  affiliate af ON r.id = af.id_room
    LEFT JOIN  promotion pm ON pm.id = af.id_promotion
    WHERE (pm.begin IS NULL OR pm.begin <= CURRENT_DATE)
        AND (pm."end" IS NULL OR pm."end" > CURRENT_DATE)
    ORDER BY 
        p.cost_per_night DESC;
                            -->