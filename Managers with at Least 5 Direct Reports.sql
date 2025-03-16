create table leetcode.employee (
	id int, 
    name char(15), 
    department char(15),
    managerId int
);

insert into leetcode.employee (id, name, department, managerId)
values 
	(101, 'John', 'A', null),
    (102, 'Henry', 'A', 101),
    (103, 'Sam', 'A', 101),
    (104, 'Max', 'A', 101),
    (105, 'Janet', 'A', 101),
    (106, 'Randy', 'B', 101);
    
select * from leetcode.employee;

select t2.name
from Employee as t1
join Employee as t2
on t1.managerId = t2.id
group by t2.id
having count(t1.id) >= 5 