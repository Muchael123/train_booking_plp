
DROP TABLE IF EXISTS Schedule;
CREATE TABLE Schedule (
    id INT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS train_station;
CREATE TABLE train_station (
 id INT PRIMARY KEY, 
 station_name VARCHAR(100) NOT NULL
 );

DROP TABLE IF EXISTS booking_status;
CREATE TABLE booking_status(
id INT primary key NOT NULL,
name VARCHAR(50)
);

DROP TABLE IF EXISTS carriage_class;
CREATE TABLE carriage_class (
   ClassID INT PRIMARY KEY, 
    class_name VARCHAR(100) NOT NULL,
    seating_capacity INT NOT NULL
);

DROP TABLE IF EXISTS passenger;
CREATE TABLE passenger (
  id int NOT NULL PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  email_address varchar(100) NOT NULL UNIQUE,
  password varchar(100) NOT NULL
);

DROP TABLE IF EXISTS journey_station;
CREATE TABLE journey_station (
    journey_id INT PRIMARY KEY,
    station_id INT,
    stop_order INT,
    departure_time DATETIME,
    FOREIGN KEY (station_id) REFERENCES train_station(id) 
);

DROP TABLE IF EXISTS train_journey;
CREATE TABLE train_journey (
    id INT PRIMARY KEY,
    schedule_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (schedule_id) REFERENCES Schedule(id)
);

DROP TABLE IF EXISTS journey_carriage;
CREATE TABLE Journey_Carriage (
    journey_id INT, 
    carriage_class_id INT, 
    position INT NOT NULL,
    PRIMARY KEY (journey_id, carriage_class_id),
    FOREIGN KEY (journey_id) REFERENCES Train_Journey(id),
    FOREIGN KEY (carriage_class_id) REFERENCES Carriage_Class(ClassID)
);

DROP TABLE IF EXISTS carriage_price;
CREATE TABLE carriage_price (
    schedule_id INT,
    carriage_class_id INT PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (schedule_id) REFERENCES Schedule(id)
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
    id INT PRIMARY KEY,
    passenger_id INT,
    status_id INT,
    starting_station_id INT,
    ending_station_id INT,
    train_journey_id INT,
    ticket_class_id INT,
    amount_paid DECIMAL(10, 2),
    ticket_no INT,
    seat_no INT,
    date DATETIME,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(id),
    FOREIGN KEY (status_id) REFERENCES booking_status(id),
    FOREIGN KEY (starting_station_id) REFERENCES train_station(id),
    FOREIGN KEY (ending_station_id) REFERENCES train_station(id),
    FOREIGN KEY (train_journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (ticket_class_id) REFERENCES carriage_class(ClassID)
);



-- Populating Schedule table
INSERT INTO Schedule (id, name)
VALUES 
(1, 'Weekday'),
(2, 'Weekend'),
(3, 'Holiday');

-- Populating train_station table
INSERT INTO train_station (id, station_name)
VALUES 
(1, 'Mombasa'),
(2, 'Mariakani'),
(3, 'Voi'),
(4, 'Mtito Andei'),
(5, 'Kibwezi'),
(6, 'Emali'),
(7, 'Athi River'),
(8, 'Nairobi Terminus');

-- Populating booking_status table
INSERT INTO booking_status (id, name)
VALUES 
(1, 'Active'),
(2, 'Cancelled'),
(3, 'Pending');

-- Populating carriage_class table
INSERT INTO carriage_class (ClassID, class_name, seating_capacity)
VALUES 
(1, 'First Class', 72),
(2, 'Business Class', 100),
(3, 'Economy', 150);

-- Populating passenger table
INSERT INTO passenger (id, first_name, last_name, email_address, password)
VALUES 
(1, 'Mwangi', 'Kamau', 'mwangi.kamau@mail.com', 'password123'),
(2, 'Achieng', 'Odhiambo', 'achieng.odhiambo@mail.com', 'password123'),
(3, 'Ahmed', 'Ali', 'ahmed.ali@mail.com', 'password123'),
(4, 'Wanjiku', 'Njeri', 'wanjiku.njeri@mail.com', 'password123'),
(5, 'Omondi', 'Otieno', 'omondi.otieno@mail.com', 'password123'),
(6, 'Mutua', 'Kilonzo', 'mutua.kilonzo@mail.com', 'password123'),
(7, 'Chebet', 'Koech', 'chebet.koech@mail.com', 'password123'),
(8, 'Kiprotich', 'Biwott', 'kiprotich.biwott@mail.com', 'password123'),
(9, 'Nyang’au', 'Onyancha', 'nyangau.onyancha@mail.com', 'password123'),
(10, 'Mumbi', 'Wairimu', 'mumbi.wairimu@mail.com', 'password123');

-- Populating train_journey table
INSERT INTO train_journey (id, schedule_id, name)
VALUES 
(1, 1, 'Mombasa to Nairobi Express'),
(2, 2, 'Mombasa to Nairobi Weekend'),
(3, 3, 'Holiday Special Nairobi to Mombasa');

-- Populating journey_station table
INSERT INTO journey_station (journey_id, station_id, stop_order, departure_time)
VALUES 
(1, 1, 1, '2025-01-10 06:00:00'),
(1, 3, 2, '2025-01-10 08:30:00'),
(1, 8, 3, '2025-01-10 12:00:00'),
(2, 1, 1, '2025-01-11 06:30:00'),
(2, 4, 2, '2025-01-11 09:00:00'),
(2, 8, 3, '2025-01-11 12:30:00');

-- Populating Journey_Carriage table
INSERT INTO Journey_Carriage (journey_id, carriage_class_id, position)
VALUES 
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 1),
(2, 3, 2);

-- Populating carriage_price table
INSERT INTO carriage_price (schedule_id, carriage_class_id, price)
VALUES 
(1, 1, 3000.00),
(1, 2, 2000.00),
(1, 3, 1000.00),
(2, 1, 3500.00),
(2, 3, 1200.00);

-- Populating booking table
INSERT INTO booking (id, passenger_id, status_id, starting_station_id, ending_station_id, train_journey_id, ticket_class_id, amount_paid, ticket_no, seat_no, date)
VALUES 
(1, 1, 1, 1, 8, 1, 1, 3000.00, 101, 5, '2025-01-10 05:00:00'),
(2, 2, 1, 1, 8, 1, 2, 2000.00, 102, 12, '2025-01-10 05:00:00'),
(3, 3, 2, 1, 8, 1, 3, 1000.00, 103, 23, '2025-01-10 05:00:00'),
(4, 4, 1, 1, 3, 1, 3, 1000.00, 104, 30, '2025-01-10 05:00:00'),
(5, 5, 1, 3, 8, 1, 2, 2000.00, 105, 6, '2025-01-10 08:00:00'),
(6, 6, 1, 1, 8, 2, 1, 3500.00, 106, 2, '2025-01-11 06:00:00'),
(7, 7, 3, 1, 4, 2, 3, 1200.00, 107, 18, '2025-01-11 07:00:00'),
(8, 8, 1, 4, 8, 2, 1, 3500.00, 108, 1, '2025-01-11 08:00:00'),
(9, 9, 1, 1, 8, 2, 3, 1200.00, 109, 25, '2025-01-11 06:00:00'),
(10, 10, 1, 1, 8, 1, 2, 2000.00, 110, 19, '2025-01-10 06:30:00'),
(11, 1, 1, 3, 8, 2, 1, 3500.00, 111, 8, '2025-01-11 09:00:00'),
(12, 2, 1, 1, 4, 2, 3, 1200.00, 112, 15, '2025-01-11 06:45:00'),
(13, 3, 1, 4, 8, 1, 1, 3000.00, 113, 10, '2025-01-10 07:00:00'),
(14, 4, 2, 1, 3, 1, 3, 1000.00, 114, 21, '2025-01-10 07:15:00'),
(15, 5, 1, 3, 8, 1, 2, 2000.00, 115, 7, '2025-01-10 08:15:00');
