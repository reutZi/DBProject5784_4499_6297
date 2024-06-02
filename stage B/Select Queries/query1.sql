SELECT dp.address,
       daily_donations.donation_count AS total_donations,
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
