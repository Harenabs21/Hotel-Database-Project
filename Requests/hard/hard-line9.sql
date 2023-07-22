
-- For each promotion, display 
-- the total number of reservations
-- that benefited from the promotion, by hotel (to know if it worked or not).
    -->
        SELECT
            pr.name as promotion,
            ho.name as hotel,
            count(re.id) as reservation
        FROM "affiliate" aff
            INNER JOIN "room" ro ON aff.id_room = ro.id
            INNER JOIN "reservation" re ON re.id_room = ro.id
            INNER JOIN "promotion" pr ON aff.id_promotion = pr.id
            INNER JOIN "hotel" ho ON ro.id_hotel = ho.id
        GROUP BY pr.id, ho.id;
