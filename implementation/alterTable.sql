ALTER TABLE "hotel"
DROP COLUMN id;

ALTER TABLE "hotel"
ADD COLUMN id SERIAL PRIMARY KEY;

-------------------------

ALTER TABLE hotel ADD COLUMN id_province INT REFERENCES province_available(id);

DROP TABlE cancel;

ALTER TABLE reservation ADD COLUMN is_cancel BOOLEAN ;	

ALTER TABLE reservation ADD COLUMN id_client INT REFERENCES client(id_client) ;

ALTER TABLE payment ADD COLUMN id_client INT REFERENCES client(id_client);

ALTER TABLE receptionist ADD COLUMN id_hotel INT REFERENCES hotel(id_hotel);

ALTER TABLE room DROP COLUMN id_promotion;