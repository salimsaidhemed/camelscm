/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  salim
 * Created: Feb 17, 2018
 */
CREATE TABLE IF NOT EXISTS customers
(
    ID INTEGER IDENTITY PRIMARY KEY,
    customer_name VARCHAR(55) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,
    customer_email VARCHAR(255) NOT NULL
    
);
CREATE TABLE IF NOT EXISTS users(
    ID INTEGER IDENTITY PRIMARY KEY,
    username VARCHAR(55) NOT NULL UNIQUE,
    password VARCHAR(55) NOT NULL,
);
CREATE TABLE IF NOT EXISTS products(
    ID INTEGER IDENTITY PRIMARY KEY,
    product_name VARCHAR(55) NOT NULL,
    weight FLOAT NOT NULL,
    cost DOUBLE NOT NULL,
    amount_in_stock INTEGER NOT NULL
    
);
CREATE TABLE IF NOT EXISTS orders(
    ID INTEGER IDENTITY PRIMARY KEY,
    order_number VARCHAR(15) NOT NULL UNIQUE,
    customer INTEGER NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT fk_customer_order FOREIGN KEY(customer) REFERENCES customers(ID)
);
CREATE TABLE IF NOT EXISTS order_items(
    ID INTEGER IDENTITY PRIMARY KEY,
    product DOUBLE NOT NULL,
    quantity INTEGER NOT NULL,
    CONSTRAINT fk_product_order FOREIGN KEY(product) REFERENCES products(ID)
);

CREATE TABLE IF NOT EXISTS bags(
    ID INTEGER IDENTITY PRIMARY KEY,
    product INTEGER NOT NULL,
    amount_in_stock INTEGER DEFAULT 0 NOT NULL,
    CONSTRAINT fk_bags_product FOREIGN KEY(product) REFERENCES products(ID)
    
);
CREATE TABLE IF NOT EXISTS bags_damaged(
    ID INTEGER IDENTITY PRIMARY KEY,
    date_damaged DATE NOT NULL,
    amount INTEGER NOT NULL,
    bags INTEGER NOT NULL,
    CONSTRAINT fk_bags_damaged FOREIGN KEY(bags) REFERENCES bags(ID)

);
CREATE TABLE IF NOT EXISTS bags_received(
    ID INTEGER IDENTITY PRIMARY KEY,
    date_received DATE NOT NULL,
    amount INTEGER NOT NULL,
    bags INTEGER NOT NULL,
    CONSTRAINT fk_bags_received FOREIGN KEY(bags) REFERENCES bags(ID)
    
);
CREATE TABLE IF NOT EXISTS bags_consumed(
    ID INTEGER IDENTITY PRIMARY KEY,
    date_damaged DATE NOT NULL,
    amount INTEGER NOT NULL,
    bags INTEGER NOT NULL,
    CONSTRAINT fk_bags_consumed FOREIGN KEY(bags) REFERENCES bags(ID)
);
CREATE TABLE IF NOT EXISTS vehicles(
    ID INTEGER IDENTITY PRIMARY KEY,
    plate_number VARCHAR(15) NOT NULL UNIQUE,
    vehicle_type VARCHAR(15) NOT NULL, --SEMI TRAILER TRAILER CANTER
    vahicle_model VARCHAR(10) NOT NULL, --HOW TATA

);
CREATE TABLE IF NOT EXISTS drivers(
     ID INTEGER IDENTITY PRIMARY KEY,
     driver_name VARCHAR(255) NOT NULL,
     license_number VARCHAR(32) NOT NULL,


);
CREATE TABLE IF NOT EXISTS raw_materials(
    ID INTEGER IDENTITY PRIMARY KEY,
    raw_material_name VARCHAR(55) NOT NULL,
    
);
CREATE TABLE IF NOT EXISTS raw_materials_stock(
     ID INTEGER IDENTITY PRIMARY KEY,
     raw_materials INTEGER NOT NULL,
     amount FLOAT NOT NULL,
     CONSTRAINT fk_raw_materials_stock FOREIGN KEY(raw_materials) REFERENCES raw_materials(ID)

);
CREATE TABLE IF NOT EXISTS production(
        ID INTEGER IDENTITY PRIMARY KEY,
        production_date DATE NOT NULL,
        product INTEGER NOT NULL,
        quantity FLOAT NOT NULL,
        CONSTRAINT fk_product_production FOREIGN KEY(product) REFERENCES products(ID)

);
CREATE TABLE IF NOT EXISTS service_records(
    ID INTEGER IDENTITY PRIMARY KEY,
    vehicle INTEGER NOT NULL,
    driver INTEGER NOT NULL,
    service_date DATE NOT NULL,
    description VARCHAR(255) NOT NULL,
    equipment_used VARCHAR(255) NOT NULL,
    mileage_reading_before FLOAT NOT NULL,
    mileage_reading_next FLOAT NOT NULL,
    oil_usage FLOAT NOT NULL,
    CONSTRAINT fk_vehicle_service FOREIGN KEY(vehicle) REFERENCES vehicles(ID),
    CONSTRAINT fk_drivers_service FOREIGN KEY(drivers) REFERENCES drivers(ID)
    
);
CREATE TABLE IF NOT EXISTS fuel_vouchers(
    ID INTEGER IDENTITY PRIMARY KEY,
    voucher_date DATE NOT NULL,
    fuel_type VARCHAR(15) NOT NULL --DIESEL PETROL,
    amount FLOAT NOT NULL,
    service_station VARCHAR(55) NOT NULL,
    vehicle INTEGER NOT NULL,
    driver INTEGER NOT NULL,
    remarks VARCHAR(255) NOT NULL,
    CONSTRAINT fk_vehicle_fuel FOREIGN KEY(vehicle) REFERENCES vehicles(ID),
    CONSTRAINT fk_driver_fuel FOREIGN KEY(driver) REFERENCES drivers(ID)
);
CREATE TABLE IF NOT EXISTS product_dispatch(
        ID INTEGER IDENTITY PRIMARY KEY,
        dispatch_date DATE NOT NULL,
        amount INTEGER NOT NULL,
        product INTEGER NOT NULL,
        production INTEGER NOT NULL,
        vehicle INTEGER NOT NULL,
        driver INTEGER NOT NULL,
        fuel_voucher INTEGER NOT NULL,
        order_detail INTEGER NOT NULL,
        destination VARCHAR(55) NOT NULL,
        delivery_note_number VARCHAR(55) NOT NULL UNIQUE,
        CONSTRAINT fk_product_dispatch FOREIGN KEY(product) REFERENCES products(ID),
        CONSTRAINT fk_production_dispatch FOREIGN KEY(production) REFERENCES production(ID),
        CONSTRAINT fk_vehicle_dispatch FOREIGN KEY(vehicle) REFERENCES vehicles(ID),
        CONSTRAINT fk_driver_dispatch FOREIGN KEY(driver) REFERENCES drivers(ID),
        CONSTRAINT fk_fuel_dispatch FOREIGN KEY(fuel_voucher) REFERENCES fuel_vouchers(ID),
        CONSTRAINT fk_order_details FOREIGN KEY(order_detail) REFERENCES order_details(ID)
); 


