------------- Afficher le nombre de réservations effectuées par un client donné durant une période donnée
SELECT c.name, c.principal_contact, c.gender, c.cin, COUNT(*) AS total_reservation FROM customer c 
INNER JOIN reservation r ON r.id_customer = c.id 
WHERE c.name = 'Mason' AND r.date_arrived = '2023-07-15 10:00:00'
GROUP BY c.name, c.principal_contact, c.gender, c.cin;