-- Le nombre de reservation acceuilli par hotel 
-- sur chaque mois d'une annee donner
SELECT
    avg(re.id) as reservation,
    (
        SELECT 
            date_part('month', date_arrived) as month
        FROM "reservation"
        WHERE date_part('year', date_arrived) = '2023' -- ?
        GROUP BY month
    ),
    ho.id as hotel
FROM "reservation" re
    INNER JOIN "room" ro ON re.id_room = ro.id
    INNER JOIN "hotel" ho ON ro.id_hotel = ho.id
GROUP BY ho.id, month;
