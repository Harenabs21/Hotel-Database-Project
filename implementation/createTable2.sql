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
ALTER SEQUENCE province_available_id_seq RESTART WITH 1;
ALTER TABLE province_available ALTER COLUMN id SET DEFAULT nextval('province_available_id_seq');


---------------------------------------------------
-- Create table "hotel"
CREATE TABLE "hotel"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    address VARCHAR(200),
    id_province INT REFERENCES province_available(id)
);


---------------------------------------------------
-- Create tablel "season"
CREATE TABLE "season"(
    id SERIAL PRIMARY KEY,
    items VARCHAR(50),
    start_date DATE DEFAULT CURRENT_DATE,
    end_date DATE
);


---------------------------------------------------
-- Create table "promotion"
CREATE TABLE "promotion"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    begin DATE DEFAULT CURRENT_DATE,
    "end" DATE,
    percent INT NOT NULL
);


---------------------------------------------------
-- Create table "price"

CREATE TABLE price (
    id SERIAL PRIMARY KEY,
    cost_per_night FLOAT NOT NULL,
    id_season INT REFERENCES season(id)
);

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
    id_hotel SERIAL REFERENCES hotel(id),
    id_price INT REFERENCES price(id),
    id_room_features INT REFERENCES room_features(id)
);


-- Change realtion (affiliate) du table
CREATE TABLE "affiliate"(
    id SERIAL PRIMARY KEY,
    id_promotion SERIAL REFERENCES promotion(id),
    id_room SERIAL REFERENCES room(id)
);



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

ALTER SEQUENCE customer_status_id_seq RESTART WITH 1;
ALTER TABLE customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq');

-----------------------------------------------
-- Create "feed_back"
CREATE TABLE "feed_back"(
    id SERIAL PRIMARY KEY,
    comment TEXT,
    rating INT,
    id_customer INT REFERENCES customer(id)
);



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
-- Relation "use" :
CREATE TABLE "buy"(
    id SERIAL PRIMARY KEY,
    id_customer INT REFERENCES customer(id),
    id_service INT REFERENCES service(id)
);
ALTER SEQUENCE buy_id_seq RESTART WITH 1;
ALTER TABLE buy ALTER COLUMN id SET DEFAULT nextval('buy_id_seq');

---------------------------------------------------
-- Create table "customer_status"
CREATE TABLE "customer_status"(
    id SERIAL PRIMARY KEY,
    status_arrived INT NOT NULL,
    status_missing INT NOT NULL,
    is_fidelity BOOLEAN DEFAULT false,
    is_blacklist BOOLEAN DEFAULT false,
    id_customer INT REFERENCES customer(id)
);

ALTER SEQUENCE customer_status_id_seq RESTART WITH 1;
ALTER TABLE customer_status ALTER COLUMN id SET DEFAULT nextval('customer_status_id_seq');
---------------------------------------------------
-- Create table "payment_method"
CREATE TABLE "payment_method"(
    id SERIAL PRIMARY KEY,
    mobile_money BOOLEAN,
    credit_card BOOLEAN,
    cash BOOLEAN
);
ALTER SEQUENCE payment_method_id_seq RESTART WITH 1;
ALTER TABLE payment_method ALTER COLUMN id SET DEFAULT nextval('payment_method_id_seq');



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
-----------------------------------------------