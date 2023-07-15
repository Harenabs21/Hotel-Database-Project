-- Réinitialiser les séquences à 1 pour chaque table
ALTER SEQUENCE province_available_id_seq RESTART WITH 1;
ALTER SEQUENCE hotel_id_seq RESTART WITH 1;
ALTER SEQUENCE season_id_seq RESTART WITH 1;
ALTER SEQUENCE promotion_id_seq RESTART WITH 1;
ALTER SEQUENCE price_id_seq RESTART WITH 1;
ALTER SEQUENCE room_features_id_seq RESTART WITH 1;
ALTER SEQUENCE room_id_seq RESTART WITH 1;
ALTER SEQUENCE affiliate_id_seq RESTART WITH 1;
ALTER SEQUENCE receptionist_id_seq RESTART WITH 1;
ALTER SEQUENCE customer_id_seq RESTART WITH 1;
ALTER SEQUENCE feed_back_id_seq RESTART WITH 1;
ALTER SEQUENCE reservation_id_seq RESTART WITH 1;
ALTER SEQUENCE service_id_seq RESTART WITH 1;
ALTER SEQUENCE buy_id_seq RESTART WITH 1;
ALTER SEQUENCE customer_status_id_seq RESTART WITH 1;
ALTER SEQUENCE payment_method_id_seq RESTART WITH 1;
ALTER SEQUENCE payment_id_seq RESTART WITH 1;

-- Modifier les colonnes ID existantes pour utiliser les séquences
ALTER TABLE province_available ALTER COLUMN id SET DEFAULT nextval('province_available_id_seq');
ALTER TABLE hotel ALTER COLUMN id SET DEFAULT nextval('hotel_id_seq');
ALTER TABLE season ALTER COLUMN id SET DEFAULT nextval('season_id_seq');
ALTER TABLE promotion ALTER COLUMN id SET DEFAULT nextval('promotion_id_seq');
ALTER TABLE price ALTER COLUMN id SET DEFAULT nextval('price_id_seq');
ALTER TABLE room_features ALTER COLUMN id SET DEFAULT nextval('room_features_id_seq');
ALTER TABLE room ALTER COLUMN id SET DEFAULT nextval('room_id_seq');
ALTER TABLE affiliate ALTER COLUMN id SET DEFAULT nextval('affiliate_id_seq');
ALTER TABLE receptionist ALTER COLUMN id SET DEFAULT nextval('receptionist_id_seq');
ALTER TABLE customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq');
ALTER TABLE feed_back ALTER COLUMN id SET DEFAULT nextval('feed_back_id_seq');
ALTER TABLE reservation ALTER COLUMN id SET DEFAULT nextval('reservation_id_seq');
ALTER TABLE service ALTER COLUMN id SET DEFAULT nextval('service_id_seq');
ALTER TABLE buy ALTER COLUMN id SET DEFAULT nextval('buy_id_seq');
ALTER TABLE customer_status ALTER COLUMN id SET DEFAULT nextval('customer_status_id_seq');
ALTER TABLE payment_method ALTER COLUMN id SET DEFAULT nextval('payment_method_id_seq');
ALTER TABLE payment ALTER COLUMN id SET DEFAULT nextval('payment_id_seq');