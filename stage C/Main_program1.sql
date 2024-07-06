DECLARE
    -- Declaring variables
    v_blood_type blood.type%type;
    v_blood_sign blood.sign%type;
    v_min_age NUMBER;
    v_max_age NUMBER;
    v_decision VARCHAR2(1);

    v_ratio_invalid NUMBER;
    v_ratio_gender NUMBER;

    -- Cursor declaration
    v_cursor SYS_REFCURSOR;
    v_total_received NUMBER;
    v_total_invalid NUMBER;
    v_total_valid NUMBER;
    v_total_females NUMBER;
    v_total_males NUMBER;
    v_max_age_donated NUMBER;

BEGIN
    -- Getting user input for blood type
    v_blood_type :=&<name="Blood type" list="SELECT DISTINCT type FROM BLOOD" type="string">;

    -- Getting user input for blood sign
    v_blood_sign :=&<name="Blood sign" list="SELECT DISTINCT sign FROM BLOOD" type="string">;

    -- Getting user input for age range and decision
    v_min_age := &<name="nim age">;
    v_max_age := &<name="max age">;

    -- Getting cursor from function to fetch donors
    v_cursor := get_donation_statistics(v_blood_type, v_blood_sign, v_min_age, v_max_age);

    -- Proceed if cursor is not null
    IF v_cursor IS NOT NULL THEN
        -- Fetching data from cursor
        FETCH v_cursor INTO
            v_total_received,
            v_total_invalid,
            v_total_valid,
            v_total_females,
            v_total_males,
            v_max_age_donated;

        -- Calculating ratio of received to invalid donations
        IF v_total_invalid > 0 THEN
            v_ratio_invalid := v_total_received / v_total_invalid;
        ELSE
            v_ratio_invalid := 0;
        END IF;

        -- Calculating ratio of donations received (females to males)
        IF v_total_males > 0 THEN
            v_ratio_gender := v_total_females / v_total_males;
        ELSE
            v_ratio_gender := 0;
        END IF;

        -- Printing the report
        DBMS_OUTPUT.PUT_LINE('Blood Donation Report');
        DBMS_OUTPUT.PUT_LINE('---------------------');
        DBMS_OUTPUT.PUT_LINE('Blood Type: ' || v_blood_type || v_blood_sign);
        DBMS_OUTPUT.PUT_LINE('Age Range: ' || v_min_age || ' to ' || v_max_age);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('   Total donations That did pass the tests: ' || v_total_received);
        DBMS_OUTPUT.PUT_LINE('   Total donations That did not pass the tests: ' || v_total_invalid);
        DBMS_OUTPUT.PUT_LINE('   Ratio of pass to not pass: ' || TO_CHAR(v_ratio_invalid, '999.99'));
        DBMS_OUTPUT.PUT_LINE('   Total donations that passed by females: ' || v_total_females);
        DBMS_OUTPUT.PUT_LINE('   Total donations that passed by males: ' || v_total_males);
        DBMS_OUTPUT.PUT_LINE('   Ratio of donations passed (females to males): ' ||TO_CHAR(v_ratio_gender, '999.99'));
        DBMS_OUTPUT.PUT_LINE('   The max Age that donated and passed the tests: ' || v_max_age_donated);
        DBMS_OUTPUT.PUT_LINE('');
        
        -- Returning blood ( decision by a procedure)
        return_blood_to_bank(v_cursor,v_blood_type, v_blood_sign, v_min_age, v_max_age);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No donations found for the specified criteria.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
