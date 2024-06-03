DELETE FROM Donation
WHERE person_id_donor IN (
    SELECT D.person_id
    FROM Donor D
    WHERE NOT EXISTS (
    	SELECT 1
    	FROM Donation DN
    	WHERE DN.person_id_donor = D.person_id
      AND DN.donation_date >= ADD_MONTHS(SYSDATE, -120)
    )
);
 
DELETE FROM Donor
WHERE person_id IN (
    SELECT D.person_id
    FROM Donor D
    WHERE NOT EXISTS (
      SELECT 1
      FROM Donation DN
      WHERE DN.person_id_donor = D.person_id
      AND DN.donation_date >= ADD_MONTHS(SYSDATE, -120)
    )
);
