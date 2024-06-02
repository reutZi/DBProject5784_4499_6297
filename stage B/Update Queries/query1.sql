UPDATE Donation
SET pass_tests = 'Y',valid = 'N'
WHERE donation_date = TO_DATE('2024-01-01', 'YYYY-MM-DD')
AND place_id = (
    SELECT place_id
    FROM Donation_place
    WHERE address = '8968 Moulton Plaza'
);
