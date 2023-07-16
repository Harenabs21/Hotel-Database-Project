--Afficher la liste des réservations en commençant par la plus récente, pour un hotel donné

SELECT res.id, res.date_arrived, res.leaving_date, res.number_of_person 
FROM reservation res INNER JOIN room r ON r.id = res.id_room INNER JOIN hotel h ON r.id_hotel = h.id 
WHERE h.name = 'Ocean View Inn' order by res.date_arrived DESC;