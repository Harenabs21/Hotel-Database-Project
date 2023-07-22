-------- SHOW HOW MANY TIMES A CUSTOMER HAS BOOKED IN OUR HOTEL
--->
    SELECT
        count(*)
    FROM "reservation" re
    WHERE re.id_customer = 45; -- <-- Param
                            --->


-- NOTE :
-- *Param : parameter that can be changed