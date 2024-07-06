CREATE OR REPLACE FUNCTION get_donation_statistics (
    p_blood_type VARCHAR2,
    p_blood_sign VARCHAR2,
    p_min_age NUMBER,
    p_max_age NUMBER
) RETURN SYS_REFCURSOR IS
    v_stats_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_stats_cursor FOR
        SELECT 
            COUNT(*) AS total_received,
            SUM(CASE WHEN d.valid = 'N' THEN 1 ELSE 0 END) AS total_invalid,
            COUNT(CASE WHEN d.valid = 'Y' THEN 1 END) AS total_valid,
            COUNT(CASE WHEN dr.gender = 'F' AND d.valid = 'Y' THEN 1 END) AS total_females,
            COUNT(CASE WHEN dr.gender = 'M' AND d.valid = 'Y' THEN 1 END) AS total_males,
            MAX(TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12)) AS max_age_donated
        FROM donation d
        JOIN donor dr ON d.donor_id = dr.donor_id
        WHERE dr.type = p_blood_type
          AND dr.sign = p_blood_sign
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, dr.birth_date) / 12) BETWEEN p_min_age AND p_max_age;
          
    RETURN v_stats_cursor;
END;
