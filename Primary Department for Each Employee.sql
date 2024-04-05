create table leetcode.Employee3 (employee_id int, department_id int, primary_flag char(15));
insert into leetcode.Employee3 (employee_id, department_id, primary_flag)
values 
	(1, 1, 'N'),
    (2, 1, 'Y'),
    (2, 2, 'N'),
    (3, 3, 'N'),
    (4, 2, 'N'),
    (4, 3, 'Y'),
    (4, 4, 'N');
    
SELECT * FROM LEETCODE.EMPLOYEE3;


select employee_id, department_id from leetcode.employee3 where primary_flag = 'Y'
union
select t1.employee_id, department_id 
from leetcode.employee3 t1 
right join (
select employee_id
from leetcode.employee3 
group by employee_id
having count(employee_id) = 1) t2
on t1.employee_id = t2.employee_id;


