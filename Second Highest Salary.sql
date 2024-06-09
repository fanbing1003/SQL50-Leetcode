# Instead of create another table called employee, I used the table for previous question which contain the same columns.

select * from leetcode.employee4;

select IFNULL(
(select salary
from leetcode.employee4
where salary <> (select max(salary) from leetcode.employee4)
order by salary desc
limit 1), NULL
) AS SecondHighestSalary;