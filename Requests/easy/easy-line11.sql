-- Afficher la liste des chambres qui correspondent à un intervalle de prix donné par le client
SELECT ro.number, room_type, capacity_room, p.cost_per_night FROM room ro INNER JOIN price p on ro.id_price =
 p.id WHERE p.cost_per_night BETWEEN 12100 AND 12200;