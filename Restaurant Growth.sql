create table leetcode.Customer2 (
	customer_id int, 
    name char(20),
    visited_on date,
    amount int);
insert into leetcode.customer2 (customer_id, name, visited_on, amount)
values 
	(1, 'John', '2019-01-01', 100),
    (2, 'Daniel', '2019-01-02', 110),
    (3, 'Jade', '2019-01-03', 120),
    (4, 'Khaled', '2019-01-04', 130),
    (5, 'Winston', '2019-01-05', 110),
    (6, 'Elvis', '2019-01-06', 140),
    (7, 'Anna', '2019-01-07', 150),
    (8, 'Maria', '2019-01-08', 80),
    (9, 'Jaze', '2019-01-09', 110),
    (1, 'John', '2019-01-10', 130),
    (3, 'Jade', '2019-01-10', 150);

select * from leetcode.customer2;

select visited_on, sum(amount)
from leetcode.customer2
group by visited_on;

select t1.visited_on, sum(t2.amount) as amount, round(avg(t2.amount), 2) as average_amount
from (select visited_on, sum(amount) as amount
	from leetcode.customer2
	group by visited_on) t1 
join (select visited_on, sum(amount) as amount
	from leetcode.customer2
	group by visited_on) t2
on t1.visited_on >= t2.visited_on
where t1.visited_on >= (select date_add(min(visited_on), INTERVAL 6 day) from leetcode.customer2)
	and t2.visited_on >= DATE_SUB(t1.visited_on, INTERVAL 6 day)
group by t1.visited_on;