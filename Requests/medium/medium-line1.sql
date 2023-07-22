-- Combien de fois un client a reserver dans nos hotel
    SELECT
        count(*)
    FROM "reservation" re
    WHERE re.id_customer = 45; -- <-- Param


-- NOTE :
-- *Param : paramatre qu'on peut changer