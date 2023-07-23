-------- MAKE AN INVOICE WITH THE TOTAL AMOUNT TO BE PAID AND THE REST TO BE PAID, WITH THE NAME OF THE CUSTOMER
-------- AND THE DATE OF RESERVATION (BEGINNING AND END)
--->
        SELECT
            pr.cost_per_night * extract(day from (re.leaving_date - re.date_arrived)) as total_amount,
            pay.amount_paid,
            re.date_arrived as debut_resrvation,
            re.leaving_date as fin_reservation
        FROM "payment" pay
            INNER JOIN "customer" cu ON pay.id_customer = cu.id
            INNER JOIN "reservation" re ON cu.id = re.id_customer
            INNER JOIN "room" ro ON ro.id = re.id_room
            INNER JOIN "price" pr ON pr.id = ro.id_price
        WHERE cu.id = 23;
                        --->