CREATE OR REPLACE FUNCTION Is_Paramedic_Outstanding(
  p_paramedic_threshold NUMBER,
  p_donor_threshold NUMBER
)
RETURN SYS_REFCURSOR
IS
  v_cursor SYS_REFCURSOR;
  v_paramedic_rec PARAMEDIC%ROWTYPE;
  v_donation_count_paramedic NUMBER;
  v_donation_count_donor NUMBER;
  v_reason VARCHAR2(200);
  CURSOR c_paramedics IS
    SELECT * FROM PARAMEDIC;
BEGIN
  OPEN c_paramedics;
  LOOP
    FETCH c_paramedics INTO v_paramedic_rec;
    EXIT WHEN c_paramedics%NOTFOUND;

    -- Get the number of donations made by the paramedic as paramedic_id
    SELECT COUNT(*) INTO v_donation_count_paramedic
    FROM DONATION
    WHERE paramedic_id = v_paramedic_rec.paramedic_id;

    -- Get the number of donations made by the paramedic as donor_id
    SELECT COUNT(*) INTO v_donation_count_donor
    FROM DONATION
    WHERE donor_id = v_paramedic_rec.paramedic_id;

    -- Check conditions and set reasons
    IF v_donation_count_paramedic > p_paramedic_threshold THEN
      v_reason := 'Participated in more than ' || p_paramedic_threshold || ' donations';
    ELSIF v_donation_count_donor > p_donor_threshold THEN
      v_reason := 'Donated more than ' || p_donor_threshold || ' times';
    ELSE
      v_reason := NULL;
    END IF;

    IF v_reason IS NOT NULL THEN
      INSERT INTO temp_paramedic_reasons (paramedic_id, reason)
      VALUES (v_paramedic_rec.paramedic_id, v_reason);
    END IF;
  END LOOP;
  CLOSE c_paramedics;

  OPEN v_cursor FOR
    SELECT paramedic_id, reason FROM temp_paramedic_reasons;

  RETURN v_cursor;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  WHEN OTHERS THEN
    RAISE;
END;
/
