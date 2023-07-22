--------- Afficher les promotions en fonction de la saison (periode), tout hotel confondu
    SELECT p.name, s.items, s.start_date, s.end_date FROM promotion p 
    INNER JOIN affiliate a ON a.id_promotion = p.id
    INNER JOIN room ON a.id_room = room.id 
    INNER JOIN price ON room.id_price = price.id 
    INNER JOIN season s ON price.id_season = s.id GROUP BY s.start_date ASC;