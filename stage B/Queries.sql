-- Queries without parameters: 

-- SELECT Queries:

-- 1.
SELECT dp.address, daily_donations.donation_count AS total_donations,
       daily_donations.donation_date
FROM (
    SELECT d.place_id,
       	d.donation_date,
       	COUNT(*) AS donation_count
    FROM Donation d
    WHERE d.donation_date BETWEEN ADD_MONTHS(SYSDATE, -12) AND SYSDATE
    GROUP BY d.place_id, d.donation_date
    ORDER BY donation_count DESC
) daily_donations
JOIN Donation_place dp ON dp.place_id = daily_donations.place_id
WHERE ROWNUM = 1;

-- 2.
SELECT P.pid AS person_id, P.f_name AS first_name,P.l_name AS last_name,
       LISTAGG(PPN.phone_number, ', ') WITHIN GROUP (ORDER BY PPN.phone_number) AS phone_numbers
FROM DONATION DN
JOIN DONOR D ON DN.donor_id = D.donor_id
JOIN PERSON P ON D.donor_id = P.pid
JOIN DONATION_PLACE DP ON DN.place_id = DP.place_id
JOIN PERSON_PHONE_NUMBER PPN ON P.pid = PPN.pid
WHERE DP.address = '63 Lily Ave'
  AND DP.place_id = 69545
  AND D.donor_id NOT IN (
    	SELECT D1.donor_id
    	FROM DONATION DN1
    	JOIN DONOR D1 ON DN1.donor_id = D1.donor_id
    	WHERE MONTHS_BETWEEN(SYSDATE, DN1.donation_date) <= 3
    )
GROUP BY P.pid, P.f_name, P.l_name;

-- 3.
SELECT P.f_name AS first_name,P.l_name AS last_name,
    D.type AS blood_type,D.sign AS rh_sign,
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
WHERE P.pid = '238348956';

-- 4.
SELECT DP.address AS donation_place,
    LISTAGG(P.f_name || ' ' || P.l_name || ' (' || PPN.phone_number || ')', ', ') WITHIN GROUP (ORDER BY P.l_name) AS donors
FROM DONATION DN
JOIN DONOR D ON DN.donor_id = D.donor_id
JOIN PERSON P ON D.donor_id = P.pid
JOIN PERSON_PHONE_NUMBER PPN ON P.pid = PPN.pid
JOIN DONATION_PLACE DP ON DN.place_id = DP.place_id
WHERE D.sign LIKE '%+%' AND D.type LIKE '%O%'
GROUP BY DP.address;

-- DELETE Queries:

-- 1.
DELETE FROM Donation
WHERE donation_id IN (
    SELECT DN.donation_id
    FROM Donation DN
    JOIN Receiver R ON DN.hospital_id = R.hospital_id
    WHERE R.delivery_date < DN.donation_date
);

-- 2.
-- Step 1: Delete donation records for donors older than 64 and who haven't donated in the last 10 years
DELETE FROM DONATION
WHERE donor_id IN (
    SELECT D.donor_id
    FROM DONOR D
    JOIN PERSON P ON D.donor_id = P.pid
    WHERE D.birth_date <= ADD_MONTHS(SYSDATE, -64*12)
      AND NOT EXISTS (
      	SELECT 1
      	FROM DONATION DN
      	WHERE DN.donor_id = D.donor_id
      	AND DN.donation_date >= ADD_MONTHS(SYSDATE, -120)
      )
);
-- Step 2: Delete donors who are older than 64 and who haven't donated in the last 10 years
DELETE FROM DONOR
WHERE donor_id IN (
    SELECT D.donor_id
    FROM DONOR D
    JOIN PERSON P ON D.donor_id = P.pid
    WHERE D.birth_date <= ADD_MONTHS(SYSDATE, -64*12)
      AND NOT EXISTS (
      	SELECT 1
      	FROM DONATION DN
      	WHERE DN.donor_id = D.donor_id
      	AND DN.donation_date >= ADD_MONTHS(SYSDATE, -120)
      )
);


-- UPDATE Queries:

-- 1.
UPDATE Donation
SET pass_tests = 'Y',valid = 'N'
WHERE donation_date = TO_DATE('2024-01-01', 'YYYY-MM-DD')
AND place_id = (
    SELECT place_id
    FROM Donation_place
    WHERE address = '8968 Moulton Plaza'
);

-- 2.
UPDATE PARAMEDIC
SET SALARY = SALARY +
    CASE
    	WHEN PARAMEDIC_ID IN (
        	SELECT D.PARAMEDIC_ID
        	FROM DONATION D
        	JOIN DONATION_PLACE DP ON D.PLACE_ID = DP.PLACE_ID
        	JOIN PARAMEDIC P ON D.PARAMEDIC_ID = P.PARAMEDIC_ID
        	WHERE DP.ADDRESS = '82nd Street'
          	AND P.SENIORITY > 2
        	GROUP BY D.PARAMEDIC_ID
        	HAVING COUNT(D.DONATION_ID) > 5
    	) THEN 600
    	WHEN PARAMEDIC_ID IN (
        	SELECT D.PARAMEDIC_ID
        	FROM DONATION D
        	JOIN DONATION_PLACE DP ON D.PLACE_ID = DP.PLACE_ID
        	JOIN PARAMEDIC P ON D.PARAMEDIC_ID = P.PARAMEDIC_ID
        	WHERE DP.ADDRESS = '82nd Street'
          	AND P.SENIORITY > 2
        	GROUP BY D.PARAMEDIC_ID
        	HAVING COUNT(D.DONATION_ID) > 3
    	) THEN 400
    	ELSE 0
    END
WHERE PARAMEDIC_ID IN (
    SELECT D.PARAMEDIC_ID
    FROM DONATION D
    JOIN DONATION_PLACE DP ON D.PLACE_ID = DP.PLACE_ID
    JOIN PARAMEDIC P ON D.PARAMEDIC_ID = P.PARAMEDIC_ID
    WHERE DP.ADDRESS = '82nd Street'
      AND P.SENIORITY > 2
    GROUP BY D.PARAMEDIC_ID
    HAVING COUNT(D.DONATION_ID) > 3
);
