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








INSERT INTO enclosure (enclosure_name,capacity,closed_for_maintenance) VALUES ('Big Cat Field',20, FALSE);
INSERT INTO enclosure (enclosure_name,capacity,closed_for_maintenance) VALUES ('Small Cat Field',10, TRUE);
INSERT INTO enclosure (enclosure_name,capacity,closed_for_maintenance) VALUES ('Elephant Field',10, TRUE);







INSERT INTO staff (staff_name,employee_number) VALUES ('Captain Rik',12345);
INSERT INTO staff (staff_name,employee_number) VALUES ('John Smith',67891);
INSERT INTO staff (staff_name,employee_number) VALUES ('Mark Corrigan',54321);







INSERT INTO assignment (employee_id,enclosure_id,day) VALUES (1,1,'Tuesday');
INSERT INTO assignment (employee_id,enclosure_id,day) VALUES (2,2,'Wednesday');
INSERT INTO assignment (employee_id,enclosure_id,day) VALUES (3,3,'Thursday');









INSERT INTO animals (animal_name,animal_type,age,enclosure_id) VALUES ('Tony','Tiger',59,1);
INSERT INTO animals (animal_name,animal_type,age,enclosure_id) VALUES ('Tom','Cat',10,2);
INSERT INTO animals (animal_name,animal_type,age,enclosure_id) VALUES ('Elma','Elephant',100,3);





SELECT animal_name FROM enclosure 
INNER JOIN animals
ON enclosure.id = animals.enclosure_id
WHERE enclosure.id = 2 
;


SELECT staff_name FROM staff
INNER JOIN assignment
ON staff.id = assignment.enclosure_id
WHERE enclosure_id = 3
;
