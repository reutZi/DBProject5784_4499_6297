SELECT P.f_name AS first_name, P.l_name AS last_name,
    D.type AS blood_type, D.sign AS rh_sign,
    (SELECT MAX(DN.donation_date) 
     FROM DONATION DN 
     WHERE DN.donor_id = P.pid) AS last_donation_date,
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, (SELECT MAX(DN.donation_date) 
                                      FROM DONATION DN 
                                      WHERE DN.donor_id = P.pid)) >= 3
             AND (SELECT COUNT(*) 
                  FROM DONATION DN 
                  WHERE DN.donor_id = P.pid 
                    AND DN.pass_tests = 'N') <= 4 
        THEN 'Yes' 
        ELSE 'No' 
    END AS can_donate
FROM PERSON P
JOIN DONOR D ON P.pid = D.donor_id
WHERE P.pid = &<name="ID" type="string" required="true">;
