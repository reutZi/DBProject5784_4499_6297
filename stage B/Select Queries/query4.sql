SELECT DP.address AS donation_place,
    LISTAGG(P.f_name || ' ' || P.l_name || ' (' || PPN.phone_number || ')', ', ') WITHIN GROUP (ORDER BY P.l_name) AS donors
FROM DONATION DN
JOIN DONOR D ON DN.donor_id = D.donor_id
JOIN PERSON P ON D.donor_id = P.pid
JOIN PERSON_PHONE_NUMBER PPN ON P.pid = PPN.pid
JOIN DONATION_PLACE DP ON DN.place_id = DP.place_id
WHERE D.sign LIKE '%+%' AND D.type LIKE '%O%'
GROUP BY DP.address;
