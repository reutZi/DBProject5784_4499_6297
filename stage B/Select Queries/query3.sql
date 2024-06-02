SELECT DP.address AS donation_place,
    LISTAGG(P.first_name || ' ' || P.last_name || ' (' || PPN.phone_number || ')', ', ') WITHIN GROUP (ORDER BY P.last_name) AS donors
FROM Donation DN
JOIN Donor D ON DN.person_id_donor = D.person_id
JOIN Person P ON D.person_id = P.person_id
JOIN Person_phone_number PPN ON P.person_id = PPN.person_id
JOIN Donation_place DP ON DN.place_id = DP.place_id
WHERE D.sign LIKE '%+%' AND D.type LIKE '%O%'
GROUP BY DP.address;
