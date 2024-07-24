--1
-- Adding new column paramedic_id to the VOLUNTEERS table
ALTER TABLE VOLUNTEERS
  ADD mentor_id VARCHAR2(9);
 -- Adding foreign key constraint for paramedic_id
ALTER TABLE VOLUNTEERS
  ADD CONSTRAINT fk_paramedic
  FOREIGN KEY (mentor_id)
  REFERENCES PARAMEDIC (paramedic_id);


--2
-- Insert data from volunteers to person
INSERT INTO PERSON (pid, l_name, f_name, email)
SELECT v.volunteer_id, v.last_name, v.first_name, v.email
FROM (SELECT volunteer_id, last_name, first_name, email 
      FROM VOLUNTEERS) v
WHERE NOT EXISTS (SELECT 1 FROM PERSON p WHERE p.pid = v.volunteer_id);

-- Insert data from volunteers to person_phone_number
INSERT INTO PERSON_PHONE_NUMBER (phone_number, pid)
SELECT v.phone_number, v.volunteer_id
FROM (SELECT volunteer_id, phone_number 
      FROM VOLUNTEERS) v;
      
-- Set up the foreign key constraint to reference PERSON table
ALTER TABLE VOLUNTEERS
  ADD CONSTRAINT fk_per FOREIGN KEY (volunteer_id) REFERENCES PERSON (pid);

-- Drop redundant columns
ALTER TABLE VOLUNTEERS
  DROP COLUMN first_name;
ALTER TABLE VOLUNTEERS
  DROP COLUMN last_name;
ALTER TABLE VOLUNTEERS
  DROP COLUMN email;
ALTER TABLE VOLUNTEERS 
  DROP COLUMN phone_number;

--3
CREATE TABLE EVENT_LOCATION
(
  location_id NUMBER(5) NOT NULL,
  address 	VARCHAR2(25) NOT NULL,
  CONSTRAINT pk_event_location PRIMARY KEY (location_id)
);

--4
-- Insert data from donation_place to event_location
INSERT INTO EVENT_LOCATION (location_id, address)
SELECT place_id, address
FROM DONATION_PLACE;

--5
-- Add location_id column to the EVENTS table
ALTER TABLE EVENTS
  ADD location_id NUMBER(5);
  
-- Run this procedure:
CREATE OR REPLACE PROCEDURE update_ev_loc AS
BEGIN
 MERGE INTO EVENTS e
  USING (
    SELECT event_id, 
           location_id
    FROM (
      SELECT e.event_id,
             el.location_id,
             ROW_NUMBER() OVER (PARTITION BY e.event_id ORDER BY DBMS_RANDOM.VALUE) as rn
      FROM EVENTS e
      CROSS JOIN EVENT_LOCATION el
    )
    WHERE rn = 1
  ) r
  ON (e.event_id = r.event_id)
  WHEN MATCHED THEN
    UPDATE SET e.location_id = r.location_id;
  COMMIT;
END;
  
-- Set up the foreign key constraint
ALTER TABLE EVENTS
  ADD CONSTRAINT fk_event_location FOREIGN KEY (location_id) REFERENCES EVENT_LOCATION (location_id);
  
-- Make location_id NOT NULL
ALTER TABLE EVENTS MODIFY location_id NUMBER(5) NOT NULL;

-- Drop the old e_location column
ALTER TABLE EVENTS
  DROP COLUMN e_location;
 
--6
  -- Drop the redundant address column
ALTER TABLE DONATION_PLACE
  DROP COLUMN address;

ALTER TABLE DONATION_PLACE
  ADD CONSTRAINT fk_event_location2 FOREIGN KEY (place_id) REFERENCES EVENT_LOCATION (location_id);
