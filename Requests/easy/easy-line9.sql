------------- DISPLAY THE NUMBER OF RESERVATIONS MADE BY A GIVEN CUSTOMER DURING A GINVEN PERIOD
--->
    SELECT c.name, c.principal_contact, c.gender, c.cin, 
        COUNT(*) AS total_reservation FROM customer c 
    INNER JOIN reservation r ON r.id_customer = c.id 
    WHERE c.name = 'Mason' AND r.date_arrived = '2023-07-15 10:00:00'--- <--- params
    GROUP BY c.name, c.principal_contact, c.gender, c.cin;
                                                        --->
-- NOTE :
-- *params : - the given date
--           - the given customer 