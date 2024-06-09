create table leetcode.Patients (
	patient_id int, 
    patient_name char(15),
    conditions char(100)
);

insert into leetcode.Patients (patient_id, patient_name, conditions)
values (1, 'Daniel', 'YFEV COUGH'),
	   (2, 'Alice', ''),
       (3, 'Bob', 'DIAB100 MYOP'),
       (4, 'George', 'ACNE DIAB100'),
       (5, 'Alain', 'DIAB201');
       
insert into leetcode.Patients (patient_id, patient_name, conditions)
values (6, 'Daniel', 'SADIAB100  ');

       
SELECT * FROM leetcode.patients;

select * 
from leetcode.patients
where conditions like 'DIAB1%' OR conditions like '% DIAB1%';