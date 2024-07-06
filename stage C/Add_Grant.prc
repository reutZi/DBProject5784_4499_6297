CREATE OR REPLACE PROCEDURE Add_Grant
IS
  v_paramedic_rec PARAMEDIC%ROWTYPE;
  v_donation_count NUMBER;
  v_first_name VARCHAR2(50);
  v_last_name VARCHAR2(50);
  CURSOR c_paramedics IS
    SELECT * FROM PARAMEDIC;
BEGIN
  OPEN c_paramedics;
  LOOP
    FETCH c_paramedics INTO v_paramedic_rec;
    EXIT WHEN c_paramedics%NOTFOUND;

    -- Initialize grant amount for reporting
    v_paramedic_rec.salary := 0;

    -- Get paramedic name
    BEGIN
      SELECT f_name, l_name INTO v_first_name, v_last_name
      FROM PERSON
      WHERE pid = v_paramedic_rec.paramedic_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_first_name := 'Unknown';
        v_last_name := 'Unknown';
    END;

    -- Check for paramedics who made donations on 7/10/2024
    SELECT COUNT(*) INTO v_donation_count
    FROM DONATION 
    WHERE paramedic_id = v_paramedic_rec.paramedic_id 
      AND donation_date = TO_DATE('07-10-2024', 'dd-mm-yyyy');

    IF v_donation_count > 0 THEN
      v_paramedic_rec.salary := v_paramedic_rec.salary + 500;
    END IF;

    -- Check for paramedics with more than 40 years seniority
    IF v_paramedic_rec.seniority > 45 THEN
      v_paramedic_rec.salary := v_paramedic_rec.salary + 700;
    END IF;

    -- Update the salary if any grant is given
    IF v_paramedic_rec.salary > 0 THEN
      UPDATE PARAMEDIC
      SET salary = salary + v_paramedic_rec.salary
      WHERE paramedic_id = v_paramedic_rec.paramedic_id;

      DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name || ' (' || v_paramedic_rec.paramedic_id || ') - Grant of: ' || v_paramedic_rec.salary);
    END IF;
  END LOOP;
  CLOSE c_paramedics;
  DBMS_OUTPUT.PUT_LINE('Grants added to paramedics based on donations and seniority.');

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/
