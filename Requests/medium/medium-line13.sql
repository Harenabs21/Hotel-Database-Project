-- DISPLAY THE LIST OF CUSTOMERS, WITH THE NUMBER OF RESERVATIONS, THE NUMBER OF CANCELED RESERVATIONS,
-- AND THE TOTAL AMOUNT OF MONEY THE CUSTOMER HAS PAID
--->
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        COUNT(r.id) AS number_of_reservations,
        SUM(CASE WHEN r.is_cancelled THEN 1 ELSE 0 END) AS number_of_cancelled_reservations,
        ROUND(SUM(p.cost_per_night)) AS total_amount_paid
    FROM "customer" c
    INNER JOIN "reservation" r ON c.id = r.id_customer
    INNER JOIN "room" rm ON r.id_room = rm.id
    INNER JOIN "price" p ON rm.id_price = p.id
    GROUP BY c.id, c.name
    ORDER BY c.id ASC;
                        --->