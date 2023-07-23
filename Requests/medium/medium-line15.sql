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