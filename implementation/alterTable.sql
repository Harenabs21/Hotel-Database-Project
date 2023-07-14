-- supprimer la colonne id de hotel et ceux qui en dépendent(foreign key)
ALTER TABLE "hotel" DROP id CASCADE;
-- créer une colomne id avec le type serial
ALTER TABLE "hotel"
ADD COLUMN id SERIAL PRIMARY KEY;
--reecrire le foreign key de room
ALTER TABLE "room" ADD COLUMN room_id_hotel INT REFERENCES hotel(id);
-------------------------
-- ajouter foreign key du id de province_available dans hotel
ALTER TABLE hotel ADD COLUMN id_province INT REFERENCES province_available(id);
-- supprimer la table cancel
DROP TABlE cancel;
-- ajouter la colomne is_cancel dans reservation
ALTER TABLE reservation ADD COLUMN is_cancel BOOLEAN ;	
-- ajouter la colomne id_client foreign key de client dans reservation
ALTER TABLE reservation ADD COLUMN id_client INT REFERENCES customer(id_client) ;
-- ajouter la colomne id_client foreign key de client dans payment
ALTER TABLE payment ADD COLUMN id_client INT REFERENCES customer(id_client);
-- ajouter la colomne id_hotel foreign key de hotel dans reservation
ALTER TABLE receptionist ADD COLUMN id_hotel INT REFERENCES hotel(id_hotel);
-- supprimer la colomne id_promotion dans room
ALTER TABLE room DROP COLUMN id_promotion;