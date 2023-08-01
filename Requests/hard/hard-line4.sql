-------- SHOW THE TOTAL PAYMENTS RECEIVED IN A MONTH (INCLUDING CHARGES FOR 
-------- CANCELLED BOOKINGS), BY HOTEL
--->
    SELECT 
        sum(CASE WHEN res.is_cancelled IS TRUE 
        THEN pay.amount_paid + ((pay.amount_paid * 10)/100) 
        ELSE pay.amount_paid END) AS total_amount_paid,
        h.name AS hotel
    FROM "payment" pay 
    LEFT JOIN "customer" c ON pay.id_customer = c.id
    INNER JOIN "reservation" res ON res.id_customer = c.id
    INNER JOIN "room" r ON res.id_room = r.id
    INNER JOIN "hotel" h ON r.id_hotel = h.id
    WHERE pay.payment_date >= '2024-01-01' -- <-- params
    AND pay.payment_date <= '2024-02-01' -- <-- params
    GROUP BY h.name
    ORDER BY h.name ASC;
                        --->

-- NOTE :
-- *params : the given date, in this example the request show the total
-- payments received in a month 
-- NB : But we can change this date.