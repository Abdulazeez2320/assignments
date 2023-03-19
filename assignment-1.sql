create table jobs(
  job_id SERIAL,
  job_title VARCHAR(255),
  min_salary INT,
  max_salary INT,
  PRIMARY KEY(Job_id),
  CHECK(min_salary>1000)
);

create table regions(
  region_id SERIAL,
  region_name VARCHAR(255),
  PRIMARY KEY(region_id)
);

create table countries(
  country_id SERIAL,
  country_name VARCHAR(255),
  region_id INT,
  PRIMARY KEY(country_id),
  FOREIGN KEY(region_id) REFERENCES regions(region_id)
);

create table locations(
  location_id SERIAL,
  street_address VARCHAR(255),
  postal_code VARCHAR(10),
  city VARCHAR(255),
  state_province VARCHAR(255),
  country_id INT,
  PRIMARY KEY(location_id),
  FOREIGN KEY(country_id) REFERENCES countries(country_id)
);

create table departments(
  department_id SERIAL,
  department_name VARCHAR(255),
  location_id INT,
  PRIMARY KEY(department_id),
  FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

create table employees(
  employee_id SERIAL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone_number VARCHAR(255),
  hire_date DATE,
  job_id INT,
  salary INT,
  manager_id VARCHAR(255),
  department_id INT,
  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id) REFERENCES jobs(job_id),
  FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

create table dependents(
  dependent_id SERIAL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  relationship VARCHAR(255),
  employee_id INT,
  PRIMARY KEY(dependent_id),
  FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES('Software Engineer',15000,100000);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES('QA engineer',10000,60000);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES('product manager',20000,150000);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES('HR Exicutive',50000,250000);
INSERT INTO jobs(job_title,min_salary,max_salary) 
VALUES('software tester',10000,100000);

INSERT INTO regions (region_name) VALUES ('north');
INSERT INTO regions (region_name) VALUES ('south');
INSERT INTO regions (region_name) VALUES ('east');
 INSERT INTO regions (region_name) VALUES ('west');
INSERT INTO regions (region_name) VALUES ('north East');

INSERT INTO countries (country_name,region_id) VALUES ('India',1);
INSERT INTO countries (country_name,region_id) VALUES ('america',2);
INSERT INTO countries (country_name,region_id) VALUES ('china',3); 
INSERT INTO countries (country_name,region_id) VALUES ('canada',4);
INSERT INTO countries (country_name,region_id) VALUES ('russia',5);

INSERT INTO locations (street_address,postal_code,city,state_province,country_id) VALUES ('12-AB Street','712249','kolkata','WB',2);
INSERT INTO locations (street_address,postal_code,city,state_province,country_id) VALUES ('Fransis Street','866899','paris','FR',3);
INSERT INTO locations (street_address,postal_code,city,state_province,country_id) VALUES ('Tokyo Street','445545','Tokyo','JP',4);
INSERT INTO locations (street_address,postal_code,city,state_province,country_id) VALUES ('Moscow Street','111122','Moscow','RAS',1);
INSERT INTO locations (street_address,postal_code,city,state_province,country_id) VALUES ('Torronto Street','333243','Torronto','CAN',5);

INSERT INTO departments (department_name,location_id) VALUES ('Production',1);
INSERT INTO departments (department_name,location_id) VALUES ('Finance',4);
INSERT INTO departments (department_name,location_id) VALUES ('Marketing',3);
INSERT INTO departments (department_name,location_id) VALUES ('Operational',2);
INSERT INTO departments (department_name,location_id) VALUES ('Logistics',5);


INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('abdul','azeez','syed.abdulazeez@kreeti.com','8331892055','2022-02-01',1,50000,2,1);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('suneel','mallika','mallika suneel@gmail.com','6309718036','2022-02-01',2,55000,3,2);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('karthik','akepati','akepatikarthik@gmail.com','9652979626','2022-02-20',3,45000,5,3);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('sampath','chekuri','sampath@gmail.com','9505902376','2022-02-10',3,35000,4,4);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('vinay','danal','vinay@gmail.com','9999999999','2022-02-15',4,12000,1,5);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('Frankfin','gidla','frankfin.gidla@mail.com','7009373931','2020-12-01',5,70000,3,1);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('Michael','Christian','michael.christian@mail.com','7009373678','2021-05-11',1,85000,4,2);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('chirs','lyn','chris.lyn@mail.com','67903628929','2022-10-21',2,20000,2,3);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES ('steve','jobs','steve.jobs@mail.com','7003067883','2022-08-01',3,50000,4,4);
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES ('alex','Neugen','alex.neugen@mail.com','9123088822','2022-07-01',4,90000,5,5);

ALTER table departments ADD COLUMN manager_name VARCHAR(255);

ALTER table jobs DROP COLUMN max_salary;

ALTER table locations RENAME COLUMN postal_code to pincode;
