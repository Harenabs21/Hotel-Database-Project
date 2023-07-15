--Afficher la liste des payements avec le nom et le prénom du réceptionniste que les a reçus

SELECT p.payment_date, p.amount_paid, p.number_night, p.room_occupied, p.deadline_payment, p.lending_status, p.total_amount_status, p.id_customer, 
rec.first_name, rec.last_name FROM payment p 
INNER JOIN receptionist rec ON p.id_receptionist = rec.id;