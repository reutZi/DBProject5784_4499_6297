-- Queries with parameters: 

-- 1.
SELECT P.pid AS person_id,
       P.f_name AS first_name,
       P.l_name AS last_name,
       LISTAGG(PPN.phone_number, ', ') WITHIN GROUP (ORDER BY PPN.phone_number) AS phone_numbers
FROM DONATION DN
JOIN DONOR D ON DN.donor_id = D.donor_id
JOIN PERSON P ON D.donor_id = P.pid
JOIN DONATION_PLACE DP ON DN.place_id = DP.place_id
JOIN PERSON_PHONE_NUMBER PPN ON P.pid = PPN.pid
WHERE DP.address = &<name="Address" required="true" type="string">
  AND DP.place_id = &<name="Place id" required="true" type="string">
  AND D.donor_id NOT IN (
      SELECT D1.donor_id
      FROM DONATION DN1
      JOIN DONOR D1 ON DN1.donor_id = D1.donor_id
      WHERE MONTHS_BETWEEN(&<name="Donation date" required="true" type="date">, DN1.donation_date) <= 3
    )
GROUP BY P.pid, P.f_name, P.l_name;

-- 2.
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

-- 3.
SELECT  p.f_name AS First_name,  p.l_name AS Last_name,  pp.phone_number
FROM person p
 	JOIN donor d ON p.pid = d.donor_id
 	JOIN person_phone_number pp ON p.pid = pp.pid
WHERE  d.type=&<name="Blood type" list="SELECT DISTINCT type FROM BLOOD" type="string">
 	AND d.sign=&<name="Rh" list="SELECT DISTINCT sign FROM BLOOD" type="string">
 	AND ROUND(MONTHS_BETWEEN(SYSDATE, d.birth_date) / 12) BETWEEN 
&<name="Min age" hint="The min age for donating is 17" required="true" default="17"> 
AND &<name="Max age" required="true" default="60">
 	AND EXISTS (SELECT 1
             	FROM   donation dn
             	WHERE  dn.donor_id = d.donor_id
                    	AND dn.donation_date >= 
                        TRUNC(SYSDATE) - INTERVAL '1' YEAR
                    	AND dn.pass_tests = 'Y'
                        AND dn.valid = 'Y');

						
-- 4.
SELECT p.f_name AS last_name, p.l_name AS first_name,
       p.pid AS paramedic_id, COUNT(d.donation_id) AS donation_count
FROM   person p
       JOIN PARAMEDIC pr ON p.pid = pr.paramedic_id
       JOIN DONATION d ON pr.paramedic_id = d.paramedic_id
       JOIN DONATION_PLACE dp ON d.place_id = dp.place_id
WHERE  EXTRACT(MONTH FROM d.donation_date) = &<name="Month" required="true" type="integer">
       AND EXTRACT(YEAR FROM d.donation_date) = &<name="Year" required="true" type="integer">
       AND dp.address = &<name="Address" required="true" type="string">
       AND dp.place_id = &<name="Place id" required="true" type="string">
GROUP BY p.f_name, p.l_name, p.pid
HAVING COUNT(d.donation_id) > 0
ORDER BY donation_count DESC;
