SELECT first_name, last_name, person_id  
FROM PARAMEDIC NATURAL JOIN PERSON
WHERE person_id = 2764845751

commit;

insert into person (PERSON_ID, LAST_NAME, FIRST_NAME, EMAIL)
values (2764845751, 'Shteren', 'Moshe', 'moshe123@gmail.com');

insert into paramedic (LICENSE_NUMBER, SENIORITY, PERSON_ID)
values (722679256, 7, 2764845751);

SELECT first_name, last_name, person_id  
FROM PARAMEDIC NATURAL JOIN PERSON
WHERE person_id = 2764845751

rollback;

SELECT first_name, last_name, person_id  
FROM PARAMEDIC NATURAL JOIN PERSON
WHERE person_id = 2764845751
