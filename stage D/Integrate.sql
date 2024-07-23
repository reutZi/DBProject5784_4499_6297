-- Adding new column paramedic_id to the VOLUNTEERS table
ALTER TABLE VOLUNTEERS
  ADD mentor_id VARCHAR2(9);
 -- Adding foreign key constraint for paramedic_id
ALTER TABLE VOLUNTEERS
  ADD CONSTRAINT fk_paramedic
  FOREIGN KEY (mentor_id)
  REFERENCES PARAMEDIC (paramedic_id);

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


CREATE TABLE EVENT_LOCATION
(
  location_id NUMBER(5) NOT NULL,
  address 	VARCHAR2(25) ,
  CONSTRAINT pk_event_location PRIMARY KEY (location_id)
);


INSERT INTO EVENT_LOCATION (location_id, address)
SELECT place_id, address
FROM DONATION_PLACE;


-- Drop the old e_location column
ALTER TABLE EVENTS
  DROP COLUMN e_location;
-- Add location_id column to the EVENTS table
ALTER TABLE EVENTS
  ADD location_id NUMBER(5);
-- Set up the foreign key constraint
ALTER TABLE EVENTS
  ADD CONSTRAINT fk_event_location FOREIGN KEY (location_id) REFERENCES EVENT_LOCATION (location_id);


  -- Drop the redundant address column
ALTER TABLE DONATION_PLACE
  DROP COLUMN address;

ALTER TABLE DONATION_PLACE
  ADD CONSTRAINT fk_event_location2 FOREIGN KEY (place_id) REFERENCES EVENT_LOCATION (location_id);
