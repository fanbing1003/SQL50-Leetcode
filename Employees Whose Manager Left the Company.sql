create table leetcode.employees (
	employee_id int, 
    name char(15),
    manager_id int,
    salary int
    );

insert into leetcode.employees (employee_id, name, manager_id, salary)
values 
	(3, 'Mila', 9, 60301),
    (12, 'Antonella', null, 31000),
    (13, 'Emery', null, 67084),
    (1, 'Kalel', 11, 21241),
    (9, 'Mikaela', null, 50937),
    (11, 'Joziah', 6, 28485);

select * from leetcode.employees;

select employee_id, manager_id from leetcode.employees
where salary < 30000;

select t1.employee_id
from (
	select employee_id, manager_id from leetcode.employees
	where salary < 30000 and manager_id is not null
    ) t1
left join 
	leetcode.employees t2
on t1.manager_id = t2.employee_id
where t2.employee_id is null
order by employee_id asc;

