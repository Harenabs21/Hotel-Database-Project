-- APPLY PRICE REDUCTIOS TO CERTAIN PAYEMENTS,
-- AND LIST THE AMOUNT TO BE PAID BY THE CUSTOMER


-->
    SELECT
        (((pr.cost_per_night - pr.cost_per_night * (pm.percent / 100)) * DATE_PART('day', res.leaving_date - res.date_arrived)) - se.reduction) AS prix_total,
        cu.name, cu.last_name, cu.principal_contact, cu.emergency_number,
        cu.address, cu.gender, cu.cin, cu.email, r.number, res.date_arrived, res.leaving_date
    FROM
        reservation res
    INNER JOIN room r ON res.id_room = r.id
    INNER JOIN price pr ON pr.id = r.id_price
    LEFT JOIN promotion pm ON res.date_arrived >= pm.begin AND res.date_arrived < pm."end"
    LEFT JOIN buy ON buy.id_customer = res.id_customer
    LEFT JOIN service se ON se.id = buy.id_service
    INNER JOIN customer cu ON cu.id = res.id_customer
    WHERE
        res.id_customer = 45 --<-- Param
    AND res.id = 14 --<--Param
    LIMIT 1;
                                        -->


-- NOTE:
-- Change the settings appropriately