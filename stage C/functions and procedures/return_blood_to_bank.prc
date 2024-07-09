CREATE OR REPLACE PROCEDURE return_blood_to_bank (
    v_donors_cursor SYS_REFCURSOR,
    p_blood_type VARCHAR2,
    p_blood_sign VARCHAR2,
    p_min_age NUMBER,
    p_max_age NUMBER
) IS
-- values for input cursor
    v_total_received NUMBER;
    v_total_invalid NUMBER;
    v_total_valid NUMBER;
    v_total_females NUMBER;
    v_total_males NUMBER;
    v_max_age_donated NUMBER;
    
    --values for counting
    v_invalid_male_count NUMBER;
    v_invalid_female_count NUMBER;
    v_valid_male_count NUMBER;
    v_valid_female_count NUMBER;
    
    -- values for printing
    v_donation_id donation.donation_id%TYPE;
    v_donor_id donor.donor_id%TYPE;
    
    -- cursors for more then 5 lines:
    -- cursor for invalid and males
    CURSOR v_invalid_male_cursor IS
        SELECT d.donation_id, dr.donor_id
        FROM donation d
        JOIN donor dr ON d.donor_id = dr.donor_id
        WHERE dr.type = p_blood_type
          AND dr.sign = p_blood_sign
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
          AND d.valid = 'N'
          AND dr.gender = 'M';
          
    -- cursor for invalid and females
    CURSOR v_invalid_female_cursor IS
        SELECT d.donation_id, dr.donor_id
        FROM donation d
        JOIN donor dr ON d.donor_id = dr.donor_id
        WHERE dr.type = p_blood_type
          AND dr.sign = p_blood_sign
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
          AND d.valid = 'N'
          AND dr.gender = 'F';
          
    -- cursor for valid and males
    CURSOR v_valid_male_cursor IS
        SELECT d.donation_id, dr.donor_id
        FROM donation d
        JOIN donor dr ON d.donor_id = dr.donor_id
        WHERE dr.type = p_blood_type
          AND dr.sign = p_blood_sign
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
          AND d.valid = 'Y'
          AND dr.gender = 'M';
          
    -- cursor for valid and females
    CURSOR v_valid_female_cursor IS
        SELECT d.donation_id, dr.donor_id
        FROM donation d
        JOIN donor dr ON d.donor_id = dr.donor_id
        WHERE dr.type = p_blood_type
          AND dr.sign = p_blood_sign
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
          AND d.valid = 'Y'
          AND dr.gender = 'F';
BEGIN
  
    -- Fetching data from cursor
    FETCH v_donors_cursor INTO
        v_total_received,
        v_total_invalid,
        v_total_valid,
        v_total_females,
        v_total_males,
        v_max_age_donated;

    IF v_total_valid < v_total_invalid THEN
        IF v_total_females < v_total_males THEN
        -- when there are more invalid and males
        
            -- Count invalid donations by males
            SELECT COUNT(*) INTO v_invalid_male_count
            FROM donation d
            JOIN donor dr ON d.donor_id = dr.donor_id
            WHERE dr.type = p_blood_type
              AND dr.sign = p_blood_sign
              AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
              AND d.valid = 'N'
              AND dr.gender = 'M';

            -- more then 5 invalid donations by males
            IF v_invalid_male_count > 5 THEN
                OPEN v_invalid_male_cursor;
                FOR i IN 1..5 LOOP  -- for loop to return the blood (update the donation)
                    FETCH v_invalid_male_cursor INTO v_donation_id, v_donor_id;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Invalid Male Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_invalid_male_cursor;
            -- less then 5 and more then 0 invalid donations by males
            ELSIF v_invalid_male_count > 0 THEN
                OPEN v_invalid_male_cursor;
                LOOP
                    FETCH v_invalid_male_cursor INTO v_donation_id, v_donor_id;
                    EXIT WHEN v_invalid_male_cursor%NOTFOUND;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Invalid Male Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_invalid_male_cursor;
            -- zero invalid donations by males
            ELSE DBMS_OUTPUT.PUT_LINE('No invalid male donation was returned');
            END IF;
        ELSE
        -- when there are more invalid and females
          
            -- Count invalid donations by females
            SELECT COUNT(*) INTO v_invalid_female_count
            FROM donation d
            JOIN donor dr ON d.donor_id = dr.donor_id
            WHERE dr.type = p_blood_type
              AND dr.sign = p_blood_sign
              AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
              AND d.valid = 'N'
              AND dr.gender = 'F';

            -- more then 5 invalid donations by females
            IF v_invalid_female_count > 5 THEN
                OPEN v_invalid_female_cursor;
                FOR i IN 1..5 LOOP -- for loop to return the blood (update the donation)
                    FETCH v_invalid_female_cursor INTO v_donation_id, v_donor_id;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Invalid Female Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_invalid_female_cursor;
            -- less then 5 and more then 0 invalid donations by females
            ELSIF v_invalid_female_count > 0 THEN
                OPEN v_invalid_female_cursor;
                LOOP
                    FETCH v_invalid_female_cursor INTO v_donation_id, v_donor_id;
                    EXIT WHEN v_invalid_female_cursor%NOTFOUND;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Invalid Female Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_invalid_female_cursor;
            -- zero invalid donations by females
            ELSE DBMS_OUTPUT.PUT_LINE('No invalid female donation was returned');
            END IF;
        END IF;
    ELSE
        IF v_total_females < v_total_males THEN
        -- when there are more valid and males  
        
            -- Count valid donations by males
            SELECT COUNT(*) INTO v_valid_male_count
            FROM donation d
            JOIN donor dr ON d.donor_id = dr.donor_id
            WHERE dr.type = p_blood_type
              AND dr.sign = p_blood_sign
              AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
              AND d.valid = 'Y'
              AND dr.gender = 'M';

            -- more then 5 valid donations by males
            IF v_valid_male_count > 5 THEN
                OPEN v_valid_male_cursor;
                FOR i IN 1..5 LOOP -- for loop to return the blood (update the donation)
                    FETCH v_valid_male_cursor INTO v_donation_id, v_donor_id;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Valid Male Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_valid_male_cursor;
            -- less then 5 and more then 0 valid donations by males
            ELSIF v_valid_male_count > 0 THEN
                OPEN v_valid_male_cursor;
                LOOP
                    FETCH v_valid_male_cursor INTO v_donation_id, v_donor_id;
                    EXIT WHEN v_valid_male_cursor%NOTFOUND;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Valid Male Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_valid_male_cursor;
            -- zero valid donations by males
            ELSE DBMS_OUTPUT.PUT_LINE('No valid male donation was returned');
            END IF;
        ELSE
        -- when there are more valid and females  
        
            -- Count valid donations by females
            SELECT COUNT(*) INTO v_valid_female_count
            FROM donation d
            JOIN donor dr ON d.donor_id = dr.donor_id
            WHERE dr.type = p_blood_type
              AND dr.sign = p_blood_sign
              AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age
              AND d.valid = 'Y'
              AND dr.gender = 'F';

            -- more then 5 valid donations by females
            IF v_valid_female_count > 5 THEN
                OPEN v_valid_female_cursor;
                FOR i IN 1..5 LOOP -- for loop to return the blood (update the donation)
                    FETCH v_valid_female_cursor INTO v_donation_id, v_donor_id;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Valid Female Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_valid_female_cursor;
            -- less then 5 and more then 0 valid donations by females
            ELSIF v_valid_female_count > 0 THEN
                OPEN v_valid_female_cursor;
                LOOP
                    FETCH v_valid_female_cursor INTO v_donation_id, v_donor_id;
                    EXIT WHEN v_valid_female_cursor%NOTFOUND;
                    UPDATE donation
                    SET hospital_id = NULL
                    WHERE donation_id = v_donation_id;
                    DBMS_OUTPUT.PUT_LINE('Valid Female Donation returned: ID - ' || v_donor_id );
                END LOOP;
                CLOSE v_valid_female_cursor;
            -- zero valid donations by females
            ELSE DBMS_OUTPUT.PUT_LINE('No valid female donation was returned');
            END IF;
        END IF;
    END IF;
    commit; -- save changes
    
    -- Closing the cursors after use
    CLOSE v_donors_cursor;
END;
