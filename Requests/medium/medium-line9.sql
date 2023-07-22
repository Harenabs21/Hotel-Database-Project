-- SHOW LIST OF CURENTLY OCCUPIED ROOMS:
-->
    SELECT room.id, room.number, room.room_type, room.capacity_room FROM room 
    INNER JOIN reservation res ON room.id = res.id_room
    WHERE leaving_date  > current_date;
                                    --->