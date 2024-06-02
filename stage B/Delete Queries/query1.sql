DELETE FROM Donation
WHERE donation_id IN (
    SELECT DN.donation_id
    FROM Donation DN
    JOIN Receiver R ON DN.hospital_id = R.hospital_id
    WHERE R.delivery_date < DN.donation_date
);
