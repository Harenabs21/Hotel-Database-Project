--------- DISPLAY THE AVERAGE NUMBER OF RESERVATIONS PER HOTEL FOR EACH MONTH OF A GIVEN YEAR 
--->
        SELECT
            round(avg(re.id)) as reservation,
            ho.name as hotel
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
                        --->
