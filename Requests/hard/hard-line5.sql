-------- TOTAL PAYMENTS COLLECTED IN A YEAR FOR EACH HOTEL
--->
    SELECT
        sum(pay.amount_paid) as total_in_year,
        ho.name
    FROM "payment" pay
        INNER JOIN receptionist re ON pay.id_receptionist = re.id
        INNER JOIN hotel ho ON ho.id = re.id_hotel
    WHERE date_part('year', pay.payment_date) = '2023' -- <-- Param
    GROUP BY ho.id, re.id;

    ------------ OR ---------------

    SELECT
        sum(pay.amount_paid) AS total_in_year,
        ho.name
    FROM "payment" pay
    INNER JOIN receptionist re ON pay.id_receptionist = re.id
    INNER JOIN hotel ho ON ho.id = re.id_hotel
    WHERE date_part('year', pay.payment_date) = 2023 -- <-- Param (removed quotes around 2023)
    GROUP BY ho.name; -- <-- Modified GROUP BY clause
                    --->

-- NOTE :
-- *Param : changeables parameters