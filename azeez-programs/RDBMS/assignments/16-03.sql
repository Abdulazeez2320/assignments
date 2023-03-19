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