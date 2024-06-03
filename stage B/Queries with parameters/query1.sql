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
