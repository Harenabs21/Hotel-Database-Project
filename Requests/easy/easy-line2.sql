----- DISPLAY THE LIST OF RECEPTIONISTS WITH THE HOTEL TO WHICH THEY ARE ATTACHED 
--->
    SELECT first_name, last_name, work_contact, h.name as hotel_name, h.address 
    FROM receptionist 
    INNER JOIN hotel h ON id_hotel = h.id;
                                        --->