CREATE TABLE Person
(
  person_id NUMERIC(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  email VARCHAR(25),
  PRIMARY KEY (person_id)
);

CREATE TABLE Paramedic
(
  license_number NUMERIC(10) NOT NULL,
  seniority NUMERIC(2) NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Blood
(
  sign CHAR(1) NOT NULL,
  type VARCHAR(2) NOT NULL,
  PRIMARY KEY (sign, type)
);

CREATE TABLE Receiver
(
  hospital_id NUMERIC(10) NOT NULL,
  hospital_name VARCHAR(10) NOT NULL,
  city VARCHAR(10) NOT NULL,
  delivery_date DATE NOT NULL,
  hospital_phone NUMERIC(10) NOT NULL,
  PRIMARY KEY (hospital_id)
);

CREATE TABLE Donation_place
(
  place_id NUMERIC(10) NOT NULL,
  place_phone NUMERIC(10) NOT NULL,
  manager VARCHAR(20) NOT NULL,
  address VARCHAR(25) NOT NULL,
  PRIMARY KEY (place_id)
);

CREATE TABLE Person_phone_number
(
  phone_number NUMERIC(10) NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (phone_number, person_id),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Donor
(
  gender CHAR(1) NOT NULL,
  birth_date DATE NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  sign CHAR(1) NOT NULL,
  type VARCHAR(2) NOT NULL,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES Person(person_id),
  FOREIGN KEY (sign, type) REFERENCES Blood(sign, type)
);

CREATE TABLE Donation
(
  donation_id NUMERIC(10) NOT NULL,
  pass_tasts CHAR(1) NOT NULL,
  donation_date DATE NOT NULL,
  valid CHAR(1) NOT NULL,
  person_id_paramedic NUMERIC(10) NOT NULL,
  person_id_donor NUMERIC(10) NOT NULL,
  place_id NUMERIC(10) NOT NULL,
  hospital_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (donation_id),
  FOREIGN KEY (person_id_paramedic) REFERENCES Paramedic(person_id),
  FOREIGN KEY (person_id_donor) REFERENCES Donor(person_id),
  FOREIGN KEY (place_id) REFERENCES Donation_place(place_id),
  FOREIGN KEY (hospital_id) REFERENCES Receiver(hospital_id)
);