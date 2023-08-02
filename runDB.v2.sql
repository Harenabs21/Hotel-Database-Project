\c postgres;

DROP DATABASE IF EXISTS akory;

CREATE DATABASE akory;

\c akory;

---------------------------------------------------
-- Create table "province_available"
CREATE TABLE "province_available"(
    id SERIAL PRIMARY KEY,
    province_name VARCHAR(200) NOT NULL,
    code_province INT
);
ALTER SEQUENCE province_available_id_seq RESTART WITH 1;
ALTER TABLE province_available ALTER COLUMN id SET DEFAULT nextval('province_available_id_seq');

------------------------------
-- 6 province
INSERT INTO "province_available" (province_name, code_province) VALUES
    ('Antananarivo', 100),
    ('Antsiranana', 200),
    ('Fianarantsoa', 300),
    ('Nosy Be', 400),
    ('Toamasina', 500),
    ('Toliara', 600);



---------------------------------------------------
-- Create table "hotel"
CREATE TABLE "hotel"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    address VARCHAR(200),
    id_province INT REFERENCES province_available(id)
);
ALTER SEQUENCE hotel_id_seq RESTART WITH 1;
ALTER TABLE hotel ALTER COLUMN id SET DEFAULT nextval('hotel_id_seq');

------------------------------
-- 12 hotel
INSERT INTO "hotel" (name, address, id_province) VALUES
    ('Akory100', '123 Rue Principale', 1), -- id 1
    ('Akory101', '456 Avenue Centrale', 1), -- id 2
    ('Akory200', '567 Avenue de la Mer', 2), -- id 3
    ('Akory201', '23 Rue de la Sérénité', 2), -- id 4
    ('Akory300', '567 Rue de la Rivière', 3), -- id 5
    ('Akory301', '90 Avenue Royale', 3), -- id 6
    ('Akory400', '890 Rue de la Plage', 4), -- id 7
    ('Akory401', '890 Avenue du Luxe', 4), -- id 8
    ('Akory500', '12 Vue sur Mer', 5), -- id 9
    ('Akory501', '789 Chalet Montagnard', 5), -- id 10
    ('Akory600', '14 Rue Paisible', 6), -- id 11
    ('Akory601', '456 Rue des Jardins', 6); -- id 12




---------------------------------------------------
-- Create tablel "season"
CREATE TABLE "season"(
    id SERIAL PRIMARY KEY,
    items VARCHAR(50),
    start_date DATE DEFAULT CURRENT_DATE,
    end_date DATE
);
ALTER SEQUENCE season_id_seq RESTART WITH 1;
ALTER TABLE season ALTER COLUMN id SET DEFAULT nextval('season_id_seq');

-------------------------------------
-- 4 season
INSERT INTO "season" (items, start_date, end_date) VALUES
    ('Hiver', '2023-01-01', '2023-03-20'),
    ('Printemps', '2023-03-21', '2023-06-20'),
    ('Ete', '2023-06-21', '2023-09-22'),
    ('Automne', '2023-09-23', '2023-12-21');




---------------------------------------------------
-- Create table "promotion"
CREATE TABLE "promotion"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    begin DATE DEFAULT CURRENT_DATE,
    "end" DATE,
    percent INT NOT NULL
);
ALTER SEQUENCE promotion_id_seq RESTART WITH 1;
ALTER TABLE promotion ALTER COLUMN id SET DEFAULT nextval('promotion_id_seq');

--------------------------------------
-- 12 promotion
INSERT INTO "promotion" (name, begin, "end", percent) VALUES
    ('Promotion d''Ete', '2023-07-01', '2023-08-31', 20),
    ('Offre spéciale', '2023-09-15', '2023-09-30', 15),
    ('Promotion de printemps', '2023-04-01', '2023-05-31', 10),
    ('Super rabais', '2023-10-01', '2023-10-31', 25),
    ('Promotion de Noël', '2023-12-01', '2023-12-25', 30),
    ('Rabais automnal', '2023-09-01', '2023-11-30', 12),
    ('Offre exclusive', '2023-05-01', '2023-05-31', 10),
    ('Promotion d''hiver', '2023-01-01', '2023-02-28', 25),
    ('Rabais de Pâques', '2023-04-15', '2023-04-30', 30),
    ('Promotion de la Saint-Valentin', '2023-02-01', '2023-02-14', 12),
    ('Promotion de vacances', '2023-07-01', '2023-08-31', 15),
    ('Rabais de printemps', '2023-03-01', '2023-03-31', 10);




---------------------------------------------------
-- Create table "price"
CREATE TABLE price (
    id SERIAL PRIMARY KEY,
    cost_per_night FLOAT NOT NULL,
    id_season INT REFERENCES season(id)
);
ALTER SEQUENCE price_id_seq RESTART WITH 1;
ALTER TABLE price ALTER COLUMN id SET DEFAULT nextval('price_id_seq');

---------------------------------------------------
-- 4 price:
INSERT INTO price (cost_per_night, id_season) VALUES
(34999.99, 1),
(44999.99, 1),
(74999.99, 1),
(99999.99, 1);



---------------------------------------------------
-- Create table "rooom_features"
CREATE TABLE "room_features"(
    id SERIAL PRIMARY KEY,
    sea_view BOOLEAN,
    VIP_category BOOLEAN,
    hot_water BOOLEAN,
    wifi_available BOOLEAN,
    room_service BOOLEAN,
    mini_bar BOOLEAN,
    flat_screen BOOLEAN
);
ALTER SEQUENCE room_features_id_seq RESTART WITH 1;
ALTER TABLE room_features ALTER COLUMN id SET DEFAULT nextval('room_features_id_seq');

------------------------------------
-- 15 room_features
INSERT INTO room_features (sea_view, VIP_category, hot_water, wifi_available, room_service, mini_bar, flat_screen)
VALUES
    (true, false, false, false, true, false, false), --1 -- NO HOT WATER, WIFI, MINI BAR, FLAT SCREEN
    (true, false, false, true, true, false, false), --2 -- NO HOT WATER, MINI BAR, FLAT SCREEN
    (false, false, false, true, true, false, true), --3 -- NO VIEW SEA, HOT WATER, MINI BAR
    (true, false, false, true, true, false, true), --4 -- NO HOT WATER, MINI BAR
    (true, false, true, false, true, false, true), --5 -- NO WIFI, MINI BAR
    (false, false, true, false, true, false, true), --6 -- NO VIEW SEA, WIFI, MINI BAR
    (false, false, true, true, false, false, true), --7 -- NO VIEW SEA, SERVICE, MINI BAR
    (true, false, true, true, false, false, true), --8 -- NO SERVICE, MINI BAR
    (false, false, true, true, true, true, false), --9 -- NO SEA VIEW, FLAT SCREEN
    (false, false, true, true, true, true, true), --10 -- NO SEA VIEW
    (false, false, true, true, true, false, true), --11 -- MO VIEW SEA, MINIBAR
    (true, false, true, true, true, false, true), --12 -- NO MINI BAR
    (true, false, true, true, true, true, true), --13 -- NOT VIP
    (false, true, true, true, true, true, true), --14 -- VIP, NO VIEW SEA
    (true, true, true, true, true, true, true); --15 -- VIP



---------------------------------------------------
-- Create table "room"
CREATE TABLE "room"(
    id SERIAL PRIMARY KEY,
    number VARCHAR(100) NOT NULL,
    room_type VARCHAR(200) NOT NULL,
    capacity_room INT NOT NULL,
    id_hotel SERIAL REFERENCES hotel(id),
    id_price INT REFERENCES price(id),
    id_room_features INT REFERENCES room_features(id)
);
ALTER SEQUENCE room_id_seq RESTART WITH 1;
    ALTER TABLE room ALTER COLUMN id SET DEFAULT nextval('room_id_seq');

-------------------------------------
-- 240 rooms
    --20 Room Akory100:
    INSERT INTO room (number, room_type, capacity_room, id_hotel, id_price, id_room_features)
    VALUES
        ('101', 'solo', 1, 1, 1, 7),
        ('102', 'solo', 1, 1, 1, 3),
        ('103', 'twin', 2, 1, 2, 10),
        ('104', 'family', 8, 1, 3, 11),
        ('105', 'VIP', 5, 1, 4, 14),
        ('201', 'solo', 1, 1, 1, 3),
        ('202', 'solo', 1, 1, 1, 7),
        ('203', 'twin', 2, 1, 2, 6),
        ('204', 'family', 8, 1, 3, 6),
        ('205', 'VIP', 5, 1, 4, 14),
        ('301', 'solo', 1, 1, 1, 10),
        ('302', 'solo', 1, 1, 1, 11),
        ('303', 'twin', 2, 1, 2, 10),
        ('304', 'family', 8, 1, 3, 6),
        ('305', 'VIP', 5, 1, 4, 14),
        ('401', 'solo', 1, 1, 1, 10),
        ('402', 'solo', 1, 1, 1, 11),
        ('403', 'twin', 2, 1, 2, 10),
        ('404', 'family', 8, 1, 3, 11),
        ('405', 'VIP', 5, 1, 4, 14),

    --20 Room Akory101:
        ('101', 'solo', 1, 2, 1, 10),
        ('102', 'solo', 1, 2, 1, 11),
        ('103', 'twin', 2, 2, 2, 10),
        ('104', 'family', 8, 2, 3, 6),
        ('105', 'VIP', 5, 2, 4, 14),
        ('201', 'solo', 1, 2, 1, 3),
        ('202', 'solo', 1, 2, 1, 10),
        ('203', 'twin', 2, 2, 2, 6),
        ('204', 'family', 8, 2, 3, 7),
        ('205', 'VIP', 5, 2, 4, 14),
        ('301', 'solo', 1, 2, 1, 7),
        ('302', 'solo', 1, 2, 1, 11),
        ('303', 'twin', 2, 2, 2, 6),
        ('304', 'family', 8, 2, 3, 10),
        ('305', 'VIP', 5, 2, 4, 14),
        ('401', 'solo', 1, 2, 1, 3),
        ('402', 'solo', 1, 2, 1, 10),
        ('403', 'twin', 2, 2, 2, 6),
        ('404', 'family', 8, 2, 3, 10),
        ('405', 'VIP', 5, 2, 4, 14),
    
    --20 Room Akory200:
        ('101', 'solo', 1, 3, 1, 4),
        ('102', 'solo', 1, 3, 1, 1),
        ('103', 'twin', 2, 3, 2, 5),
        ('104', 'family', 8, 3, 3, 12),
        ('105', 'VIP', 5, 3, 4, 15),
        ('201', 'solo', 1, 3, 1, 9),
        ('202', 'solo', 1, 3, 1, 4),
        ('203', 'twin', 2, 3, 2, 13),
        ('204', 'family', 8, 3, 3, 12),
        ('205', 'VIP', 5, 3, 4, 15),
        ('301', 'solo', 1, 3, 1, 3),
        ('302', 'solo', 1, 3, 1, 4),
        ('303', 'twin', 2, 3, 2, 13),
        ('304', 'family', 8, 3, 3, 12),
        ('305', 'VIP', 5, 3, 4, 15),
        ('401', 'solo', 1, 3, 1, 13),
        ('402', 'solo', 1, 3, 1, 11),
        ('403', 'twin', 2, 3, 2, 8),
        ('404', 'family', 8, 3, 3, 12),
        ('405', 'VIP', 5, 3, 4, 15),
    
    --20 Room Akory201:
        ('101', 'solo', 1, 4, 1, 9),
        ('102', 'solo', 1, 4, 1, 5),
        ('103', 'twin', 2, 4, 2, 8),
        ('104', 'family', 8, 4, 3, 12),
        ('105', 'VIP', 5, 4, 4, 14),
        ('201', 'solo', 1, 4, 1, 4),
        ('202', 'solo', 1, 4, 1, 8),
        ('203', 'twin', 2, 4, 2, 13),
        ('204', 'family', 8, 4, 3, 12),
        ('205', 'VIP', 5, 4, 4, 14),
        ('301', 'solo', 1, 4, 1, 13),
        ('302', 'solo', 1, 4, 1, 5),
        ('303', 'twin', 2, 1, 2, 4),
        ('304', 'family', 8, 4, 3, 8),
        ('305', 'VIP', 5, 4, 4, 15),
        ('401', 'solo', 1, 4, 1, 13),
        ('402', 'solo', 1, 4, 1, 5),
        ('403', 'twin', 2, 4, 2, 4),
        ('404', 'family', 8, 4, 3, 12),
        ('405', 'VIP', 5, 4, 4, 15),
    
    --20 Room Akory300:
        ('101', 'solo', 1, 5, 1, 10),
        ('102', 'solo', 1, 5, 1, 11),
        ('103', 'twin', 2, 5, 2, 6),
        ('104', 'family', 8, 5, 3, 7),
        ('105', 'VIP', 5, 5, 4, 14),
        ('201', 'solo', 1, 5, 1, 3),
        ('202', 'solo', 1, 5, 1, 10),
        ('203', 'twin', 2, 5, 2, 11),
        ('204', 'family', 8, 5, 3, 6),
        ('205', 'VIP', 5, 5, 4, 14),
        ('301', 'solo', 1, 5, 1, 7),
        ('302', 'solo', 1, 5, 1, 10),
        ('303', 'twin', 2, 5, 2, 10),
        ('304', 'family', 8, 5, 3, 11),
        ('305', 'VIP', 5, 5, 4, 14),
        ('401', 'solo', 1, 5, 1, 7),
        ('402', 'solo', 1, 5, 1, 10),
        ('403', 'twin', 2, 5, 2, 10),
        ('404', 'family', 8, 5, 3, 11),
        ('405', 'VIP', 5, 5, 4, 14),
    
    --20 Room Akory301:
        ('101', 'solo', 1, 6, 1, 10),
        ('102', 'solo', 1, 6, 1, 3),
        ('103', 'twin', 2, 6, 2, 6),
        ('104', 'family', 8, 6, 3, 11),
        ('105', 'VIP', 5, 6, 4, 14),
        ('201', 'solo', 1, 6, 1, 11),
        ('202', 'solo', 1, 6, 1, 10),
        ('203', 'twin', 2, 6, 2, 7),
        ('204', 'family', 8, 6, 3, 11),
        ('205', 'VIP', 5, 6, 4, 14),
        ('301', 'solo', 1, 6, 1, 3),
        ('302', 'solo', 1, 6, 1, 7),
        ('303', 'twin', 2, 6, 2, 10),
        ('304', 'family', 8, 6, 3, 9),
        ('305', 'VIP', 5, 6, 4, 14),
        ('401', 'solo', 1, 6, 1, 7),
        ('402', 'solo', 1, 6, 1, 10),
        ('403', 'twin', 2, 6, 2, 9),
        ('404', 'family', 8, 6, 3, 11),
        ('405', 'VIP', 5, 6, 4, 14),

    --20 Room Akory400:
        ('101', 'solo', 1, 7, 1, 13),
        ('102', 'solo', 1, 7, 1, 12),
        ('103', 'twin', 2, 7, 2, 13),
        ('104', 'family', 8, 7, 3, 12),
        ('105', 'VIP', 5, 7, 4, 15),
        ('201', 'solo', 1, 7, 1, 5),
        ('202', 'solo', 1, 7, 1, 13),
        ('203', 'twin', 2, 7, 2, 11),
        ('204', 'family', 8, 7, 3, 12),
        ('205', 'VIP', 5, 7, 4, 15),
        ('301', 'solo', 1, 7, 1, 11),
        ('302', 'solo', 1, 7, 1, 12),
        ('303', 'twin', 2, 7, 2, 9),
        ('304', 'family', 8, 7, 3, 5),
        ('305', 'VIP', 5, 7, 4, 15),
        ('401', 'solo', 1, 7, 1, 13),
        ('402', 'solo', 1, 7, 1, 12),
        ('403', 'twin', 2, 7, 2, 5),
        ('404', 'family', 8, 7, 3, 12),
        ('405', 'VIP', 5, 7, 4, 15),

    --20 Room Akory401:
        ('101', 'solo', 1, 8, 1, 1),
        ('102', 'solo', 1, 8, 1, 2),
        ('103', 'twin', 2, 8, 2, 1),
        ('104', 'family', 8, 8, 3, 3),
        ('105', 'VIP', 5, 8, 4, 15),
        ('201', 'solo', 1, 8, 1, 5),
        ('202', 'solo', 1, 8, 1, 7),
        ('203', 'twin', 2, 8, 2, 12),
        ('204', 'family', 8, 8, 3, 12),
        ('205', 'VIP', 5, 8, 4, 15),
        ('301', 'solo', 1, 8, 1, 4),
        ('302', 'solo', 1, 8, 1, 8),
        ('303', 'twin', 2, 8, 2, 12),
        ('304', 'family', 8, 8, 3, 13),
        ('305', 'VIP', 5, 8, 4, 15),
        ('401', 'solo', 1, 8, 1, 12),
        ('402', 'solo', 1, 8, 1, 2),
        ('403', 'twin', 2, 8, 2, 3),
        ('404', 'family', 8, 8, 3, 12),
        ('405', 'VIP', 5, 8, 4, 15),

    --20 Room Akory500:
        ('101', 'solo', 1, 9, 1, 12),
        ('102', 'solo', 1, 9, 1, 13),
        ('103', 'twin', 2, 9, 2, 10),
        ('104', 'family', 8, 9, 3, 8),
        ('105', 'VIP', 5, 9, 4, 15),
        ('201', 'solo', 1, 9, 1, 7),
        ('202', 'solo', 1, 9, 1, 8),
        ('203', 'twin', 2, 9, 2, 5),
        ('204', 'family', 8, 9, 3, 4),
        ('205', 'VIP', 5, 9, 4, 15),
        ('301', 'solo', 1, 9, 1, 2),
        ('302', 'solo', 1, 9, 1, 8),
        ('303', 'twin', 2, 9, 2, 12),
        ('304', 'family', 8, 9, 3, 12),
        ('305', 'VIP', 5, 9, 4, 15),
        ('401', 'solo', 1, 9, 1, 4),
        ('402', 'solo', 1, 9, 1, 5),
        ('403', 'twin', 2, 9, 2, 12),
        ('404', 'family', 8, 9, 3, 13),
        ('405', 'VIP', 5, 9, 4, 15),

    --20 Room Akory501:
        ('101', 'solo', 1, 10, 1, 3),
        ('102', 'solo', 1, 10, 1, 8),
        ('103', 'twin', 2, 10, 2, 11),
        ('104', 'family', 8, 10, 3, 12),
        ('105', 'VIP', 5, 10, 4, 15),
        ('201', 'solo', 1, 10, 1, 13),
        ('202', 'solo', 1, 10, 1, 10),
        ('203', 'twin', 2, 10, 2, 12),
        ('204', 'family', 8, 10, 3, 12),
        ('205', 'VIP', 5, 10, 4, 15),
        ('301', 'solo', 1, 10, 1, 4),
        ('302', 'solo', 1, 10, 1, 6),
        ('303', 'twin', 2, 10, 2, 8),
        ('304', 'family', 8, 10, 3, 10),
        ('305', 'VIP', 5, 10, 4, 15),
        ('401', 'solo', 1, 10, 1, 12),
        ('402', 'solo', 1, 10, 1, 8),
        ('403', 'twin', 2, 10, 2, 9),
        ('404', 'family', 8, 10, 3, 11),
        ('405', 'VIP', 5, 10, 4, 15),

    --20 Room Akory600:
        ('101', 'solo', 1, 11, 1, 8),
        ('102', 'solo', 1, 11, 1, 10),
        ('103', 'twin', 2, 11, 2, 11),
        ('104', 'family', 8, 11, 3, 12),
        ('105', 'VIP', 5, 11, 4, 14),
        ('201', 'solo', 1, 11, 1, 4),
        ('202', 'solo', 1, 11, 1, 7),
        ('203', 'twin', 2, 11, 2, 12),
        ('204', 'family', 8, 11, 3, 10),
        ('205', 'VIP', 5, 11, 4, 15),
        ('301', 'solo', 1, 11, 1, 2),
        ('302', 'solo', 1, 11, 1, 3),
        ('303', 'twin', 2, 11, 2, 6),
        ('304', 'family', 8, 11, 3, 7),
        ('305', 'VIP', 5, 11, 4, 15),
        ('401', 'solo', 1, 11, 1, 10),
        ('402', 'solo', 1, 11, 1, 1),
        ('403', 'twin', 2, 11, 2, 2),
        ('404', 'family', 8, 11, 3, 6),
        ('405', 'VIP', 5, 11, 4, 15),

    --20 Room Akory601:
        ('101', 'solo', 1, 12, 1, 12),
        ('102', 'solo', 1, 12, 1, 13),
        ('103', 'twin', 2, 12, 2, 12),
        ('104', 'family', 8, 12, 3, 12),
        ('105', 'VIP', 5, 12, 4, 14),
        ('201', 'solo', 1, 12, 1, 7),
        ('202', 'solo', 1, 12, 1, 8),
        ('203', 'twin', 2, 12, 2, 10),
        ('204', 'family', 8, 12, 3, 11),
        ('205', 'VIP', 5, 12, 4, 15),
        ('301', 'solo', 1, 12, 1, 11),
        ('302', 'solo', 1, 12, 1, 12),
        ('303', 'twin', 2, 12, 2, 13),
        ('304', 'family', 8, 12, 3, 12),
        ('305', 'VIP', 5, 12, 4, 15),
        ('401', 'solo', 1, 12, 1, 10),
        ('402', 'solo', 1, 12, 1, 11),
        ('403', 'twin', 2, 12, 2, 12),
        ('404', 'family', 8, 12, 3, 12),
        ('405', 'VIP', 5, 12, 4, 15);




-----------------------------------------------------
-- Change realtion (affiliate) du table
CREATE TABLE "affiliate"(
    id SERIAL PRIMARY KEY,
    id_promotion SERIAL REFERENCES promotion(id),
    id_room SERIAL REFERENCES room(id)
);
ALTER SEQUENCE affiliate_id_seq RESTART WITH 1;
ALTER TABLE affiliate ALTER COLUMN id SET DEFAULT nextval('affiliate_id_seq');

------------------------
-- 240 affiliate
INSERT INTO "affiliate" (id_room, id_promotion)
    VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), 
    (10, 2),(11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2),
    (20, 3), (21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), (29, 3), 
    (30, 4), (31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), (39, 4), 
    (40, 5), (41, 5), (42, 5), (43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5), (49, 5), 
    (50, 6), (51, 6), (52, 6), (53, 6), (54, 6), (55, 6), (56, 6), (57, 6), (58, 6), (59, 6), 
    (60, 6), (61, 6), (62, 6), (63, 6), (64, 6), (65, 6), (66, 6), (67, 6), (68, 6), (69, 6),
    (70, 7), (71, 7), (72, 7), (73, 7), (74, 7), (75, 7), (76, 7), (77, 7), (78, 7), (79, 7), 
    (80, 8), (81, 8), (82, 8), (83, 8), (84, 8), (85, 8), (86, 8), (87, 8), (88, 8), (89, 8), 
    (90, 9), (91, 9), (92, 9), (93, 9), (94, 9), (95, 9), (96, 9), (97, 9), (98, 9), (99, 9), 
    (100, 10), (101, 10), (102, 10), (103, 10), (104, 10), (105, 10), (106, 10), (107, 10), (108, 10), (109, 10), 
    (110, 11), (111, 11), (112, 11), (113, 11), (114, 11), (115, 11), (116, 11), (117, 11), (118, 11), (119, 11), 
    (120, 12), (121, 12), (122, 12), (123, 12), (124, 12), (125, 12), (126, 12), (127, 12), (128, 12), (129, 12), 
    (130, 1), (131, 1), (132, 1), (133, 1), (134, 1), (135, 1), (136, 1), (137, 1), (138, 1), (139, 1), 
    (140, 2), (141, 2), (142, 2), (143, 2), (144, 2), (145, 2), (146, 2), (147, 2), (148, 2), (149, 2),
    (150, 3), (151, 3), (152, 3), (153, 3), (154, 3), (155, 3), (156, 3), (157, 3), (158, 3), (159, 3), 
    (160, 4), (161, 4), (162, 4), (163, 4), (164, 4), (165, 4), (166, 4), (167, 4), (168, 4), (169, 4), 
    (170, 5), (171, 5), (172, 5), (173, 5), (174, 5), (175, 5), (176, 5), (177, 5), (178, 5), (179, 5), 
    (180, 7), (181, 7), (182, 7), (183, 7), (184, 7), (185, 7), (186, 7), (187, 7), (188, 7), (189, 7), 
    (190, 8), (191, 8), (192, 8), (193, 8), (194, 8), (195, 8), (196, 8), (197, 8), (198, 8), (199, 8), 
    (200, 9), (201, 9), (202, 9), (203, 9), (204, 9), (205, 9), (206, 9), (207, 9), (208, 9), (209, 9), 
    (210, 10), (211, 10), (212, 10), (213, 10), (214, 10), (215, 10), (216, 10), (217, 10), (218, 10), (219, 10), 
    (220, 11), (221, 11), (222, 11), (223, 11), (224, 11), (225, 11), (226, 11), (227, 11), (228, 11), (229, 11), 
    (230, 12), (231, 12), (232, 12), (233, 12), (234, 12), (235, 12), (236, 12), (237, 12), (238, 12), (239, 12), 
    (240, 8);


---------------------------------------------------
-- Create table "receptionist"
CREATE TABLE "receptionist"(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    work_contact INT,
    id_hotel INT REFERENCES hotel(id)
);
ALTER SEQUENCE receptionist_id_seq RESTART WITH 1;
ALTER TABLE receptionist ALTER COLUMN id SET DEFAULT nextval('receptionist_id_seq');

-----------------------------------
-- receptionist:
INSERT INTO "receptionist" (first_name, last_name, password, email, work_contact, id_hotel)
VALUES 
    ('Alice', 'Jackson', 'password1', 'alice.jackson@gmail.com', 0331234567, 1),
    ('Jane', 'Smith', 'password2', 'jane.smith@gmail.com', 0349876543, 2),
    ('Michael', 'Johnson', 'password3', 'michael.johnson@gmail.com', 0324567890, 3),
    ('Emily', 'Davis', 'password4', 'emily.davis@gmail.com', 0339876543, 4),
    ('Daniel', 'Taylor', 'password5', 'daniel.taylor@gmail.com', 0341234567, 5),
    ('Sophia', 'Clark', 'password6', 'sophia.clark@gmail.com', 0327894561, 6),
    ('Matthew', 'Anderson', 'password7', 'matthew.anderson@gmail.com', 0336549872, 7),
    ('Olivia', 'Martinez', 'password8', 'olivia.martinez@gmail.com', 0347891234, 8),
    ('David', 'Hernandez', 'password9', 'david.hernandez@gmail.com', 0327896541, 9),
    ('Emma', 'Gonzalez', 'password10', 'emma.gonzalez@gmail.com', 0334567890, 10),
    ('Liam', 'Wilson', 'password11', 'liam.wilson@gmail.com', 0337896541, 11),
    ('Ava', 'Lopez', 'password12', 'ava.lopez@gmail.com', 0346547892, 12),
    ('Alexander', 'Young', 'password21', 'alexander.young@gmail.com', 0349871234, 1),
    ('Harper', 'White', 'password22', 'harper.white@gmail.com', 0327896541, 2),
    ('Daniel', 'Harris', 'password23', 'daniel.harris@gmail.com', 0336547892, 3),
    ('Sophia', 'Jackson', 'password24', 'sophia.jackson@gmail.com', 0347891234, 4),
    ('Matthew', 'Moore', 'password25', 'matthew.moore@gmail.com', 0321237894, 5),
    ('Amelia', 'Hall', 'password26', 'amelia.hall@gmail.com', 0334567890, 6),
    ('Oliver', 'Clark', 'password27', 'oliver.clark@gmail.com', 0347896543, 7),
    ('Grace', 'Lee', 'password28', 'grace.lee@gmail.com', 0326547891, 8),
    ('William', 'Perez', 'password29', 'william.perez@gmail.com', 0337894562, 9),
    ('Sofia', 'Collins', 'password30', 'sofia.collins@gmail.com', 0341237895, 10),
    ('Joseph', 'Harris', 'password31', 'joseph.harris@gmail.com', 0327894561, 11),
    ('Victoria', 'Wright', 'password32', 'victoria.wright@gmail.com', 0339876541, 12);




---------------------------------------------------
-- Create "customer"
CREATE TABLE "customer"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    principal_contact VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    emergency_number VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    CIN BIGINT NOT NULL,
    email VARCHAR(250) NOT NULL,
    password VARCHAR(50) NOT NULL,
    id_receptionist INT REFERENCES receptionist(id)
);

ALTER SEQUENCE customer_id_seq RESTART WITH 1;  
ALTER TABLE customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq');

-------------------
-- customer
INSERT INTO "customer" (name, last_name, principal_contact, address, emergency_number, gender, CIN, email, password, id_receptionist)
VALUES
    ('John', 'Doe', '0331234567', '123 Main Street', '0349876543', 'M', 123456789012, 'john.doe@gmail.com', 'password1', 1),
    ('Jane', 'Smith', '0349876543', '456 Elm Avenue', '0324567890', 'F', 987654321098, 'jane.smith@gmail.com', 'password2', 2),
    ('Michael', 'Johnson', '0324567890', '789 Oak Road', '0336549872', 'M', 543210987654, 'michael.johnson@gmail.com', 'password3', 3),
    ('Emily', 'Davis', '0339876543', '321 Pine Street', '0341234567', 'F', 987654321012, 'emily.davis@gmail.com', 'password4', 4),
    ('Daniel', 'Taylor', '0341234567', '654 Cedar Lane', '0327894561', 'M', 210987654321, 'daniel.taylor@gmail.com', 'password5', 5),
    ('Sophia', 'Clark', '0327894561', '987 Maple Avenue', '0336547892', 'F', 432109876543, 'sophia.clark@gmail.com', 'password6', 6),
    ('Matthew', 'Anderson', '0336549872', '456 Oak Street', '0347891234', 'M', 210987654322, 'matthew.anderson@gmail.com', 'password7', 7),
    ('Olivia', 'Martinez', '0347891234', '789 Elm Road', '0327896541', 'F', 109876543210, 'olivia.martinez@gmail.com', 'password8', 8),
    ('David', 'Hernandez', '0327896541', '123 Pine Avenue', '0337896542', 'M', 987654321012, 'david.hernandez@gmail.com', 'password9', 9),
    ('Emma', 'Gonzalez', '0334567890', '456 Oak Lane', '0344567892', 'F', 321098765432, 'emma.gonzalez@gmail.com', 'password10', 10),
    ('Liam', 'Wilson', '0337896541', '789 Main Street', '0346547892', 'M', 210987654323, 'liam.wilson@gmail.com', 'password11', 11),
    ('Ava', 'Lopez', '0346547892', '456 Elm Avenue', '0329876543', 'F', 432109876544, 'ava.lopez@gmail.com', 'password12', 12),
    ('Noah', 'Lee', '0329876543', '123 Oak Road', '0331237894', 'M', 210987654324, 'noah.lee@gmail.com', 'password13', 3),
    ('Isabella', 'Garcia', '0331237894', '789 Pine Street', '0347896541', 'F', 109876543211, 'isabella.garcia@gmail.com', 'password14', 4),
    ('James', 'Martin', '0347896541', '456 Cedar Lane', '0324569873', 'M', 987654321013, 'james.martin@gmail.com', 'password15', 5),
    ('Charlotte', 'Clark', '0324569873', '789 Maple Avenue', '0337894562', 'F', 876543210987, 'charlotte.clark@gmail.com', 'password16', 6),
    ('Benjamin', 'Rodriguez', '0337894562', '123 Elm Road', '0349871234', 'M', 210987654325, 'benjamin.rodriguez@gmail.com', 'password17', 7),
    ('Mia', 'Lewis', '0349871234', '456 Pine Avenue', '0327896541', 'F', 543210987655, 'mia.lewis@gmail.com', 'password18', 8),
    ('Henry', 'Walker', '0327896541', '789 Oak Lane', '0337896543', 'M', 432109876545, 'henry.walker@gmail.com', 'password19', 9),
    ('Evelyn', 'Hall', '0337896543', '123 Cedar Street', '0341237896', 'F', 321098765433, 'evelyn.hall@gmail.com', 'password20', 10),
    ('Alexander', 'Young', '0341237896', '456 Maple Road', '0327894561', 'M', 109876543212, 'alexander.young@gmail.com', 'password21', 1),
    ('Harper', 'White', '0327894561', '789 Elm Avenue', '0336547892', 'F', 987654321014, 'harper.white@gmail.com', 'password22', 2),
    ('Daniel', 'Harris', '0336547892', '123 Pine Road', '0347896543', 'M', 876543210988, 'daniel.harris@gmail.com', 'password23', 11),
    ('Sophia', 'Jackson', '0347896543', '456 Cedar Avenue', '0327896542', 'F', 765432109876, 'sophia.jackson@gmail.com', 'password24', 12),
    ('Matthew', 'Moore', '0327896542', '789 Maple Lane', '0331237895', 'M', 654321098765, 'matthew.moore@gmail.com', 'password25', 5),
    ('Amelia', 'Hall', '0331237895', '123 Elm Street', '0344567890', 'F', 543210987656, 'amelia.hall@gmail.com', 'password26', 6),
    ('Oliver', 'Clark', '0344567890', '456 Pine Road', '0327896541', 'M', 432109876546, 'oliver.clark@gmail.com', 'password27', 7),
    ('Grace', 'Lee', '0327896541', '789 Cedar Avenue', '0336547891', 'F', 321098765434, 'grace.lee@gmail.com', 'password28', 8),
    ('William', 'Perez', '0336547891', '123 Maple Lane', '0347891235', 'M', 210987654326, 'william.perez@gmail.com', 'password29', 9),
    ('Sofia', 'Collins', '0347891235', '456 Elm Street', '0327896542', 'F', 109876543213, 'sofia.collins@gmail.com', 'password30', 10),
    ('Joseph', 'Harris', '0327896542', '789 Oak Road', '0339876541', 'M', 987654321015, 'joseph.harris@gmail.com', 'password31', 1),
    ('Victoria', 'Wright', '0339876541', '123 Cedar Lane', '0344567892', 'F', 876543210989, 'victoria.wright@gmail.com', 'password32', 2),
    ('Daniel', 'Green', '0344567892', '456 Maple Avenue', '0327894563', 'M', 765432109877, 'daniel.green@gmail.com', 'password33', 3),
    ('Avery', 'Turner', '0327894563', '789 Elm Road', '0337896542', 'F', 654321098766, 'avery.turner@gmail.com', 'password34', 4),
    ('Michael', 'Hall', '0337896542', '123 Pine Avenue', '0347896544', 'M', 543210987657, 'michael.hall@gmail.com', 'password35', 11),
    ('Madison', 'Smith', '0347896544', '456 Cedar Lane', '0327891234', 'F', 432109876547, 'madison.smith@gmail.com', 'password36', 12),
    ('David', 'Walker', '0327891234', '789 Maple Avenue', '0337896541', 'M', 321098765435, 'david.walker@gmail.com', 'password37', 7),
    ('Luna', 'Wilson', '0337896541', '123 Elm Road', '0346547893', 'F', 210987654327, 'luna.wilson@gmail.com', 'password38', 8),
    ('James', 'Gonzalez', '0346547893', '456 Pine Avenue', '0329876543', 'M', 109876543214, 'james.gonzalez@gmail.com', 'password39', 9),
    ('Ella', 'Taylor', '0329876543', '789 Cedar Lane', '0331237896', 'F', 987654321016, 'ella.taylor@gmail.com', 'password40', 10),
    ('Joseph', 'King', '0331237896', '123 Maple Avenue', '0347896542', 'M', 876543210990, 'joseph.king@gmail.com', 'password41', 1),
    ('Avery', 'Parker', '0347896542', '456 Elm Road', '0327894564', 'F', 765432109878, 'avery.parker@gmail.com', 'password42', 2),
    ('Noah', 'Adams', '0327894564', '789 Oak Lane', '0339876542', 'M', 654321098767, 'noah.adams@gmail.com', 'password43', 3),
    ('Scarlett', 'Garcia', '0339876542', '123 Cedar Avenue', '0344567893', 'F', 543210987658, 'scarlett.garcia@gmail.com', 'password44', 4),
    ('Mason', 'Thompson', '0344567893', '456 Maple Lane', '0327896541', 'M', 432109876548, 'mason.thompson@gmail.com', 'password45', 5),
    ('Chloe', 'Baker', '0327896541', '789 Elm Street', '0336547894', 'F', 321098765436, 'chloe.baker@gmail.com', 'password46', 6),
    ('Ethan', 'Cruz', '0336547894', '123 Pine Road', '0347891234', 'M', 210987654328, 'ethan.cruz@gmail.com', 'password47', 11),
    ('Lily', 'Ward', '0347891234', '456 Cedar Avenue', '0327896542', 'F', 109876543215, 'lily.ward@gmail.com', 'password48', 12),
    ('Samuel', 'Mitchell', '0327896542', '789 Maple Road', '0331237897', 'M', 987654321017, 'samuel.mitchell@gmail.com', 'password49', 9),
    ('Hannah', 'Bennett', '0331237897', '123 Elm Avenue', '0344567890', 'F', 876543210991, 'hannah.bennett@gmail.com', 'password50', 10),
    ('Michael', 'Gomez', '0344567890', '456 Pine Lane', '0327896543', 'M', 765432109879, 'michael.gomez@gmail.com', 'password51', 1),
    ('Abigail', 'Davis', '0327896543', '789 Cedar Street', '0336547895', 'F', 654321098768, 'abigail.davis@gmail.com', 'password52', 2),
    ('Daniel', 'Hernandez', '0336547895', '123 Maple Avenue', '0347896543', 'M', 543210987659, 'daniel.hernandez@gmail.com', 'password53', 3),
    ('Emily', 'Collins', '0347896543', '456 Elm Road', '0327894565', 'F', 432109876549, 'emily.collins@gmail.com', 'password54', 4),
    ('Alexander', 'Roberts', '0327894565', '789 Oak Lane', '0339876543', 'M', 321098765437, 'alexander.roberts@gmail.com', 'password55', 5),
    ('Olivia', 'Wood', '0339876543', '123 Cedar Avenue', '0344567894', 'F', 210987654329, 'olivia.wood@gmail.com', 'password56', 6),
    ('William', 'Ward', '0344567894', '456 Maple Road', '0327891235', 'M', 109876543216, 'william.ward@gmail.com', 'password57', 7),
    ('Charlotte', 'Parker', '0327891235', '789 Elm Street', '0337896544', 'F', 987654321018, 'charlotte.parker@gmail.com', 'password58', 8),
    ('Mason', 'Collins', '0337896544', '123 Pine Lane', '0349871235', 'M', 876543210992, 'mason.collins@gmail.com', 'password59', 11),
    ('Amelia', 'Baker', '0349871235', '456 Cedar Avenue', '0327896543', 'F', 765432109880, 'amelia.baker@gmail.com', 'password60', 12),
    ('James', 'Hernandez', '0327896543', '789 Maple Road', '0336547896', 'M', 654321098769, 'james.hernandez@gmail.com', 'password61', 11),
    ('Oliver', 'Evans', '0336547896', '123 Elm Street', '0347896544', 'F', 543210987660, 'oliver.evans@gmail.com', 'password62', 12),
    ('Mia', 'Ward', '0347896544', '456 Pine Lane', '0327896541', 'M', 432109876550, 'mia.ward@gmail.com', 'password63', 13),
    ('Benjamin', 'Rivera', '0327896541', '789 Cedar Avenue', '0337894563', 'F', 321098765438, 'benjamin.rivera@gmail.com', 'password64', 14),
    ('Evelyn', 'Gonzalez', '0337894563', '123 Maple Road', '0341237896', 'M', 210987654330, 'evelyn.gonzalez@gmail.com', 'password65', 15),
    ('Alexander', 'Wright', '0341237896', '456 Elm Street', '0327894564', 'F', 109876543217, 'alexander.wright@gmail.com', 'password66', 16),
    ('Daniel', 'Green', '0327894564', '789 Oak Lane', '0339876544', 'M', 987654321019, 'daniel.green@gmail.com', 'password67', 17),
    ('Olivia', 'Johnson', '0339876544', '123 Cedar Avenue', '0344567895', 'F', 876543210993, 'olivia.johnson@gmail.com', 'password68', 18),
    ('William', 'Perez', '0344567895', '456 Maple Road', '0327896545', 'M', 765432109881, 'william.perez@gmail.com', 'password69', 19),
    ('Charlotte', 'Parker', '0327896545', '789 Elm Street', '0336547897', 'F', 654321098770, 'charlotte.parker@gmail.com', 'password70', 10),
    ('Mason', 'Collins', '0336547897', '123 Pine Lane', '0347896545', 'M', 543210987661, 'mason.collins@gmail.com', 'password71', 11),
    ('Amelia', 'Baker', '0347896545', '456 Cedar Avenue', '0327896544', 'F', 432109876551, 'amelia.baker@gmail.com', 'password72', 12),
    ('James', 'Harris', '0327896544', '789 Maple Road', '0331237897', 'M', 321098765439, 'james.harris@gmail.com', 'password73', 13),
    ('Oliver', 'Hall', '0331237897', '123 Elm Street', '0344567890', 'F', 210987654331, 'oliver.hall@gmail.com', 'password74', 14),
    ('Mia', 'Johnson', '0344567890', '456 Pine Lane', '0327896545', 'M', 109876543218, 'mia.johnson@gmail.com', 'password75', 15),
    ('Benjamin', 'Perez', '0327896545', '789 Cedar Avenue', '0336547898', 'F', 987654321020, 'benjamin.perez@gmail.com', 'password76', 16),
    ('Olivia', 'Wood', '0336547898', '123 Maple Road', '0347891236', 'M', 876543210994, 'olivia.wood@gmail.com', 'password77', 17),
    ('William', 'Ward', '0347891236', '456 Elm Street', '0327894565', 'F', 765432109882, 'william.ward@gmail.com', 'password78', 18),
    ('Charlotte', 'Parker', '0327894565', '789 Oak Lane', '0339876545', 'M', 654321098771, 'charlotte.parker@gmail.com', 'password79', 19),
    ('Mason', 'Collins', '0339876545', '123 Cedar Avenue', '0344567891', 'F', 543210987662, 'mason.collins@gmail.com', 'password80', 20),
    ('Amelia', 'Baker', '0344567891', '456 Maple Road', '0327896546', 'M', 432109876552, 'amelia.baker@gmail.com', 'password81', 21),
    ('James', 'Hernandez', '0327896546', '789 Elm Street', '0336547899', 'F', 321098765440, 'james.hernandez@gmail.com', 'password82', 22),
    ('Oliver', 'Evans', '0336547899', '123 Pine Lane', '0347896546', 'M', 210987654332, 'oliver.evans@gmail.com', 'password83', 23),
    ('Mia', 'Ward', '0347896546', '456 Cedar Avenue', '0327896545', 'F', 109876543219, 'mia.ward@gmail.com', 'password84', 24),
    ('Benjamin', 'Rivera', '0327896545', '789 Maple Road', '0331237898', 'M', 987654321021, 'benjamin.rivera@gmail.com', 'password85', 15),
    ('Evelyn', 'Gonzalez', '0331237898', '123 Elm Street', '0344567892', 'F', 876543210995, 'evelyn.gonzalez@gmail.com', 'password86', 16),
    ('Alexander', 'Wright', '0344567892', '456 Pine Lane', '0327894566', 'M', 765432109883, 'alexander.wright@gmail.com', 'password87', 17),
    ('Daniel', 'Green', '0327894566', '789 Cedar Avenue', '0339876546', 'F', 654321098772, 'daniel.green@gmail.com', 'password88', 18),
    ('Olivia', 'Johnson', '0339876546', '123 Maple Road', '0347891237', 'M', 543210987663, 'olivia.johnson@gmail.com', 'password89', 8),
    ('William', 'Perez', '0347891237', '456 Elm Street', '0327896546', 'F', 432109876553, 'william.perez@gmail.com', 'password90', 4),
    ('Charlotte', 'Parker', '0327896546', '789 Oak Lane', '0336547892', 'M', 321098765441, 'charlotte.parker@gmail.com', 'password91', 3),
    ('Mason', 'Collins', '0336547892', '123 Cedar Avenue', '0344567893', 'F', 210987654333, 'mason.collins@gmail.com', 'password92', 5),
    ('Amelia', 'Baker', '0344567893', '456 Maple Road', '0327896547', 'M', 109876543220, 'amelia.baker@gmail.com', 'password93', 14),
    ('James', 'Hernandez', '0327896547', '789 Elm Street', '0337896545', 'F', 987654321022, 'james.hernandez@gmail.com', 'password94', 19),
    ('Oliver', 'Evans', '0337896545', '123 Pine Lane', '0349871238', 'M', 876543210996, 'oliver.evans@gmail.com', 'password95', 8),
    ('Mia', 'Ward', '0349871238', '456 Cedar Avenue', '0327896546', 'F', 765432109884, 'mia.ward@gmail.com', 'password96', 6),
    ('Benjamin', 'Rivera', '0327896546', '789 Maple Road', '0336547893', 'M', 654321098773, 'benjamin.rivera@gmail.com', 'password97', 19),
    ('Evelyn', 'Gonzalez', '0336547893', '123 Elm Street', '0347896547', 'F', 543210987664, 'evelyn.gonzalez@gmail.com', 'password98', 22),
    ('Alexander', 'Wright', '0347896547', '456 Pine Lane', '0327896547', 'M', 432109876554, 'alexander.wright@gmail.com', 'password99', 2),
    ('Daniel', 'Green', '0327896547', '789 Cedar Avenue', '0339876547', 'F', 321098765442, 'daniel.green@gmail.com', 'password100', 10);




---------------------------------------------------
-- Create table "reservation"
CREATE TABLE "reservation"(
    id SERIAL PRIMARY KEY,
    date_arrived TIMESTAMP NOT NULL,
    leaving_date TIMESTAMP NOT NULL,
    number_of_person INT NOT NULL,
    is_cancelled BOOLEAN,
    id_customer INT REFERENCES customer(id),
    id_room INT REFERENCES room(id)
);
ALTER SEQUENCE reservation_id_seq RESTART WITH 1;  
ALTER TABLE reservation ALTER COLUMN id SET DEFAULT nextval('reservation_id_seq');

----------------------------------------------------
--- 168 reservation:
INSERT INTO reservation (date_arrived, leaving_date, number_of_person, id_customer, id_room)
VALUES
    ('2023-09-16 14:30:00', '2023-09-22 10:00:00', 3, 78, 202),
    ('2023-09-18 09:00:00', '2023-09-23 11:30:00', 1, 17, 203),
    ('2023-09-15 10:00:00', '2023-09-20 12:00:00', 2, 45, 201),
    ('2023-09-25 16:30:00', '2023-10-01 09:00:00', 3, 55, 211),
    ('2023-09-26 10:30:00', '2023-10-02 13:00:00', 1, 67, 202),
    ('2023-09-27 14:00:00', '2023-10-03 16:30:00', 2, 21, 213),
    ('2023-09-28 11:30:00', '2023-10-04 14:00:00', 4, 89, 204),
    ('2023-08-07 09:30:00', '2023-08-14 12:00:00', 2, 93, 225),
    ('2023-08-08 15:00:00', '2023-08-15 17:30:00', 1, 32, 236),
    ('2023-08-09 12:30:00', '2023-08-16 10:00:00', 3, 69, 217),
    ('2023-08-10 08:00:00', '2023-08-17 11:30:00', 4, 57, 218),
    ('2023-08-11 13:00:00', '2023-08-18 14:30:00', 2, 86, 209),
    ('2023-08-12 09:30:00', '2023-08-19 12:00:00', 1, 25, 221),
    ('2023-08-13 16:00:00', '2023-08-20 17:30:00', 3, 78, 202),
    ('2023-08-14 11:30:00', '2023-08-21 09:00:00', 2, 13, 203),
    ('2023-08-15 14:00:00', '2023-08-22 16:30:00', 4, 63, 234),
    ('2023-08-16 10:30:00', '2023-08-23 13:00:00', 1, 37, 205),
    ('2023-08-17 13:30:00', '2023-08-24 15:00:00', 3, 95, 216),
    ('2023-08-18 10:00:00', '2023-08-25 09:30:00', 2, 19, 207),
    ('2023-08-19 15:30:00', '2023-08-26 12:00:00', 1, 47, 228),
    ('2023-08-20 12:00:00', '2023-08-27 14:30:00', 4, 74, 209),
    ('2023-08-21 09:30:00', '2023-08-28 17:00:00', 3, 24, 211),
    ('2023-08-22 16:00:00', '2023-08-29 09:30:00', 2, 81, 202),
    ('2023-08-23 11:30:00', '2023-08-30 12:00:00', 1, 59, 223),
    ('2023-08-24 14:30:00', '2023-08-31 14:00:00', 2, 84, 204),
    ('2023-08-25 11:00:00', '2023-09-01 16:30:00', 3, 16, 205),
    ('2023-09-06 16:30:00', '2023-09-13 10:30:00', 1, 68, 228),
    ('2023-09-07 12:30:00', '2023-09-14 13:00:00', 2, 28, 209),
    ('2023-09-08 15:00:00', '2023-09-15 16:30:00', 3, 52, 211),
    ('2023-09-09 11:00:00', '2023-09-16 09:30:00', 1, 89, 202),
    ('2023-09-10 13:30:00', '2023-09-17 12:00:00', 4, 33, 223),
    ('2023-09-11 10:00:00', '2023-09-18 14:30:00', 2, 71, 234),
    ('2023-09-12 15:30:00', '2023-09-19 17:00:00', 1, 15, 205),
    ('2023-09-13 12:00:00', '2023-09-20 09:30:00', 3, 64, 226),
    ('2023-09-14 09:30:00', '2023-09-21 12:00:00', 2, 81, 207),
    ('2023-09-15 16:00:00', '2023-09-22 14:30:00', 4, 23, 218),
    ('2023-09-16 11:30:00', '2023-09-23 16:00:00', 3, 59, 209),
    ('2023-09-17 14:30:00', '2023-09-24 11:30:00', 1, 94, 211),
    ('2023-09-18 10:00:00', '2023-09-25 14:00:00', 2, 48, 202),
    ('2023-09-19 15:30:00', '2023-09-26 16:30:00', 3, 79, 203),
    ('2023-09-20 12:00:00', '2023-09-27 09:00:00', 4, 36, 214),
    ('2023-10-11 10:00:00', '2023-10-18 12:00:00', 3, 52, 207),
    ('2023-10-12 15:30:00', '2023-10-19 14:30:00', 2, 89, 208),
    ('2023-10-13 12:00:00', '2023-10-20 17:00:00', 4, 15, 219),
    ('2023-10-14 09:30:00', '2023-10-21 10:30:00', 1, 64, 201),
    ('2023-10-15 16:30:00', '2023-10-22 13:00:00', 2, 33, 222),
    ('2023-10-16 11:30:00', '2023-10-23 15:30:00', 3, 77, 203),
    ('2023-10-17 14:30:00', '2023-10-24 11:00:00', 1, 23, 214),
    ('2023-10-18 10:00:00', '2023-10-25 14:30:00', 4, 66, 225),
    ('2023-10-19 15:30:00', '2023-10-26 16:00:00', 3, 31, 206),
    ('2023-10-20 12:00:00', '2023-10-27 09:30:00', 2, 71, 237),
    -----
    ('2023-09-16 14:30:00', '2023-09-22 10:00:00', 3, 78, 112),
    ('2023-09-21 11:00:00', '2023-09-28 14:30:00', 3, 67, 106),
    ('2023-09-22 08:30:00', '2023-09-29 10:30:00', 1, 36, 67),
    ('2023-09-23 13:00:00', '2023-09-30 09:00:00', 4, 81, 18),
    ('2023-09-24 09:30:00', '2023-09-30 12:30:00', 2, 23, 19),
    ('2023-09-25 16:30:00', '2023-10-01 09:00:00', 3, 55, 11),
    ('2023-09-26 10:30:00', '2023-10-02 13:00:00', 1, 67, 122),
    ('2023-09-27 14:00:00', '2023-10-03 16:30:00', 2, 21, 163),
    ('2023-09-28 11:30:00', '2023-10-04 14:00:00', 4, 89, 134),
    ('2023-08-08 15:00:00', '2023-08-15 17:30:00', 1, 32, 106),
    ('2023-08-09 12:30:00', '2023-08-16 10:00:00', 3, 69, 187),
    ('2023-08-10 08:00:00', '2023-08-17 11:30:00', 4, 57, 148),
    ('2023-08-11 13:00:00', '2023-08-18 14:30:00', 2, 86, 109),
    ('2023-08-12 09:30:00', '2023-08-19 12:00:00', 1, 25, 141),
    ('2023-08-13 16:00:00', '2023-08-20 17:30:00', 3, 78, 102),
    ('2023-08-14 11:30:00', '2023-08-21 09:00:00', 2, 13, 153),
    ('2023-08-15 14:00:00', '2023-08-22 16:30:00', 4, 63, 164),
    ('2023-08-16 10:30:00', '2023-08-23 13:00:00', 1, 37, 105),
    ('2023-08-17 13:30:00', '2023-08-24 15:00:00', 3, 95, 156),
    ('2023-08-18 10:00:00', '2023-08-25 09:30:00', 2, 19, 107),
    ('2023-08-19 15:30:00', '2023-08-26 12:00:00', 1, 47, 28),
    ('2023-08-28 15:30:00', '2023-09-04 15:00:00', 2, 66, 38),
    ('2023-08-29 12:00:00', '2023-09-05 17:30:00', 3, 22, 109),
    ('2023-08-30 09:30:00', '2023-09-06 10:00:00', 4, 92, 31),
    ('2023-08-31 16:00:00', '2023-09-07 13:30:00', 2, 29, 62),
    ('2023-09-01 11:30:00', '2023-09-08 14:00:00', 1, 54, 103),
    ('2023-09-02 14:00:00', '2023-09-09 16:30:00', 3, 88, 104),
    ('2023-09-03 10:30:00', '2023-09-10 09:00:00', 2, 41, 75),
    ('2023-09-04 13:00:00', '2023-09-11 12:30:00', 4, 75, 186),
    ('2023-09-05 09:30:00', '2023-09-12 15:00:00', 3, 19, 107),
    ('2023-09-06 16:30:00', '2023-09-13 10:30:00', 1, 68, 122),
    ('2023-09-07 12:30:00', '2023-09-14 13:00:00', 2, 28, 13),
    ('2023-09-08 15:00:00', '2023-09-15 16:30:00', 3, 52, 11),
    ('2023-09-09 11:00:00', '2023-09-16 09:30:00', 1, 89, 2),
    ('2023-09-10 13:30:00', '2023-09-17 12:00:00', 4, 33, 3),
    ('2023-09-11 10:00:00', '2023-09-18 14:30:00', 2, 71, 4),
    ('2023-09-12 15:30:00', '2023-09-19 17:00:00', 1, 15, 15),
    ('2023-09-13 12:00:00', '2023-09-20 09:30:00', 3, 64, 6),
    ('2023-09-14 09:30:00', '2023-09-21 12:00:00', 2, 81, 107),
    ('2023-09-15 16:00:00', '2023-09-22 14:30:00', 4, 23, 118),
    ('2023-09-16 11:30:00', '2023-09-23 16:00:00', 3, 59, 110),
    ('2023-09-17 14:30:00', '2023-09-24 11:30:00', 1, 94, 120),
    ('2023-10-08 15:00:00', '2023-10-15 10:30:00', 3, 43, 140),
    ('2023-10-09 11:00:00', '2023-10-16 13:00:00', 2, 84, 105),
    ('2023-10-23 13:30:00', '2023-10-30 17:00:00', 4, 16, 121),
    ('2023-10-24 15:30:00', '2023-10-31 10:30:00', 1, 61, 22),
    ('2023-11-09 13:30:00', '2023-11-16 16:30:00', 1, 31, 29),
    ('2023-11-10 10:00:00', '2023-11-17 09:30:00', 2, 74, 81),
    ('2023-11-11 12:30:00', '2023-11-18 13:00:00', 4, 19, 72),
    ('2023-11-12 09:00:00', '2023-11-19 15:30:00', 3, 56, 73),
    ('2023-11-13 16:00:00', '2023-11-20 11:00:00', 1, 88, 64);





---------------------------------------------------
-- Create table "service"
CREATE TABLE "service"(
    id SERIAL PRIMARY KEY,
    service_name VARCHAR(200) NOT NULL,
    description VARCHAR(200),
    price FLOAT NOT NULL,
    reduction FLOAT
);
ALTER SEQUENCE service_id_seq RESTART WITH 1;
ALTER TABLE service ALTER COLUMN id SET DEFAULT nextval('service_id_seq');

---------------------------------------------------
-- 3 service:
INSERT INTO "service" (service_name, description, price, reduction)
VALUES
    ('Piscine Prive', 'Description 1', 200000000.0, 0.1),
    ('Grande Salle', 'Description 2', 1000000000.0, 0.2),
    ('Location de voiture', 'Description 3', 500000000.0, NULL);




---------------------------------------------------
-- Relation Buy service :
CREATE TABLE "buy"(
    id SERIAL PRIMARY KEY,
    id_customer INT REFERENCES customer(id),
    id_service INT REFERENCES service(id)
);
ALTER SEQUENCE buy_id_seq RESTART WITH 1;
ALTER TABLE buy ALTER COLUMN id SET DEFAULT nextval('buy_id_seq');

----------------------
-- 50 buy:
INSERT INTO "buy" (id_customer, id_service)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (10, 1),
    (15, 2),
    (4, 2),
    (5, 1),
    (6, 2),
    (25, 1),
    (62, 2),
    (90, 2),
    (23, 3),
    (14, 1),
    (12, 2),
    (86, 2),
    (77, 3),
    (81, 3),
    (49, 1),
    (20, 2);

---------------------------------------------------
-- Create table "customer_status"
CREATE TABLE "customer_status"(
    id SERIAL PRIMARY KEY,
    status_arrived BOOLEAN DEFAULT false,
    status_missing BOOLEAN DEFAULT false,
    is_fidelity BOOLEAN DEFAULT false,
    is_blacklist BOOLEAN DEFAULT false,
    id_customer INT REFERENCES customer(id)
);
ALTER SEQUENCE customer_status_id_seq RESTART WITH 1;
ALTER TABLE customer_status ALTER COLUMN id SET DEFAULT nextval('customer_status_id_seq');

-----------------------
-- 100 customer_status
INSERT INTO "customer_status" (status_arrived, status_missing, is_fidelity, is_blacklist, id_customer)
VALUES
    (true, false, true, false, 1),
    (true, false, false, true, 2),
    (true, false, true, false, 3),
    (false, true, false, false, 4),
    (true, false, false, false, 5),
    (true, false, true, false, 6),
    (true, false, false, false, 7),
    (true, false, true, false, 8),
    (true, false, false, false, 9),
    (true, false, true, false, 10),
    (true, false, false, false, 11),
    (true, false, true, false, 12),
    (false, true, false, false, 13),
    (true, false, true, false, 14),
    (true, false, false, false, 15),
    (true, false, true, false, 16),
    (true, false, false, false, 17),
    (true, false, true, false, 18),
    (true, false, false, false, 19),
    (true, false, true, false, 20),
    (true, false, false, false, 21),
    (true, false, true, false, 22),
    (true, false, false, false, 23),
    (false, true, true, false, 24),
    (true, false, false, false, 25),
    (true, false, true, false, 26),
    (true, false, false, false, 27),
    (true, false, true, false, 28),
    (false, true, false, false, 29),
    (true, false, true, false, 30),
    (true, false, false, false, 31),
    (true, false, true, false, 32),
    (true, false, false, false, 33),
    (true, false, true, false, 34),
    (true, false, false, false, 35),
    (true, false, true, false, 36),
    (true, false, false, false, 37),
    (true, false, true, false, 38),
    (true, false, false, false, 39),
    (true, false, true, false, 40),
    (true, false, false, false, 41),
    (true, false, true, false, 42),
    (true, false, false, false, 43),
    (false, true, true, false, 44),
    (true, false, false, false, 45),
    (true, false, true, false, 46),
    (true, false, false, false, 47),
    (true, false, true, false, 48),
    (true, false, false, false, 49),
    (true, false, true, false, 50),
    (true, false, true, false, 51),
    (true, false, false, true, 52),
    (true, false, true, false, 53),
    (true, false, false, false, 54),
    (true, false, false, false, 55),
    (true, false, true, false, 56),
    (true, false, false, false, 57),
    (true, false, true, false, 58),
    (true, false, false, false, 59),
    (true, false, true, false, 60),
    (false, true, false, false, 61),
    (true, false, true, false, 62),
    (true, false, false, false, 63),
    (true, false, true, false, 64),
    (false, true, false, false, 65),
    (true, false, true, false, 66),
    (true, false, false, false, 67),
    (true, false, true, false, 68),
    (true, false, false, false, 69),
    (true, false, true, false, 70),
    (true, false, false, false, 71),
    (true, false, true, false, 72),
    (true, false, false, false, 73),
    (true, false, true, false, 74),
    (true, false, false, false, 75),
    (true, false, true, false, 76),
    (false, true, false, false, 77),
    (true, false, true, false, 78),
    (true, false, false, false, 79),
    (true, false, true, false, 80),
    (true, false, false, false, 81),
    (true, false, true, false, 82),
    (true, false, false, false, 83),
    (true, false, true, false, 84),
    (true, false, false, false, 85),
    (true, false, true, false, 86),
    (true, false, false, false, 87),
    (true, false, true, false, 88),
    (true, false, false, false, 89),
    (true, false, true, false, 90),
    (true, false, false, false, 91),
    (false, true, true, false, 92),
    (true, false, false, false, 93),
    (true, false, true, false, 94),
    (true, false, false, false, 95),
    (true, false, true, false, 96),
    (true, false, false, false, 97),
    (true, false, true, false, 98),
    (true, false, false, false, 99);




---------------------------------------------------
-- Create table "payment_method"
CREATE TABLE "payment_method"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);
ALTER SEQUENCE payment_method_id_seq RESTART WITH 1;
ALTER TABLE payment_method ALTER COLUMN id SET DEFAULT nextval('payment_method_id_seq');

---------------------------------------------------
--  payment_method
INSERT INTO "payment_method" (id, name)
VALUES
    (1, 'mobile_money'),
    (2, 'credit_card'),
    (3, 'cash');



---------------------------------------------------
-- Create table "payment"
CREATE TABLE "payment"(
    id SERIAL PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount_paid FLOAT NOT NULL,
    number_night INT,
    room_occuped INT,
    deadline_payment TIMESTAMP,
    lending_status BOOLEAN,
    total_amount_status BOOLEAN,
    id_customer INT REFERENCES customer(id),
    id_payment_method INT REFERENCES payment_method(id),
    id_receptionist INT REFERENCES receptionist(id)
);
ALTER SEQUENCE payment_method_id_seq RESTART WITH 1;
ALTER TABLE payment ALTER COLUMN id SET DEFAULT nextval('payment_id_seq');

-----------------------------------------------------
-- 101 payement:
INSERT INTO "payment" (payment_date, amount_paid, number_night, room_occuped, deadline_payment, lending_status, total_amount_status, id_customer, id_payment_method, id_receptionist)
VALUES
    ('2023-01-01', 500000.0, 2, 101, '2023-01-05 12:00:00', false, true, 1, 1, 1),
    ('2023-02-02', 750000.0, 3, 102, '2023-02-06 12:00:00', false, true, 2, 2, 2),
    ('2023-03-03', 1000000.0, 4, 103, '2023-03-07 12:00:00', false, true, 3, 3, 3),
    ('2023-04-04', 1250000.0, 5, 104, '2023-04-08 12:00:00', false, true, 4, 1, 4),
    ('2023-05-05', 1500000.0, 6, 105, '2023-05-09 12:00:00', false, true, 5, 1, 5),
    ('2023-06-06', 1750000.0, 7, 106, '2023-06-10 12:00:00', false, true, 6, 1, 6),
    ('2023-07-07', 2000000.0, 8, 107, '2023-07-11 12:00:00', false, true, 7, 1, 7),
    ('2023-08-08', 2250000.0, 9, 108, '2023-08-12 12:00:00', false, true, 8, 1, 8),
    ('2023-09-09', 2500000.0, 10, 109, '2023-09-13 12:00:00', false, true, 9, 1, 9),
    ('2023-10-10', 2750000.0, 11, 110, '2023-10-14 12:00:00', false, true, 10, 3, 10),
    ('2023-11-11', 3000000.0, 12, 111, '2023-11-15 12:00:00', false, true, 11, 3, 11),
    ('2023-12-12', 3250000.0, 13, 112, '2023-12-16 12:00:00', false, true, 12, 3, 12),
    ('2024-01-01', 3500000.0, 14, 113, '2024-01-17 12:00:00', false, true, 13, 3, 13),
    ('2024-02-02', 3750000.0, 15, 114, '2024-02-18 12:00:00', false, true, 14, 3, 14),
    ('2024-03-03', 4000000.0, 16, 115, '2024-03-19 12:00:00', false, true, 15, 3, 15),
    ('2024-04-04', 4250000.0, 17, 116, '2024-04-20 12:00:00', false, true, 16, 3, 16),
    ('2024-05-05', 4500000.0, 18, 117, '2024-05-21 12:00:00', false, true, 17, 3, 17),
    ('2024-06-06', 475000.0, 19, 118, '2024-06-22 12:00:00', false, true, 18, 3, 18),
    ('2024-07-07', 5000000.0, 20, 119, '2024-07-23 12:00:00', false, true, 19, 3, 19),
    ('2024-08-08', 525000.0, 21, 120, '2024-08-24 12:00:00', false, true, 20, 2, 20),
    ('2024-09-09', 5500000.0, 22, 121, '2024-09-25 12:00:00', false, true, 21, 2, 21),
    ('2024-10-10', 5750000.0, 23, 122, '2024-10-26 12:00:00', false, true, 22, 2, 22),
    ('2024-11-11', 6000000.0, 24, 123, '2024-11-27 12:00:00', false, true, 23, 2, 23),
    ('2024-12-12', 6250000.0, 25, 124, '2024-12-28 12:00:00', false, true, 24, 2, 24),
    ('2025-01-01', 650000.0, 26, 125, '2025-01-29 12:00:00', false, true, 25, 2, 15),
    ('2025-02-02', 6750000.0, 27, 126, '2025-02-01 12:00:00', false, true, 26, 2, 16),
    ('2025-03-03', 7000000.0, 28, 127, '2025-03-02 12:00:00', false, true, 27, 2, 17),
    ('2025-04-04', 7250000.0, 29, 128, '2025-04-03 12:00:00', false, true, 28, 2, 18),
    ('2025-05-05', 750000.0, 30, 129, '2025-05-04 12:00:00', false, true, 29, 2, 19),
    ('2025-06-06', 7750000.0, 31, 130, '2025-06-05 12:00:00', false, true, 30, 3, 10),
    ('2025-07-07', 80000.0, 32, 131, '2025-07-06 12:00:00', false, true, 31, 3, 11),
    ('2025-08-08', 8250000.0, 33, 132, '2025-08-07 12:00:00', false, true, 32, 3, 12),
    ('2025-09-09', 850000.0, 34, 133, '2025-09-08 12:00:00', false, true, 33, 3, 13),
    ('2025-10-10', 8750000.0, 35, 134, '2025-10-09 12:00:00', false, true, 34, 3, 14),
    ('2025-11-11', 9000000.0, 36, 135, '2025-11-10 12:00:00', false, true, 35, 3, 15),
    ('2025-12-12', 9250000.0, 37, 136, '2025-12-11 12:00:00', false, true, 36, 3, 16),
    ('2026-01-01', 950000.0, 38, 137, '2026-01-12 12:00:00', false, true, 37, 3, 17),
    ('2026-02-02', 9750000.0, 39, 138, '2026-02-13 12:00:00', false, true, 38, 3, 18),
    ('2026-03-03', 100000.0, 40, 139, '2026-03-14 12:00:00', false, true, 39, 3, 19),
    ('2026-04-04', 1025000.0, 41, 140, '2026-04-15 12:00:00', false, true, 40, 1, 10),
    ('2026-05-05', 10500000.0, 42, 141, '2026-05-16 12:00:00', false, true, 41, 1, 11),
    ('2026-06-06', 10750000.0, 43, 142, '2026-06-17 12:00:00', false, true, 42, 1, 12),
    ('2026-07-07', 1100000.0, 44, 143, '2026-07-18 12:00:00', false, true, 43, 1, 13),
    ('2026-08-08', 10250000.0, 45, 144, '2026-08-19 12:00:00', false, true, 44, 1, 14),
    ('2026-09-09', 11500000.0, 46, 145, '2026-09-20 12:00:00', false, true, 45, 1, 15),
    ('2026-10-10', 1175000.0, 47, 146, '2026-10-21 12:00:00', false, true, 46, 1, 16),
    ('2026-11-11', 1200000.0, 48, 147, '2026-11-22 12:00:00', false, true, 47, 1, 17),
    ('2026-12-12', 12250000.0, 49, 148, '2026-12-23 12:00:00', false, true, 48, 1, 18),
    ('2027-01-01', 1250000.0, 50, 149, '2027-01-24 12:00:00', false, true, 49, 1, 19),
    ('2027-02-02', 1275000.0, 51, 150, '2027-02-25 12:00:00', false, true, 50, 2, 10),
    ('2027-03-03', 1300000.0, 52, 151, '2027-03-26 12:00:00', false, true, 51, 2, 11),
    ('2027-04-04', 13250000.0, 53, 152, '2027-04-27 12:00:00', false, true, 52, 2, 12),
    ('2027-05-05', 1350000.0, 54, 153, '2027-05-28 12:00:00', false, true, 53, 2, 13),
    ('2027-06-06', 1375000.0, 55, 154, '2027-06-29 12:00:00', false, true, 54, 2, 14),
    ('2027-07-07', 1400000.0, 56, 155, '2027-07-30 12:00:00', false, true, 55, 2, 15),
    ('2027-08-08', 1425000.0, 57, 156, '2027-08-31 12:00:00', false, true, 56, 2, 16),
    ('2027-09-09', 1450000.0, 58, 157, '2027-09-01 12:00:00', false, true, 57, 2, 17),
    ('2027-10-10', 14750000.0, 59, 158, '2027-10-02 12:00:00', false, true, 58, 2, 18),
    ('2027-11-11', 1500000.0, 60, 159, '2027-11-03 12:00:00', false, true, 59, 2, 19),
    ('2031-05-05', 25500000.0, 102, 201, '2031-05-16 12:00:00', false, true, 1, 1, 1),
    ('2031-06-06', 2575000.0, 103, 202, '2031-06-17 12:00:00', false, true, 2, 2, 2),
    ('2031-07-07', 2600000.0, 104, 203, '2031-07-18 12:00:00', false, true, 3, 3, 3),
    ('2031-08-08', 26250000.0, 105, 204, '2031-08-19 12:00:00', false, true, 4, 2, 4),
    ('2031-09-09', 26500000.0, 106, 205, '2031-09-20 12:00:00', false, true, 5, 2, 5),
    ('2031-10-10', 26750000.0, 107, 206, '2031-10-21 12:00:00', false, true, 6, 2, 6),
    ('2031-11-11', 270000.0, 108, 207, '2031-11-22 12:00:00', false, true, 7, 2, 7),
    ('2031-12-12', 27250000.0, 109, 208, '2031-12-23 12:00:00', false, true, 8, 2, 8),
    ('2032-01-01', 27500000.0, 110, 209, '2032-01-24 12:00:00', false, true, 9, 2, 9),
    ('2032-02-02', 27750000.0, 111, 210, '2032-02-25 12:00:00', false, true, 10, 2, 10),
    ('2032-03-03', 280000.0, 112, 211, '2032-03-26 12:00:00', false, true, 11, 3, 11),
    ('2032-04-04', 28250000.0, 113, 212, '2032-04-27 12:00:00', false, true, 12, 3, 12),
    ('2032-05-05', 28500000.0, 114, 213, '2032-05-28 12:00:00', false, true, 13, 3, 13),
    ('2032-06-06', 28750000.0, 115, 214, '2032-06-29 12:00:00', false, true, 14, 3, 14),
    ('2032-07-07', 290000.0, 116, 215, '2032-07-30 12:00:00', false, true, 15, 3, 15),
    ('2032-08-08', 2925000.0, 117, 216, '2032-08-31 12:00:00', false, true, 16, 3, 16),
    ('2032-09-09', 2950000.0, 118, 217, '2032-09-01 12:00:00', false, true, 17, 3, 17),
    ('2032-10-10', 297500.0, 119, 218, '2032-10-02 12:00:00', false, true, 18, 3, 18),
    ('2032-11-11', 300000.0, 120, 219, '2032-11-03 12:00:00', false, true, 19, 3, 19),
    ('2032-12-12', 3025000.0, 121, 220, '2032-12-04 12:00:00', false, true, 20, 2, 20),
    ('2033-01-01', 3050000.0, 122, 221, '2033-01-05 12:00:00', false, true, 21, 2, 21),
    ('2033-02-02', 3075000.0, 123, 222, '2033-02-06 12:00:00', false, true, 22, 2, 22),
    ('2033-03-03', 31000000.0, 124, 223, '2033-03-07 12:00:00', false, true, 23, 2, 23),
    ('2033-04-04', 31250000.0, 125, 224, '2033-04-08 12:00:00', false, true, 24, 2, 24),
    ('2033-05-05', 31500000.0, 126, 225, '2033-05-09 12:00:00', false, true, 25, 2, 15),
    ('2033-06-06', 31750000.0, 127, 226, '2033-06-10 12:00:00', false, true, 26, 2, 16),
    ('2033-07-07', 32000000.0, 128, 227, '2033-07-11 12:00:00', false, true, 27, 2, 17),
    ('2033-08-08', 325000.0, 129, 228, '2033-08-12 12:00:00', false, true, 28, 2, 18),
    ('2033-09-09', 3250000.0, 130, 229, '2033-09-13 12:00:00', false, true, 29, 2, 19),
    ('2033-10-10', 3275000.0, 131, 230, '2033-10-14 12:00:00', false, true, 30, 3, 10),
    ('2033-11-11', 3300000.0, 132, 231, '2033-11-15 12:00:00', false, true, 31, 3, 11),
    ('2033-12-12', 335000.0, 133, 232, '2033-12-16 12:00:00', false, true, 32, 3, 12),
    ('2034-01-01', 335000.0, 134, 233, '2034-01-17 12:00:00', false, true, 33, 3, 13),
    ('2034-02-02', 37500.0, 135, 234, '2034-02-18 12:00:00', false, true, 34, 3, 14),
    ('2034-03-03', 34000000.0, 136, 235, '2034-03-19 12:00:00', false, true, 35, 3, 15),
    ('2034-04-04', 35000.0, 137, 236, '2034-04-20 12:00:00', false, true, 36, 3, 16),
    ('2034-05-05', 345000.0, 138, 237, '2034-05-21 12:00:00', false, true, 37, 3, 17),
    ('2034-06-06', 350000.0, 139, 238, '2034-06-22 12:00:00', false, true, 38, 3, 18),
    ('2034-07-07', 35000000.0, 140, 239, '2034-07-23 12:00:00', false, true, 39, 3, 19),
    ('2034-08-08', 350000.0, 141, 240, '2034-08-24 12:00:00', false, true, 40, 1, 20),
    ('2034-09-09', 3500000.0, 142, 241, '2034-09-25 12:00:00', false, true, 41, 1, 1),
    ('2034-10-10', 350000.0, 143, 242, '2034-10-26 12:00:00', false, true, 42, 1, 2);





-----------------------------------------------
-- Create "feed_back"
CREATE TABLE "feed_back"(
    id SERIAL PRIMARY KEY,
    comment TEXT,
    rating INT,
    id_customer INT REFERENCES customer(id),
    id_hotel INT REFERENCES hotel(id)
);
ALTER SEQUENCE feed_back_id_seq RESTART WITH 1;  
ALTER TABLE feed_back ALTER COLUMN id SET DEFAULT nextval('feed_back_id_seq');

-------------------------------------------------
-- 49 feed_back
INSERT INTO feed_back (comment, rating, id_customer)
VALUES 
    ('Un excellent service !', 9, 25),
    ('Très satisfait de mon achat.', 8, 50),
    ('Le personnel était très aimable.', 7, 73),
    ('Produit de qualité supérieure.', 6, 42),
    ('Livraison rapide et efficace.', 9, 19),
    ('Très déçu par le produit.', 2, 88),
    ('Mauvaise expérience client.', 3, 12),
    ('Service client incompétent.', 2, 37),
    ('Produit endommagé à la livraison.', 4, 65),
    ('Commande incorrecte.', 3, 91),
    ('Très satisfait du service après-vente.', 7, 5),
    ('Expérience d''achat exceptionnelle !', 10, 78),
    ('Commande livrée avant la date prévue.', 9, 33),
    ('Produit de mauvaise qualité.', 2, 67),
    ('Service client peu réactif.', 3, 95),
    ('Livraison très lente.', 2, 23),
    ('Excellent rapport qualité-prix.', 8, 14),
    ('Commande incomplète.', 4, 62),
    ('Satisfait du produit mais délai de livraison long.', 6, 48),
    ('Service client attentionné.', 7, 81),
    ('Produit défectueux à la livraison.', 3, 21),
    ('Livraison rapide et sans problème.', 9, 54),
    ('Expérience d''achat décevante.', 2, 36),
    ('Service client aimable et efficace.', 8, 77),
    ('Produit conforme à mes attentes.', 6, 45),
    ('Commande incorrecte, mauvaise gestion des stocks.', 3, 31),
    ('Livraison retardée sans préavis.', 2, 85),
    ('Service client peu disponible.', 3, 72),
    ('Excellent produit, je recommande vivement !', 10, 10),
    ('Mauvaise qualité, ne vaut pas le prix.', 2, 68),
    ('Livraison manquée, aucune communication.', 1, 90),
    ('Service client inutile.', 2, 28),
    ('Produit endommagé pendant le transport.', 4, 59),
    ('Très satisfait de mon achat, bon rapport qualité-prix.', 8, 16),
    ('Commande perdue, aucun remboursement.', 1, 43),
    ('Service client réactif et professionnel.', 9, 74),
    ('Produit non conforme à la description.', 3, 39),
    ('Livraison rapide mais emballage abîmé.', 5, 97),
    ('Service client décevant, manque de suivi.', 2, 66),
    ('Bonne expérience globale, produit satisfaisant.', 7, 29),
    ('Commande annulée sans préavis.', 1, 82),
    ('Service client aimable mais peu efficace.', 5, 17),
    ('Produit de qualité moyenne.', 5, 61),
    ('Livraison ponctuelle et bien emballée.', 8, 32),
    ('Expérience d''achat médiocre.', 4, 93),
    ('Service client indisponible aux heures de bureau.', 3, 52),
    ('Très mauvaise qualité, produit cassé à l''arrivée.', 1, 89),
    ('Livraison incorrecte, colis mélangés.', 4, 24),
    ('Service client réactif mais pas de solution apportée.', 4, 71);