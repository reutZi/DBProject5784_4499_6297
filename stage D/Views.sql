-- view1

CREATE OR REPLACE VIEW VOLUNTEER_ACTIVITY_VIEW AS
SELECT 
    v.volunteer_id,
    p.f_name,
    p.l_name,
    a.activity_name,
    a.activity_date,
    s.shift_date,
    s.s_location,
    e.event_date
FROM 
    VOLUNTEERS v
JOIN 
    PERSON p ON v.volunteer_id = p.pid
JOIN 
    VS_IN_SHIFTS vs ON v.volunteer_id = vs.volunteer_id
JOIN 
    SHIFTS s ON vs.shift_id = s.shift_id
JOIN 
    EVENTS e ON s.shift_id = e.shift_id
JOIN 
    ACTS_IN_EVENTS ae ON e.event_id = ae.event_id
JOIN 
    ACTIVITES a ON ae.activity_id = a.activity_id;
    
--query1
    
SELECT 
    volunteer_id, 
    f_name, 
    l_name, 
    activity_name
FROM 
    VOLUNTEER_ACTIVITY_VIEW
WHERE 
    activity_date = TO_DATE('2017-09-23', 'YYYY-MM-DD');


-- query2

SELECT  
    shift_date
FROM 
    VOLUNTEER_ACTIVITY_VIEW
WHERE 
    volunteer_id = '979932926';


-- view2

CREATE OR REPLACE VIEW DONATION_DETAILS_VIEW AS
SELECT
    d.donation_id,
    d.donation_date,
    d.valid,
    p1.l_name AS donor_last_name,
    p1.f_name AS donor_first_name,
    dnr.gender,
    b.sign AS blood_sign,
    b.type AS blood_type,
    el.address AS donation_place_address
FROM
    DONATION d
JOIN
    DONOR dnr ON d.donor_id = dnr.donor_id
JOIN
    PERSON p1 ON dnr.donor_id = p1.pid
JOIN
    BLOOD b ON dnr.sign = b.sign AND dnr.type = b.type
JOIN
    DONATION_PLACE dp ON d.place_id = dp.place_id
JOIN
    EVENT_LOCATION el ON dp.place_id = el.location_id
WHERE
    el.address = '33 Bishop BlvdHuddinge';

-- query 2.1

SELECT
    donation_id,
    donation_date,
    valid,
    donor_last_name,
    donor_first_name,
    gender,
    blood_sign,9
    blood_type
FROM
    DONATION_DETAILS_VIEW
WHERE
    donation_date = TO_DATE('2023-03-23', 'YYYY-MM-DD');

-- query 2.2

SELECT COUNT(*) as valid_donations
FROM DONATION_DETAILS_VIEW
WHERE gender = 'F' and valid = 'Y'
