
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
