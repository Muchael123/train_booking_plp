# train_booking_plp
# Train Booking Database System

This project is a train booking database system for Kenya's SGR (Standard Gauge Railway). It includes database schemas, sample data, and scripts to implement and populate the database.

## Project Overview

The system models train schedules, stations, journeys, passengers, and bookings. It supports key functionalities like:
- Booking tickets.
- Associating train schedules with carriages and stations.
- Managing passenger and booking information.

## Database Schema

The database schema includes the following tables:
1. **Schedule**: Stores train schedules (e.g., Weekday, Weekend).
2. **Train Station**: Represents stations along the route (e.g., Mombasa, Nairobi Terminus).
3. **Booking Status**: Tracks booking states (e.g., Active, Cancelled, Pending).
4. **Carriage Class**: Represents train classes (e.g., First Class, Economy).
5. **Passenger**: Stores passenger details.
6. **Journey Station**: Tracks stops and times for each train journey.
7. **Train Journey**: Represents individual train trips.
8. **Journey Carriage**: Links journeys to carriages.
9. **Carriage Price**: Defines ticket prices based on schedule and class.
10. **Booking**: Records passenger bookings.

## Features

- Tracks journeys, stations, schedules, and carriages.
- Supports various booking statuses.
- Differentiates ticket classes and prices.
- Manages passenger details and seat assignments.

## Setup Instructions

### Prerequisites
- MySQL or any compatible RDBMS.
- SQL client (e.g., MySQL Workbench, DBeaver).

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Muchael123/train_booking_plp.git
   cd train_booking_plp
