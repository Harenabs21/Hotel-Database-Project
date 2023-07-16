-- DISPLAY LIST OF PAYMENT WITH NAME AND FIRST-NAME WHO WAS RECEIVE IT:

-->
    SELECT p.payment_date, p.amount_paid, p.number_night, 
    p.room_occuped, p.deadline_payment,
    p.lending_status, p.total_amount_status, p.id_customer, 
    rec.first_name, rec.last_name FROM payment p 
    INNER JOIN receptionist rec ON p.id_receptionist = rec.id;
                                    --> 