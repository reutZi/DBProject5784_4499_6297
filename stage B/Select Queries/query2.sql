SELECT P.person_id, P.first_name,P.last_name,
LISTAGG(PPN.phone_number, ', ') WITHIN GROUP (ORDER BY PPN.phone_number) AS phone_numbers
FROM Donation DN
JOIN Donor D ON DN.person_id_donor = D.person_id
JOIN Person P ON D.person_id = P.person_id
JOIN Donation_place DP ON DN.place_id = DP.place_id
JOIN Person_phone_number PPN ON P.person_id = PPN.person_id
WHERE DP.address = '8968 Moulton Plaza' AND D.person_id NOT IN (
      SELECT D1.person_id
      FROM Donation DN1
      JOIN Donor D1 ON DN1.person_id_donor = D1.person_id
      WHERE MONTHS_BETWEEN(SYSDATE, DN1.donation_date) <= 3
    )
GROUP BY P.person_id, P.first_name, P.last_name;
