-- DISPLAY SPECIAL OFFERS BY SEASON (PERIOD), ALL HOTEL COMBINED
    -->
        SELECT
            p.name,
            s.items,
            s.start_date,
            s.end_date
        FROM promotion p
            INNER JOIN affiliate a ON a.id_promotion = p.id
            INNER JOIN room ON a.id_room = room.id
            INNER JOIN price ON room.id_price = price.id
            INNER JOIN season s ON price.id_season = s.id
        GROUP BY s.start_date , s.items, p.name , s.end_date;
                             -->