--Afficher la liste des clients qui n'ont pas encore payé en totalité leurs frais

SELECT name, last_name, principal_contact, address, emergency_number, gender, CIN FROM customer 
INNER JOIN payment ON customer.id = payment.id_customer WHERE total_amount_status = 'f';