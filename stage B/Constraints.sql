ALTER TABLE PERSON
ADD CONSTRAINT chk_email_format 
CHECK (INSTR(email, '@') > 0);

ALTER TABLE Person_Phone_Number
ADD CONSTRAINT chk_person_phone 
CHECK (phone_number LIKE '0%');

ALTER TABLE DONATION
ADD CONSTRAINT chk_pass_test_valid 
CHECK (pass_tests = 'N' AND valid IS NULL OR pass_tests != 'N');


