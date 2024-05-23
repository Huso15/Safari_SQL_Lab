DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;


CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    enclosure_name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    staff_name VARCHAR(255),
    employee_number INT
);

CREATE TABLE assignment(
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES staff(id),
    enclosure_id INTEGER REFERENCES enclosure(id),
    day VARCHAR(255)
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    animal_name VARCHAR(255),
    animal_type VARCHAR(255),
    age INT,
    enclosure_id INTEGER REFERENCES enclosure(id) 
);