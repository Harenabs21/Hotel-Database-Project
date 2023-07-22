------ VIEW THE LIST OF CUSTOMERS WHO HAVE NOT YET PAID THEIR FEES IN FULL
--->
    SELECT name, last_name, principal_contact, address, emergency_number, gender, CIN 
    FROM customer 
    INNER JOIN payment ON customer.id = payment.id_customer 
    WHERE payment.total_amount_status = 'f';
                                        --->