-- SHOW LIST OF CURENTLY OCCUPIED ROOMS:
-->
    SELECT r.* FROM room r;
    SELECT id_room FROM reservation WHERE leaving_date  > current_date;

    ---- en cours-------