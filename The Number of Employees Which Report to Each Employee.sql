create table leetcode.Employee2 (employee_id int, name char(15), reports_to int, age int);
insert into leetcode.Employee2 (employee_id, name, reports_to, age)
values 
	(1, 'Michael', null, 45),
    (2, 'Alice', 1, 38),
    (3, 'Bob', 1, 42),
    (4, 'Charlie', 2, 34),
    (5, 'David', 2, 40),
    (6, 'Eve', 3, 37),
    (7, 'Frank', null, 50),
    (8, 'Grace', null, 48);

select * from leetcode.employee2;

select t1.employee_id, t1.name, count(*) as reports_count, round(avg(t2.age), 0) as average_age
from leetcode.employee2 t1 left join leetcode.employee2 t2
on t1.employee_id = t2.reports_to
where t2.age is not null
group by employee_id, name
order by employee_id;
