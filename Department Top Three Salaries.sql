create table leetcode.employee4 (
	id int, 
    name char(15), 
    salary int,
    departmentId int
);

create table leetcode.department (
	id int, 
    name char(15)
);

insert into leetcode.employee4 (id, name, salary, departmentId)
values 
	(1, 'Joe', 85000, 1),
    (2, 'Henry', 80000, 2),
    (3, 'Sam', 60000, 2),
    (4, 'Max', 90000, 1),
    (5, 'Janet', 69000, 1),
    (6, 'Randy', 85000, 1),
    (7, 'Will', 70000, 1);
    
insert into leetcode.department (id, name)
values 
	(1, 'IT'),
    (2, 'Sales');
    
select * from leetcode.employee4
order by departmentId, salary desc;
select * from leetcode.department;

select d.name as Department, e.name as Employee, e.salary as Salary
from leetcode.employee4 e
join leetcode.department d
on e.departmentId = d.id 
where 3 > (select count(distinct e1.salary)
			from leetcode.employee4 e1
            where e1.salary > e.salary and e.departmentId = e1.departmentId) 


