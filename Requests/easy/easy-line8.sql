-- Total des payements recus par mobile money
SELECT 
    count(*) 
FROM "payment" pay
    INNER JOIN "payment_method" pay_m ON pay.id_payment_method = pay_m.id
WHERE pay_m.mobile_money = true;
-- OR
-- WHERE pay_m.name = 'mobile_money';

