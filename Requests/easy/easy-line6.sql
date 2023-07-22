----- LIST OF RESERVATIONS OF A GIVEN CLIENT
---> 
    SELECT *
    FROM "reservation" re
    WHERE re.id_customer = 60; -- <-- Param
                            --->

-- NOTE :
-- *Param : paramatre qu'on peut changer