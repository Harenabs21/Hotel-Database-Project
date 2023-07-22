-- DISPLAY TOTAL  OF PAYMANT ONLY FOR CONFERENCES ROOM'S RESERVATIONS IN A GIVEN DATE INTERVAL
--->
    SELECT 
        SUM(pay.amount_paid) , pay.payment_date, h.name, r.room_type
    FROM payment pay 
    FULL OUTER JOIN hotel h ON h.id = pay.room_occuped
    FULL OUTER JOIN room r ON pay.room_occuped = r.id
    WHERE pay.total_amount_status = 't' 
    AND pay.payment_date >= '2000-08-01'  --<-- param
    AND pay.payment_date <= '2025-12-30' --<-- param
    AND r.room_type = 'communicante' --<-- param
    GROUP BY h.name, pay.payment_date,  r.room_type;
                                                --->

-- NOTE:
-- change params appropriatly