----- LIST OF RESERVATIONS OF A GIVEN CLIENT
---> 
    SELECT *
    FROM "reservation" re
    WHERE re.id_customer = 23; -- <-- Param
                            --->

-- NOTE :
-- *Param : changeables parameters