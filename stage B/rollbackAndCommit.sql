SELECT f_name, l_name, pid  
FROM PERSON
WHERE pid = 276484571

commit;

insert into person (PID, L_NAME, F_NAME, EMAIL)
values (276484571, 'Shteren', 'Moshe', 'moshe123@gmail.com');

SELECT f_name, l_name, pid  
FROM PERSON
WHERE pid = 276484571

rollback;

SELECT f_name, l_name, pid  
FROM PERSON
WHERE pid = 276484571
