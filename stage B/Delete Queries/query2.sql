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

commit;
