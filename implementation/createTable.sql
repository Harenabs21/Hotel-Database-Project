-- \c postgres;

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
-- Alter table "province_available"


---------------------------------------------------
-- Create table "hotel"
CREATE TABLE "hotel"(
    id VARCHAR(200) PRIMARY KEY,
    name VARCHAR(200),
    address VARCHAR(200),
    id_province_available INT REFERENCES province_available(id)  
);
-- Alter table "hotel"
    -- id INT


---------------------------------------------------
-- Create tablel "season"
CREATE TABLE "season"(
    id SERIAL PRIMARY KEY,
    items VARCHAR(50),
    start_date DATE,
    end_date DATE
);


---------------------------------------------------
-- Create table "promotion"
CREATE TABLE "promotion"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    begin DATE DEFAULT CURRENT_DATE,
    "end" DATE,
    prercent INT NOT NULL
);


---------------------------------------------------
-- Create table "price"
CREATE TABLE "price"(
    id SERIAL PRIMARY KEY,
    cost_per_night FLOAT NOT NULL,
    id_season INT REFERENCES season(id)
);
-- Alter table "price"


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


---------------------------------------------------
-- Create table "room"
CREATE TABLE "room"(
    id SERIAL PRIMARY KEY,
    number VARCHAR(100) NOT NULL,
    room_type VARCHAR(200) NOT NULL,
    capacity_room INT NOT NULL,
    id_hotel VARCHAR REFERENCES hotel(id),
    id_price INT REFERENCES price(id),
    id_promotion INT REFERENCES promotion(id),
    id_room_features INT REFERENCES room_features(id)
);
-- Alter table "room"


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
    email VARCHAR(1) NOT NULL,
    password VARCHAR(50) NOT NULL
);
-- Alter table "client"


---------------------------------------------------
-- Create table "reservation"
CREATE TABLE "reservation"(
    id SERIAL PRIMARY KEY,
    date_arrived TIMESTAMP NOT NULL,
    leaving_date TIMESTAMP NOT NULL,
    number_of_person INT NOT NULL,
    id_client INT REFERENCES customer(id),
    id_room INT REFERENCES room(id)
);
-- Alter table "reservation"
    -- reservation_date TIMESTAMP DEFAULT CURRENT_DATE,
    -- add : is_cancel BOOLEAN DEFAULT 'f',
    -- drop table : table cancel


---------------------------------------------------
-- Create table "service"
CREATE TABLE "service"(
    id SERIAL PRIMARY KEY,
    service_name VARCHAR(200) NOT NULL,
    description VARCHAR(200),
    price FLOAT NOT NULL,
    reduction FLOAT
);
-- Alter table "service"


---------------------------------------------------
-- Create table "receptionist"
CREATE TABLE "receptionist"(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    work_contact INT
);
-- Alter table "receptionist"


---------------------------------------------------
-- Relation "use" :
CREATE TABLE "buy"(
    id SERIAL PRIMARY KEY,
    id_customer INT REFERENCES customer(id),
    id_service INT REFERENCES service(id)
);


---------------------------------------------------
-- Create table "status_client"
CREATE TABLE "status_client"(
    id SERIAL PRIMARY KEY,
    status_arrived INT NOT NULL,
    status_missing INT NOT NULL,
    is_fidelity BOOLEAN DEFAULT false,
    is_blacklist BOOLEAN DEFAULT false,
    id_customer INT REFERENCES customer(id)
);
-- Alter table "status_client"


---------------------------------------------------
-- Create table "cancel"
CREATE TABLE "cancel"(
    id SERIAL PRIMARY KEY,
    is_cancel BOOLEAN,
    id_reservation INT REFERENCES reservation(id)
);


---------------------------------------------------
-- Create table "payment_method"
CREATE TABLE "payment_method"(
    id SERIAL PRIMARY KEY,
    mobile_money BOOLEAN,
    credit_card BOOLEAN,
    cash BOOLEAN
);
-- Alter table "payment_method"
    -- remove : all column (-id)
    -- add : name VARCHAR


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
-- Alter table "payement"
    -- payement_date TIMESTAMP
