DECLARE
  v_paramedic_id VARCHAR2(9);
  v_first_name VARCHAR2(10);
  v_last_name VARCHAR2(10);
  v_reason VARCHAR2(200);
  v_cursor SYS_REFCURSOR;
  v_paramedic_threshold NUMBER := 15; -- Set the paramedic threshold value
  v_donor_threshold NUMBER := 13; -- Set the donor threshold value
BEGIN
  -- Call the Add_Grant procedure first
  Add_Grant;

  -- Call the Is_Paramedic_Outstanding function to get the cursor
  v_cursor := Is_Paramedic_Outstanding(v_paramedic_threshold, v_donor_threshold);

  LOOP
    FETCH v_cursor INTO v_paramedic_id, v_reason;
    EXIT WHEN v_cursor%NOTFOUND;

    BEGIN
      SELECT f_name, l_name INTO v_first_name, v_last_name
      FROM PERSON
      WHERE pid = v_paramedic_id;

      DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name || ': ' || v_reason);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for paramedic ID: ' || v_paramedic_id);
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error fetching paramedic name: ' || SQLERRM);
    END;
  END LOOP;
  CLOSE v_cursor;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    IF v_cursor%ISOPEN THEN
      CLOSE v_cursor;
    END IF;
END;
