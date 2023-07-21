-- Le nombre de reservation acceuilli par hotel 
-- sur chaque mois d'une annee donner
SELECT
    round(avg(re.id)) as reservation,
    ho.id as hotel
FROM "reservation" re
    INNER JOIN "room" ro ON re.id_room = ro.id
    INNER JOIN "hotel" ho ON ro.id_hotel = ho.id
WHERE date_part('month', re.date_arrived) IN (
        SELECT 
            date_part('month', date_arrived) as month
        FROM "reservation"
        WHERE date_part('year', date_arrived) = '2023' -- ?
    )
GROUP BY ho.id;
